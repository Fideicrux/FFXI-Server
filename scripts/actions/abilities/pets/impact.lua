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
    -- Single huge dark magical hit. Scales with the avatar's INT and pet TP.
    xi.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

    local tp = pet:getTP()
    local intBonus = summoner:getMainLvl() ^ 2
    local intDiff = (intBonus) - target:getStat(xi.mod.INT)

    local damage = math.floor(3000 + 0.172 * tp + intDiff * 2.5)

    damage = xi.mobskills.mobMagicalMove(pet, target, petskill, damage, xi.element.DARK, 1, xi.mobskills.magicalTpBonus.NO_EFFECT, 0)
    damage = xi.mobskills.mobAddBonuses(pet, target, damage, xi.element.DARK, petskill)

    local totaldamage = xi.summon.avatarFinalAdjustments(damage, pet, petskill, target, xi.attackType.MAGICAL, xi.damageType.DARK, 1)

    if totaldamage > 0 then
        -- Potency varies with summoning skill: approximately -floor(skill/20) to all stats
        local summoningSkill = summoner:getSkillLevel(xi.skill.SUMMONING_MAGIC)
        local power = math.floor(summoningSkill / 20)
        local duration = 180

        if power > 0 then
            xi.mobskills.mobStatusEffectMove(pet, target, xi.effect.STR_DOWN, power, 0, duration)
            xi.mobskills.mobStatusEffectMove(pet, target, xi.effect.DEX_DOWN, power, 0, duration)
            xi.mobskills.mobStatusEffectMove(pet, target, xi.effect.VIT_DOWN, power, 0, duration)
            xi.mobskills.mobStatusEffectMove(pet, target, xi.effect.AGI_DOWN, power, 0, duration)
            xi.mobskills.mobStatusEffectMove(pet, target, xi.effect.INT_DOWN, power, 0, duration)
            xi.mobskills.mobStatusEffectMove(pet, target, xi.effect.MND_DOWN, power, 0, duration)
            xi.mobskills.mobStatusEffectMove(pet, target, xi.effect.CHR_DOWN, power, 0, duration)
        end
    end

    target:takeDamage(totaldamage, pet, xi.attackType.MAGICAL, xi.damageType.DARK)
    target:updateEnmityFromDamage(pet, totaldamage)

    return totaldamage
end

return abilityObject