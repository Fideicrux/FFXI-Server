-----------------------------------
-- Requiescat
-- Sword weapon skill
-- Skill level: MERIT
-- Delivers a five-hit attack. Attack power varies with TP.
-- Element: None
-- Modifiers: MND:73~85%
-- 100%TP    200%TP    300%TP
--         ALL 1.0
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 5
    params.ftpMod = { 1.6, 1.6, 1.6 }
    params.mnd_wsc = player:getMerit(xi.merit.REQUIESCAT) * 0.17
    params.accVaries = { 1.0, 1.25, 1.5 }
    -- TODO: Verify the params.formless check
    params.formless = true

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.str_wsc_wsc = 0.5 + (player:getMerit(xi.merit.REQUIESCAT) * 0.15)
        params.dex_wsc = 0.5
        params.multiHitfTP = true
        params.atkVaries = { 1.25, 1.25, 1.25 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
