-----------------------------------
-- Spinning Slash
-- Great Sword weapon skill
-- Skill level: 225
-- Delivers a single-hit attack. Damage varies with TP.
-- Modifiers: STR:30%  INT:30%
-- 100%TP     200%TP     300%TP
-- 2.5         3        3.5
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 5.0, 7.5, 10.0 }
    -- wscs are in % so 0.2=20%
    params.str_wsc = 1.0
    params.int_wsc = 0.5
    params.atkVaries = { 1.5, 1.5, 1.5 }

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
