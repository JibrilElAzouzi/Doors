local Prompt = script.Parent.ProximityPrompt

Prompt.Triggered:Connect(function(Player)
	local crucifix = game.ServerScriptService.Server.Assets.Items.Crucifix:Clone()
	crucifix.Parent = Player.Backpack
	script.Parent:Destroy()
	wait(2)
end)
