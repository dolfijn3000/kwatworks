local DataModel = require(game.ServerScriptService.kwatworks.Base.BaseObject):extend()


function DataModel:new()
    self.model = {}
end

function DataModel:AddField(fieldName)
    self.model[fieldName] = {}
end


return DataModel