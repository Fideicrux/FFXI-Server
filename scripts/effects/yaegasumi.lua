-----------------------------------
-- xi.effect.YAEGASUMI
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    effect:addMod(xi.mod.ALL_WSDMG_ALL_HITS, 50)
    effect:addMod(xi.mod.SPECIAL_ATTACK_EVASION, 1000)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
