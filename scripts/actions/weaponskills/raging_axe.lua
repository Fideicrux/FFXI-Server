-----------------------------------
-- Raging Axe
-- Axe weapon skill
-- Skill level: 5
-- Delivers a two-hit attack. Damage varies with TP.
-- Will stack with Sneak Attack.
-- When stacked with Sneak Attack, both hits have a 100% chance of landing, though it is unclear if they both params.crit.
-- Aligned with the Breeze Gorget & Thunder Gorget.
-- Aligned with the Breeze Belt & Thunder Belt.
-- Element: None
-- Modifiers: STR:60%
-- 100%TP    200%TP    300%TP
-- 1.00      1.50      2.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftpMod = { 2.0, 3.5, 5.0 }
    params.str_wsc = 0.3

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.5, 1.5, 1.5 }
        params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
        params.str_wsc = 1.0
        params.ftpMod = { 2.0,  4.0, 6.0 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
