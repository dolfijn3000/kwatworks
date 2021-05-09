local Portal = require(game.ServerScriptService.kwatworks.Base.BaseObject):extend()

function Portal:new(id,model,spawnLocation)
    self.id = id
    self.model = model:Clone()
    self:WeldParts(self.model,self.model.PrimaryPart)
    self.model:SetPrimaryPartCFrame(spawnLocation)
	self.model.Parent = workspace
end


function Portal:WeldParts(part,root)
	for i,v in pairs(part:GetChildren()) do

		if v.ClassName == "Part" or v.ClassName == "MeshPart" or v.ClassName == "WedgePart"  or v.ClassName == "UnionOperation" then
			if v.Name ~= root.Name then
				v.CanCollide = false
				local weld = Instance.new("WeldConstraint")
				weld.Part0 = root
				weld.Part1 = v
				weld.Parent = root
			end
		end
		if v.ClassName == "Model" then
			self:WeldParts(v,root)
		end
	end
end


return Portal