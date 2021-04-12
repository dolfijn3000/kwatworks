local DataController= require(game.ServerScriptService.kwatworks.Base.BaseController):extend()

local DataStoreService = game:GetService("DataStoreService")


DataController.dataStoreName = nil
DataController.dataStores = {}

function DataController:SetDataStore(dataStore)
    DataController.dataStoreName = dataStore
end

function DataController:SetScope(scope)
    DataController.dataStores[scope] =  DataStoreService:GetDataStore(DataController.dataStoreName,scope)
end

function DataController:Set(scope,key,value)
    local success, error = pcall(function()
        DataController.dataStores[scope]:SetAsync(key, value)
    end)
     
    if success  then
    else
        print(error)
    end
end

function DataController:Get(scope,key)
    local success, data = pcall(function()
        return DataController.dataStores[scope]:GetAsync(key)
    end)
     
    if success  then
        return data
    end
end



return DataController