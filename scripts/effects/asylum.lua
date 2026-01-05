-----------------------------------
-- xi.effect.ASYLUM
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    -- TODO: Audit power and add Job point effect
    target:addMod(xi.mod.SLEEP_MEVA, 98)
    target:addMod(xi.mod.POISON_MEVA, 98)
    target:addMod(xi.mod.PARALYZE_MEVA, 98)
    target:addMod(xi.mod.BLIND_MEVA, 98)
    target:addMod(xi.mod.SILENCE_MEVA, 98)
    target:addMod(xi.mod.VIRUS_MEVA, 98)
    target:addMod(xi.mod.PETRIFY_MEVA, 98)
    target:addMod(xi.mod.BIND_MEVA, 98)
    target:addMod(xi.mod.CURSE_MEVA, 98)
    target:addMod(xi.mod.GRAVITY_MEVA, 98)
    target:addMod(xi.mod.SLOW_MEVA, 98)
    target:addMod(xi.mod.STUN_MEVA, 98)
    target:addMod(xi.mod.CHARM_MEVA, 98)
    target:addMod(xi.mod.AMNESIA_MEVA, 98)
    target:addMod(xi.mod.LULLABY_MEVA, 98)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
