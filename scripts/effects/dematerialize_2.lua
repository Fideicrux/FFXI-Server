-----------------------------------
-- xi.effect.DEMATERIALIZE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local power = effect:getPower() * 100

    target:addMod(xi.mod.UDMGPHYS, -power)
    target:addMod(xi.mod.UDMGMAGIC, -power)
    target:addMod(xi.mod.UDMGBREATH, -power)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local power = effect:getPower() * 100

    target:delMod(xi.mod.UDMGPHYS, -power)
    target:delMod(xi.mod.UDMGMAGIC, -power)
    target:delMod(xi.mod.UDMGBREATH, -power)
end

return effectObject