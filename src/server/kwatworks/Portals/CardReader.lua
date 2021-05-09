local CardReader = require(game.ServerScriptService.kwatworks.Portals.Reader):extend()

local PortalController = require(game.ServerScriptService.kwatworks.Portals.PortalController)


function CardReader:OnHit(part)
    if part.Parent.Name == "card" then
        PortalController.portals[self.id]:Open(true)
    end
end



return CardReader