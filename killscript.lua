function onTouched(Obj)
	local h = Obj.Parent:FindFirstChild("Humanoid")
	if h then
		h.Health = 0
	end
end

script.Parent.Touched:Connect(onTouched)



local checkpoints = workspace:WaitForChild("Checkpoints")

game.Players.PlayerAdded:Connect(function(player) local stage = Instance.new("IntValue") stage.Name = "Stage" stage.Value = 0 stage.Parent = player

player.CharacterAdded:Connect(function(char)
	local h = char:WaitForChild("Humanoid")
	task.wait()

	if stage.Value ~= 0 then
		char:MoveTo(checkpoints:GetChildren()[stage.Value].Position)
	end

	h.Touched:Connect(function(obj)
		if obj.Parent == checkpoints then
			for i, p in ipairs(checkpoints:GetChildren()) do
				if obj == p then
					stage.Value = i
				end
			end
		end
	end)
end)
end)