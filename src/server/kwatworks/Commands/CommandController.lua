local CommandController = require(game.ServerScriptService.kwatworks.Base.BaseController):extend()

local Command = require(game.ServerScriptService.kwatworks.Commands.Command):extend()

CommandController.commands = {}
CommandController.prefix = "/"

function CommandController:RegisterNewCommand(name,requiredRanks,commandFunction)
    local newCommand = Command(name,requiredRanks,commandFunction)
    CommandController.commands[name] = newCommand
end

function CommandController:HandleEvent(player,message)
    if string.sub(message, 1, 1) == CommandController.prefix then
        local values = message:split(" ")
        local command = string.gsub(values[1], CommandController.prefix, "")
        for i,v in pairs(CommandController.commands) do
			if i == command then
				local output = v:Execute(player,values)	
			end	
		end	
    end
end

return CommandController