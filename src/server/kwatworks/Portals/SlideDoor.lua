local Door = require(game.ServerScriptService.kwatworks.Portals.Portal):extend()

local TweenService = game:GetService("TweenService")


function Door:SetupTweening(openingDistance,speed,direction)
    self.state = 0
	--setup tweening
	self.openingDistance = openingDistance
	self.speed = speed
	
	--setup tween info for moving the doors
	self.tweenInformation = TweenInfo.new(
		self.speed,
		Enum.EasingStyle.Linear,
		Enum.EasingDirection.Out,
		0,
		false,
		0
	)
	
	self.doorClosed = {CFrame = self.model.PrimaryPart.CFrame}
	self.doorOpen = self:GetOpenDirection(direction,self.model,self.openingDistance)
	self.tweenOpen = TweenService:Create(self.model.PrimaryPart,self.tweenInformation,self.doorOpen)
	self.tweenClosed = TweenService:Create(self.model.PrimaryPart,self.tweenInformation,self.doorClosed)
	
end

function Door:GetOpenDirection(direction,model,openingDistance)
	
	if direction == "x-" then
		return {CFrame = self.model.PrimaryPart.CFrame - (model.PrimaryPart.CFrame.RightVector * self.openingDistance)}
	end
	if direction == "x" then
		return {CFrame = model.PrimaryPart.CFrame - (model.PrimaryPart.CFrame.RightVector * -openingDistance)}
	end
	
	if direction == "z-" then
		return {CFrame = model.PrimaryPart.CFrame - (model.PrimaryPart.CFrame.LookVector * openingDistance)}
	end
	if direction == "z" then
		return {CFrame = model.PrimaryPart.CFrame - (model.PrimaryPart.CFrame.LookVector * -openingDistance)}
	end
end


function Door:Open(autoClose)
    print("going")
	if self.state == 0 then
		self.tweenOpen:Play()
		self.state = 1
		if autoClose then
            print("going back")
			wait(self.speed + 5)
			self.tweenClosed:Play()
			wait(self.speed)
			self.state = 0
		end
	end
end



return Door