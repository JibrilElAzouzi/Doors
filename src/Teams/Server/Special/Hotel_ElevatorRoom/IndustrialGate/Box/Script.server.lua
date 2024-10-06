local doorTweenInfo = TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut,0,false,0)
local TweenService = game:GetService("TweenService")
local doorModel = script.Parent.Parent


local doorTween = TweenService:Create(doorModel.Gate, doorTweenInfo, {CFrame = doorModel.GateOpen.CFrame})
local doorTween1 = TweenService:Create(doorModel.Gate1, doorTweenInfo, {CFrame = doorModel.Gate1Open.CFrame})

script.Parent.ActivateEventPrompt.Triggered:Connect(function()
	script.Parent.ActivateEventPrompt.Enabled = false
	doorModel.LeverConstraint.TargetPosition = -5.6
	doorTween:Play()
	doorTween1:Play()
	doorModel.Main.Open:Play()
	doorModel.Parent.FigureSetup.FigureCutsceneAnim.Playanimation.Enabled = true
	wait(1.6)
	game.Workspace.Ambience_Figure:Play()
	for i, d in pairs(game.Players:GetPlayers()) do 
		if d.Character then 
			game.ReplicatedStorage.Bricks.Cutscene:FireClient(d, "FigureEnd")
			d.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Cutscenes.NoHidePlayer.Enabled = false
			d.Character.Humanoid.WalkSpeed = 0
		else
			game.ReplicatedStorage.Bricks.Cutscene:FireClient(d, "FigureEnd")
			d.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Cutscenes.NoHidePlayer.Enabled = false
		end
	end
	wait(8)
	doorModel.Gate.CanCollide = false
	doorModel.Gate1.CanCollide = false
	doorModel.Main.CanCollide = false
	for i, d in pairs(game.Players:GetPlayers()) do 
		if d.Character then 
			d.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Cutscenes.NoHidePlayer.Enabled = true
			d.Character.PrimaryPart.CFrame = script.Parent.CFrame
			d.Character.Humanoid.WalkSpeed = 15
		else
			d.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Cutscenes.NoHidePlayer.Enabled = true
		end
	end
end)