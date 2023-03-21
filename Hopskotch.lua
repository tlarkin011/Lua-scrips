local Platforms = script.Parent.Platforms
local nextBlock = false
local died = false

function main()
	for i = 1, 6, 1 do
		local part = Platforms:FindFirstChild("Part" .. i)
		part.CanCollide = true
		
		local touchedPlatform = part.Touched:Connect(function(hit)
			nextBlock = true
		end)
		
		while nextBlock == false do
			if died == true then
				died = false
				return
			end
			wait(.3)
		end
		nextBlock = false
		touchedPlatform:Disconnect()
	end
end



game:GetService('Players').PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		character:WaitForChild("Humanoid").Died:Connect(function()
			for i = 2, 6, 1 do
				local part = Platforms:FindFirstChild("Part" .. i)
				died = true
				wait(3)
				part.CanCollide = false
				main()
			end
		end)
	end)
end)

main()
