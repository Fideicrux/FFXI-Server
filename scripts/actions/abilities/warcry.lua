-----------------------------------
-- Ability: Warcry
-- Job: Warrior
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    if not player:hasStatusEffect(xi.effect.BERSERK) then
        return xi.msg.basic.STATUS_PREVENTS, xi.effect.BERSERK
    end
    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    return xi.job_utils.warrior.useWarcry(player, target, ability)
end

return abilityObject
