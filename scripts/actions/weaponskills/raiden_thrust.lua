-----------------------------------
-- Raiden Thrust
-- Polearm weapon skill
-- Skill Level: 70
-- Deals lightning elemental damage to enemy. Damage varies with TP.
-- Aligned with the Light Gorget & Thunder Gorget.
-- Aligned with the Light Belt & Thunder Belt.
-- Element: Lightning
-- Modifiers: STR:40%  INT:40%
-- 100%TP    200%TP    300%TP
-- 1.00      2.00      3.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 0.75, 1.125, 1.5 }
    params.str_wsc = 0.3
    params.int_wsc = 0.3
    params.hybridWS = true
    params.ele = xi.element.THUNDER
    params.skill = xi.skill.POLEARM
    params.includemab = true
    params.atkVaries = { 1.5, 1.5, 1.5 }

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.25, 1.25, 1.25 }
        params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
        params.str_wsc = 0.1
        params.dex_wsc = 0.1
        params.int_wsc = 0.1
        params.ftpMod = { 0.75, 1.5, 2.25 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
