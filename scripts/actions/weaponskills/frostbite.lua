-----------------------------------
-- Frostbite
-- Great Sword weapon skill
-- Skill Level: 70
-- Delivers an ice elemental attack. Damage varies with TP.
-- Aligned with the Snow Gorget.
-- Aligned with the Snow Belt.
-- Element: Ice
-- Modifiers: STR:20%  INT:20%
-- 100%TP    200%TP    300%TP
-- 1.00      2.00      2.50
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 1.5, 3.0, 4.5 }
    params.str_wsc = 0.2
    params.int_wsc = 0.2
    params.hybridWS = true
    params.ele = xi.element.ICE
    params.skill = xi.skill.GREAT_SWORD
    params.includemab = true

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.25, 1.25, 1.25 }
        params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
        params.str_wsc = 0.15
        params.int_wsc = 0.15
        params.ftpMod = { 1.375, 2.75, 4.125 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
