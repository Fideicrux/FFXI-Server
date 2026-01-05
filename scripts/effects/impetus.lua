-----------------------------------
-- xi.effect.IMPETUS
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.ATT, 100)
    target:addMod(xi.mod.CRITHITRATE, 50)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.ATT, 100)
    target:delMod(xi.mod.CRITHITRATE, 50)
end

return effectObject
