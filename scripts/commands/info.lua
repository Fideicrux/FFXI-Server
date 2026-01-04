-----------------------------------
-- func: info
-- desc: root help system command
-----------------------------------

---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 0,
    parameters = "[name]"
}

-- guarded init (command always survives)
local ok, err = pcall(require, "scripts/globals/help/init")
if not ok then
    print("[INFO] help init failed:", err)
end

commandObj.onTrigger = function(player, arg)
    local args = {}
    for word in string.gmatch(arg, "%S+") do
        table.insert(args, word)
    end

    if #args == 0 then
        player:printToPlayer("Usage: !info <job|magic|ability|trait> [name]")
        return
    end

    local category = string.lower(args[1])
    local targetName = ""
    local entry = nil

    -- Handle "!info job [name]" logic
    if category == "job" then
        if args[2] then
            -- Use the name provided (e.g., !info job war)
            targetName = args[2]
        else
            -- Get the player's current main job name
            -- Most servers use xi.job[id] to get the short string name
            local mJob = player:getMainJob()
            for name, id in pairs(xi.job) do
                if id == mJob then
                    targetName = name
                    break
                end
            end
        end
        entry = xi.help.get(targetName)
        
    -- Handle "!info <type> <name>" logic (e.g., !info magic cure)
    elseif args[2] then
        targetName = table.concat(args, " ", 2)
        entry = xi.help.get(targetName)
        
        -- Optional: Verify that the entry type matches the requested category
        if entry and string.lower(entry.type) ~= category then
            player:printToPlayer(string.format("%s is not a %s.", targetName, category))
            return
        end
    else
        -- Fallback: Check if the first word is a direct entry (e.g., !info berserk)
        entry = xi.help.get(args[1])
    end

    if not entry then
        player:printToPlayer("No help entry found for: " .. (targetName ~= "" and targetName or args[1]))
        return
    end

    xi.help.print(player, entry)
end

return commandObj
