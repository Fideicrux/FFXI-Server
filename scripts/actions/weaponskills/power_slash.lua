-----------------------------------
-- Power Slash
-- Great Sword weapon skill
-- Skill level: 30
-- Delivers a single-hit attack. params.crit varies with TP.
-- Modifiers: STR:60%  VIT:60%
-- 100%TP     200%TP     300%TP
-- 1.0         1.0        1.0
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    -- ftp damage mods (for Damage Varies with TP lines are calculated in the function
    params.ftpMod = { 3.0, 3.0, 3.0 }
    -- wscs are in % so 0.2=20%
    params.str_wsc = 0.2
    params.vit_wsc = 0.2
    params.critVaries = { 0.3, 0.45, 0.6 }

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.25, 1.25, 1.25 }
        params.critVaries = { 0.3, 0.6, 0.9 } -- unless crit varies with TP.
        params.str_wsc = 0.1
        params.dex_wsc = 0.1
        params.int_wsc = 0.1
        params.ftpMod = { 1.25, 2.1875, 3.125 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    local drain = math.floor(damage * 0.1)
    player:addMP(drain)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
