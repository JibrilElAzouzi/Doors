local hiddenplayer = script.Parent.Parent.HiddenPlayer
local wardrobe = script.Parent.Parent
local tweens = game:GetService("TweenService")
local stopanim = script.stopanim
script.Parent.Triggered:Connect(function(player)
	local root = player.Character.HumanoidRootPart
	if hiddenplayer.Value == nil and player.Character.Humanoid.Health > 0 then
		if math.random(1, 20) ~= 20 then
			game.ReplicatedStorage.Remotes.wardrobe:FireClient(player)
			local anim = script.Parent.Parent.Entering
			player:SetAttribute("Hidden", true)
			player.Character:WaitForChild("IsCloset").Value = true
			player.Character:WaitForChild("HumanoidRootPart").Anchored = true
			game.ReplicatedStorage.TurnOn:FireClient(player)
			local hum = player.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(anim)
			script.stopanim.Value = false
			player.Character:WaitForChild("Animate").Enabled = false
			wait()
			for i,v in pairs(player.Character:FindFirstChildWhichIsA("Humanoid"):GetPlayingAnimationTracks()) do
				if v.Name ~= "Entering" then
					v:Stop()
				end

			end

			wait()
			script.Parent.stopallanims.Value = true
			hum:Play()
			stopanim.Changed:Connect(function()
				if stopanim.Value == true then
					hum:Stop()
					for i,v in pairs(player.Character:FindFirstChildWhichIsA("Humanoid"):GetPlayingAnimationTracks()) do
						if v.Name ~= "Entering" then
							v:Stop()
						end

					end
				else

				end
			end)
			hiddenplayer.Value = player
			root:PivotTo(wardrobe.turn.CFrame)
			script.ClosetOpen:Play()
			game.ReplicatedStorage.Remotes.setcam:FireClient(player,player.Character:WaitForChild("Head"))
			tweens:Create(wardrobe.Door1, TweenInfo.new(0.14, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {CFrame = wardrobe.Door1Tween.CFrame}):Play()
			tweens:Create(wardrobe.Door2, TweenInfo.new(0.14, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {CFrame = wardrobe.Door2Tween.CFrame}):Play()
			wait(hum.Length - 0.047)
			script.Parent.Parent.CAM.Position = player.Character:WaitForChild("Head").Position
			hum:AdjustSpeed(0)

			tweens:Create(wardrobe.Door1, TweenInfo.new(0.07, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {CFrame = wardrobe.Door1Back.CFrame}):Play()
			tweens:Create(wardrobe.Door2, TweenInfo.new(0.07, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {CFrame = wardrobe.Door2Back.CFrame}):Play()


		else
			local jack = game.ReplicatedStorage.Entities.Jack:Clone()
			jack.CFrame = wardrobe.TPTO.CFrame
			local sound = Instance.new("Sound", workspace)
			sound.SoundId = "rbxassetid://11344144872"
			sound.TimePosition = 0.04
			tweens:Create(wardrobe.Door1, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {CFrame = wardrobe.Door1Tween.CFrame}):Play()
			tweens:Create(wardrobe.Door2, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {CFrame = wardrobe.Door2Tween.CFrame}):Play()
			jack.Parent = workspace
			hiddenplayer.Value = jack
			sound:Play()
			wait(1)
			tweens:Create(wardrobe.Door1, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {CFrame = wardrobe.Door1Back.CFrame}):Play()
			tweens:Create(wardrobe.Door2, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.InOut), {CFrame = wardrobe.Door2Back.CFrame}):Play()
			hiddenplayer.Value = nil
			sound:Stop()
			jack:Destroy()
		end
	else
		if hiddenplayer.Value ~=  player then
			game.ReplicatedStorage.Bricks.Caption:FireClient(player, tostring(hiddenplayer.Value).." Is already hiding in here!")
		end
	end
end)

game.ReplicatedStorage.Remotes.wardrobe.OnServerEvent:Connect(function(player)
	if script.Parent.Parent.HiddenPlayer.Value == player then
		script.Parent.Parent.HiddenPlayer.Value = nil
		player.Character.HumanoidRootPart.Anchored = true
		player.Character.HumanoidRootPart:PivotTo(script.Parent.Parent.GETOUT.CFrame)
		script.ClosetClose:Play()
		player.Character:WaitForChild("IsCloset").Value = false

		local anim = script.Parent.Animation
		script.stopanim.Value = true
		local hum = player.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(anim)
		hum:Play()
		player.Character:WaitForChild("Animate").Enabled = true
		script.Parent.stopallanims.Value = false
		game.ReplicatedStorage.TurnOn:FireClient(player)
		for i,v in pairs(player.Character:FindFirstChildWhichIsA("Humanoid"):GetPlayingAnimationTracks()) do
			if v.Name ~= "Entering" then
				v:AdjustSpeed(v.Speed)
			end

		end
		player:SetAttribute("Hidden", false)

		wait(0.2)
		player.Character.HumanoidRootPart.Anchored = false
	end
end)