-----------------------------------
-- xi.effect.SENTINEL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local enmityBonus = 100
    local merits      = target:getMerit(xi.merit.SENTINEL_RECAST) * -100

    if target:getMainJob() ~= xi.job.PLD then
        enmityBonus = 50
    end

    target:addMod(xi.mod.UDMGPHYS, -effect:getPower())
    target:addMod(xi.mod.UDMGRANGE, -effect:getPower())
    target:addMod(xi.mod.UDMGMAGIC, merits)
    target:addMod(xi.mod.ENMITY, enmityBonus)
    target:addMod(xi.mod.ENMITY_LOSS_REDUCTION, effect:getSubPower())
end

effectObject.onEffectTick = function(target, effect)

end

effectObject.onEffectLose = function(target, effect)
    local enmityBonus = 100
    local merits      = player:getMerit(xi.merit.SENTINEL_RECAST) * -100

    if target:getMainJob() ~= xi.job.PLD then
        enmityBonus = 50
    end

    target:delMod(xi.mod.UDMGPHYS, -effect:getPower())
    target:delMod(xi.mod.UDMGRANGE, -effect:getPower())
    target:delMod(xi.mod.UDMGMAGIC, merits)
    target:delMod(xi.mod.ENMITY, enmityBonus)
    target:delMod(xi.mod.ENMITY_LOSS_REDUCTION, effect:getSubPower())
end

return effectObject
