local debounce = false

script.Parent.Touched:Connect(function(player)
	if not debounce then
		debounce = true
		for i, d in pairs(game.Players:GetPlayers()) do 
			if d.Character then 
				game.ReplicatedStorage.Bricks.Cutscene:FireClient(d, "Figure")
				d.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Cutscenes.NoHidePlayer.Enabled = false
				d.Character:PivotTo(script.Parent.CFrame)
				d.Character.Humanoid.WalkSpeed = 0
			end
		end
		--workspace.Rooms.CurrentRoom += 1
		--wait()
		script.Parent.Parent.Animated.Generation.Enabled = true
		script.Parent.Parent.FigureSetup.TriggerFigure:Fire(player)
		script.Parent.Parent.Door.Door.Open:Play()
		script.Parent.Parent.Door.Door1.Open:Play()
		script.Parent.Parent.Door.Door.Anchored = false
		script.Parent.Parent.Door.Door.CanCollide = false
		script.Parent.Parent.Door.Door1.Anchored = false
		script.Parent.Parent.Door.Door1.CanCollide = false
		script.Parent.Parent.Door.HingeConstraint2.TargetAngle = -100
		script.Parent.Parent.Door.HingeConstraint.TargetAngle = 100
		--script.Parent.Parent.FigureSetup.AssetControl.Enabled = true
		wait(4)
		script.Parent.Parent.Door.HingeConstraint2.TargetAngle = 0
		script.Parent.Parent.Door.HingeConstraint.TargetAngle = 0
		wait(4)
		script.Parent.Parent.Door.FigureCollision.CanCollide = true
		for i, d in pairs(game.Players:GetPlayers()) do 
			if d.Character then 
				d.Character.Humanoid.WalkSpeed = 15
				d.Character:PivotTo(script.Parent.Parent.FigureSetup.TeleportGame.CFrame)
			end
		end
		--doorin()
	end
end)