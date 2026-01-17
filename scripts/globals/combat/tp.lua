xi = xi or {}
xi.combat = xi.combat or {}
xi.combat.tp = xi.combat.tp or {}
-----------------------------------

-- returns a single melee hit's TP return
xi.combat.tp.getSingleMeleeHitTPReturn = function(actor, target, isZanshin)
    isZanshin = isZanshin or false -- optional input, defaults to false.

    local delay        = actor:getBaseDelay()
    local attackOutput = xi.combat.tp.getModifiedDelayAndCanZanshin(actor, delay)
    local tpReturn     = xi.combat.tp.calculateTPReturn(actor, attackOutput.modifiedDelay)

    if isZanshin and attackOutput.canZanshin then
        tpReturn = tpReturn + actor:getMerit(xi.merit.IKISHOTEN) -- https://www.bg-wiki.com/ffxi/Ikishoten
    end

    local storeTPModifier = (100 + actor:getMod(xi.mod.STORETP)) / 100

    return math.floor(tpReturn * storeTPModifier)
end

-- returns a PC weapon slot's TP return for a single hit
xi.combat.tp.getSingleWeaponTPReturn = function(actor, slot)
    -- TODO: implement Zanshin check optionally?
    if actor:isPC() then
        local delay           = actor:getBaseWeaponDelay(slot)
        local attackOutput    = xi.combat.tp.getModifiedDelayAndCanZanshin(actor, delay)
        local tpReturn        = xi.combat.tp.calculateTPReturn(actor, attackOutput.modifiedDelay)
        local storeTPModifier = (100 + actor:getMod(xi.mod.STORETP)) / 100

        return math.floor(tpReturn * storeTPModifier)
    end

    -- TODO: print error message for non-PC?
    return 0
end

xi.combat.tp.getModifiedDelayAndCanZanshin = function(actor, delay)
    local modifiedDelay = delay
    local canZanshin    = false

    -- Dual Wielding logic
    if actor:isDualWielding() then
        local dualWieldReduction = actor:getMod(xi.mod.DUAL_WIELD)
        modifiedDelay = (delay * (100 - dualWieldReduction) / 100) / 2 -- Halve the delay for off-hand
        canZanshin = true -- Zanshin can proc on dual-wielding swings

    -- Hand-to-Hand logic
    elseif actor:isUsingH2H() then
        if actor:getObjType() == xi.objType.PC then
            if actor:getEquippedItem(xi.slot.SUB) ~= nil or actor:getSkillRank(xi.skill.HAND_TO_HAND) == 0 then
                -- Single fist or shield equipped
                modifiedDelay = math.max((delay - actor:getMod(xi.mod.MARTIAL_ARTS)), 96)
                canZanshin = true -- Zanshin can proc on unarmed swings
            else
                -- Dual fists
                modifiedDelay = math.max((delay - actor:getMod(xi.mod.MARTIAL_ARTS)) / 2, 48)
            end
        else
            -- Non-PC entities using H2H
            modifiedDelay = math.max((delay - actor:getMod(xi.mod.MARTIAL_ARTS)) / 2, 48)
        end

    -- Single melee swing (1H or 2H)
    else
        canZanshin = true -- Zanshin can proc on single melee swings
    end

    -- Apply delay percentage modifiers (minimum cap of -15%)
    modifiedDelay = modifiedDelay * math.max((100 + actor:getMod(xi.mod.DELAYP)) / 100, 0.85)

    return ({ canZanshin = canZanshin, modifiedDelay = math.floor(modifiedDelay) })
end

-- returns a single melee hit's TP return
xi.combat.tp.getSingleRangedHitTPReturn = function(actor, target)
    local delay = actor:getBaseRangedDelay() -- there do not appear to be any delay modifiers for ranged attacks, snapshot does not seem to effect this

    if delay > 0 then
        local storeTPModifier = (100 + actor:getMod(xi.mod.STORETP)) / 100

        return math.floor(xi.combat.tp.calculateTPReturn(actor, delay) * storeTPModifier)
    end

    return 0
