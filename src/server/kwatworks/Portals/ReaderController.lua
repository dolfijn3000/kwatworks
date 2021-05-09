local ReaderController = require(game.ServerScriptService.kwatworks.Base.BaseController):extend()

local Reader = require(game.ServerScriptService.kwatworks.Portals.Reader)
local CardReader = require(game.ServerScriptService.kwatworks.Portals.CardReader)
local ElevatorCallButton = require(game.ServerScriptService.kwatworks.Portals.ElevatorCallButton)

local CollectionService = game:GetService("CollectionService")

ReaderController.readers = {}

ReaderController.readerModelsFolder = game.ServerStorage

local readers = CollectionService:GetTagged("reader")


function ReaderController:LoadReaders()
	for i,v in pairs(readers) do
		local reader = nil

		if v:GetAttribute("type") == "CardReader" then
			reader = CardReader(v:GetAttribute("id"),self:GetReaderModel(v:GetAttribute("model")),v.CFrame,v:GetAttribute("Hitbox"))
		end
		if v:GetAttribute("type") == "ElevatorCallButton" then
			reader = ElevatorCallButton(v:GetAttribute("id"),self:GetReaderModel(v:GetAttribute("model")),v.CFrame,v:GetAttribute("button"),v:GetAttribute("floor"))
		end
        ReaderController.readers[reader.id] = reader
	end
end

function ReaderController:GetReaderModel(modelName)
	local portalModels = ReaderController.readerModelsFolder:GetChildren()
	for i,v in pairs(portalModels) do
		if modelName == v.Name then
			return v
		end
	end
	return nil
end



return ReaderController