-----------------------------------
-- Spinning Axe
-- Axe weapon skill
-- Skill level: 150
-- Single-hit attack. Damage varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Flame Gorget, Soil Gorget & Thunder Gorget.
-- Aligned with the Flame Belt, Soil Belt & Thunder Belt.
-- Element: None
-- Modifiers: STR:60%
-- 100%TP    200%TP    300%TP
-- 2.00      2.50      3.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 2.0, 3.0, 4.0 }
    params.str_wsc = 0.35
    params.atkVaries = { 1.5, 1.5, 1.5 }

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.str_wsc = 0.5
        params.dex_wsc = 0.5
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
