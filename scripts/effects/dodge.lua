-----------------------------------
-- xi.effect.DODGE
-- Note: Glanzfaust bonus is implemented as a latent effect while wearing the equipment and having the effect
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local bonusPower = effect:getPower()
    local monkLevel = math.floor(utils.getActiveJobLevel(target, xi.job.MNK) * (99/75) + 1)

    -- https://www.bg-wiki.com/ffxi/Dodge
    effect:addMod(xi.mod.EVA, monkLevel + bonusPower)
    effect:addMod(xi.mod.ADDITIVE_GUARD, math.floor(monkLevel * 0.2))
    target:addMod(xi.mod.UDMGMAGIC, effect:getSubPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.UDMGMAGIC, effect:getSubPower())
end

return effectObject
