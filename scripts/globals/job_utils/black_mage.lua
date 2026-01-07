-----------------------------------
-- Black Mage Job Utilities
-----------------------------------
xi = xi or {}
xi.job_utils = xi.job_utils or {}
xi.job_utils.black_mage = xi.job_utils.black_mage or {}

-----------------------------------
-- Ability Check Functions
-----------------------------------
xi.job_utils.black_mage.checkManafont = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(xi.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

xi.job_utils.black_mage.checkSubtleSorcery = function(player, target, ability)
    ability:setRecast(math.max(0, ability:getRecast() - player:getMod(xi.mod.ONE_HOUR_RECAST) * 60))
    return 0, 0
end

-----------------------------------
-- Ability Use Functions
-----------------------------------
xi.job_utils.black_mage.useCascade = function(player, target, ability)

    -- Get current TP (0–3000)
    local tp = player:getTP()
    -- If no TP... notta
    if tp <= 0 then
        return xi.msg.basic.NOT_ENOUGH_TP, 0
    end

    -- Calculate 20% of current TP
    local magicDamageBonus = math.floor(tp * 0.20)

    -- Consume all TP
    player:setTP(0)

    -- Apply effect with calculated power
    player:addStatusEffect(xi.effect.CASCADE, magicDamageBonus, 0, 60)

    return xi.effect.CASCADE
end

xi.job_utils.black_mage.useElementalSeal = function(player, target, ability)
    local level = player:getMainJob() == xi.job.BLM and player:getMainLvl() or 25 

    player:addStatusEffect(xi.effect.ELEMENTAL_SEAL, level, 0, 60)

    return xi.effect.ELEMENTAL_SEAL
end

xi.job_utils.black_mage.useEnmityDouse = function(player, target, ability)
    if target:isMob() then
        target:setCE(player, 1)
        target:setVE(player, 0)
    end
end

xi.job_utils.black_mage.useManafont = function(player, target, ability)
    player:addStatusEffect(xi.effect.MANAFONT, 1, 0, 60)

    return xi.effect.MANAFONT
end

xi.job_utils.black_mage.useManaWall = function(player, target, ability)
    player:addStatusEffect(xi.effect.MANA_WALL, 1, 0, 60)

    return xi.effect.MANA_WALL
end

xi.job_utils.black_mage.useManawell = function(player, target, ability)
    local maxMP = player:getMaxMP()
    local mpRestore = math.floor(maxMP * 0.20)

    player:addMP(mpRestore)
    target:addStatusEffect(xi.effect.MANAWELL, 1, 0, 60)

    return xi.effect.MANAWELL
end

xi.job_utils.black_mage.useSubtleSorcery = function(player, target, ability)
    player:addStatusEffect(xi.effect.SUBTLE_SORCERY, 1, 0, 60)

    return xi.effect.SUBTLE_SORCERY
end
