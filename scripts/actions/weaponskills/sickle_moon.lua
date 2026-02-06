-----------------------------------
-- Sickle Moon
-- Great Sword weapon skill
-- Skill level: 200
-- Delivers a two-hit attack. Damage varies with TP.
-- Modifiers: STR:40%  AGI:40%
-- 100%TP     200%TP     300%TP
-- 1.5         2        2.75
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftpMod = { 3.5, 5.75, 8.0 }
    -- wscs are in % so 0.2=20%
    params.str_wsc = 0.2
    params.agi_wsc = 0.2

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.25, 1.25, 1.25 }
        params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
        params.str_wsc = 0.6
        params.ftpMod = { 1.75, 3.5, 5.25 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
