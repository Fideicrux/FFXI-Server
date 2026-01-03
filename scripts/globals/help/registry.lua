xi.help.registry = xi.help.registry or {}

local function normalize(str)
    return string.lower(str):gsub("[%s%p]", "")
end

local validTypes =
{
    Ability = true,
    Trait   = true,
    Magic   = true,
}

function xi.help.register(entry)
    if not entry.name or not entry.type then
        printf("[HELP] Invalid entry (missing name or type)")
        return
    end

    if not validTypes[entry.type] then
        printf("[HELP] Invalid type '%s' for '%s'", entry.type, entry.name)
        return
    end

    local key = normalize(entry.name)
    entry.key = key

    if xi.help.registry[key] then
        printf("[HELP] Duplicate entry for '%s'", entry.name)
        return
    end

    xi.help.registry[key] = entry

    if entry.aliases then
        for _, alias in ipairs(entry.aliases) do
            xi.help.registry[normalize(alias)] = entry
        end
    end
end
