-----------------------------------
-- Ability: Hasso
-- Grants a bonus to attack speed, accuracy, and Strength when using two-handed weapons, but increases recast and casting times.
-- Obtained: Samurai Level 25
-- Recast Time: 1:00
-- Duration: 5:00
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    if not target:isWeaponTwoHanded() then
        return xi.msg.basic.NEEDS_2H_WEAPON, 0
    end

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    local strboost = 0
    local accboost = 0

    if target:getMainJob() == xi.job.SAM then
        strboost = (target:getMainLvl() / 5) + target:getJobPointLevel(xi.jp.HASSO_EFFECT)
        accboost    = (target:getMainLvl())
    elseif target:getSubJob() == xi.job.SAM then
        strboost = target:getSubLvl() / 5
        accboost = target:getSubLvl()
    end

    if strboost > 0 then
        target:delStatusEffect(xi.effect.HASSO)
        target:delStatusEffect(xi.effect.SEIGAN)
        target:addStatusEffect(xi.effect.HASSO, strboost, 0, 300, 0, accboost)
    end
end

return abilityObject
