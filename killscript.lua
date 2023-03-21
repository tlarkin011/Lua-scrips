function onTouched(Obj)
	local h = Obj.Parent:FindFirstChild("Humanoid")
	if h then
		h.Health = 0
	end
end

script.Parent.Touched:Connect(onTouched)