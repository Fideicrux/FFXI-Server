-----------------------------------
-- xi.effect.AGGRESSOR
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local power   = effect:getPower()
    local jpLevel = target:getJobPointLevel(xi.jp.AGGRESSOR_EFFECT)

    -- Accuracy bonuses
    target:addMod(xi.mod.ACC,  power + jpLevel)
    target:addMod(xi.mod.RACC, power + jpLevel)

    -- Evasion penalty (stance drawback)
    target:addMod(xi.mod.EVA, -power)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local power   = effect:getPower()
    local jpLevel = target:getJobPointLevel(xi.jp.AGGRESSOR_EFFECT)

    target:delMod(xi.mod.ACC,  power + jpLevel)
    target:delMod(xi.mod.RACC, power + jpLevel)
    
    target:delMod(xi.mod.EVA, -power)

end

return effectObject
