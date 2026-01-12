-----------------------------------
-- xi.effect.NETHER_VOID
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local power    = player:getMerit(xi.merit.DARK_SEAL) 
    local subPower = player:getMerit(xi.merit.DARK_SEAL) * player:getMod(xi.mod.ENHANCES_DARK_SEAL) / 10

    target:delStatusEffectSilent(xi.effect.DIVINE_EMBLEM)
    target:delStatusEffectSilent(xi.effect.DIVINE_SEAL)
    target:delStatusEffectSilent(xi.effect.ELEMENTAL_SEAL)

    effect:addMod(xi.mod.DARK_MAGIC_CAST, -power)
    effect:addMod(xi.mod.DARK_MAGIC_DURATION, subPower)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
