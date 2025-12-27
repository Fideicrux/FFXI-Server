-----------------------------------
-- xi.effect.AGGRESSOR
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local jpLevel = target:getJobPointLevel(xi.jp.AGGRESSOR_EFFECT)

    --Get Warrior Level
    local warriorLevel = target:getMainJob() == xi.job.WAR and target:getMainLvl() or 0
    local levelScale = math.floor((warriorLevel - 25) / 5)

    --effects
    effect:addMod(xi.mod.RACC, effect:getPower() + jpLevel)
    effect:addMod(xi.mod.ACC, 15 + utils.clamp(levelScale, 0, 10) + jpLevel)
    effect:addMod(xi.mod.RACC, 15 + utils.clamp(levelScale, 0, 10))
    effect:addMod(xi.mod.EVA, -15)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
