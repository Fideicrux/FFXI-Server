-----------------------------------
-- Impact
-- Description: Deals dark damage that lowers an enemy's STR/DEX/VIT/AGI/INT/MND/CHR.
-- Level: 99
-- Blood Pact Type: Blood Pact: Rage
-- MP Cost: 222
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    return xi.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
    -- Impact: Dark Elemental Damage + All Stats Down
    xi.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local tp = pet:getTP()
    local level = summoner:getMainLvl()
    local summoningSkill = summoner:getSkillLevel(xi.skill.SUMMONING_MAGIC)
    local playerINT = summoner:getStat(xi.mod.INT)

    -- 1. Base Power Calculation
    -- Impact should hit hard. We use a high flat base + Summoning Skill scaling.
    -- Example: 1000 base + (450 skill * 1.5) = ~1675 base power before TP/INT
    local basePower = 1000 + (summoningSkill * 1.5) + (level * 2) + (playerINT * 1.5)

    -- 2. Attribute Scaling (dINT)
    -- Impact is Dark based, so we check Player INT vs Target INT
    local dINT = summoner:getStat(xi.mod.INT) - target:getStat(xi.mod.INT)
    if dINT < 0 then dINT = 0 end

    -- 3. TP Multiplier
    -- TP scales the damage multiplier significantly (1.0x to 3.0x)
    local tpMultiplier = xi.combat.physical.calculateTPfactor(tp, { 1.0, 2.0, 3.0 })

    -- 4. Final Damage Calculation
    local damage = (basePower + (dINT * 2.0)) * tpMultiplier

    -- 5. Magic Processing (Resists, Shell, M.Def)
    damage = xi.mobskills.mobMagicalMove(pet, target, petskill, damage, xi.element.DARK, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 0)
    
    -- 6. Apply Bonuses (Weather, Day, Staff, Affinity)
    damage = xi.mobskills.mobAddBonuses(pet, target, damage, xi.element.DARK, petskill)

    -- 7. Final Adjustments (Avatar specific, BP Damage gear)
    damage = xi.summon.avatarFinalAdjustments(damage, pet, petskill, target, xi.attackType.MAGICAL, xi.damageType.DARK, xi.mobskills.shadowBehavior.WIPE_SHADOWS)

    -- Apply Damage
    target:takeDamage(damage, pet, xi.attackType.MAGICAL, xi.damageType.DARK)
    target:updateEnmityFromDamage(pet, damage)

    -- 8. Status Effects (All Stats Down)
    -- Only apply if damage was dealt (not fully resisted/immune)
    if damage > 0 then
        -- Potency scales with summoning skill.
        -- Skill 400 / 20 = -20 Stats. Skill 600 / 20 = -30 Stats.
        local power = math.floor(summoningSkill / 20)
        local duration = 180 -- 3 Minutes

        if power > 0 then
            -- Table of effects to iterate through for cleaner code
            local effects = {
                xi.effect.STR_DOWN, xi.effect.DEX_DOWN, xi.effect.VIT_DOWN,
                xi.effect.AGI_DOWN, xi.effect.INT_DOWN, xi.effect.MND_DOWN,
                xi.effect.CHR_DOWN
            }

            for _, effectId in ipairs(effects) do
                xi.mobskills.mobStatusEffectMove(pet, target, effectId, power, 0, duration)
            end
        end
    end

    return damage
end

return abilityObject