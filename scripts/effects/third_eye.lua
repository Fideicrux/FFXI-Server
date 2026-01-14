-----------------------------------
-- xi.effect.THIRD_EYE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local merit = target:getMerit(xi.merit.THIRD_EYE_RECAST)
    
    effect:addMod(xi.mod.THIRD_EYE_COUNTER_RATE, merit)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
