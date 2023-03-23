while wait(1) do
	local fireballClone = game.ServerStorage.FireBall:Clone()
	fireballClone.Parent = game.Workspace
	fireballClone.Position = script.Parent.Position
	fireballClone.AssemblyLinearVelocity = Vector3.new(0, 0, -150)
end
