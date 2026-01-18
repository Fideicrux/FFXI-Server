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
    -- Dark elemental magical Blood Pact with TP scaling
    xi.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local tp = pet:getTP()
    local intBonus = summoner:getMainLvl() ^ 2
    local intDiff = (intBonus) - target:getStat(xi.mod.INT)

    local damage = math.floor(1750 + 0.5 * tp + intDiff * 2.0)

    damage = xi.mobskills.mobMagicalMove(pet, target, petskill, damage, xi.element.DARK, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 0)
    damage = xi.mobskills.mobAddBonuses(pet, target, damage, xi.element.DARK, petskill)
    local totaldamage = xi.summon.avatarFinalAdjustments(damage, pet, petskill, target, xi.attackType.MAGICAL, xi.damageType.DARK, 1)

    target:takeDamage(totaldamage, pet, xi.attackType.MAGICAL, xi.damageType.DARK)
    target:updateEnmityFromDamage(pet, totaldamage)

    return totaldamage
end

return abilityObject
