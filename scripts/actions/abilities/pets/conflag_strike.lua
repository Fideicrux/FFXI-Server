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

    local basePower = (summoningSkill * 0.5) + (level * 2) + (playerINT * 1.5)

    local tpBonus = xi.combat.physical.calculateTPfactor(tp, { 500, 1000, 1500 }) 
    
    local finalDamage = basePower + tpBonus
    

    local params = {
        multiplier       = 2.5,
        element          = xi.element.FIRE,
        damageCap        = 99999, -- Uncap it, let the damage formula decide
        bonusDamage      = finalDamage,
        mAccuracyBonus   = { 100, 200, 300 }, -- Not typically used for Breath, but safe to keep
        resistStat       = xi.mod.INT,
    }

    local damage = xi.mobskills.mobBreathMove(pet, target, petskill, params)

    local variance = math.random(90, 110) / 100
    damage = damage * variance * params.multiplier

    damage = xi.summon.avatarFinalAdjustments(damage, pet, petskill, target, xi.attackType.BREATH, xi.damageType.FIRE, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

    target:takeDamage(damage, pet, xi.attackType.BREATH, xi.damageType.FIRE)
    target:updateEnmityFromDamage(pet, damage)


    if damage > 0 then
        xi.mobskills.mobStatusEffectMove(pet, target, xi.effect.BURN, ((playerINT)/4), 3, 90)
    end

    return damage
end

return abilityObject
