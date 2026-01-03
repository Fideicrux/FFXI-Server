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
    if not arg or arg == "" then
        player:printToPlayer("Usage: !info <ability | trait | spell>")
        return
    end

    local entry = xi.help and xi.help.get(arg)
    if not entry then
        player:printToPlayer("No help entry found for: "..arg)
        return
    end

    xi.help.print(player, entry)
end

return commandObj
