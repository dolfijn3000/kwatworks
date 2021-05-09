local PortalController = require(game.ServerScriptService.kwatworks.Base.BaseController):extend()

local Portal = require(game.ServerScriptService.kwatworks.Portals.Portal)
local SlideDoor = require(game.ServerScriptService.kwatworks.Portals.SlideDoor)
local Elevator = require(game.ServerScriptService.kwatworks.Portals.Elevator)

local CollectionService = game:GetService("CollectionService")

PortalController.portals = {}

PortalController.portalModelsFolder = game.ServerStorage

local portals = CollectionService:GetTagged("portal")
local readers = CollectionService:GetTagged("reader")

function PortalController:LoadPortals()
	for i,v in pairs(portals) do
		local portal = nil

		if v:GetAttribute("type") == "SlideDoor" then
			portal = SlideDoor(v:GetAttribute("id"),self:GetPortalModel(v:GetAttribute("model")),v.CFrame)
			portal:SetupTweening(v:GetAttribute("OpeningDistance"),v:GetAttribute("Speed"),v:GetAttribute("Direction"))
		end
		if v:GetAttribute("type") == "Elevator" then
			portal = Elevator(v:GetAttribute("id"),self:GetPortalModel(v:GetAttribute("model")),v.CFrame,v:GetAttribute("speed"))
			portal:GetFloors()
			portal:CreatePrisma()
		end


        PortalController.portals[portal.id] = portal
	end
end

function PortalController:GetPortalModel(modelName)
	local portalModels = PortalController.portalModelsFolder:GetChildren()
	for i,v in pairs(portalModels) do
		if modelName == v.Name then
			return v
		end
	end
	return nil
end

function PortalController:WeldParts(model,root)
	for i,v in pairs(part:GetChildren()) do

		if v.ClassName == "Part" or v.ClassName == "MeshPart" or v.ClassName == "WedgePart" then
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


return PortalController