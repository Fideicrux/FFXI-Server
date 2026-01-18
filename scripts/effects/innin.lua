-----------------------------------
-- xi.effect.INNIN
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect) -- Power = 30 initially, subpower = 20 for enmity
    local power    = effect:getPower()
    local subpower = effect:getSubPower()
    local jpValue = target:getJobPointLevel(xi.jp.INNIN_EFFECT)

    target:addMod(xi.mod.NIN_NUKE_BONUS_INNIN, power)
    target:addMod(xi.mod.ENMITY, -subpower)
    target:addMod(xi.mod.FASTCAST, 50)
    target:addMod(xi.mod.CRIT_DMG_INCREASE, subpower)
    target:addMod(xi.mod.ACC, jpValue)
end

effectObject.onEffectTick = function(target, effect)

end

effectObject.onEffectLose = function(target, effect)
    local power   = effect:getPower()
    local subpower = effect:getSubPower()
    local jpValue = target:getJobPointLevel(xi.jp.INNIN_EFFECT)

    -- Remove the remaining modifiers.
    target:delMod(xi.mod.NIN_NUKE_BONUS_INNIN, power)
    target:delMod(xi.mod.ENMITY, -subpower)
    target:delMod(xi.mod.FASTCAST, 50)
    target:delMod(xi.mod.CRIT_DMG_INCREASE, subpower)
    target:delMod(xi.mod.ACC, jpValue)
end

return effectObject
