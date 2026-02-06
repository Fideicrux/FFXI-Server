-----------------------------------
-- Rampage
-- Axe weapon skill
-- Skill level: 175
-- Delivers a five-hit attack. Chance of params.critical varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Soil Gorget.
-- Aligned with the Soil Belt.
-- Element: None
-- Modifiers: STR:50%
-- 100%TP    200%TP    300%TP
--   1         1         1
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 5
    params.ftpMod = { 0.5, 0.5, 0.5 }
    params.str_wsc = 0.3
    params.critVaries = { 0.30, 0.45, 0.60 }

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.25, 1.25, 1.25 }
        params.critVaries = { 0.3, 0.6, 0.9 } -- unless crit varies with TP.
        params.str_wsc = 0.3
        params.dex_wsc = 0.3
        params.ftpMod = { 0.7, 1.4, 2.1 } 
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
