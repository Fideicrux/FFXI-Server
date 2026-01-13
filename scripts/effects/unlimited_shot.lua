-----------------------------------
-- xi.effect.UNLIMITED_SHOT
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(xi.jp.UNLIMITED_SHOT_EFFECT)
    local jpValue2 = target:getJobPointLevel(xi.jp.DOUBLE_SHOT_EFFECT)

    target:addMod(xi.mod.DOUBLE_SHOT_RATE, 50 + jpValue2)
    target:addMod(xi.mod.ENMITY, -2 * jpValue)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(xi.jp.UNLIMITED_SHOT_EFFECT)
    local jpValue2 = target:getJobPointLevel(xi.jp.DOUBLE_SHOT_EFFECT)

    target:delMod(xi.mod.DOUBLE_SHOT_RATE, 50 + jpValue2)
    target:delMod(xi.mod.ENMITY, -2 * jpValue)
end

return effectObject
