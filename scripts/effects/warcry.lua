-----------------------------------
-- xi.effect.WARCRY
-- Notes:
-- Savagery TP bonus not cut in half like ffxclopedia says.
-- ffxiclopedia is wrong, bg wiki right. See link where testing was done.
-- http://www.bluegartr.com/threads/108199-Random-Facts-Thread-Other?p=5367464&viewfull=1#post5367464
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local power    = effect:getPower()
    local jpEffect = target:getJobPointLevel(xi.jp.WARCRY_EFFECT) * 3

    effect:addMod(xi.mod.ATTP, power)
    effect:addMod(xi.mod.RATTP, power)
    effect:addMod(xi.mod.TP_BONUS, effect:getSubPower())

    -- Job Point Bonus
    effect:addMod(xi.mod.ATT, jpEffect)
    effect:addMod(xi.mod.RATT, jpEffect)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local power    = effect:getPower()
    local jpEffect = target:getJobPointLevel(xi.jp.WARCRY_EFFECT) * 3

    target:delMod(xi.mod.ATTP, power)
    target:delMod(xi.mod.RATTP, power)
    target:delMod(xi.mod.TP_BONUS, effect:getSubPower())

    -- Job Point Bonus
    target:delMod(xi.mod.ATT, jpEffect)
    target:delMod(xi.mod.RATT, jpEffect)
end

return effectObject
