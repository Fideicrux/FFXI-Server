-----------------------------------
-- xi.effect.HUNDRED_FISTS
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    -- Job Point Accuracy bonus (unchanged)
    local jpLevel = target:getJobPointLevel(xi.jp.HUNDRED_FISTS_EFFECT)
    target:addMod(xi.mod.ACC, jpLevel * 2)

    -- Martial Arts adjustment
    local ma = target:getMod(xi.mod.MARTIAL_ARTS)

    -- Reduce Martial Arts by 50% while HF is active
    local maPenalty = math.floor(ma * 0.5)

    effect:setSubPower(maPenalty)
    target:addMod(xi.mod.MARTIAL_ARTS, -maPenalty)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    -- Restore Accuracy
    local jpLevel = target:getJobPointLevel(xi.jp.HUNDRED_FISTS_EFFECT)
    target:delMod(xi.mod.ACC, jpLevel * 2)

    -- Restore Martial Arts
    local maPenalty = effect:getSubPower()
    if maPenalty > 0 then
        target:addMod(xi.mod.MARTIAL_ARTS, maPenalty)
    end
end

return effectObject