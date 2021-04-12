local UIFrame = require(game.ReplicatedStorage.UI.UIComponent):extend()

function UIFrame:new()
    self.component = Instance.new("Frame")
    self.component.Size = UDim2.new(1, 0, 1, 0)
end


return UIFrame