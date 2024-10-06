script.Parent.Touched:Connect(function(hit)
	if hit.Parent:FindFirstChild("Humanoid") then
		local plrhum = hit.Parent
		if game.Players:GetPlayerFromCharacter(hit.Parent) then
			hit.Humanoid.Health = 0 
			game.ReplicatedStorage.Bricks.DeathHint:FireClient(game.Players:WaitForChild(hit.Parent.Name), {"You Died to Seek", "Look both ways before you progress."})
			game.ReplicatedStorage.Bricks.Jumpscare:FireClient(game.Players:WaitForChild(hit.Parent.Name), "Seek")
		end
	end
end)