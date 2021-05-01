local PlayerObject = require(game.ServerScriptService.kwatworks.Base.BaseObject):extend()

local DataController = require(game.ServerScriptService.kwatworks.Core.DataController)
local RankController = require(game.ServerScriptService.kwatworks.Ranks.RankController)
local CommandController = require(game.ServerScriptService.kwatworks.Commands.CommandController)

function PlayerObject:new(playerInstance,name)
   self.playerInstance = playerInstance
   self.name = name
   self.data = DataController:Get("PlayerData",playerInstance.UserId)
   self.ranks = RankController:GetPlayerRanks(playerInstance)

   --event binding
   playerInstance.Chatted:Connect(function(message) CommandController:HandleEvent(playerInstance,message) end)
end

return PlayerObject