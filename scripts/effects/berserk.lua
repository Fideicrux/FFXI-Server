-----------------------------------
-- xi.effect.BERSERK
-- Notes:
-- DEFP penalty reduction from Warrior's Calligae NQ/+1/+2 handled by latent effect
-- CRITHITRATE & DOUBLE_ATTACK bonuses from Conqueror (all forms) handled by latent effect
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local power    = effect:getPower()
    local jpEffect = target:getJobPointLevel(xi.jp.BERSERK_EFFECT) * 2

    effect:addMod(xi.mod.ATTP, power)
    effect:addMod(xi.mod.RATTP, power)
    
    -- Changed from -25 to -15
    effect:addMod(xi.mod.DEFP, -15)

    -- Job Point Bonuses (Unused, kept for legacy purposes)
    effect:addMod(xi.mod.ATT, jpEffect)
    effect:addMod(xi.mod.RATT, jpEffect)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local power    = effect:getPower()
    local jpEffect = target:getJobPointLevel(xi.jp.BERSERK_EFFECT) * 2

    target:delMod(xi.mod.ATTP, power)
    target:delMod(xi.mod.RATTP, power)
    
    -- Changed from -25 to -15
    target:delMod(xi.mod.DEFP, -15)

    -- Job Point Bonuses (Unused, kept for legacy purposes)
    target:delMod(xi.mod.ATT, jpEffect)
    target:delMod(xi.mod.RATT, jpEffect)
end

return effectObject
