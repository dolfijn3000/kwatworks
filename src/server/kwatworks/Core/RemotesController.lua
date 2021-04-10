local RemotesController= require(game.ServerScriptService.kwatworks.Base.BaseController):extend()

local ReplicatedStorage = game:GetService("ReplicatedStorage")

RemotesController.events = {}
RemotesController.functions = {}

function RemotesController:NewRemoteEvent(name) 
    local remoteEvent = Instance.new("RemoteEvent")
    remoteEvent.Name = name
    remoteEvent.Parent = ReplicatedStorage
    RemotesController.events[name] = remoteEvent
end

function RemotesController:BindEventServerFunction(eventName,eventFunction)
    RemotesController.events[eventName].OnServerEvent:Connect(eventFunction)
end

return RemotesController