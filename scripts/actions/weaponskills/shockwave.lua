-----------------------------------
-- Shockwave
-- Great Sword weapon skill
-- Skill level: 150
-- Delivers an area of effect attack. Sleeps enemies. Duration of effect varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Aqua Gorget.
-- Aligned with the Aqua Belt.
-- Element: None
-- Modifiers: STR:30%  MND:30%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params  = {}
    params.numHits = 1
    params.multiHitFtp = true
    params.accVaries = { 1.0, 1.25, 1.5 }
    params.atkVaries = { 1.5, 1.5, 1.5 }
    params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
    params.str_wsc = 0.35
    params.dex_wsc = 0.35
    params.int_wsc = 0.35
    params.ftpMod = { 2.0, 4.0, 6.0 }

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    -- Handle status effect
    local effectId      = xi.effect.SLEEP_I
    local actionElement = xi.element.DARK
    local power         = 1
    local duration      = math.floor(6 * tp / 100 * applyResistanceAddEffect(player, target, actionElement, 0))
    xi.weaponskills.handleWeaponskillEffect(player, target, effectId, actionElement, damage, power, duration)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
