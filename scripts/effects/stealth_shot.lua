-----------------------------------
-- xi.effect.STEALTH_SHOT
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.RATTP, effect:getPower())
    target:addMod(xi.mod.ENMITY, -effect:getSubPower())
    target:addMod(xi.mod.BOUNTY_SHOT_TH_BONUS, 2)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.RATTP, effect:getPower())
    target:delMod(xi.mod.ENMITY, -effect:getSubPower())
    target:delMod(xi.mod.BOUNTY_SHOT_TH_BONUS, 2)
end

return effectObject
