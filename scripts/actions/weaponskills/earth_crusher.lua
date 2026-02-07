-----------------------------------
-- Earth Crusher
-- Staff weapon skill
-- Skill Level: 70
-- Delivers an area of effect earth elemental attack. Damage varies with TP.
-- Aligned with the Breeze Gorget & Thunder Gorget.
-- Aligned with the Breeze Belt & Thunder Belt.
-- Element: Earth
-- Modifiers: STR:30%  INT:30%
-- 100%TP    200%TP    300%TP
-- 1.00      2.31      3.63
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.ftpMod = { 1.0, 2.3125, 3.625 }
    params.str_wsc = 0.3
    params.int_wsc = 0.3
    params.ele = xi.element.EARTH
    params.skill = xi.skill.STAFF
    params.includemab = true

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.25, 1.25, 1.25 }
        params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
        params.str_wsc = 0.0
        params.int_wsc = 0.3
        params.ftpMod = { 1.5, 3.0, 4.5 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doMagicWeaponskill(player, target, wsID, params, tp, action, primary)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
