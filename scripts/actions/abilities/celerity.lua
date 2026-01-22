-----------------------------------
-- Ability: Celerity
-- Reduces the casting time and the recast time of your next white magic spell by 50%.
-- Obtained: Scholar Level 25
-- Recast Time: Stratagem Charge
-- Duration: 1 white magic spell or 60 seconds, whichever occurs first.
--
-- Level   |Charges |Recharge Time per Charge
-- -----   -------- ---------------
-- 10      |1       |4:00 minutes
-- 30      |2       |2:00 minutes
-- 50      |3       |1:20 minutes
-- 70      |4       |1:00 minute
-- 90      |5       |48 seconds
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    if player:hasStatusEffect(xi.effect.CELERITY) then
        return xi.msg.basic.EFFECT_ALREADY_ACTIVE, 0
    end

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    local merit = player:getMerit(xi.merit.ALTRUISM)

    player:addStatusEffect(xi.effect.CELERITY, 1, 0, 60)

    if merit > 0 then
        player:addStatusEffect(xi.effect.ALTRUISM, player:getMerit(xi.merit.ALTRUISM), 0, 60)
    end

    return xi.effect.CELERITY
end

return abilityObject
