-----------------------------------
-- xi.effect.CASCADE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local power = effect:getPower()
    target:addMod(xi.mod.MATT, power)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local power = effect:getPower()
    target:delMod(xi.mod.MATT, power)
end

return effectObject
