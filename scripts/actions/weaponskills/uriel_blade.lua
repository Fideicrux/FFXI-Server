-----------------------------------
-- Uriel Blade
-- Sword weapon skill
-- Skill Level: N/A
-- Description: Delivers an area attack that deals light elemental damage. Damage varies with TP. Additional effect Flash.
-- AoE range ??.
-- Only available during Campaign Battle while wielding a Griffinclaw.
-- Aligned with the Thunder Gorget & Breeze Gorget.
-- Aligned with Thunder Belt & Breeze Belt.
-- Modifiers: STR: 32% MND:32%
-- 100%TP    200%TP    300%TP
-- 4.50      6.00      7.50
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params      = {}
    params.numHits  = 1
    params.multiHitFtp = true
    params.accVaries = { 1.0, 1.25, 1.5 }
    params.atkVaries = { 1.5, 1.5, 1.5 }
    params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
    params.str_wsc = 0.35
    params.vit_wsc = 0.35
    params.mnd_wsc = 0.35
    params.ftpMod = { 1.25, 2.5, 3.75 }
    params.hybridWS   = true
    params.ele        = xi.element.LIGHT
    params.skill      = xi.skill.SWORD
    params.includemab = true

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary)

    -- Handle status effect
    local effectId      = xi.effect.FLASH
    local actionElement = xi.element.LIGHT
    local power         = 200
    local duration      = math.floor(15 * applyResistanceAddEffect(player, target, actionElement, 0))
    xi.weaponskills.handleWeaponskillEffect(player, target, effectId, actionElement, damage, power, duration)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
