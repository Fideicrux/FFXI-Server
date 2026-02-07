-----------------------------------
-- Retribution
-- Staff weapon skill
-- Skill Level: 230
-- Delivers a single-hit attack. Damage varies with TP.
-- In order to obtain Retribution, the quest Blood and Glory must be completed.
-- Despite the appearance of throwing the staff, this is not a long-range Weapon Skill like Mistral Axe.
-- The range only extends the usual 1 yalm beyond meleeing range.
-- Will stack with Sneak Attack.
-- Aligned with the Shadow Gorget, Soil Gorget & Aqua Gorget.
-- Aligned with the Shadow Belt, Soil Belt & Aqua Belt.
-- Element: None
-- Modifiers: STR:30%  MND:50%
-- 100%TP    200%TP    300%TP
-- 2.00      2.50      3.00
-----------------------------------
---@type TWeaponSkill
local weaponskillObject = {}

weaponskillObject.onUseWeaponSkill = function(player, target, wsID, tp, primary, action, taChar)
    local params     = {}
    params.numHits   = 1
    params.multiHitFtp = true
    params.accVaries = { 1.0, 1.25, 1.5 }
    params.atkVaries = { 1.5, 1.5, 1.5 }
    params.critVaries = { 0.1, 0.1, 0.1 } -- unless crit varies with TP.
    params.str_wsc = 0.5
    params.int_wsc = 0.5
    params.ftpMod = { 4.5, 9.0, 13.5 }

    local damage, criticalHit, tpHits, extraHits = xi.weaponskills.doPhysicalWeaponskill(player, target, wsID, params, tp, action, primary, taChar)
    return tpHits, extraHits, criticalHit, damage
end

return weaponskillObject
