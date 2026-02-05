-----------------------------------
-- Ground Strike
-- Great Sword weapon skill
-- Skill level: 250 QUESTED
-- Delivers a single-hit attack. Damage varies with TP.
-- Modifiers: STR:50% INT:50%
-- 100%TP     200%TP     300%TP
-- 1.5         1.75    3.0
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.multiHitFtp = true
    params.accVaries = { 1.0, 1.25, 1.5 }
    params.atkVaries = { 1.5, 1.5, 1.5 }
    params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
    params.str_wsc = 1.0
    params.ftpMod = { 4.5, 9.0, 13.5 }

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
