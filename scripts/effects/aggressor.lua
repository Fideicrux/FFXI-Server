-----------------------------------
-- xi.effect.AGGRESSOR
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpLevel = target:getJobPointLevel(xi.jp.AGGRESSOR_EFFECT)

    --Get Warrior Level
    local warriorLevel = player:getMainJob() == xi.job.WAR and player:getMainLvl() or 0
    local levelScale = math.floor((warriorLevel - 25) / 5)

    --effects
    effect:addMod(xi.mod.RACC, effect:getPower() + jpLevel)
    effect:addMod(xi.mod.ACCP, 15 + levelScale + jpLevel)
    effect:addMod(xi.mod.RACCP, 15 + levelScale)
    effect:addMod(xi.mod.EVA, -15)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
