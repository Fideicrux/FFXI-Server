-----------------------------------
-- Howling Fist
-- Hand-to-Hand weapon skill
-- Skill Level: 200
-- Damage varies with TP.
-- Will stack with Sneak Attack.
-- Ignores some defense.
-- Aligned with the Light Gorget & Thunder Gorget.
-- Aligned with the Light Belt & Thunder Belt.
-- Element: None
-- Modifiers: STR:20%  VIT:50%
-- 100%TP    200%TP    300%TP
-- 2.50      2.75      3.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params     = {}
    params.numHits   = 2
    params.ftpMod    = { 2.5, 2.75, 3.0 }
    params.atkVaries = { 1.25, 1.25, 1.25 } -- https://w.atwiki.jp/studiogobli/pages/93.html
    params.str_wsc   = 0.2
    params.vit_wsc   = 0.5

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.25, 1.25, 1.25 }
        params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
        params.str_wsc = 0.3
        params.dex_wsc = 0.3
        params.vit_wsc = 0.0
        params.ftpMod = { 1.875, 3.75, 5.65 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
