local UIManager = require(game.ReplicatedStorage.UI.BaseClass):extend()

local player = game:GetService("Players").LocalPlayer

function UIManager:new()

end


function UIManager:Mount(UI)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = player.PlayerGui
    UI.component.Parent = screenGui
end


return UIManager