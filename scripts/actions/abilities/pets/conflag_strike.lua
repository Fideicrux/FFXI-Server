-----------------------------------
-- Conflag Strike
-- Deals fire elemental breath damage. Additional effect: Burn.
-----------------------------------
---@type TAbilityPet
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
	return xi.job_utils.summoner.canUseBloodPact(player, player:getPet(), target, ability)
end

abilityObject.onPetAbility = function(target, pet, petskill, summoner, action)
	xi.job_utils.summoner.onUseBloodPact(target, petskill, summoner, action)

	local tp = pet:getTP()
	local intBonus = summoner:getMainLvl() ^ 2
	local intDiff = intBonus - target:getStat(xi.mod.INT)
	local variance = math.random(90, 110) / 100

	local baseDamage = xi.combat.physical.calculateTPfactor(tp, { 1200, 2000, 3000 })
	local bonusDamage = math.floor(baseDamage + intDiff * 3.35)

	local params = {
		percentMultipier = 0,
		element          = xi.element.FIRE,
		damageCap        = math.floor(baseDamage + 1200),
		bonusDamage      = bonusDamage,
		mAccuracyBonus   = { 100, 200, 300 },
		resistStat       = xi.mod.INT,
	}

	local damage = xi.mobskills.mobBreathMove(pet, target, petskill, params)
	damage = damage * variance
	damage = xi.summon.avatarFinalAdjustments(damage, pet, petskill, target, xi.attackType.BREATH, xi.damageType.FIRE, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)

	target:takeDamage(damage, pet, xi.attackType.BREATH, xi.damageType.FIRE)
	target:updateEnmityFromDamage(pet, damage)

	if damage > 0 then
		xi.mobskills.mobStatusEffectMove(pet, target, xi.effect.BURN, 30, 3, 60)
		xi.mobskills.mobStatusEffectMove(pet, target, xi.effect.INT_DOWN, 63, 0, 60)
	end

	return damage
end

return abilityObject
