-----------------------------------
-- Conflag Strike
-- Deals fire elemental breath damage. Additional effect: Burn.
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    xi.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local tp = pet:getTP()
    local level = summoner:getMainLvl()
    local summoningSkill = summoner:getSkillLevel(xi.skill.SUMMONING_MAGIC)
    local playerINT = summoner:getStat(xi.mod.INT)

    -- Standard Blood Pact Scaling: Based on Summoning Skill and Level
    -- Note: Conflag Strike is a "Breath" type, but scales like a Magical BP.
    local basePower = (summoningSkill * 0.5) + (level * 2) + (playerINT * 1.5)
    
    -- TP scales the damage multiplier (1.0, 2.0, 3.0 effectively at 1k, 2k, 3k TP)
    -- We use a flat bonus here to feed into the breath function
    local tpBonus = xi.combat.physical.calculateTPfactor(tp, { 500, 1000, 1500 }) 
    
    local finalDamage = basePower + tpBonus
    
    -- Params for mobBreathMove
    -- We set multiplier to 0 and pass our calculated damage as 'bonusDamage'
    -- so we have full control over the formula while keeping the Breath mechanics.
    local params = {
        multiplier       = 2.5,
        element          = xi.element.FIRE,
        damageCap        = 99999, -- Uncap it, let the damage formula decide
        bonusDamage      = finalDamage,
        mAccuracyBonus   = { 100, 200, 300 }, -- Not typically used for Breath, but safe to keep
        resistStat       = xi.mod.INT,
    }

    -- Execute Breath Move (Handles Animation, reduction by Breath Damage Taken gear, etc.)
    local damage = xi.mobskills.mobBreathMove(pet, target, petskill, params)

    -- Variance (Random fluctuation 90-110%)
    local variance = math.random(90, 110) / 100
    damage = damage * variance * params.multiplier

    -- Final Adjustments (Avatar specific boosts, day/weather effects)
    damage = xi.summon.avatarFinalAdjustments(damage, pet, petskill, target, xi.attackType.BREATH, xi.damageType.FIRE, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    -- Apply Damage
    target:takeDamage(damage, pet, xi.attackType.BREATH, xi.damageType.FIRE)
    target:updateEnmityFromDamage(pet, damage)

    -- Apply Status Effect: Burn
    if damage > 0 then
        -- Burn: Power, Tick, Duration
        -- Conflag Strike Burn is potent.
        -- Power: 30-40, Tick: 3s, Duration: 60-90s
        xi.mobskills.mobStatusEffectMove(pet, target, xi.effect.BURN, 40, 3, 90)
    end

    return damage
end

return abilityObject
