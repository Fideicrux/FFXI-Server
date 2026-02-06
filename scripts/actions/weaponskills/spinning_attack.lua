-----------------------------------
-- Spinning Attack
-- Hand-to-Hand weapon skill
-- Skill Level: 150
-- Delivers an area attack. Radius varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Flame Gorget & Thunder Gorget.
-- Aligned with the Flame Belt & Thunder Belt.
-- Element: None
-- Modifiers: STR: 35%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

-- TODO: Radius 5y at 2334 TP
weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftpMod = { 1.4, 1.4, 1.4 }
    params.str_wsc = 0.35
    params.atkVaries = { 1.5, 1.5, 1.5 }

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.5, 1.5, 1.5 }
        params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
        params.str_wsc = 0.3
        params.dex_wsc = 0.3
        params.ftpMod = { 1.0, 2.0, 3.0 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
