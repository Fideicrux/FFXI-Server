-----------------------------------
-- Cross Reaper
-- Scythe weapon skill
-- Skill level: 225
-- Delivers a two-hit attack. Damage varies with TP.
-- Modifiers: STR:30%  MND:30%
-- 100%TP     200%TP     300%TP
-- 2.0         2.25    2.5
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftpMod = { 2.0, 2.25, 2.5 }
    -- wscs are in % so 0.2=20%
    params.str_wsc = 0.3
    params.mnd_wsc = 0.3

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.5, 1.5, 1.5 }
        params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
        params.str_wsc = 1.0
        params.ftpMod = { 2.125, 4.25, 6.375 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    
    local drain = math.floor(damage * 0.2)
    player:addMP(drain) -- Restore MP equal to 20% of damage dealt

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
