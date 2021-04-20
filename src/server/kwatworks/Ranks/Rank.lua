local Rank = require(game.ServerScriptService.kwatworks.Base.BaseObject):extend()


function Rank:new(name)
    self.name = name
    self.color = BrickColor.new("Bright red")
    self.team = false
end

return Rank