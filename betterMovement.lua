-- This script will make moving parts easier and will move objects that are in contact with this part
-- Place this script in a script of a part that you would like to move
-- That part must be anchored

local part = script.Parent

-- PART MOVEMENT

local TweenService = game:GetService("TweenService") -- Built-in movement library

local moveInfo = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true) -- Defines the duration, style, and number of movements (CHANGE THESE PARAMETERS)
-- 1st Parameter: Time it takes to complete one movement
-- 2nd Parameter: Style of movement (sine makes the movement very fluent)
-- 3rd Parameter: When does the stylish movement happen? (inout makes the easing happen on both sides)
-- 4th Parameter: How many times it moves (-1 makes it move infinitely)
-- 5th Parameter: Should it move back and forth? (true/false)

local tween = TweenService:Create(part, moveInfo, {
	CFrame = part.CFrame * CFrame.new(0, 20, 0) -- Defines the direction and magnitude of the movement (CHANGE THESE NUMBERS)
})

tween:Play() -- Runs movement

-- PART INTERACTS WITH OTHER OBJECTS

local RunService = game:GetService("RunService")

local lastPos = part.Position
RunService.Stepped:Connect(function(run, deltaTime) -- "Stepped" event occurs whenever the game physics update
	local currentPos = part.Position
	local distance = currentPos - lastPos
	
	local velocity = distance / deltaTime
	
	part.AssemblyLinearVelocity = velocity -- This function updates this part's velocity according to its movement
	
	lastPos = currentPos
end)

-- Moving blocks will only move players (or other objects) when we update their velocity
-- Changing their position will only affect that part
-- However we must change both the position and velocity because this part is anchored
