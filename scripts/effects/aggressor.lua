-----------------------------------
-- xi.effect.AGGRESSOR
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local power   = effect:getPower()
    local jpLevel = target:getJobPointLevel(xi.jp.AGGRESSOR_EFFECT)
    local accuracy = effect:getSubPower()

    -- Accuracy bonuses
    target:addMod(xi.mod.ACC, 50 + accuracy) 
    target:addMod(xi.mod.RACC, 50 + accuracy)
    target:addMod(xi.mod.CRIT_HIT_RATE, power)


    -- Evasion penalty (stance drawback)
    effect:addMod(xi.mod.EVA, -15)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.ACC, 50 + accuracy) 
    target:delMod(xi.mod.RACC, 50 + accuracy)
    target:delMod(xi.mod.CRIT_HIT_RATE, power)

    
end

return effectObject
