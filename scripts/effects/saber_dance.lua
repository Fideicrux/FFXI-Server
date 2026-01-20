-----------------------------------
-- xi.effect.SABER_DANCE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local saberDanceMerits = target:getMerit(xi.merit.SABER_DANCE)
    if saberDanceMerits > 5 then
        target:addMod(xi.mod.SAMBA_PDURATION, (saberDanceMerits))
    end

    -- Does not stack with warrior Double Attack trait, so disable it
    

    target:addMod(xi.mod.DOUBLE_ATTACK, effect:getPower())
    target:delStatusEffect(xi.effect.FAN_DANCE)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local saberDanceMerits = target:getMerit(xi.merit.SABER_DANCE)
    if saberDanceMerits > 1 then
        target:delMod(xi.mod.SAMBA_PDURATION, (saberDanceMerits))
    end


    target:delMod(xi.mod.DOUBLE_ATTACK, effect:getPower())
end

return effectObject
