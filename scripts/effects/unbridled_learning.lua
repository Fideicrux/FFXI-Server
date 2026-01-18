-----------------------------------
-- xi.effect.UNBRIDLED_LEARNING
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    effect:addMod(xi.mod.ATTP, 25)
    effect:addMod(xi.mod.MATTP, 25)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
