-- This script turns a part into a functional trampoline
-- Place this script into an anchored part

local part = script.Parent
local isLaunched = false

function launch(obj)
	local h = obj.Parent:FindFirstChild("Humanoid")
	if h and not isLaunched then
		isLaunched = true
		
		local normalJump = h.JumpHeight
		
		h.JumpHeight = 50 -- Controls the strength of the trampoline
		h.Jump = true
		
		task.wait(1)
		
		h.JumpHeight = normalJump
		isLaunched = false
	end
end

part.Touched:Connect(launch)