end

-- https://www.bg-wiki.com/ffxi/Tactical_Points
-- Gainee is the target who is going to gain the TP.
-- For instance, if a player attacks a mob, the mob uses the mob formula when gaining TP from the returned hit.
-- This appears to be a measure to not buff mobs when players were buffed with the new TP gain formula.
xi.combat.tp.calculateTPReturn = function(gainee, delay)
    local tpReturn = 0

    if gainee and gainee:getObjType() ~= xi.objType.MOB then -- Pets and PCs have been observed to use this formula
        if delay > 900 then
            tpReturn = 173 + (delay - 900) * 28 / 360
        elseif delay > 720 then
            tpReturn = 161 + (delay - 720) * 24 / 360
        elseif delay > 630 then
            tpReturn = 154 + (delay - 630) * 28 / 360
        elseif delay > 540 then
            tpReturn = 149 + (delay - 540) * 20 / 360
        elseif delay > 180 then
            tpReturn = 61 + (delay - 180) * 88 / 360
        else
            tpReturn = 61 + (delay - 180) * 63 / 360
        end
    else -- mobs have been observed to use this formula -- http://wiki.ffo.jp/html/308.html
        if delay > 530 then
            tpReturn = 145 + (delay - 530) * 35 / 470
        elseif delay > 480 then
            tpReturn = 130 + (delay - 480) * 15 / 30
        elseif delay > 450 then
            tpReturn = 115 + (delay - 450) * 15 / 30
        elseif delay > 180 then
            tpReturn = 50 + (delay - 180) * 65 / 270
        else
            tpReturn = 50 + (delay - 180) * 15 / 180
        end
    end

    return math.floor(tpReturn)
end

-- Bonus subtle blow II from Tandem Blow (BST trait)
xi.combat.tp.getTandemBlowBonus = function(actor)
    local tandemBlowBonus = 0
    if actor:isTandemActive() then
        if actor:getMaster() ~= nil and actor:getMaster():isPC() then
            tandemBlowBonus = actor:getMaster():getMod(xi.mod.TANDEM_BLOW_POWER)
        else
            tandemBlowBonus = actor:getMod(xi.mod.TANDEM_BLOW_POWER)
        end
    end

    return tandemBlowBonus
end

-- TODO: does Ikishoten factor into this as a bonus to baseTPGain if it procs on the hit? Needs verification.
xi.combat.tp.calculateTPGainOnPhysicalDamage = function(totalDamage, delay, actor, target)
    -- TODO: does dAGI penalty work against/for Trusts/Pets? Nothing is documented for this. Currently assuming mob only.
    if totalDamage > 0 and target and actor then
        local attackOutput       = xi.combat.tp.getModifiedDelayAndCanZanshin(actor, delay)
        local baseTPGain         = xi.combat.tp.calculateTPReturn(target, attackOutput.modifiedDelay)
        local dAGI               = actor:getStat(xi.mod.AGI) - target:getStat(xi.mod.AGI)
        local inhibitTPModifier  = (100 - target:getMod(xi.mod.INHIBIT_TP)) / 100                    -- no known cap: https://www.bg-wiki.com/ffxi/Monster_TP_gain#Inhibit_TP
        local dAGIModifier       = utils.clamp(200 - (dAGI + 30) / 200, 0.5, 1)                      -- 50% reduction at +70 dAGI: https://www.bg-wiki.com/ffxi/Monster_TP_gain
        local subtleBlowMerits   = actor:getMerit(xi.merit.SUBTLE_BLOW_EFFECT)
        local subtleBlowI        = math.min(actor:getMod(xi.mod.SUBTLE_BLOW) + subtleBlowMerits, 50) -- cap of 50% https://www.bg-wiki.com/ffxi/Subtle_Blow
        local tandemBlowBonus    = xi.combat.tp.getTandemBlowBonus(actor)
        local subtleBlowII       = actor:getMod(xi.mod.SUBTLE_BLOW_II) + tandemBlowBonus             -- no known cap
        local subtleBlowModifier = math.max((100 - subtleBlowI + subtleBlowII) / 100, 0.25)          -- combined cap of 75% reduction: https://www.bg-wiki.com/ffxi/Subtle_Blow
        local storeTPModifier    = (100 + target:getMod(xi.mod.STORETP)) / 100

        -- TODO: unknown where/how many floor steps there are. Napkin math seems to be a single floor step, but given x/256 it's hard to tell
        -- TODO: unknown if player pets (automaton/wyvern/avatars) are affected by dAGI

        -- mob vs mob (via charm) is observed to use the (base * 1/3) formula instead of (base + 30)
        -- (base + 30) formula appears to be intentional by SE to make mobs 'more dangerous' when hit by players/pets
        if
            target:getObjType() == xi.objType.MOB and
            actor:getObjType() ~= xi.objType.MOB
        then
            -- +30 sourced from http://wiki.ffo.jp/html/2621.html and tested in game
            return math.floor((baseTPGain + 30) * inhibitTPModifier * dAGIModifier * subtleBlowModifier * storeTPModifier)
        else
            -- 1/3rd sourced from https://www.bg-wiki.com/ffxi/Tactical_Points and tested in game
            return math.floor(baseTPGain * inhibitTPModifier * subtleBlowModifier * storeTPModifier * (1 / 3))
        end
    end

    return 0
