-----------------------------------
-- xi.effect.BRAZEN_RUSH
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpLevel = target:getJobPointLevel(xi.jp.BRAZEN_RUSH_EFFECT)
    

    target:addMod(xi.mod.TRIPLE_ATTACK, effect:getSubPower())
    target:addMod(xi.mod.ATT, 4 * jpLevel)
    target:addMod(xi.mod.DOUBLE_ATTACK, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpLevel = target:getJobPointLevel(xi.jp.BRAZEN_RUSH_EFFECT)

    target:delMod(xi.mod.TRIPLE_ATTACK, effect:getSubPower())
    target:delMod(xi.mod.ATT, 4 * jpLevel)
    target:delMod(xi.mod.DOUBLE_ATTACK, effect:getPower())
end

return effectObject
