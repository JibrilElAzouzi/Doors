while wait(1) do
	local F = game.Workspace.Rooms:FindFirstChild("50")
	if F then
		if F.FigureSetup.Modules.Lever1Triggered.Value == true  then
			script.Parent.Color = Color3.fromRGB(3, 50, 0)
			script.Parent.NumberUI.TextLabel.TextColor3 = Color3.fromRGB(0, 255, 127)
		end
	end
end