-----------------------------------
-- Skill: Final Heaven
-- H2H weapon skill
-- Skill Level N/A
-- Additional effect: temporarily enhances Subtle Blow xi.effect.
-- Mods : VIT:60%
-- 100%TP     200%TP     300%TP
-- 3.0x        3.0x    3.0x
-- +10 Subtle Blow for a short duration after using the weapon skill. (Not implemented)
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    -- number of normal hits for ws
    params.numHits = 2
    -- stat-modifiers (0.0 = 0%, 0.2 = 20%, 0.5 = 50%..etc)
    params.vit_wsc = 0.5
    params.ftpMod = { 4.0, 4.0, 4.0 }
    params.atkVaries = { 1.5, 1.5, 1.5 }

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.5, 1.5, 1.5 }
        params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
        params.str_wsc = 0.5
        params.dex_wsc = 0.75
        params.vit_wsc = 0.0
        params.ftpMod = { 2.5, 5.0, 7.5 }
    end

    -- Apply aftermath
    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.RELIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
