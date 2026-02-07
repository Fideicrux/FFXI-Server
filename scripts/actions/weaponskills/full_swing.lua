-----------------------------------
-- Full Swing
-- Staff weapon skill
-- Skill Level: 200
-- Delivers a single-hit attack. Damage varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Flame Gorget & Thunder Gorget.
-- Aligned with the Flame Belt & Thunder Belt.
-- Element: None
-- Modifiers: STR:50%
-- 100%TP    200%TP    300%TP
-- 1.00      3.00      5.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.multiHitFtp = true
    params.accVaries = { 1.0, 1.25, 1.5 }
    params.atkVaries = { 1.25, 1.25, 1.25 }
    params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
    params.str_wsc = 0.3
    params.int_wsc = 0.3
    params.ftpMod = { 3.75, 7.5, 11.25 }
    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
