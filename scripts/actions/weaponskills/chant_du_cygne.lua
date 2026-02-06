-----------------------------------
-- Chant du Cygne
-- Sword weapon skill
-- Skill level: EMPYREAN
-- Delivers a three-hit attack. Chance of params.critical varies with TP.
-- Will stack with Sneak Attack.
-- Element: None
-- Modifiers: DEX:60%
-- 100%TP    200%TP    300%TP
--         ALL 2.25
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 3
    params.ftpMod = { 2.25, 2.25, 2.25 }
    params.dex_wsc = 0.6
    params.critVaries = { 0.3, 0.45, 0.6 }

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftpMod = { 2.7, 2.7, 2.7 }
        params.dex_wsc = 0.5
        params.str_wsc = 0.5
        params.multiHitfTP = true -- https://www.bg-wiki.com/ffxi/Chant_du_Cygne
        params.atkVaries = { 1.25, 1.25, 1.25 }
    end

    -- Apply aftermath
    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.EMPYREAN)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
