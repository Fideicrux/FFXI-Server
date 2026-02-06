-----------------------------------
-- Cyclone
-- Dagger weapon skill
-- Skill level: 125
-- Delivers an area attack that deals wind elemental damage. Damage varies with TP.
-- This weapon skill is ranged and can be used from a distance (Up to 15').
-- Directly affected by Magic Attack Bonus.
-- Aligned with the Breeze Gorget & Thunder Gorget.
-- Aligned with the Breeze Belt & Thunder Belt.
-- Element: Wind
-- Modifiers: DEX:30%  INT:25%
-- 100%TP    200%TP    300%TP
-- 1.00      2.38      2.88
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 1.0, 2.375, 2.875 }
    params.dex_wsc = 0.3
    params.int_wsc = 0.25
    params.hybridWS = true
    params.ele = xi.element.WIND
    params.skill = xi.skill.DAGGER
    params.includemab = true

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.25, 1.25, 1.25 }
        params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
        params.dex_wsc = 0.5
        params.int_wsc = 0.5
        params.ftpMod = { 1.0, 2.0, 3.0 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
