-----------------------------------
-- Monk Job Utilities
-----------------------------------
xi = xi or {}
xi.job_utils = xi.job_utils or {}
xi.job_utils.monk = xi.job_utils.monk or {}

local chakraStatusEffects =
{
    POISON       = 0, -- Removed by default
    BLINDNESS    = 0, -- Removed by default
    PARALYSIS    = 1,
    DISEASE      = 2,
    PLAGUE       = 4,
}

-----------------------------------
-- Ability Check Functions
-----------------------------------
xi.job_utils.monk.checkHundredFists = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(xi.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

xi.job_utils.monk.checkInnerStrength = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(xi.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

-----------------------------------
-- Ability Use Functions
-----------------------------------
xi.job_utils.monk.useBoost = function(player, target, ability)
    local power = 12.5 + (0.10 * player:getMod(xi.mod.BOOST_EFFECT)) * 1.5

    if player:hasStatusEffect(xi.effect.BOOST) then
        local effect = player:getStatusEffect(xi.effect.BOOST)

        effect:setPower(effect:getPower() + power) -- Store updated power in boost for zoning
        effect:addMod(xi.mod.ATTP, power)
    else
        player:addStatusEffect(xi.effect.BOOST, power, 0, 180)
    end
end

-- TODO: add Melee Gloves +2 aug
xi.job_utils.monk.useChakra = function(player, target, ability)
    local chakraRemoval = player:getMod(xi.mod.CHAKRA_REMOVAL)

    for k, v in pairs(chakraStatusEffects) do
        if bit.band(chakraRemoval, v) == v then
            player:delStatusEffect(xi.effect[k])
        end
    end

    -- see https://www.bg-wiki.com/ffxi/Chakra
    local monkLevel         = utils.getActiveJobLevel(player, xi.job.MNK)
    local jpModifier        = target:getJobPointLevel(xi.jp.CHAKRA_EFFECT) -- NOTE: Level is the modified value, so 10 per point spent
    local hpModifier        = ((monkLevel + 1) * 0.2 / 100) * player:getMaxHP()
    local chakraMultiplier  = 1.5 + player:getMod(xi.mod.CHAKRA_MULT) / 100
    local maxRecoveryAmount = (player:getStat(xi.mod.VIT) * 2 + hpModifier) * chakraMultiplier + jpModifier
    local recoveryAmount    = math.min(player:getMaxHP() - player:getHP(), maxRecoveryAmount)

    player:setHP(player:getHP() + recoveryAmount)

    local merits = player:getMerit(xi.merit.INVIGORATE)
    
    player:setTP(player:getTP() + merits)
    

    return recoveryAmount
end

xi.job_utils.monk.useChiBlast = function(player, target, ability)
    local boost = player:getStatusEffect(xi.effect.BOOST)
    local multiplier = 1.6

    local dmg = math.floor(player:getStat(xi.mod.VIT) * (0.5 + (math.random() / 2))) * multiplier

    dmg = xi.ability.adjustDamage(dmg, player, ability, target, xi.attackType.BREATH, xi.damageType.ELEMENTAL, xi.mobskills.shadowBehavior.IGNORE_SHADOWS)
    target:takeDamage(dmg, player, xi.attackType.BREATH, xi.damageType.ELEMENTAL)
    target:updateClaim(player)
    player:delStatusEffect(xi.effect.BOOST)

    return dmg
end

xi.job_utils.monk.useCounterstance = function(player, target, ability)
    local power = 50 + player:getMod(xi.mod.COUNTERSTANCE_EFFECT)

    target:delStatusEffect(xi.effect.COUNTERSTANCE) --if not found this will do nothing
    target:delStatusEffect(xi.effect.FOCUS)
    target:addStatusEffect(xi.effect.COUNTERSTANCE, power, 0, 7200)

    return xi.effect.COUNTERSTANCE
end

xi.job_utils.monk.useDodge = function(player, target, ability)
    local jpLevel  = target:getJobPointLevel(xi.jp.DODGE_EFFECT)
    local dodgeMod = target:getMod(xi.mod.DODGE_EFFECT)
    local merits = player:getMerit(xi.merit.DODGE_RECAST) * -100
    -- Remove conflicting stances
  
    player:addStatusEffect(xi.effect.DODGE, jpLevel + dodgeMod, 0, 60, 0, merits)
    

    return xi.effect.DODGE
end

xi.job_utils.monk.useFocus = function(player, target, ability)
    local jpLevel  = target:getJobPointLevel(xi.jp.FOCUS_EFFECT)
    local focusMod = target:getMod(xi.mod.FOCUS_EFFECT)
    local merits = player:getMerit(xi.merit.FOCUS_RECAST)
    -- Remove conflicting stances
    player:delStatusEffect(xi.effect.COUNTERSTANCE)
    player:delStatusEffect(xi.effect.FOCUS)
    --Apply stance
    player:addStatusEffect(xi.effect.FOCUS, jpLevel + focusMod, 0, 7200, 0, merits)

    return xi.effect.FOCUS
end

xi.job_utils.monk.useFootwork = function(player, target, ability)
    local kickDmg = 20 + player:getWeaponDmg()
    local kickAttPercent = 25 + player:getMod(xi.mod.FOOTWORK_ATT_BONUS)

    player:addStatusEffect(xi.effect.FOOTWORK, kickDmg, 0, 60, 0, kickAttPercent)

    return xi.effect.FOOTWORK
end

xi.job_utils.monk.useFormlessStrikes = function(player, target, ability)
    player:addStatusEffect(xi.effect.FORMLESS_STRIKES, 1, 0, 7200)

    return xi.effect.FORMLESS_STRIKES
end

xi.job_utils.monk.useHundredFists = function(player, target, ability)
    player:addStatusEffect(xi.effect.HUNDRED_FISTS, 1, 0, 60)

    return xi.effect.HUNDRED_FISTS
end

-- TODO: Support Tantra Cyclas + 1 (does not give critical hit damage)
-- Probably will be exceptionally jank, very low priority
--Impetis Miss listener here

--impetis hitlistener here

xi.job_utils.monk.useImpetus = function(player, target, ability)
    player:addStatusEffect(xi.effect.IMPETUS, 0, 0, 60)

    return xi.effect.IMPETUS
end

xi.job_utils.monk.useInnerStrength = function(player, target, ability)
    local restoreHP = math.floor(player:getMaxHP())

    player:addStatusEffect(xi.effect.INNER_STRENGTH, 2, 0, 60)

    target:addHP(restoreHP)

    return xi.effect.INNER_STRENGTH
end

xi.job_utils.monk.useMantra = function(player, target, ability)
    local merits = player:getMerit(xi.merit.MANTRA) -- This is unused below, fix?
    
    target:delStatusEffect(xi.effect.MAX_HP_BOOST) -- TODO: confirm which versions of HP boost mantra can overwrite
    target:addStatusEffect(xi.effect.MAX_HP_BOOST, merits, 0, 60)
    
    local restore = math.floor(player:getMaxHP() * 0.2)
    target:addHP(restore)

    return 0 -- xi.effect.MANTRA -- TODO: implement xi.effect.MANTRA
end

xi.job_utils.monk.usePerfectCounter = function(player, target, ability)
    player:addStatusEffect(xi.effect.PERFECT_COUNTER, 2, 0, 30)

    return xi.effect.PERFECT_COUNTER
end
