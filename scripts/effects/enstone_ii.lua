-----------------------------------
-- xi.effect.ENSTONE_II
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.ENSPELL, xi.element.EARTH + 8) -- Tier IIs have higher "enspell IDs"

    -- Treat Tier II enspell as fully ramped on cast by setting ENSPELL_DMG to the calculated cap
    local skill = target:getSkillLevel(xi.skill.ENHANCING_MAGIC)
    local cap
    if skill > 200 then
        cap = 5 + math.floor(5 * skill / 100)
    else
        cap = 3 + math.floor(6 * skill / 100)
    end
    cap = cap * 2
    target:setMod(xi.mod.ENSPELL_DMG, cap)

    -- Set chance to trigger an elemental spell proc: 5 + ((ElementalSkill - 270) / 10) percent
    local elemSkill = target:getSkillLevel(xi.skill.ELEMENTAL_MAGIC)
    local chance = 5 + math.floor((elemSkill - 270) / 10)
    if chance < 1 then
        chance = 1
    elseif chance > 100 then
        chance = 100
    end
    target:setMod(xi.mod.ENSPELL_PROC_CHANCE, chance)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:setMod(xi.mod.ENSPELL_DMG, 0)
    target:setMod(xi.mod.ENSPELL, 0)
    target:setMod(xi.mod.ENSPELL_PROC_CHANCE, 0)
end

return effectObject
