-----------------------------------
-- One Inch Punch
-- Hand-to-Hand weapon skill
-- Skill level: 75
-- Delivers an attack that ignores target's defense. Amount ignored varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Shadow Gorget.
-- Aligned with the Shadow Belt.
-- Element: None
-- Modifiers: VIT:40%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params = {}
    params.numHits = 1
    params.ftpMod = { 3.5, 3.5, 3.5 }
    params.vit_wsc = 0.4
    -- Defense ignored is 0%, 30%, 50% as per http://www.bg-wiki.com/bg/One_Inch_Punch
    params.ignoredDefense = { 0.2, 0.35, 0.5 }
    params.atkVaries = { 1.5, 1.5, 1.5 }

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitfTP = true -- http://wiki.ffo.jp/html/2418.html
        params.str_wsc = 0.5
        params.vit_wsc = 0.5
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
