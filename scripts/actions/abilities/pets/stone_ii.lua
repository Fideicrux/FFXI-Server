-----------------------------------
-- Stone 2
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    xi.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    -- Updated formula to match Stone II Spell (Base: 117, Multiplier: 1.0) * 1.33
    local damage = math.floor(133 + (pet:getStat(xi.mod.INT) * 2.33 - target:getStat(xi.mod.INT)))

    damage = xi.mobskills.mobMagicalMove(pet, target, petskill, damage, xi.element.EARTH, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 0)
    damage = xi.mobskills.mobAddBonuses(pet, target, damage, xi.element.EARTH, petskill)
    damage = xi.summon.avatarFinalAdjustments(damage, pet, petskill, target, xi.attackType.MAGICAL, xi.damageType.EARTH, 1)

    target:takeDamage(damage, pet, xi.attackType.MAGICAL, xi.damageType.EARTH)
    target:updateEnmityFromDamage(pet, damage)

    return damage
end

return abilityObject
