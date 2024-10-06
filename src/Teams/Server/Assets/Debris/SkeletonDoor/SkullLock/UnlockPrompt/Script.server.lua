local anim = script.Parent.Animation
script.Parent.PromptButtonHoldBegan:Connect(function(unlock)
	if unlock then
		if unlock.Character:FindFirstChild("SkeletonKey") then
			local loadanim = unlock.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(anim)

			loadanim:Play()
			script.Parent.PromptButtonHoldEnded:Connect(function()
				loadanim:Stop()
			end)
		end
	end
end)
script.Parent.Triggered:Connect(function(unlock)
	if unlock then
		if unlock.Character:FindFirstChild("SkeletonKey") then
			wait(0.03)
			script.Parent.Parent.Parent.Hidden.Script.Enabled = true
			script.Parent:Destroy()
			unlock.Character:FindFirstChild("SkeletonKey"):Destroy()
			script:Destroy()
		end
	end
end)