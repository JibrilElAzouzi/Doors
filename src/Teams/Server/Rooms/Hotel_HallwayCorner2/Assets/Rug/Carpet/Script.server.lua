while true do
	wait(0.1)
	if script.Parent.Parent.Parent.Parent.Colors.Carpet:FindFirstChild("Carpet") then
		script.Parent.Color = script.Parent.Parent.Parent.Parent.Colors.Carpet:FindFirstChild("Carpet").Value
		wait(0.5)
		script:Destroy()
	end
end