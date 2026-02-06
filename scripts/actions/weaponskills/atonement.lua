-----------------------------------
-- Atonement
-- TODO: This needs to be reworked, as this weapon skill does damage based on current enmity, not based on stat modifiers. http://wiki.ffxiclopedia.org/wiki/Atonement    http://www.bg-wiki.com/bg/Atonement
-- Sword weapon skill
-- Skill Level: N/A
-- Delivers a Twofold attack. Enmity varies with TP. Burtgang: Aftermath effect varies with TP.
-- Available only after completing the Unlocking a Myth (Paladin) quest.
-- Aligned with the Aqua Gorget, Flame Gorget & Light Gorget.
-- Aligned with the Aqua Belt, Flame Belt & Light Belt.
-- Element: None
-- Modifiers (old): damage varies with enmity
-- 100%TP    200%TP    300%TP
-- 0.09      0.11      0.20   -CE
-- 0.11      0.14      0.25   -VE
-- Modifiers (new): enmity from damage varies with TP
-- 100%TP    200%TP    300%TP
-- 1.00      1.5       2.0
-- Modifiers (non-mob, wrong): STR:40% VIT:50%
-- 100%TP    200%TP    300%TP
-- 1.00      1.25      1.50
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params   = {}
    params.numHits = 1
    params.ftpMod  = { 1.125, 1.125, 1.125 }
    params.str_wsc = 0.5
    params.vit_wsc = 0.5

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.ftpMod = { 8, 8, 8 }
        params.atkVaries = { 1.25, 1.25, 1.25 }
    end

    -- Apply aftermath
    xi.aftermath.addStatusEffect(player, tp, xi.slot.MAIN, xi.aftermath.type.MYTHIC)

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    -- Handle status effect
    local effectId      = xi.effect.FLASH
    local actionElement = xi.element.LIGHT
    local power         = 200
    local duration      = math.floor(15 * applyResistanceAddEffect(player, target, actionElement, 0))
    xi.weaponskills.handleWeaponskillEffect(player, target, effectId, actionElement, damage, power, duration)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
