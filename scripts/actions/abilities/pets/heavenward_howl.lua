-----------------------------------
-- Heavenward Howl
-- Description: Grants the effect of HP Drain or MP Drain to party members within area of effect.
-- Level: 96
-- Blood Pact Type: Blood Pact: Ward
-- MP Cost: 96
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    -- Base duration 60s, scales with summoning skill over 300
    local bonusTime = utils.clamp(summoner:getSkillLevel(xi.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration  = 60 + bonusTime

    xi.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local moonCycle = getVanadielMoonCycle()

    -- Mapping moon cycle to effect and power (%)
    -- Data based on user provided notes (Endrain: 1st Q to Lesser Waning G, Enaspir: 3rd Q to New Moon side)
    local moonData =
    {
        [xi.moonCycle.NEW_MOON]                = { effect = xi.effect.ENASPIR, power = 5  },
        [xi.moonCycle.LESSER_WAXING_CRESCENT]  = { effect = xi.effect.ENASPIR, power = 4  },
        [xi.moonCycle.GREATER_WAXING_CRESCENT] = { effect = xi.effect.ENASPIR, power = 2  },
        [xi.moonCycle.FIRST_QUARTER]           = { effect = xi.effect.ENDRAIN, power = 5  },
        [xi.moonCycle.LESSER_WAXING_GIBBOUS]   = { effect = xi.effect.ENDRAIN, power = 8  },
        [xi.moonCycle.GREATER_WAXING_GIBBOUS]  = { effect = xi.effect.ENDRAIN, power = 12 },
        [xi.moonCycle.FULL_MOON]               = { effect = xi.effect.ENDRAIN, power = 15 },
        [xi.moonCycle.GREATER_WANING_GIBBOUS]  = { effect = xi.effect.ENDRAIN, power = 12 },
        [xi.moonCycle.LESSER_WANING_GIBBOUS]   = { effect = xi.effect.ENDRAIN, power = 8  },
        [xi.moonCycle.THIRD_QUARTER]           = { effect = xi.effect.ENASPIR, power = 1  },
        [xi.moonCycle.GREATER_WANING_CRESCENT] = { effect = xi.effect.ENASPIR, power = 2  },
        [xi.moonCycle.LESSER_WANING_CRESCENT]  = { effect = xi.effect.ENASPIR, power = 4  },
    }

    local data       = moonData[moonCycle]
    local typeEffect = data.effect
    local power      = data.power

    -- Remove existing effect if any to prevent conflict
    target:delStatusEffect(xi.effect.ENDRAIN)
    target:delStatusEffect(xi.effect.ENASPIR)

    if target:addStatusEffect(typeEffect, power, 0, duration) then
        if target:getID() == action:getPrimaryTargetID() then
            petskill:setMsg(xi.msg.basic.SKILL_GAIN_EFFECT_2)
        else
            petskill:setMsg(xi.msg.basic.JA_GAIN_EFFECT)
        end
    else
        if target:getID() == action:getPrimaryTargetID() then
            petskill:setMsg(xi.msg.basic.JA_NO_EFFECT_2)
        end
    end

    return 0
end

return abilityObject
