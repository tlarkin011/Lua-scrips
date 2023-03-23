local part = script.Parent
local debounce = false 


part.Touched:Connect(function(touched)

	debounce = true
	if touched.Parent:FindFirstChild("Humanoid") and debounce == true  then
		
		local copy = part:Clone()
		copy.Parent = part.Parent
		local newZ = copy.Position.Z + 15
		
		copy.Position = Vector3.new(360, 135.7, newZ)
		copy.Parent = part.Parent
		wait(2)
		copy.CanTouch = false
		debounce = false
		
		
		
	end
end)	
	