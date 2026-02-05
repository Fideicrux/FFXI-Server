-----------------------------------
-- Dark Harvest
-- Scythe weapon skill
-- Skill Level: 30
-- Delivers a dark elemental attack. Damage varies with TP.
-- Aligned with the Aqua Gorget.
-- Aligned with the Aqua Belt.
-- Element: Dark
-- Modifiers: STR:20%  INT:20%
-- 100%TP    200%TP    300%TP
-- 1.00      2.00      2.50
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 1.75, 2.625, 3.5 }
    params.str_wsc = 0.2
    params.int_wsc = 0.2
    params.hybridWS = true
    params.ele = xi.element.DARK
    params.skill = xi.skill.SCYTHE
    params.includemab = true
    params.atkVaries = { 1.5, 1.5, 1.5 }

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.str_wsc = 0.75
        params.int_wsc = 0.25
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
