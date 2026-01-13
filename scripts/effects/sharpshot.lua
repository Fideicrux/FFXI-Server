-----------------------------------
-- xi.effect.SHARPSHOT
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpValue = target:getJobPointLevel(xi.jp.SHARPSHOT_EFFECT)
    local merits  = target:getMerit(xi.merit.SHARPSHOT_RECAST)

    target:addMod(xi.mod.RACC, effect:getPower())
    target:addMod(xi.mod.RATT, jpValue * 2)
    target:addMod(xi.mod.RANGED_CRIT_DMG_INCREASE, merits)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local jpValue = target:getJobPointLevel(xi.jp.SHARPSHOT_EFFECT)
    local merits  = target:getMerit(xi.merit.SHARPSHOT_RECAST)

    target:delMod(xi.mod.RACC, effect:getPower())
    target:delMod(xi.mod.RATT, jpValue * 2)
    target:delMod(xi.mod.RANGED_CRIT_DMG_INCREASE, merits)
end

return effectObject
