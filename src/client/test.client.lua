local ReplicatedStorage = game:GetService("ReplicatedStorage")
 
local remoteEvent = ReplicatedStorage:WaitForChild("test")
 
-- Fire the remote event
remoteEvent:FireServer()