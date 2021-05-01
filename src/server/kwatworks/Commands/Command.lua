local Command = require(game.ServerScriptService.kwatworks.Base.BaseObject):extend()

function Command:new(name,requiredRanks,commandFunction)
    self.name = name
    self.requiredRanks = requiredRanks
    self.commandFunction = commandFunction
end

function Command:Execute(player,parameters)
    self.commandFunction(player,parameters)
end

return Command