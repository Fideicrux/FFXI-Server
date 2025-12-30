-----------------------------------
-- xi.effect.RESTRAINT
-- Engine-safe, WS-safe, TP-inferred restraint
-----------------------------------

---@type TEffect
local effectObject = {}

-----------------------------------
-- Constants (tunable)
-----------------------------------
local RESTRAINT_CAP           = 30
local MAX_HITS_PER_TICK       = 8
local MIN_MELEE_RATIO         = 0.75
local MAX_TP_SPIKE_MULTIPLIER = 4

-----------------------------------
-- On Gain
-----------------------------------
effectObject.onEffectGain = function(target, effect)
    effect:setPower(0)
    effect:setSubPower(target:getTP())
end

-----------------------------------
-- On Tick
-----------------------------------
effectObject.onEffectTick = function(target, effect)
    local currentTP = target:getTP()
    local lastTP    = effect:getSubPower()

    -------------------------------------------------
    -- WS usage or TP spend → preserve stacks
    -------------------------------------------------
    if currentTP <= lastTP then
        effect:setSubPower(currentTP)
        return
    end

    -------------------------------------------------
    -- Must be engaged
    -------------------------------------------------
    if not target:isEngaged() then
        effect:setSubPower(currentTP)
        return
    end

    local tpGained = currentTP - lastTP

    -------------------------------------------------
    -- Expected TP from one melee hit
    -------------------------------------------------
    local expectedTP = xi.combat.tp.getSingleMeleeHitTPReturn(target, target, false)
    if expectedTP <= 0 then
        effect:setSubPower(currentTP)
        return
    end

    -------------------------------------------------
    -- Reject non-melee TP
    -------------------------------------------------
    if tpGained < expectedTP * MIN_MELEE_RATIO then
        effect:setSubPower(currentTP)
        return
    end

    -------------------------------------------------
    -- Reject TP-feed spikes
    -------------------------------------------------
    if tpGained > expectedTP * MAX_TP_SPIKE_MULTIPLIER then
        effect:setSubPower(currentTP)
        return
    end

    -------------------------------------------------
    -- Estimate hit count
    -------------------------------------------------
    local hits = math.floor(tpGained / expectedTP)
    if hits <= 0 then
        effect:setSubPower(currentTP)
        return
    end

    hits = math.min(hits, MAX_HITS_PER_TICK)

    -------------------------------------------------
    -- Weapon-weight scaling via TP-per-hit
    -------------------------------------------------
    -- Rough retail mapping:
    -- ~100 TP → light weapon
    -- ~150 TP → medium
    -- ~200 TP → heavy
    local gainPerHit = math.max(1, math.floor(expectedTP / 50))

    -------------------------------------------------
    -- Apply stacks
    -------------------------------------------------
    local currentPower = effect:getPower()
    local totalGain    = hits * gainPerHit
    local newPower     = math.min(currentPower + totalGain, RESTRAINT_CAP)

    if newPower ~= currentPower then
        target:delMod(xi.mod.ALL_WSDMG_FIRST_HIT, currentPower)
        effect:setPower(newPower)
        target:addMod(xi.mod.ALL_WSDMG_FIRST_HIT, newPower)
    end

    effect:setSubPower(currentTP)
end

-----------------------------------
-- On Lose
-----------------------------------
effectObject.onEffectLose = function(target, effect)
    local power = effect:getPower()
    if power > 0 then
        target:delMod(xi.mod.ALL_WSDMG_FIRST_HIT, power)
    end
end

return effectObject
