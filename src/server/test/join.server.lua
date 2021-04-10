local JoinController = require(game.ServerScriptService.kwatworks.Core.JoinController)
local PlayerController = require(game.ServerScriptService.kwatworks.Core.PlayerController)
local RemotesController = require(game.ServerScriptService.kwatworks.Core.RemotesController)
local DataController = require(game.ServerScriptService.kwatworks.Core.DataController)

DataController:SetDataStore("DEV")
DataController:SetScope("PlayerData")

function onJoin()
    print(PlayerController.players)
end

JoinController:Activate(onJoin)

RemotesController:NewRemoteEvent("test")
RemotesController:BindEventServerFunction("test", function() 
    print("i ran")
end)