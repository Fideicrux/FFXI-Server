-----------------------------------
-- Armor Break
-- Great Axe weapon skill
-- Skill level: 100
-- Lowers enemy's defense. Duration of effect varies with TP.
-- Lowers defense by as much as 25% if unresisted.
-- Strong against: Antica, Bats, Cockatrice, Dhalmel, Lizards, Mandragora, Worms.
-- Immune: Ahriman.
-- Will stack with Sneak Attack.
-- Aligned with the Thunder Gorget.
-- Aligned with the Thunder Belt.
-- Element: Wind
-- Modifiers: STR:20%  VIT:20%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params   = {}
    params.numHits = 1
    params.ftpMod  = { 3.5, 3.5, 3.5 }
    params.str_wsc = 0.2
    params.vit_wsc = 0.2

    if xi.settings.main.USE_ADOULIN_WEAPON_SKILL_CHANGES then
        params.multiHitFtp = true
        params.accVaries = { 1.0, 1.25, 1.5 }
        params.atkVaries = { 1.5, 1.5, 1.5 }
        params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
        params.str_wsc = 1.0
        params.ftpMod = { 2.25, 4.5, 6.75 }
    end

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)

    -- Handle status effect
    local effectId      = xi.effect.DEFENSE_DOWN
    local actionElement = xi.element.WIND
    local power         = 25
    local duration      = math.floor((120 + 6 * tp / 100) * applyResistanceAddEffect(player, target, actionElement, 0))
    xi.weaponskills.handleWeaponskillEffect(player, target, effectId, actionElement, damage, power, duration)

    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
