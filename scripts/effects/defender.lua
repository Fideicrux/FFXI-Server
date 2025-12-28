-----------------------------------
-- xi.effect.DEFENDER
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local power = effect:getPower()
    local jpLevel = target:getJobPointLevel(xi.jp.DEFENDER_EFFECT)
    local jpEffect = jpLevel * 3

    -- Enhances defense
    effect:addMod(xi.mod.DEFP, power)
    -- Weakens attacks
    effect:addMod(xi.mod.RATTP, -15)
    effect:addMod(xi.mod.ATTP, -15)

    -- Job Point Bonuses (Legacy)
    effect:addMod(xi.mod.DEF, jpEffect)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
