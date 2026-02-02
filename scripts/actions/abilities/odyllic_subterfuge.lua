-----------------------------------
-- Ability: Odyllic Subterfuge
-- Description: Strikes the target with your sword and decreases its magic attack and accuracy.
-- Obtained: RUN Level 96
-- Recast Time: 01:00:00
-- Duration: 00:00:30
-----------------------------------
---@type TAbility
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.rune_fencer.checkOdyllicSubterfuge(player, target, ability)
end

abilityObject.onUseAbility = function(player, target, ability)
    return xi.job_utils.rune_fencer.useOdyllicSubterfuge(player, target, ability)
end

return abilityObject