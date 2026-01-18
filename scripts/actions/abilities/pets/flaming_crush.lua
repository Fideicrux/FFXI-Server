-----------------------------------
-- Flaming Crush
-- Hybrid
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    local numhits = 3
    local accmod  = 1
    local dmgmod  = 2.5 -- Lower than Axe Kick because we add magic damage on top

    xi.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local physDamage = xi.summon.avatarPhysicalMove(pet, target, petskill, numhits, accmod, dmgmod, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 1, 2, 3)
    
    local finalDmg = math.floor(physDamage.dmg + (summoner:getStat(xi.mod.INT) * 40) - target:getStat(xi.mod.INT))

    -- Apply Elements and Final Adjustments
    finalDmg = xi.mobskills.mobMagicalMove(pet, target, petskill, finalDmg, xi.element.FIRE, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 0)
    finalDmg = xi.mobskills.mobAddBonuses(pet, target, finalDmg, xi.element.FIRE, petskill)
    finalDmg = xi.summon.avatarFinalAdjustments(finalDmg, pet, petskill, target, xi.attackType.PHYSICAL, xi.damageType.BLUNT, numhits)

    target:takeDamage(finalDmg, pet, xi.attackType.PHYSICAL, xi.damageType.BLUNT)
    target:updateEnmityFromDamage(pet, finalDmg)

    return finalDmg
end

return abilityObject