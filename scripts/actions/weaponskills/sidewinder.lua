-----------------------------------
-- Sidewinder
-- Archery weapon skill
-- Skill level: 175
-- Delivers an inparams.accurate attack that deals quintuple damage. params.accuracy varies with TP.
-- Aligned with the Aqua Gorget, Light Gorget & Breeze Gorget.
-- Aligned with the Aqua Belt, Light Belt & Breeze Belt.
-- Element: None
-- Modifiers: STR:20%  AGI:50%
-- 100%TP    200%TP    300%TP
-- 5.00      5.00      5.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 5.0, 5.0, 5.0 }
    params.str_wsc = 0.16
    params.agi_wsc = 0.25
    params.accVaries = { 0.8, 0.9, 1.0 } -- TODO: verify -- "Accuracy varies with TP" in retail. All current evidence points to that this modifier is static values, not percentages.

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.25, 1.25, 1.25 }
        params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
        params.str_wsc = 0.3
        params.agi_wsc = 0.3
        params.ftpMod = { 3.5, 7.0, 11.5 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doRangedWeaponskill(player, target, wsID, params, tp, action, primary)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
