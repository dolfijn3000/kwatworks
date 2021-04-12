local UIComponent = require(game.ReplicatedStorage.UI.BaseClass):extend()



function UIComponent:new()
    self.component = nil
end


function UIComponent:SetSize(xScale,xOffset,yScale,yOffset)
    self.component.Size = UDim2.new(xScale,xOffset,yScale,yOffset)
end

return UIComponent