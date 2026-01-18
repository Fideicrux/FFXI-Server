-----------------------------------
-- xi.effect.UNBRIDLED_WISDOM
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(xi.jp.UNBRIDLED_WISDOM_EFFECT)

    target:addMod(xi.mod.CONSERVE_MP, jpValue * 3)
    effect:addMod(xi.mod.HASTE_MAGIC, 1500)
    effect:addMod(xi.mod.DEFP, 15)
    effect:addMod(xi.mod.REGEN, 30)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(xi.jp.UNBRIDLED_WISDOM_EFFECT)

    target:delMod(xi.mod.CONSERVE_MP, jpValue * 3)
end

return effectObject