end

xi.combat.tp.calculateTPGainOnMagicalDamage = function(totalDamage, actor, target)
    -- TODO: does dAGI penalty work against/for Trusts/Pets? Nothing is documented for this. Currently assuming mob only.
    if totalDamage > 0 and target and actor then
        local dAGI               = actor:getStat(xi.mod.AGI) - target:getStat(xi.mod.AGI)
        local inhibitTPModifier  = (100 - target:getMod(xi.mod.INHIBIT_TP)) / 100                    -- no known cap: https://www.bg-wiki.com/ffxi/Monster_TP_gain#Inhibit_TP
        local dAGIModifier       = utils.clamp(200 - (dAGI + 30) / 200, 0.5, 1)                      -- 50% reduction at +70 dAGI: https://www.bg-wiki.com/ffxi/Monster_TP_gain
        local subtleBlowMerits   = actor:getMerit(xi.merit.SUBTLE_BLOW_EFFECT)
        local subtleBlowI        = math.min(actor:getMod(xi.mod.SUBTLE_BLOW) + subtleBlowMerits, 50) -- cap of 50% https://www.bg-wiki.com/ffxi/Subtle_Blow
        local tandemBlowBonus    = xi.combat.tp.getTandemBlowBonus(actor)
        local subtleBlowII       = actor:getMod(xi.mod.SUBTLE_BLOW_II) + tandemBlowBonus             -- no known cap
        local subtleBlowModifier = math.max((100 - subtleBlowI + subtleBlowII) / 100, 0.25)          -- combined cap of 75% reduction: https://www.bg-wiki.com/ffxi/Subtle_Blow
        local storeTPModifier    = (100 + target:getMod(xi.mod.STORETP)) / 100

        -- Similar caveats to above for physical damage, unknown where/how many floors but seems to be one.
        if target:getObjType() == xi.objType.MOB then
            return math.floor(100 * inhibitTPModifier * dAGIModifier * subtleBlowModifier * storeTPModifier) -- 100 sourced from testing & https://www.bg-wiki.com/ffxi/Monster_TP_gain#TP_gained_from_Magical_Damage
        else
            return math.floor(50 * inhibitTPModifier * subtleBlowModifier * storeTPModifier)                 -- 50 sourced from testing & https://www.bg-wiki.com/ffxi/Tactical_Points#Getting_hit_for_more_than_0_damage
        end
    end

    return 0
end
