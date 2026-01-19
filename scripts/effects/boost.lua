-----------------------------------
-- xi.effect.BOOST
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)

    if effect:getSubPower() == 1 and target:isMob() then -- TODO: what happens if a player steals this boost? It has been observed that Yovra boost does nothing on retail but unknown if that is a bug or not.
        local baseDamage = target:getWeaponDmg()
        effect:addMod(xi.mod. POWER_MULTIPLIER_BASIC_ATTACK, 25)
        effect:addMod(xi.mod. POWER_MULTIPLIER_WEAPONSKILL, 25)
        effect:addMod(xi.mod. POWER_MULTIPLIER_JOB_ABILITY, 25)
    else
        effect:addMod(xi.mod.ATTP, effect:getPower())
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
