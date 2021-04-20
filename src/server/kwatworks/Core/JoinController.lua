local JoinController= require(game.ServerScriptService.kwatworks.Base.BaseController):extend()
local RankController = require(game.ServerScriptService.kwatworks.Ranks.RankController)

local Players = game:GetService("Players")

local Player = require(game.ServerScriptService.kwatworks.Core.PlayerObject)
local PlayerController = require(game.ServerScriptService.kwatworks.Core.PlayerController)

function JoinController:Activate(customFunction)
    Players.PlayerAdded:Connect(function(player)
        local serverReady = false
        while serverReady ~= true do
            wait(1)
            print("WAITING FOR SERVER TO BE READY")
            if RankController.isReady == true then
                serverReady = true
            end
        end
        local playerObj = Player(player,player.Name)
        self:Handle(playerObj)
        customFunction(playerObj)
    end) 
end

function JoinController:Handle(playerObj)
    PlayerController:Add(playerObj)
end


return JoinController