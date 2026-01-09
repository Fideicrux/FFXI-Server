-----------------------------------
-- xi.effect.MARCATO
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.UDMGPHYS, -2500)
    target:addMod(xi.mod.UDMGRANGE, -2500)
    target:addMod(xi.mod.UDMGBREATH, -2500)
    target:addMod(xi.mod.UDMGMAGIC, -2500)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.UDMGPHYS, -2500)
    target:delMod(xi.mod.UDMGRANGE, -2500)
    target:delMod(xi.mod.UDMGBREATH, -2500)
    target:delMod(xi.mod.UDMGMAGIC, -2500)
end

return effectObject
