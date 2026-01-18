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
    xi.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    -- 1. Duration Calculation
    -- Base 60s. Adds 1s per skill over 300 (Max +200s). Total Max: 260s.
    local skill = summoner:getSkillLevel(xi.skill.SUMMONING_MAGIC)
    local bonusTime = math.min(math.max(skill - 300, 0), 200)
    local duration = 60 + bonusTime

    -- 2. Moon Phase Logic
    -- Use existing Lua helper which returns the moon cycle index (0..11)
    -- Enaspir: New Moon side (Phases 9, 10, 11, 0, 1, 2)
    -- Endrain: Full Moon side (Phases 3, 4, 5, 6, 7, 8)

    local moonPhase = getVanadielMoonCycle()
    local typeEffect = xi.effect.ENASPIR
    local power = 1

    -- Configuration Table [Phase ID] = { Effect, Power }
    local moonData = {
        [0]  = { eff = xi.effect.ENASPIR, val = 5 },  -- New Moon
        [1]  = { eff = xi.effect.ENASPIR, val = 4 },  -- Waxing Crescent 1
        [2]  = { eff = xi.effect.ENASPIR, val = 2 },  -- Waxing Crescent 2
        [3]  = { eff = xi.effect.ENDRAIN, val = 5 },  -- First Quarter
        [4]  = { eff = xi.effect.ENDRAIN, val = 8 },  -- Waxing Gibbous 1
        [5]  = { eff = xi.effect.ENDRAIN, val = 12 }, -- Waxing Gibbous 2
        [6]  = { eff = xi.effect.ENDRAIN, val = 15 }, -- Full Moon
        [7]  = { eff = xi.effect.ENDRAIN, val = 12 }, -- Waning Gibbous 1
        [8]  = { eff = xi.effect.ENDRAIN, val = 8 },  -- Waning Gibbous 2
        [9]  = { eff = xi.effect.ENASPIR, val = 1 },  -- Third Quarter
        [10] = { eff = xi.effect.ENASPIR, val = 2 },  -- Waning Crescent 1
        [11] = { eff = xi.effect.ENASPIR, val = 4 },  -- Waning Crescent 2
    }

    local data = moonData[moonPhase]
    if data then
        typeEffect = data.eff
        power = data.val
    end

    -- 3. Apply Effect
    -- Remove conflicting effects first
    target:delStatusEffect(xi.effect.ENDRAIN)
    target:delStatusEffect(xi.effect.ENASPIR)

    if target:addStatusEffect(typeEffect, power, 0, duration) then
        if target:getID() == action:getPrimaryTargetID() then
            petskill:setMsg(xi.msg.basic.JA_GAIN_EFFECT)
        else
            petskill:setMsg(xi.msg.basic.JA_RECEIVES_EFFECT)
        end
    else
        petskill:setMsg(xi.msg.basic.JA_NO_EFFECT_2)
    end

    return 0
end

return abilityObject
