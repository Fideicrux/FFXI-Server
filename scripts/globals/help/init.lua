xi = xi or {}
xi.help = xi.help or {}

require("scripts/globals/help/registry")

local lfs = require("lfs")

local function requireDir(path)
    for file in lfs.dir(path) do
        if file:match("%.lua$") then
            local module = path .. "/" .. file:gsub("%.lua$", "")
            require(module)
        end
    end
end

-- Abilities
requireDir("scripts/globals/help/abilities")

-- Traits
requireDir("scripts/globals/help/traits")

-- Magic
requireDir("scripts/globals/help/magic")
