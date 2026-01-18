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
    -- Based on similar Lv65 BPs (Chaotic Strike, Predator Claws)
    -- Hits: 3
    -- M: ~9-10
    -- Sub: ~2
    local numhits = 3
    local accmod = 1
    local dmgmod = 9
    local dmgmodsubsequent = 2

    xi.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local damage = xi.summon.avatarPhysicalMove(pet, target, petskill, numhits, accmod, dmgmod, dmgmodsubsequent, xi.mobskills.physicalTpBonus.DMG_VARIES, 1.0, 1.5, 2.0)
    
    -- Titan moves in this repo seem to use SLASHING damage type (Rock Throw, Megalith Throw, Mountain Buster)
    local totaldamage = xi.summon.avatarFinalAdjustments(damage.dmg, pet, petskill, target, xi.attackType.PHYSICAL, xi.damageType.SLASHING, numhits)

    if totaldamage > 0 then
        -- Apply Slow only on successful hit.
        xi.mobskills.mobPhysicalStatusEffectMove(pet, target, petskill, xi.effect.SLOW, 3000, 0, 180)
    end

    target:takeDamage(totaldamage, pet, xi.attackType.PHYSICAL, xi.damageType.SLASHING)
    target:updateEnmityFromDamage(pet, totaldamage)
    return totaldamage
end

return abilityObject
