-----------------------------------
-- Ability: Retaliation
-- Job: Warrior
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    if not player:hasStatusEffect(xi.effect.DEFENDER) then
        return xi.msg.basic.STATUS_PREVENTS, xi.effect.DEFENDER
    end
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    return xi.job_utils.warrior.useRetaliation(player, target, ability)
end

return abilityObject
