local PlayerObject = require(game.ServerScriptService.kwatworks.Base.BaseObject):extend()

local DataController = require(game.ServerScriptService.kwatworks.Core.DataController)


function PlayerObject:new(playerInstance,name)
   self.playerInstance = playerInstance
   self.name = name
   self.data = DataController:Get("PlayerData",playerInstance.UserId)
end

return PlayerObject