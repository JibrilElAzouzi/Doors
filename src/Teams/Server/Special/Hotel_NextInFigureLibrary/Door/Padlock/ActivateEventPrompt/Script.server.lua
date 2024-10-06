script.Parent.Triggered:Connect(function(Player)
	game.ReplicatedStorage.Bricks.EngageMinigame:FireClient(Player, "Padlock")
end)