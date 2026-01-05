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

-----------------------------------
-- Ability Use Functions
-----------------------------------

xi.job_utils.warrior.useAggressor = function(player, target, ability)
    local merits = player:getMerit(xi.merit.AGGRESSIVE_AIM)

    player:addStatusEffect(xi.effect.AGGRESSOR, merits, 0, 7200 + player:getMod(xi.mod.AGGRESSOR_DURATION))

    return xi.effect.AGGRESSOR
end

xi.job_utils.warrior.useBerserk = function(player, target, ability)
    local warriorLevel = player:getMainJob() == xi.job.WAR and player:getMainLvl() or 0
    
    local levelScale = utils.clamp(math.floor((warriorLevel - 10) * 15 / 65), 0, 15)
    local power = 15 + levelScale + player:getMod(xi.mod.BERSERK_POTENCY)
    local duration = 7200

    -- Remove conflicting stances.
    player:delStatusEffect(xi.effect.DEFENDER)
    player:delStatusEffect(xi.effect.BERSERK)

    -- Apply Berserk using 'power' for both ATK and DEF scaling.
    player:addStatusEffect(xi.effect.BERSERK, power, 0, duration)

    return xi.effect.BERSERK
end

xi.job_utils.warrior.useBloodRage = function(player, target, ability)
    local power    = 20 + player:getJobPointLevel(xi.jp.BLOOD_RAGE_EFFECT)
    local duration = 60 + player:getMod(xi.mod.ENHANCES_BLOOD_RAGE)

    target:addStatusEffect(xi.effect.BLOOD_RAGE, power, 0, duration)

    if player:getID() ~= target:getID() then
        ability:setMsg(xi.msg.basic.JA_GAIN_EFFECT)
    end

    return xi.effect.BLOOD_RAGE
end

xi.job_utils.warrior.useBrazenRush = function(player, target, ability)
    local datkRate = player:getMod(xi.mod.DOUBLE_ATTACK)

    player:addStatusEffect(xi.effect.BRAZEN_RUSH, 100, 0, 60, datkRate)

    return xi.effect.BRAZEN_RUSH
end

-- DEFENSIVE STANCE --
xi.job_utils.warrior.useDefender = function(player, target, ability)
    local warriorLevel = player:getMainJob() == xi.job.WAR and player:getMainLvl() or 0

    -- Scale from 5 to 15 between level 20 and 75
    local minLevel = 20
    local maxLevel = 75
    local minPower = 5
    local maxPower = 15

    -- Clamp the level to the scaling range to prevent it from going over 75.
    -- This is good practice in case level cap is ever raised or other edge cases occur.
    local clampedLevel = utils.clamp(warriorLevel, minLevel, maxLevel)

    -- Calculate the power
    local scaleFactor = (maxPower - minPower) / (maxLevel - minLevel)
    local defPower = minPower + (clampedLevel - minLevel) * scaleFactor

    local duration = 7200

    player:delStatusEffect(xi.effect.BERSERK)
    player:delStatusEffect(xi.effect.DEFENDER)
    player:addStatusEffect(xi.effect.DEFENDER, defPower, 0, duration)

    return xi.effect.DEFENDER
end


xi.job_utils.warrior.useMightyStrikes = function(player, target, ability)
    local critDmg = math.min(player:getStat(xi.mod.CRITHITRATE), 25)

    player:addStatusEffect(xi.effect.MIGHTY_STRIKES, 1, 0, 60, critDmg)

    return xi.effect.MIGHTY_STRIKES
end

xi.job_utils.warrior.useRestraint = function(player, target, ability)
    player:addStatusEffect(xi.effect.RESTRAINT, 0, 0, 180)

    return xi.effect.RESTRAINT
end

xi.job_utils.warrior.useRetaliation = function(player, target, ability)
    local power    = 1
    local duration = 7200

    player:addStatusEffect(xi.effect.RETALIATION, power, 0, duration)

    return xi.effect.RETALIATION
end

xi.job_utils.warrior.useTomahawk = function(player, target, ability)
    local merits   = player:getMerit(xi.merit.TOMAHAWK) + 40
    local duration = 25 + merits

    target:addStatusEffectEx(xi.effect.TOMAHAWK, 0, 25, 3, duration)
    --player:removeAmmo(1)
end

xi.job_utils.warrior.useWarcry = function(player, target, ability)
    local merit    = player:getMerit(xi.merit.SAVAGERY)
    local warLevel = utils.getActiveJobLevel(player, xi.job.WAR)
    
    --Scale 99 value to fit current level 75 max
    local power = math.floor((((35 + (warLevel - 25) * 64 / 50) / 4) + 4.75)) / 256 * 100
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
    local datkRate = player:getMod(xi.mod.DOUBLE_ATTACK)

    player:addStatusEffect(xi.effect.WARRIORS_CHARGE, merits - 5, 0, 60, datkRate)

    return xi.effect.WARRIORS_CHARGE
end
