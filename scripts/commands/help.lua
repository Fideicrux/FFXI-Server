cmdprops =
{
    permission = 0,
    parameters = "sss"
}

function onTrigger(player, jobArg, abilityArg, field)
    if not jobArg or not abilityArg then
        player:printToPlayer("Usage: /help <job> <ability> [info|duration|recast]")
        return
    end

    local job = string.upper(jobArg)
    local jobData = xi.help.jobs[job]

    if not jobData then
        player:printToPlayer("Unknown job: " .. jobArg)
        return
    end

    local key = string.lower(abilityArg)
    local ability = jobData.abilities[key]

    if not ability then
        player:printToPlayer("No ability named '" .. abilityArg .. "' for " .. job)
        return
    end

    if field and ability[field] then
        player:printToPlayer(ability.name .. " " .. field .. ": " .. ability[field])
        return
    end

    player:printToPlayer("[" .. job .. "] " .. ability.name)
    player:printToPlayer("Effect: " .. ability.info)
    player:printToPlayer("Duration: " .. ability.duration)
    player:printToPlayer("Recast: " .. ability.recast)

    if ability.notes then
        player:printToPlayer("Notes: " .. ability.notes)
    end
end
