script.Parent.ModulePrompt.Triggered:Connect(function()
	local clone = script.Parent.Parent.CutVercionR:Clone()
	clone.Parent = script.Parent.Parent
	clone.CeD1.Color = Color3.fromRGB(72, 45, 45)
	clone.CeD.Color = Color3.fromRGB(72, 45, 45)
	clone:PivotTo(script.Parent.Dot.CFrame)
	wait()
	script.Parent:Destroy()
end)