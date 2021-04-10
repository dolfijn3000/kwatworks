local PlayerController = require(game.ServerScriptService.kwatworks.Base.BaseController):extend()


local PlayerObject = require(game.ServerScriptService.kwatworks.Core.PlayerObject)

PlayerController.players = {}

function PlayerController:Add(player)
    assert(player:is(PlayerObject),"Instance is not a player object")
    PlayerController.players[player.name] = player
end

return PlayerController