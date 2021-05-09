local ElevatorCallButton = require(game.ServerScriptService.kwatworks.Portals.Reader):extend()

local PortalController = require(game.ServerScriptService.kwatworks.Portals.PortalController)

function ElevatorCallButton:new(id,model,spawnLocation,clickButton,floor)
    self.id = id
    self.model = model:Clone()
    self.model:SetPrimaryPartCFrame(spawnLocation)
	self.model.Parent = workspace
    self.floor = floor
    self.clickButton = self.model:FindFirstChild(clickButton)
    self.clickButton.ClickDetector.MouseClick:connect(function() self:OnClick() end)
end

function ElevatorCallButton:OnClick(part)
        PortalController.portals[self.id]:MovePrisma(self.floor)
end



return ElevatorCallButton