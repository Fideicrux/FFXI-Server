-----------------------------------
-- xi.effect.DECOY_SHOT
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.POWER_MULTIPLIER_BASIC_RANGED, 10)
    target:addMod(xi.mod.POWER_MULTIPLIER_WEAPONSKILL, 10)
    target:addMod(xi.mod.RACC, 100)
    target:addMod(xi.mod.ENMITY, -10)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.POWER_MULTIPLIER_BASIC_RANGED, 10)
    target:delMod(xi.mod.POWER_MULTIPLIER_WEAPONSKILL, 10)
    target:delMod(xi.mod.RACC, 100)
    target:delMod(xi.mod.ENMITY, -10)
end

return effectObject
