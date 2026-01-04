-----------------------------------
-- xi.effect.AGGRESSOR
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local power   = effect:getPower()
    local jpLevel = target:getJobPointLevel(xi.jp.AGGRESSOR_EFFECT)

    -- Accuracy bonuses
    effect:addMod(xi.mod.ACC, 50)
    effect:addMod(xi.mod.RACC, 50)


    -- Evasion penalty (stance drawback)
    effect:addMod(xi.mod.EVA, -15)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
