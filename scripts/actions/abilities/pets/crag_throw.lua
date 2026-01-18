-----------------------------------
-- Crag Throw
-- Description: Delivers a threefold attack. Additional effect: Slow. Damage varies with TP.
-- Level: 65
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    xi.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local numhits = 4
    local accmod = 1.0 -- Merit BPs usually have decent accuracy
    
    local dmgmod = 1.5           -- First hit
    local dmgmodsubsequent = 1.3 -- Remaining 3 hits

    local tpBonus1000 = 1.0
    local tpBonus2000 = 1.5
    local tpBonus3000 = 2.0 -- Big jump at 3k TP is standard for Merit BPs

    local damage = xi.summon.avatarPhysicalMove(pet, target, petskill, numhits, accmod, dmgmod, dmgmodsubsequent, xi.mobskills.physicalTpBonus.DMG_VARIES, tpBonus1000, tpBonus2000, tpBonus3000)
    
    local totaldamage = xi.summon.avatarFinalAdjustments(damage.dmg, pet, petskill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, numhits)

    if totaldamage > 0 then
        xi.mobskills.mobPhysicalStatusEffectMove(pet, target, petskill, xi.effect.SLOW, 25, 0, 180)
    end

    target:takeDamage(totaldamage, pet, xi.attackType.PHYSICAL, xi.damageType.BLUNT)
    target:updateEnmityFromDamage(pet, totaldamage)
    
    return totaldamage
end

return abilityObject
