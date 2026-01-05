-----------------------------------
-- xi.effect.WARCRY
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local power    = effect:getPower()
    local jpEffect = target:getJobPointLevel(xi.jp.WARCRY_EFFECT) * 3

    target:addMod(xi.mod.ATTP, power)
    target:addMod(xi.mod.RATTP, power)
    target:addMod(xi.mod.TP_BONUS, 500)
    --target:addMod(xi.mod.TP_BONUS, effect:getSubPower())

    -- Job Point Bonus
    target:addMod(xi.mod.ATT, jpEffect)
    target:addMod(xi.mod.RATT, jpEffect)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local power    = effect:getPower()
    local jpEffect = target:getJobPointLevel(xi.jp.WARCRY_EFFECT) * 3

    target:delMod(xi.mod.ATTP, power)
    target:delMod(xi.mod.RATTP, power)
    target:delMod(xi.mod.TP_BONUS, 500)

    target:delMod(xi.mod.ATT, jpEffect)
    target:delMod(xi.mod.RATT, jpEffect)
end

return effectObject
