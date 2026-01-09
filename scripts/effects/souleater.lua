-----------------------------------
-- xi.effect.SOULEATER
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local merits = target:getMerit(xi.merit.MUTED_SOUL)
    local drain  = target:getMerit(xi.merit.SOULEATER_RECAST)

    target:addMod(xi.mod.ACC, 100)
    target:addMod(xi.mod.DREAD_SPIKES_EFFECT, merits)
    target:addMod(xi.mod.ENH_DRAIN_ASPIR, drain)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local merits = target:getMerit(xi.merit.MUTED_SOUL)
    local drain  = target:getMerit(xi.merit.SOULEATER_RECAST)

    target:delMod(xi.mod.ACC, 100)
    target:delMod(xi.mod.DREAD_SPIKES_EFFECT, merits)
    target:delMod(xi.mod.ENH_DRAIN_ASPIR, drain)
end

return effectObject
