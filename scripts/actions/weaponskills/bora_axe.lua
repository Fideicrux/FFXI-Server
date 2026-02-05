-----------------------------------
-- Bora Axe
-- Axe weapon skill
-- Skill level: 290
-- Delivers a single-hit ranged attack at a maximum distance of 15.7'. Chance of binding varies with TP
-- Bind doesn't always break from hitting mob.
-- This Weapon Skill's first hit params.ftp is duplicated for all additional hits
-- Not natively available to RNG
-- Aligned with the ?? Gorget.
-- Element: Ice
-- Modifiers: DEX 60%  -- http://wiki.bluegartr.com/bg/Bora_Axe
-- 100%TP    200%TP    300%TP
-- 1.0        1.0      1.0
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params     = {}
    params.numHits   = 1
    params.ftpMod    = { 1, 1, 1 }
    params.dex_wsc   = 0.6


    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.5, 1.5, 1.5 }
        params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
        params.str_wsc = 0.35
        params.dex_wsc = 0.35
        params.agi_wsc = 0.35
        params.ftpMod = { 2.5,  5.0, 7.5 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    -- Handle status effect
    if math.random(1, 100) <= tp / 30 * applyResistanceAddEffect(player, target, xi.element.ICE, 0) then
        local effectId      = xi.effect.BIND
        local actionElement = xi.element.ICE
        local power         = 1
        local duration      = math.floor(20 * applyResistanceAddEffect(player, target, actionElement, 0))
        xi.weaponskills.handleWeaponskillEffect(player, target, effectId, actionElement, damage, power, duration)
    end

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
