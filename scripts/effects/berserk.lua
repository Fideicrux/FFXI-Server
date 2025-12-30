-----------------------------------
-- xi.effect.BERSERK
-----------------------------------
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local power = effect:getPower() -- Scales 15 to 28 based on level
    local jpEffect = target:getJobPointLevel(xi.jp.BERSERK_EFFECT) * 2

    -- Attack scaling UP
    target:addMod(xi.mod.ATTP, power)
    target:addMod(xi.mod.RATTP, power)
    
    -- Flat 15% Defense down
    target:addMod(xi.mod.DEFP, -15)

    -- Job Point Bonuses (Legacy)
    target:addMod(xi.mod.ATT, jpEffect)
    target:addMod(xi.mod.RATT, jpEffect)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local power = effect:getPower()
    local jpEffect = target:getJobPointLevel(xi.jp.BERSERK_EFFECT) * 2

    target:delMod(xi.mod.ATTP, power)
    target:delMod(xi.mod.RATTP, power)
    target:delMod(xi.mod.DEFP, -15)
    target:delMod(xi.mod.ATT, jpEffect)
    target:delMod(xi.mod.RATT, jpEffect)
end

return effectObject