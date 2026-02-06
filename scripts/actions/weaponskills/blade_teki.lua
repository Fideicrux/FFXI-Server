-----------------------------------
-- Blade Teki
-- Katana weapon skill
-- Skill Level: 70
-- Decription: Deals water elemental damage. Damage varies with TP.
-- Aligned with the Aqua Gorget.
-- Aligned with the Aqua Belt.
-- Element: Water
-- Modifiers: STR:20%  INT:20%
-- 100%TP    200%TP    300%TP
-- 0.50      0.75      1.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 1.5, 2.25, 3.0 }
    params.str_wsc = 0.2
    params.int_wsc = 0.2
    params.hybridWS = true
    params.ele = xi.element.WATER
    params.skill = xi.skill.KATANA
    params.includemab = true

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        -- http://wiki.ffo.jp/html/718.html
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.5, 1.5, 1.5 }
        params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
        params.int_wsc = 0.15
        params.dex_wsc = 0.15
        params.str_wsc = 0.0
        params.ftpMod = { 1.375, 2.75, 4.125 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
