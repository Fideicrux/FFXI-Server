-----------------------------------
-- xi.effect.YONIN
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect) -- power = 30 initially
    target:addMod(xi.mod.NINJA_TOOL, effect:getPower())
    target:addMod(xi.mod.ENMITY, effect:getPower())
    target:addMod(xi.mod.FASTCAST, 50)

    local yoninMerits = target:getMerit(xi.merit.YONIN_EFFECT)
    if yoninMerits ~= 0 then
        target:addMod(xi.mod.HP, yoninMerits)
    end

    local jpValue = target:getJobPointLevel(xi.jp.YONIN_EFFECT)
    target:addMod(xi.mod.EVA, 2 * jpValue)
end

effectObject.onEffectTick = function(target, effect)

end

effectObject.onEffectLose = function(target, effect)
    --remove the remaining power
    target:delMod(xi.mod.NINJA_TOOL, effect:getPower())
    target:delMod(xi.mod.ENMITY, effect:getPower())
    target:delMod(xi.mod.FASTCAST, 50)

    local yoninMerits = target:getMerit(xi.merit.YONIN_EFFECT)
    if yoninMerits ~= 0 then
        target:delMod(xi.mod.HP, yoninMerits)
    end

    local jpValue = target:getJobPointLevel(xi.jp.YONIN_EFFECT)
    target:delMod(xi.mod.EVA, 2 * jpValue)
end

return effectObject
