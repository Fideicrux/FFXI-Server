-----------------------------------
-- xi.effect.DEFENDER
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local defPower = effect:getPower()
    local jpLevel = target:getJobPointLevel(xi.jp.DEFENDER_EFFECT)
    local jpEffect = jpLevel * 3
    local merit = ((effect:getSubPower) * -100)

    target:addMod(xi.mod.DEFP, defPower)
    target:addMod(xi.mod.UDMGPHYS, -defPower * 100)
    target:addMod(xi.mod.UDMGMAGIC, merit)

    -- The standard attack penalty remains constant
    target:addMod(xi.mod.RATTP, -15)
    target:addMod(xi.mod.ATTP, -15)

    -- Job Point Bonuses
    target:addMod(xi.mod.DEF, jpEffect)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local defPower = effect:getPower()
    
    local jpLevel = target:getJobPointLevel(xi.jp.DEFENDER_EFFECT)
    local jpEffect = jpLevel * 3

    target:delMod(xi.mod.DEFP, defPower)
    target:delMod(xi.mod.UDMGPHYS, -defPower * 100)
    target:delMod(xi.mod.UDMGMAGIC, merit)

    -- Weakens attacks (Standard -15% penalty)
    target:delMod(xi.mod.RATTP, -15)
    target:delMod(xi.mod.ATTP, -15)

    -- Job Point Bonuses
    target:delMod(xi.mod.DEF, jpEffect)
end

return effectObject
