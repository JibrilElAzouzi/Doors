script.Parent.stopallanims.Changed:Connect(function()
	if script.Parent.stopallanims.Value == true then
		repeat wait()
			if script.Parent.Parent.HiddenPlayer.Value == nil then
				return
			end
		for i,v in pairs(script.Parent.Parent.HiddenPlayer.Value:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
			if v.Name ~= "Entering" then
				v:Stop()
			end

			end
			until script.Parent.stopallanims.Value == false
	end
end)