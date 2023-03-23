-- This script teleports a player to a certain location when it is touched
-- Replace the <x> <y> and <z> with absolute coordinates

local part = script.Parent

function teleport(obj)
	local h = obj.Parent:FindFirstChild("HumanoidRootPart")
	if h then
		h.CFrame = CFrame.new(<X>, <Y>, <Z>)
	end
end

part.Touched:Connect(teleport)
