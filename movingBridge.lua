local part = script.Parent
local debounce = false 


part.Touched:Connect(function(touched)

	
	if touched.Parent:FindFirstChild("Humanoid") and debounce == false  then
		debounce = true
		local copy = part:Clone()
		copy.Parent = part.Parent
		local size = part.Size.Z
		local newZ = copy.Position.Z + size
		
		copy.Position = Vector3.new(360, 135.7, newZ)
		copy.Parent = part.Parent
		wait(100)
		copy.CanTouch = false
		debounce = false
		
		
		
	end
end)
	