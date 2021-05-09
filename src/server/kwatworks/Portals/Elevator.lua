local Elevator = require(game.ServerScriptService.kwatworks.Portals.Portal):extend()

local TweenService = game:GetService("TweenService")

local CollectionService = game:GetService("CollectionService")

function Elevator:new(id,model,spawnLocation,speed)
    self.id = id
    self.model = model:Clone()
    self:WeldParts(self.model,self.model.PrimaryPart)
    self.model:SetPrimaryPartCFrame(spawnLocation)
	self.model.Parent = workspace
    self.floors = {}
    self.buttons = {}
    self.speed = speed
    self.moving = false
    self:FindClickDetectors(self.model)
    self:SetupButtons()
end

function Elevator:GetFloors()
    local floors = CollectionService:GetTagged("elevator_floor")
    for i,v in pairs(floors) do
        if v:GetAttribute("id") == self.id  then
            self.floors[v:GetAttribute("floor")] = v
        end
    end
end



function Elevator:MovePrisma(floor)
    local startPos = self.model.PrimaryPart.Position.Y
    local endPos = self.floors[floor].Position.Y - self.floors[0].Position.Y 

    self.prisma.TargetPosition = endPos
    self.moving = true
    while self.moving do
        local firstPos = self.model.PrimaryPart.Position.Y
        wait(0.5)
        local secondPos = self.model.PrimaryPart.Position.Y

        if firstPos == secondPos then
            self.moving = false
        end
    end
    print("moving done")
end

function Elevator:CreatePrisma()
    local attachment = Instance.new("Attachment")
    attachment.Parent = self.model.PrimaryPart
    attachment.Orientation = Vector3.new(0,0,90)

    local attachment1 = Instance.new("Attachment")
    attachment1.Parent = self.floors[0]
    attachment1.Orientation = Vector3.new(0,0,90)

    self.prisma = Instance.new("PrismaticConstraint")
    self.prisma.Attachment0 = attachment1
    self.prisma.Attachment1 = attachment
    self.prisma.ActuatorType = 2
    self.prisma.ServoMaxForce = 99999
    self.prisma.TargetPosition = 0
    self.prisma.Speed = self.speed
    self.prisma.Parent = self.model.PrimaryPart
end

function Elevator:SetupButtons()
    for i,v in pairs(self.buttons) do
        v.MouseClick:connect(function() 
            if self.moving == false then
                self:MovePrisma(v:GetAttribute("floor"))
            end
        end)
    end
end

function Elevator:FindClickDetectors(part)
    for i,v in pairs(part:GetChildren()) do
        if v.ClassName == "ClickDetector" then
            table.insert(self.buttons, v)
        end
        self:FindClickDetectors(v)
    end
end

return Elevator