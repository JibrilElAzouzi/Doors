local Anina = script.Parent.AnimationController
local hasterer = script.Parent.Anim_Enter
local LocalAnim = Anina:LoadAnimation(hasterer)
local n = false
script.Parent.HIDE.HidePrompt.Triggered:Connect(function(player)
	if script.Parent.HiddenPlayer.Value == nil and player.Character:FindFirstChild("Humanoid").Health ~= 0 and player.Character:WaitForChild("CanHide").Value == true then
		script.Parent.HiddenPlayer.Value = player.Character
	end
	local character = player.Character
	local hrp = character:FindFirstChild("HumanoidRootPart")
	if hrp  and script.Parent.HiddenPlayer.Value == player.Character and n == false and player.Character:WaitForChild("CanHide").Value == true then
			n = true
			
		player.PlayerGui.Vignette.Enabled = true
		player.Character.Cam1.Value = script.Parent.CameraCFrame1
		player.Character.Cam.Value = script.Parent.CameraCFrame
		player.Character.Cam2.Value = script.Parent.CameraCFrame2
		player.Character.Cam3.Value = script.Parent.CameraCFrame3
		player.Character.Cam4.Value = script.Parent.CameraCFrame4
		wait(0.1)
		local TS = game:GetService("TweenService")
		script.Parent.Main.SoundEnter:Play()
		LocalAnim:Play()
		player.Character:WaitForChild("IsCloset").Value = true

		player.Character:WaitForChild("CanHide").Value = false
		local anim = script.gettingIn
		local hum = player.Character:FindFirstChild("Humanoid") 
		local loadanim = hum:LoadAnimation(anim)
		local animationTracks = hum:GetPlayingAnimationTracks()
		for _, v in pairs(animationTracks) do
			v:Stop()
		end
		

		loadanim:Play()
		local fart= 	TS:Create(hrp,TweenInfo.new(1),{CFrame = script.Parent.CameraCFrame.CFrame})
		fart:Play()
		fart.Completed:Wait()
		hrp.Anchored = true

		
			local character = player.Character
			local hrp = character:FindFirstChild("HumanoidRootPart")
		elseif n == true and script.Parent.HiddenPlayer.Value == player.Character and player.Character:WaitForChild("CanHide").Value == false then
				player.Character:WaitForChild("IsCloset").Value = false

				local TS = game:GetService("TweenService")
			script.Parent.Main.SoundExit:Play()

				LocalAnim:Play()

				player.Character:WaitForChild("CanHide").Value = true

				script.Parent.HiddenPlayer.Value = nil
				player.PlayerGui.Vignette.Frame.ImageLabel.Invisible.Enabled = true

				local anim = script.gettingOut
				local hum = player.Character:FindFirstChild("Humanoid") 
				local loadanim = hum:LoadAnimation(anim)
				local animationTracks = hum:GetPlayingAnimationTracks()
				for _, v in pairs(animationTracks) do
					v:Stop()
				end
				TS:Create(hrp,TweenInfo.new(0.2),{CFrame = script.Parent.CameraCFrame4.CFrame}):Play()

				wait(0.2)
				local animationTracks = hum:GetPlayingAnimationTracks()
				for _, v in pairs(animationTracks) do
					v:Stop()
				end
				loadanim:Play()
			TS:Create(hrp,TweenInfo.new(0.2),{CFrame = script.Parent.CameraCFrame4.CFrame}):Play()
				hrp.Anchored = false

				wait(1)
			TS:Create(hrp,TweenInfo.new(0.2),{CFrame = script.Parent.CameraCFrame4.CFrame}):Play()

				player.PlayerGui.Vignette.Enabled = false

				player.Character.Cam1.Value = nil
				player.Character.Cam.Value = nil
				player.Character.Cam2.Value = nil
				player.Character.Cam3.Value = nil
				player.Character.Cam4.Value = nil
n = false
			
			
	end		
		
	
end)
