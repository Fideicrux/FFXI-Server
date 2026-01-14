-----------------------------------
-- xi.effect.DIABOLIC_EYE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    effect:addMod(xi.mod.ACC, 50)
    effect:addMod(xi.mod.CRITHITRATE, effect:getPower())
    effect:addMod(xi.mod.CRIT_DMG_INCREASE, effect:getPower())
    effect:addMod(xi.mod.HPP, 10)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
