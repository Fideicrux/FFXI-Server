-----------------------------------
-- xi.effect.RESTRAINT
-- Minimal, flat WS damage bonus
-----------------------------------

---@type TEffect
local effectObject = {}

-----------------------------------
-- On Gain
-----------------------------------
effectObject.onEffectGain = function(target, effect)
    -- Power unused; force to 0 for clarity
    effect:setPower(0)

    -- Apply flat 30% WS first-hit damage
    target:addMod(xi.mod.ALL_WSDMG_FIRST_HIT, 30)
end

-----------------------------------
-- On Tick
-----------------------------------
effectObject.onEffectTick = function(target, effect)
    -- Intentionally empty
end

-----------------------------------
-- On Lose
-----------------------------------
effectObject.onEffectLose = function(target, effect)
    -- Remove flat 30% WS first-hit damage
    target:delMod(xi.mod.ALL_WSDMG_FIRST_HIT, 30)
end

return effectObject
