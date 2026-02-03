-----------------------------------
-- Raging Fists
-- Hand-to-Hand weapon skill
-- Skill Level: 125
-- Delivers a fivefold attack. Damage varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Thunder Gorget.
-- Aligned with the Thunder Belt.
-- Element: None
-- Modifiers: STR:20%  DEX:20%
-- 100%TP    200%TP    300%TP
-- 1.00       1.5        2
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 5
    params.ftpMod = { 1.0, 1.5, 2.0 }
    params.str_wsc = 0.2
    params.dex_wsc = 0.2
    params.atkVaries = { 1.5, 1.5, 1.5 }

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitfTP = true -- http://wiki.ffo.jp/html/2420.html
        params.ftpMod = { 0.8, 1.2, 1.6 }
        params.str_wsc = 0.5
        params.dex_wsc = 0.5
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
