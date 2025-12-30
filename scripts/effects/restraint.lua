-----------------------------------
-- xi.effect.RESTRAINT
-- Logic: Melee hits build "Power" (up to 30).
-- Power grants ALL_WSDMG_FIRST_HIT.
-- This version PERSISTS through Weapon Skill usage.
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    effect:setPower(0)
    effect:setSubPower(target:getTP()) -- Seed TP tracking
end

effectObject.onEffectTick = function(target, effect)
    if not target:isEngaged() then
        effect:setSubPower(target:getTP())
        return
    end

    local lastTP    = effect:getSubPower()
    local currentTP = target:getTP()

    -- WS usage or TP loss detection
    -- We resync SubPower so we don't count the WS as "gained TP,"
    -- but we do NOT reset the Power (the damage bonus).
    if currentTP <= lastTP then
        effect:setSubPower(currentTP)
        return
    end

    local tpGained = currentTP - lastTP
    local expectedTP = xi.combat.tp.getSingleMeleeHitTPReturn(target, target, false)

    -- If no TP was gained from hits, or expected TP is invalid, just sync and exit
    if expectedTP <= 0 then
        effect:setSubPower(currentTP)
        return
    end

    local hits = math.floor(tpGained / expectedTP)
    if hits <= 0 then
        effect:setSubPower(currentTP)
        return
    end

    local currentPower = effect:getPower()
    local cap = 100

    -- Calculation for gain per hit based on weapon delay
    local gainPerHit = ((target:getBaseDelay() / 1000) * 60) / 60
    local totalGain = hits * gainPerHit

    local newPower = math.min(currentPower + totalGain, cap)

    -- Keep math clean
    if newPower > currentPower then
        -- 1. Remove the old modifier amount entirely
        target:delMod(xi.mod.ALL_WSDMG_FIRST_HIT, currentPower)
        
        -- 2. Update the effect's internal power
        effect:setPower(newPower)
        
        -- 3. Apply the new total modifier amount
        target:addMod(xi.mod.ALL_WSDMG_FIRST_HIT, newPower)
    end

    -- Update TP memory for the next tick
    effect:setSubPower(currentTP)
end

effectObject.onEffectLose = function(target, effect)
    local power = effect:getPower()
    if power > 0 then
        -- Remove the full accumulated bonus upon buff expiration
        target:delMod(xi.mod.ALL_WSDMG_FIRST_HIT, power)
    end
end

return effectObject