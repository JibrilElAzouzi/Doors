script.Parent.ModulePrompt.Triggered:Connect(function(player)
	player.Character:FindFirstChild("Humanoid"):TakeDamage(40)
	game.ReplicatedStorage.Bricks.DeathHint:FireClient(player, {"You Died to Electricity.", "Looks like you picked the wrong wire.", "Next time, watch which wire you cut."})
	if player.Character:FindFirstChild("Humanoid").Health == 0 then
		player.Stats.Death.Value = "Electricity"
	end
end)