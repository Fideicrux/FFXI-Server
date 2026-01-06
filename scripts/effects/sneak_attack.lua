-----------------------------------
-- xi.effect.SNEAK_ATTACK
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(xi.jp.SNEAK_ATTACK_EFFECT)
    local merit = target:getMerit(xi.merit.SNEAK_ATTACK_RECAST)

    target:addMod(xi.mod.SNEAK_ATK_DEX, jpValue + merit)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(xi.jp.SNEAK_ATTACK_EFFECT)
    local merit = target:getMerit(xi.merit.SNEAK_ATTACK_RECAST)
    target:delMod(xi.mod.SNEAK_ATK_DEX, jpValue + merit)
end

return effectObject
