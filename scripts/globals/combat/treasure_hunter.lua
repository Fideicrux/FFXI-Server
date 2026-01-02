-----------------------------------
xi = xi or {}
xi.combat = xi.combat or {}
xi.combat.treasureHunter = xi.combat.treasureHunter or {}
-----------------------------------

-- https://forum.square-enix.com/ffxi/threads/56550
xi.combat.treasureHunter.treasureHunterTable =
{
-- TH lvl    VC    C     UC     R      VR     SR     UR
    [ 0] = { 7500, 5000, 2500, 1000,  500,  250, 100 },
    [ 1] = { 8000, 5500, 2750, 1100,  550,  275, 125 },
    [ 2] = { 8300, 6000, 3000, 1200,  600,  300, 150 },
    [ 3] = { 8600, 6250, 3250, 1300,  650,  325, 175 },
    [ 4] = { 8900, 6500, 3500, 1400,  700,  350, 200 },
    [ 5] = { 9100, 6750, 3750, 1500,  775,  400, 225 },
    [ 6] = { 9300, 7000, 4000, 1600,  850,  450, 250 },
    [ 7] = { 9450, 7250, 4250, 1700,  925,  500, 275 },
    [ 8] = { 9600, 7500, 4500, 1800, 1000,  550, 300 },
    [ 9] = { 9700, 7750, 4750, 1900, 1100,  600, 325 },
    [10] = { 9800, 8000, 5000, 2000, 1200,  650, 350 },
    [11] = { 9850, 8250, 5250, 2200, 1300,  725, 375 },
    [12] = { 9900, 8500, 5500, 2400, 1400,  800, 400 },
    [13] = { 9950, 8750, 5750, 2600, 1500,  900, 450 },
    [14] = {10000, 9000, 6000, 3000, 1750, 1100, 500 },
}

xi.combat.treasureHunter.dropBracketTable =
{
    [1] = { 2400 },
    [2] = { 1500 },
    [3] = { 1000 },
    [4] = {  500 },
    [5] = {  100 },
    [6] = {   50 },
    [7] = {    0 }, -- Set to 0, for weird cases in DB.
}

xi.combat.treasureHunter.getDropRate = function(thLevel, dropRate)
    -- Sanitize parameters
    local thTier     = utils.defaultIfNil(thLevel, 0)
    local thDropRate = utils.defaultIfNil(dropRate, 0)

    thTier     = utils.clamp(thTier, 0, 14)
    thDropRate = utils.clamp(thDropRate, 0, 10000)

    -- Early returns: Drop is guaranteed or non-existant.
    if thDropRate == 10000 then
        return 10000
    elseif thDropRate == 0 then
        return 0
    end

    -- Calculate original drop rate bracket.
    local thBracket = 0

    for i = 1, #xi.combat.treasureHunter.dropBracketTable do
        if thDropRate >= xi.combat.treasureHunter.dropBracketTable[i][1] then
            thBracket = i

            break
        end
    end

    -- Calculate TH drop rate
    local newDropRate = xi.combat.treasureHunter.treasureHunterTable[thTier][thBracket]

    return newDropRate
end
