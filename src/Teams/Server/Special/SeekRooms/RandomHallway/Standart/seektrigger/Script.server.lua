local debounce = false
local l__TweenService__1 = game:GetService("TweenService");
local SeekMoving = game:GetService("ServerScriptService").Server.Assets.Entities.SeekMoving

script.Parent.Touched:Connect(function()
	if not debounce then
		debounce = true
		SeekMoving.Parent = game.Workspace
		game.Workspace.SeekMoving.AssetControl.Enabled = true
		script.Parent.Parent.Door.Hidden.Generation.Enabled = true
		game.ReplicatedStorage.GameData.ChaseInSession.Value = true
		for i, v in pairs(game.Players:GetPlayers()) do 
			if v.Character then 
				l__TweenService__1:Create(game:GetService("Lighting"), TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
					Ambient = Color3.new(0.243137, 0, 0)
				}):Play();
				l__TweenService__1:Create(game:GetService("Lighting").Sanity, TweenInfo.new(16, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
					Saturation = 0.2
				}):Play();
				game.ReplicatedStorage.Bricks.Cutscene:FireClient(v, "SeekIntro")
				v.PlayerGui.MainUI.Initiator.Main_Game.RemoteListener.Cutscenes.NoHidePlayer.Enabled = false
				v.Character.PrimaryPart.CFrame = script.Parent.CFrame
				v.Character.Humanoid.WalkSpeed = 0
			end 
		end
		wait(8.1)
		for i, v in pairs(game.Players:GetPlayers()) do 
			if v.Character then 
				v.Character.Humanoid.WalkSpeed = 15
				v.Character.Humanoid:SetAttribute("SpeedBoostBehind", 6)
			end
		end
	end
end)