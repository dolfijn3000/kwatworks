local RankController= require(game.ServerScriptService.kwatworks.Base.BaseController):extend()

local Rank = require(game.ServerScriptService.kwatworks.Ranks.Rank)

local GroupService = game:GetService("GroupService")
local Teams = game:GetService("Teams")
 

RankController.Groups = {}
RankController.Ranks = {}
RankController.isReady = false

function RankController:LoadRanksFromGroup(groupId)
    local group = GroupService:GetGroupInfoAsync(groupId)
    RankController.Groups[group.Name] = group

    for i,v in pairs(group.Roles) do
        local newRank = Rank(v.Name)
        RankController.Ranks[newRank.name] = newRank
    end
end

function RankController:AddRanksToTeam()
    for i,v in pairs(RankController.Ranks) do
        if v.team then
            local newTeam = Instance.new("Team", Teams)
            newTeam.Name = v.name
            newTeam.TeamColor = v.color
            print(v.name)
        end
    end
end

function RankController:GetPlayerRanks(playerInstance)
    local ranks = {}
    for i,v in pairs(RankController.Groups) do
        if playerInstance:IsInGroup(v.Id) then
            local roleInGroup = playerInstance:GetRoleInGroup(v.Id)
            for j,k in pairs(RankController.Ranks) do
				if k.name == roleInGroup then 
				    table.insert(ranks,k)
				end
			end	
        end
    end
    return ranks
end



return RankController