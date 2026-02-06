-----------------------------------
-- Tachi Kagero
-- Great Katana weapon skill
-- Skill Level: 100
-- Deals fire elemental damage to enemy. Damage varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Flame Gorget.
-- Aligned with the Flame Belt.
-- Element: Fire
-- Modifiers: STR:75%
-- 100%TP    200%TP    300%TP
-- .5        .75       1.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 1.0, 1.0, 1.0 }
    params.str_wsc = 0.5
    params.hybridWS = true
    params.ele = xi.element.FIRE
    params.skill = xi.skill.GREAT_KATANA
    params.includemab = true

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.25, 1.25, 1.25 }
        params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
        params.str_wsc = 0.45
        params.int_wsc = 0.15
        params.ftpMod = { 1.625, 3.25, 4.875 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
