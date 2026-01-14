-----------------------------------
-- xi.effect.ELEMENTAL_SEAL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    
    local power = effect:getPower()

    effect:addMod(xi.mod.MATT, power)
    -- Overwrites
    target:delStatusEffectSilent(xi.effect.DARK_SEAL)
    target:delStatusEffectSilent(xi.effect.DIVINE_EMBLEM)
    target:delStatusEffectSilent(xi.effect.DIVINE_SEAL)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
