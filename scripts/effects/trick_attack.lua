-----------------------------------
-- xi.effect.TRICK_ATTACK
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(xi.jp.TRICK_ATTACK_EFFECT)
    local merit = player:getMerit(xi.merit.TRICK_ATTACK_RECAST)

    target:addMod(xi.mod.TRICK_ATK_AGI, jpValue + merit)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(xi.jp.TRICK_ATTACK_EFFECT)
    local merit = player:getMerit(xi.merit.TRICK_ATTACK_RECAST)

    target:delMod(xi.mod.TRICK_ATK_AGI, jpValue + merit)
end

return effectObject
