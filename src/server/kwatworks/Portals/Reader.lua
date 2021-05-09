local Reader = require(game.ServerScriptService.kwatworks.Base.BaseObject):extend()

function Reader:new(id,model,spawnLocation,hitbox)
    self.id = id
    self.model = model:Clone()
    self.model:SetPrimaryPartCFrame(spawnLocation)
    self.hitbox = self.model:FindFirstChild(hitbox)
    self.hitbox.Touched:Connect(function(part) self:OnHit(part) end)
	self.model.Parent = workspace
end

function Reader:OnHit(part)
end

return Reader