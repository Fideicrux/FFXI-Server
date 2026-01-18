-----------------------------------
-- Meteor Strike
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    local meritType = xi.merit.METEOR_STRIKE
    local intMult   = 40 
    local tpMult    = 2.5

    xi.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local tp = pet:getTP()
    if summoner:isPC() then
        tp = tp + summoner:getMerit(meritType)
    end
    tp = utils.clamp(tp - 400, 0, 3000)

    local damage = math.floor((summoner:getStat(xi.mod.INT) * intMult) - target:getStat(xi.mod.INT) + (tp * tpMult))

    -- 4. Standard Magic Processing
    damage = xi.mobskills.mobMagicalMove(pet, target, petskill, damage, xi.element.FIRE, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 0)
    damage = xi.mobskills.mobAddBonuses(pet, target, damage, xi.element.FIRE, petskill)
    damage = xi.summon.avatarFinalAdjustments(damage, pet, petskill, target, xi.attackType.MAGICAL, xi.damageType.FIRE, 1)

    target:takeDamage(damage, pet, xi.attackType.MAGICAL, xi.damageType.FIRE)
    target:updateEnmityFromDamage(pet, damage)

    return damage
end

return abilityObject