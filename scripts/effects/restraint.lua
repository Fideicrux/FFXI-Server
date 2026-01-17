-----------------------------------
-- xi.effect.RESTRAINT
-- Stack controlled by C++
-----------------------------------

---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    effect:setPower(0)
    effect:setSubPower(0) -- fractional remainder bank (C++ uses this)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    -- Safety cleanup: remove whatever C++ stacked
    local p = effect:getPower()
    if p and p > 0 then
        target:delMod(xi.mod.ALL_WSDMG_FIRST_HIT, p)
    end
end

return effectObject
