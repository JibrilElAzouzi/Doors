while true do
	wait(0.1)
	if script.Parent.Parent.Parent.Parent.Colors.Carpet:FindFirstChild("CarpetLight") then
		script.Parent.Color = script.Parent.Parent.Parent.Parent.Colors.Carpet:FindFirstChild("CarpetLight").Value
		if script.Parent.Parent.Parent.Parent.Colors.Carpet:FindFirstChild("Texture") then
			script.Parent.Parent.Parent.Parent.Colors.Carpet:FindFirstChild("Texture").Parent = script.Parent
			local tex = script.Parent:FindFirstChild("Texture"):Clone()
			tex.Face = "Right"
			tex.Parent = script.Parent
		end
	end
end