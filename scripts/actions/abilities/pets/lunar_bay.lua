-----------------------------------
-- Lunar Bay
-- Mapped in pet_skills as ID 537
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    -- Lunar Bay is a Magical Blood Pact (Dark Damage)
    xi.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local tp = pet:getTP()
    local level = summoner:getMainLvl()
    local summoningSkill = summoner:getSkillLevel(xi.skill.SUMMONING_MAGIC)
    local playerINT = summoner:getStat(xi.mod.INT)

    local basePower = (summoningSkill * 0.8) + (level * 2) + (playerINT * 1.5)


    local dINT = summoner:getStat(xi.mod.INT) - target:getStat(xi.mod.INT)
    if dINT < 0 then dINT = 0 end


    local tpMultiplier = xi.combat.physical.calculateTPfactor(tp, { 1.0, 1.5, 2.0 })

    local damage = (basePower + (dINT * 1.5) + 500) * tpMultiplier

    damage = xi.mobskills.mobMagicalMove(pet, target, petskill, damage, xi.element.DARK, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 0)
    damage = xi.mobskills.mobAddBonuses(pet, target, damage, xi.element.DARK, petskill)
    damage = xi.summon.avatarFinalAdjustments(damage, pet, petskill, target, xi.attackType.MAGICAL, xi.damageType.DARK, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    target:takeDamage(damage, pet, xi.attackType.MAGICAL, xi.damageType.DARK)
    target:updateEnmityFromDamage(pet, damage)

    return damage
end

return abilityObject
