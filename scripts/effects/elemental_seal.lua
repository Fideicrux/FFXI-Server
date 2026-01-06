-----------------------------------
-- xi.effect.ELEMENTAL_SEAL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    
    local power = effect:getPower() * 4

    target:addMod(xi.mod.MATT, power)
    -- Overwrites
    target:delStatusEffectSilent(xi.effect.DARK_SEAL)
    target:delStatusEffectSilent(xi.effect.DIVINE_EMBLEM)
    target:delStatusEffectSilent(xi.effect.DIVINE_SEAL)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local level = target:getMainJob() == xi.job.BLM and target:getMainLvl() or 25 
    local power = level + 25

    target:delMod(xi.mod.MATT, power)
end

return effectObject
