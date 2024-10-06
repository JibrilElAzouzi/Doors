local drawer = {}
local t = math.random(1,2)
	if script.Knobs:FindFirstChildOfClass("ProximityPrompt") then
		script.Knobs:FindFirstChildOfClass("ProximityPrompt"):Destroy()
			end
	if not script:GetAttribute("Opened") then
		script:SetAttribute("Opened", false)
			end
				local newprompt = Instance.new("ProximityPrompt")
				newprompt.Style = Enum.ProximityPromptStyle.Custom
				newprompt.ActionText = "Open"
				newprompt.ObjectText = "Drawer"
	newprompt.Parent = script.Knobs
					newprompt.Triggered:Connect(function(player)
		if script:GetAttribute("Opened") ~= true then
			script.Constraint.TargetPosition = 5
			script:SetAttribute("Opened", true)
						else
			script.Constraint.TargetPosition = 0
			script:SetAttribute("Opened", false)
						end
					end)

return drawer
