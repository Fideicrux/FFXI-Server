-----------------------------------
-- Crescent Moon
-- Great Sword weapon skill
-- Skill level: 175
-- Delivers a single-hit attack. Damage varies with TP.
-- Modifiers: STR:35%
-- 100%TP     200%TP     300%TP
-- 1.0         1.75    2.5
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 1.0, 1.75, 2.5 }
    -- wscs are in % so 0.2=20%
    params.str_wsc = 0.35

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.5, 1.5, 1.5 }
        params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
        params.str_wsc = 0.5
        params.int_wsc = 0.5
        params.ftpMod = { 2.25, 4.5, 6.75 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    local drain = math.floor(damage * 0.25)
    player:addHP(drain)
    
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
