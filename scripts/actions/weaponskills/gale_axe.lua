-----------------------------------
-- Gale Axe
-- Axe weapon skill
-- Skill level: 70
-- Chokes enemy. Duration of effect varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Breeze Gorget.
-- Aligned with the Breeze Belt.
-- Element: Wind
-- Modifiers: STR:30%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 1.5, 1.5, 1.5 }
    params.str_wsc = 0.3

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.5, 1.5, 1.5 }
        params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
        params.str_wsc = 0.5
        params.dex_wsc = 0.5
        params.ftpMod = { 1.5,  3.0, 4.5 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
