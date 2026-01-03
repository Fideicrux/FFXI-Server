-----------------------------------
-- func: sinfo <ability|trait|spell>
-- desc: Displays server help information
-----------------------------------

---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,      -- confirmed working for GMLevel 0 on your server
    parameters = "ssss"
}

require("scripts/globals/help/init")

local function normalize(str)
    return string.lower(str):gsub("[%s%p]", "")
end

local function printSection(player, title, lines)
    if not lines or #lines == 0 then return end
    player:printToPlayer(title .. ":")
    for _, line in ipairs(lines) do
        player:printToPlayer(" - " .. line)
    end
end

local function formatJobs(jobs)
    if not jobs then return nil end

    local out = {}

    -- Pattern A: { WHM = 74, RDM = 63 }
    for job, level in pairs(jobs) do
        if type(job) == "string" and type(level) == "number" then
            out[#out + 1] = string.format("%s (Lv.%d)", job, level)
        end
    end

    -- Legacy fallback: { "WHM", "RDM" }
    if #out == 0 then
        for _, job in ipairs(jobs) do
            if type(job) == "string" then
                out[#out + 1] = job
            end
        end
    end

    return table.concat(out, ", ")
end

commandObj.onTrigger = function(player, ...)
    if select("#", ...) == 0 then
        player:printToPlayer("Usage: !sinfo <ability|trait|spell>")
        return
    end

    if not xi.help or not xi.help.registry then
        player:printToPlayer("Help registry not loaded.")
        return
    end

    local args = { ... }
    local key = normalize(table.concat(args, " "))

    local entry = xi.help.registry[key]
    if not entry then
        player:printToPlayer("No help entry found.")
        return
    end

    player:printToPlayer("[" .. entry.name .. "] (" .. entry.type .. ")")

    if entry.school then
        player:printToPlayer("School: " .. entry.school)
    end

    local jobText = formatJobs(entry.jobs)
    if jobText then
        player:printToPlayer("Jobs: " .. jobText)
    end

    printSection(player, "Details", entry.details)
    printSection(player, "Server Notes", entry.notes)
    printSection(player, "Misc", entry.misc)
end

return commandObj
