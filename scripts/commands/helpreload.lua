---@type TCommand
local cmd = {}

cmd.cmdprops =
{
    permission = 1,
    parameters = ""
}

cmd.onTrigger = function(player)
    if xi.help and xi.help.reload then
        xi.help.reload()
        player:printToPlayer("Help data reloaded.")
    else
        player:printToPlayer("Help system not initialized.")
    end
end

return cmd
