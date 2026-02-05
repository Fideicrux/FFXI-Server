-----------------------------------
-- Black Halo
-- Club weapon skill
-- Skill level: 230
-- In order to obtain Black Halo, the quest Orastery Woes must be completed.
-- Delivers a two-hit attack. Damage varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Shadow Gorget, Thunder Gorget & Breeze Gorget.
-- Aligned with the Shadow Belt, Thunder Belt & Breeze Belt.
-- Element: None
-- Modifiers: STR:30%  MND:50%
-- 100%TP    200%TP    300%TP
-- 1.50      2.50      3.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 2
    params.ftpMod = { 1.5, 2.5, 3 }
    params.str_wsc = 0.5
    params.mnd_wsc = 0.5

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftpMod = { 4.5, 7.25, 10.0 }
        params.atkVaries = { 1.5, 1.5, 1.5 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
