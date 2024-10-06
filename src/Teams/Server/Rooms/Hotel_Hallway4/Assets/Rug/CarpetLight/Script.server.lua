while true do
	wait(0.1)
	if script.Parent.Parent.Parent.Parent.Colors.Carpet:FindFirstChild("CarpetLight") then
		script.Parent.Color = script.Parent.Parent.Parent.Parent.Colors.Carpet:FindFirstChild("CarpetLight").Value
		if script.Parent.Parent.Parent.Parent.Colors.Carpet:FindFirstChild("Texture") then
			local x = script.Parent.Parent.Parent.Parent.Colors.Carpet:FindFirstChild("Texture"):Clone()
			x.Parent = script.Parent
			script:Destroy()
		end
	end
end