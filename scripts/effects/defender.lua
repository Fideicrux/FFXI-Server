-----------------------------------
-- xi.effect.DEFENDER
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local defPower = effect:getPower()  -- 25
    local pdtPower = effect:getSubPower()  -- 5 to 15
    
    local jpLevel = target:getJobPointLevel(xi.jp.DEFENDER_EFFECT)
    local jpEffect = jpLevel * 3

    target:addMod(xi.mod.DEFP, defPower)
    target:addMod(xi.mod.UDMGPHYS, -((pdtPower)*100))

    -- Weakens attacks (Standard -15% penalty)
    target:addMod(xi.mod.RATTP, -15)
    target:addMod(xi.mod.ATTP, -15)

    -- Job Point Bonuses
    target:addMod(xi.mod.DEF, jpEffect)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local defPower = effect:getPower()  -- 25
    local pdtPower = effect:getSubPower()  -- 5 to 15
    
    local jpLevel = target:getJobPointLevel(xi.jp.DEFENDER_EFFECT)
    local jpEffect = jpLevel * 3

    target:delMod(xi.mod.DEFP, defPower)
    target:delMod(xi.mod.UDMGPHYS, -((pdtPower)*100))

    -- Weakens attacks (Standard -15% penalty)
    target:delMod(xi.mod.RATTP, -15)
    target:delMod(xi.mod.ATTP, -15)

    -- Job Point Bonuses
    target:delMod(xi.mod.DEF, jpEffect)
end

return effectObject
