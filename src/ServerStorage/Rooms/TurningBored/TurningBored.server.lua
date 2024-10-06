for i,v in pairs(script.Parent.Furnitures:GetChildren()) do
	if v.Name == "Dresser" then
		for i,x in pairs(v:GetChildren()) do
			if string.find(x.Name, "Container") then
				x:SetAttribute("Opened", false)
				x.Knobs.ActivateEventPrompt.Triggered:Connect(function(player)
					if x:GetAttribute("Opened") ~= true then
						x.Constraint.TargetPosition = 5
						x:SetAttribute("Opened", true)
						x.Main.Open:Play()

					else
						x.Main.Close:Play()

						x.Constraint.TargetPosition = 0
						x:SetAttribute("Opened", false)
					end
				end)
			end
		end
	end
end