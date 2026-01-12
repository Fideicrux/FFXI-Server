-----------------------------------
-- xi.effect.BLOOD_WEAPON
-- Does not overwritte any existing "Enspell" effect, including "Soul Enslavement"
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    effect:addMod(xi.mod.ENSPELL, 17)
    effect:addMod(xi.mod.ENSPELL_DMG, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local level = target:getMainLvl()
    local effect = xi.effect.ENDARK
    local magicskill = target:getSkillLevel(xi.skill.DARK_MAGIC)
    local potency = (magicskill / 8) + 12.5

    if level >= 75 then
        
    target:addStatusEffect(effect, potency, 0, 7200)

    end
end

return effectObject
