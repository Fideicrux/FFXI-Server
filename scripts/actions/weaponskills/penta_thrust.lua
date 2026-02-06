-----------------------------------
-- Penta Thrust
-- Polearm weapon skill
-- Skill Level: 150
-- Delivers a five-hit attack. params.accuracy varies with TP.
-- 0.875 Attack penalty
-- Will stack with Sneak Attack.
-- Aligned with the Shadow Gorget.
-- Aligned with the Shadow Belt.
-- Element: None
-- Modifiers: STR:20%  DEX:20%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 5
    params.multiHitFtp = true
    params.accVaries = { 1.0, 1.25, 1.5 }
    params.atkVaries = { 1.25, 1.25, 1.25 }
    params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
    params.str_wsc = 0.3
    params.dex_wsc = 0.3
    params.ftpMod = { 0.65, 1.3, 1.95 }
    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
