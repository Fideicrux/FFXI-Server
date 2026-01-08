-----------------------------------
-- xi.effect.PALISADE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.PALISADE_BLOCK_BONUS, effect:getPower())
    target:addMod(xi.mod.UDMGPHYS, (effect:getPower() * -100))
    target:addMod(xi.mod.UDMGRANGE, (effect:getPower() * -100))
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.PALISADE_BLOCK_BONUS, effect:getPower())
    target:delMod(xi.mod.UDMGPHYS, (effect:getPower() * -100))
    target:delMod(xi.mod.UDMGRANGE, (effect:getPower() * -100))

end

return effectObject
