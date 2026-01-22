-----------------------------------
-- xi.effect.LIBRA
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    effect:addMod(xi.mod.POWER_MULTIPLIER_SPELL, 20)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
