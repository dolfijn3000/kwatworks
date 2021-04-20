local PlayerObject = require(game.ServerScriptService.kwatworks.Base.BaseObject):extend()

local DataController = require(game.ServerScriptService.kwatworks.Core.DataController)
local RankController = require(game.ServerScriptService.kwatworks.Ranks.RankController)


function PlayerObject:new(playerInstance,name)
   self.playerInstance = playerInstance
   self.name = name
   self.data = DataController:Get("PlayerData",playerInstance.UserId)
   self.ranks = RankController:GetPlayerRanks(playerInstance)
end

return PlayerObject