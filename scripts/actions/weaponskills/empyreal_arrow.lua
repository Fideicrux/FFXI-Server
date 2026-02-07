-----------------------------------
-- Empyreal Arrow
-- Archery weapon skill
-- Skill level: 250
-- In order to obtain Empyreal Arrow, the quest From Saplings Grow must be completed.
-- Delivers a single-hit attack. Damage varies with TP.
-- Aligned with the Flame Gorget & Light Gorget.
-- Aligned with the Flame Belt & Light Belt.
-- Element: None
-- Modifiers: STR:16%  AGI:25%
-- 100%TP    200%TP    300%TP
-- 2.00      2.75      3.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params               = {}
    params.numHits             = 1
    params.ftpMod              = { 2.0, 2.75, 3.0 }
    params.atkVaries           = { 2.0, 2.0, 2.0 } -- https://w.atwiki.jp/studiogobli/pages/93.html
    params.str_wsc             = 0.16
    params.agi_wsc             = 0.25
    params.rangedAccuracyBonus = 100 -- https://www.ffxiah.com/forum/topic/52018/luck-of-the-draw-a-corsairs-guide-new/127/#3726841 (Empyreal Arrow is a bow copy of Detonator)

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.5, 1.5, 1.5 }
        params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
        params.str_wsc = 0.5
        params.agi_wsc = 0.5
        params.ftpMod = { 4.5, 9.0, 13.5 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doRangedWeaponskill(player, target, wsID, params, tp, action, primary)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
