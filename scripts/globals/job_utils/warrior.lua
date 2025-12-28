-----------------------------------
-- Warrior Job Utilities
-----------------------------------
xi = xi or {}
xi.job_utils = xi.job_utils or {}
xi.job_utils.warrior = xi.job_utils.warrior or {}

-----------------------------------
-- Ability Check Functions
-----------------------------------
xi.job_utils.warrior.checkBrazenRush = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(xi.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

xi.job_utils.warrior.checkMightyStrikes = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(xi.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

xi.job_utils.warrior.checkTomahawk = function(player, target, ability)
    local ammoID = player:getEquipID(xi.slot.AMMO)

    if ammoID == xi.item.THROWING_TOMAHAWK then
        return 0, 0
    else
        return xi.msg.basic.CANNOT_PERFORM, 0
    end
end

-----------------------------------
-- Ability Use Functions
-----------------------------------

--STANCE
xi.job_utils.warrior.useAggressor = function(player, target, ability)
    -- Check for warrior main job
    local warriorLevel = player:getMainJob() == xi.job.WAR and player:getMainLvl() or 0
    --Can remove.
    local merits = player:getMerit(xi.merit.AGGRESSIVE_AIM)

    --Power, Scaling, and Duration
    local levelScale = math.floor((warriorLevel - 20) / 5)
    local power    = 15 + utils.clamp(levelScale, 0, 10)
    local duration = 7200

     -- Remove any other stances
    player:delStatusEffect(xi.effect.BERSERK)
    player:delStatusEffect(xi.effect.DEFENDER)
    player:delStatusEffect(xi.effect.RETALIATION)

    -- Apply Aggressor
    player:addStatusEffect(xi.effect.AGGRESSOR, power, 0, duration)

    return xi.effect.AGGRESSOR
end

xi.job_utils.warrior.useBerserk = function(player, target, ability)
    -- Get bonus from WAR lvl as main Job
    local warriorLevel = player:getMainJob() == xi.job.WAR and player:getMainLvl() or 0
    -- New scaling: hits 10 at level 75 ( (75-25)/5 = 10 )
    local levelScale   = math.floor((warriorLevel - 25) / 5)

    -- Get Power and duration (Base 15, Duration 7200)
    local power    = (15 + utils.clamp(levelScale, 0, 10)) + player:getMod(xi.mod.BERSERK_POTENCY) 
    local duration = 7200

    -- Remove any other stances
    player:delStatusEffect(xi.effect.AGGRESSOR)
    player:delStatusEffect(xi.effect.DEFENDER)
    player:delStatusEffect(xi.effect.RETALIATION)

    player:addStatusEffect(xi.effect.BERSERK, power, 0, duration)

    return xi.effect.BERSERK
end

xi.job_utils.warrior.useBloodRage = function(player, target, ability)
    local power    = 20 + player:getJobPointLevel(xi.jp.BLOOD_RAGE_EFFECT)
    local duration = 30 + player:getMod(xi.mod.ENHANCES_BLOOD_RAGE)

    target:addStatusEffect(xi.effect.BLOOD_RAGE, power, 0, duration)

    if player:getID() ~= target:getID() then
        ability:setMsg(xi.msg.basic.JA_GAIN_EFFECT)
    end

    return xi.effect.BLOOD_RAGE
end

xi.job_utils.warrior.useBrazenRush = function(player, target, ability)
    player:addStatusEffect(xi.effect.BRAZEN_RUSH, 100, 3, 30)

    return xi.effect.BRAZEN_RUSH
end

--STANCE
xi.job_utils.warrior.useDefender = function(player, target, ability)
    -- Check for warrior main job
    local warriorLevel = player:getMainJob() == xi.job.WAR and player:getMainLvl() or 0

    local levelScale = math.floor((warriorLevel - 20) / 5)
    local power    = 15 + utils.clamp(levelScale, 0, 10)
    local duration = 7200

    -- Remove any other stances
    player:delStatusEffect(xi.effect.AGGRESSOR)
    player:delStatusEffect(xi.effect.BERSERK)
    player:delStatusEffect(xi.effect.RETALIATION)


    -- Apply Self
    player:addStatusEffect(xi.effect.DEFENDER, power, 0, duration)

    return xi.effect.DEFENDER
end


xi.job_utils.warrior.useMightyStrikes = function(player, target, ability)
    player:addStatusEffect(xi.effect.MIGHTY_STRIKES, 1, 0, 60)

    return xi.effect.MIGHTY_STRIKES
end

xi.job_utils.warrior.useRestraint = function(player, target, ability)
    player:addStatusEffect(xi.effect.RESTRAINT, 0, 0, 300)

    return xi.effect.RESTRAINT
end

--STANCE
xi.job_utils.warrior.useRetaliation = function(player, target, ability)
    local power    = 1
    local duration = 7200

    -- Remove Self and Others Stances
    player:delStatusEffect(xi.effect.AGGRESSOR)
    player:delStatusEffect(xi.effect.BERSERK)
    player:delStatusEffect(xi.effect.DEFENDER)
    player:delStatusEffect(xi.effect.RETALIATION)

    player:addStatusEffect(xi.effect.RETALIATION, power, 0, duration)

    return xi.effect.RETALIATION
end

xi.job_utils.warrior.useTomahawk = function(player, target, ability)
    local merits   = player:getMerit(xi.merit.TOMAHAWK) - 15
    local duration = 30 + merits

    target:addStatusEffectEx(xi.effect.TOMAHAWK, 0, 25, 3, duration, 0, 0, 0)
    player:removeAmmo(1)
end

xi.job_utils.warrior.useWarcry = function(player, target, ability)
    local merit    = player:getMerit(xi.merit.SAVAGERY)
    local warLevel = utils.getActiveJobLevel(player, xi.job.WAR)
    --Scale the current 75 max to have the same value as 99 rate
    local power = (math.floor((warLevel * 99 / 300) + 4.75) / 256) * 100
    local duration = 60

    duration = duration + player:getMod(xi.mod.WARCRY_DURATION)

    target:addStatusEffect(xi.effect.WARCRY, power, 0, duration, 0, merit)

    if player:getID() ~= target:getID() then
        ability:setMsg(xi.msg.basic.JA_ATK_ENHANCED)
    end

    return xi.effect.WARCRY
end

xi.job_utils.warrior.useWarriorsCharge = function(player, target, ability)
    local merits = player:getMerit(xi.merit.WARRIORS_CHARGE)

    player:addStatusEffect(xi.effect.WARRIORS_CHARGE, merits - 5, 0, 60)

    return xi.effect.WARRIORS_CHARGE
end
