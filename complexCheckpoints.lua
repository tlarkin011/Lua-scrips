-- A more complex checkpoint system for Roblox Studio
-- Creates a leaderboard that displays the stage of every player
-- Turns every part in the "Checkpoints" folder into a checkpoint
-- Teleports players to their current stage when they respawn

local checkpoints = workspace:WaitForChild("Checkpoints")

game.Players.PlayerAdded:Connect(function(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local stage = Instance.new("IntValue")
	stage.Name = "Stage"
	stage.Value = 0
	stage.Parent = leaderstats
		
	player.CharacterAdded:Connect(function(char)
		local h = char:WaitForChild("Humanoid")
		task.wait()
			
		if stage.Value ~= 0 then
		char:MoveTo(checkpoints:GetChildren()[stage.Value].Position)
		end
			
		h.Touched:Connect(function(obj)
			if obj.Parent == checkpoints then
        for i, p in ipairs(Checkpoints:GetChildren()) do
			    if obj == p then
            if i > stage.Value then
				      stage.Value = i
            end
          end
			  end
		  end
		end)
	end)
end)
