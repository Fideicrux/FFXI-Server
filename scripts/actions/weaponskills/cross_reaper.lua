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
    params.atkVaries = { 1.5, 1.5, 1.5 }

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftpMod = { 4.0, 6.5, 9.0 }
        params.str_wsc = 0.75
        params.int_wsc = 0.25
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    
    local drain = math.floor(damage * 0.2)
    player:addMP(drain) -- Restore MP equal to 20% of damage dealt

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
