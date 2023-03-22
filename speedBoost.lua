-- This script will make this part give each player that touches it a speed boost for a few seconds

local part = script.Parent

function boost(obj)
	local h = obj.Parent:FindFirstChild("Humanoid")
	if h then
		h.WalkSpeed = 50 -- Controls speed of boost
		task.wait(3)     -- Controls duration of boost
		h.WalkSpeed = 16
	end
end

part.Touched:Connect(boost)
