-----------------------------------
-- Help System Registry
-- Central storage + public API
-----------------------------------

xi = xi or {}
xi.help = xi.help or {}
xi.help.registry = xi.help.registry or {}

-----------------------------------
-- Utilities
-----------------------------------

local function normalize(str)
    return string.lower(str):gsub("[%s%p]", "")
end

local validTypes =
{
    Ability = true,
    Trait   = true,
    Magic   = true,
    Spell   = true,
}

-----------------------------------
-- Registration
-----------------------------------

function xi.help.register(entry)
    if not entry or not entry.name or not entry.type then
        print("[HELP] Invalid entry (missing name or type)")
        return
    end

    if not validTypes[entry.type] then
        print(string.format(
            "[HELP] Invalid type '%s' for '%s'",
            tostring(entry.type),
            tostring(entry.name)
        ))
        return
    end

    local key = normalize(entry.name)
    entry.key = key

    if xi.help.registry[key] then
        print("[HELP] Duplicate entry for '" .. entry.name .. "'")
        return
    end

    xi.help.registry[key] = entry

    -- Aliases resolve to the same entry
    if entry.aliases then
        for _, alias in ipairs(entry.aliases) do
            xi.help.registry[normalize(alias)] = entry
        end
    end
end

-----------------------------------
-- Lookup API
-----------------------------------

function xi.help.get(name)
    if not name then
        return nil
    end

    return xi.help.registry[normalize(name)]
end

-----------------------------------
-- Output / Formatting
-----------------------------------

function xi.help.print(player, entry)
    if not player or not entry then
        return
    end

    -- Header
    player:printToPlayer(string.format(
        "%s [%s]",
        entry.name,
        entry.type
    ))

    -- Job access
    if entry.jobs then
        local jobs = {}
        for job, lvl in pairs(entry.jobs) do
            table.insert(jobs, job .. " " .. lvl)
        end
        table.sort(jobs)
        player:printToPlayer("Jobs: " .. table.concat(jobs, ", "))
    end

    -- Details
    if entry.details then
        for _, line in ipairs(entry.details) do
            player:printToPlayer("• " .. line)
        end
    end

    -- Notes
    if entry.notes then
        for _, line in ipairs(entry.notes) do
            player:printToPlayer("Note: " .. line)
        end
    end
end
