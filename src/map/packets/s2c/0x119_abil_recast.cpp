/*
===========================================================================

  Copyright (c) 2025 LandSandBoat Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#include "0x119_abil_recast.h"

#include "common/timer.h"

#include <cstring>

#include "ability.h"
#include "entities/charentity.h"
#include "recast_container.h"

GP_SERV_COMMAND_ABIL_RECAST::GP_SERV_COMMAND_ABIL_RECAST(CCharEntity* PChar)
{
    auto& packet = this->data();

    // Gather active ability recasts, prioritize special/mount, sort by expiry and trim to 31.
    const RecastList_t* RecastList = PChar->PRecastContainer->GetRecastList(RECAST_ABILITY);

    struct Entry
    {
        Recast_t recast;
        std::chrono::seconds remaining;
    };

    std::vector<Entry> active;
    active.reserve(RecastList->size());

    for (auto&& recast : *RecastList)
    {
        if (recast.RecastTime == 0s)
        {
            continue; // skip expired/placeholder entries
        }

        const auto remaining = std::chrono::ceil<std::chrono::seconds>(recast.TimeStamp - timer::now() + recast.RecastTime);
        const auto remsecs   = static_cast<int64>(std::max<int64>(timer::count_seconds(remaining), 0));

        active.push_back(Entry{ recast, std::chrono::seconds(remsecs) });
    }

    // Prioritize: Mount first, then Special (2hr) entries, then soonest-expiring abilities
    std::sort(active.begin(), active.end(), [](auto const& a, auto const& b)
    {
        if (a.recast.ID == Recast::Mount) return true;
        if (b.recast.ID == Recast::Mount) return false;
        if (a.recast.ID == Recast::Special) return true;
        if (b.recast.ID == Recast::Special) return false;
        return a.remaining < b.remaining;
    });

    if (active.size() > 31)
    {
        ShowWarning("GP_SERV_COMMAND_ABIL_RECAST: player '%s' has %zu active ability recasts, trimming to 31.", PChar->getName(), active.size());
        active.resize(31);
    }

    uint8 count = 1;
    for (auto const& e : active)
    {
        const auto& recast = e.recast;
        const auto recastSeconds = static_cast<uint32>(e.remaining.count());

        if (recast.ID == Recast::Mount)
        {
            packet.MountRecast   = recastSeconds;
            packet.MountRecastId = static_cast<uint32_t>(recast.ID);
        }
        else if (recast.ID != Recast::Special)
        {
            packet.Timers[count].Timer   = static_cast<uint16_t>(recastSeconds);
            packet.Timers[count].TimerId = static_cast<uint8_t>(recast.ID);

            if (recast.maxCharges != 0)
            {
                if (const auto* charge = ability::GetCharge(PChar, static_cast<uint16>(recast.ID)))
                {
                    const uint16_t actualChargeTime = timer::count_seconds(recast.chargeTime);
                    const uint16_t baseChargeTime   = timer::count_seconds(charge->chargeTime);

                    if (baseChargeTime > actualChargeTime)
                    {
                        packet.Timers[count].Calc1 = 0;
                        packet.Timers[count].Calc2 = 65536 - (baseChargeTime - actualChargeTime) * recast.maxCharges;
                    }
                }
            }
            count++;
        }
        else // Special (2hr) handling
        {
            packet.Timers[0].Timer   = static_cast<uint16_t>(recastSeconds);
            packet.Timers[0].TimerId = 0;

            packet.Timers[count].Timer   = static_cast<uint16_t>(recastSeconds);
            packet.Timers[count].TimerId = 0;
            count++;
        }
    }
}
