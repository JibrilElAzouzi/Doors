local randomPainting = math.random(1, 10)
local Image = script.Parent.ImageLabel
local Number = Instance.new("NumberValue")
Number.Value = randomPainting
Number.Name = "Number"
Number.Parent = script.Parent
local TitleNumber = Instance.new("StringValue")
TitleNumber.Value = randomPainting
TitleNumber.Name = "Title"
TitleNumber.Parent = script.Parent

if Number.Value == 1 then
	Image.Image = "rbxassetid://13640159193"
	Image.Parent.Parent.Parent.Name = "Alien Maze"
	TitleNumber.Value = "Alien Maze"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Alien Maze".')
	end)
elseif Number.Value == 2 then
	Image.Image = "rbxassetid://13640182089"
	Image.Parent.Parent.Parent.Name = "Cul De Sac"
	TitleNumber.Value = "Cul De Sac"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Cul De Sac".')
	end)
elseif Number.Value == 3 then
	Image.Image = "rbxassetid://13640189380"
	Image.Parent.Parent.Parent.Name = "Finals"
	TitleNumber.Value = "Finals"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Finals".')
	end)
elseif Number.Value == 4 then
	Image.Image = "rbxassetid://13640197745"
	Image.Parent.Parent.Parent.Name = "Happy Accident"
	TitleNumber.Value = "Happy Accident"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Happy Accident".')
	end)
elseif Number.Value == 5 then
	Image.Image = "rbxassetid://13640205682"
	Image.Parent.Parent.Parent.Name = "Flaming Man"
	TitleNumber.Value = "Flaming Man"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Flaming Man".')
	end)
elseif Number.Value == 6 then
	Image.Image = "rbxassetid://13640213170"
	Image.Parent.Parent.Parent.Name = "Marbles"
	TitleNumber.Value = "Marbles"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Marbles".')
	end)
elseif Number.Value == 7 then
	Image.Image = "rbxassetid://13640233872"
	Image.Parent.Parent.Parent.Name = "My Neighbourhood"
	TitleNumber.Value = "My Neighbourhood"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "My Neighbourhood".')
	end)
elseif Number.Value == 8 then
	Image.Image = "rbxassetid://13640242782"
	Image.Parent.Parent.Parent.Name = "Nine To Five"
	TitleNumber.Value = "Nine To Five"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Nine To Five".')
	end)
elseif Number.Value == 9 then
	Image.Image = "rbxassetid://13640251169"
	Image.Parent.Parent.Parent.Name = "Petrol"
	TitleNumber.Value = "Petrol"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Petrol".')
	end)
elseif Number.Value == 10 then
	Image.Image = "rbxassetid://13640260399"
	Image.Parent.Parent.Parent.Name = "Pirate Cove"
	TitleNumber.Value = "Pirate Cove"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Pirate Cove".')
	end)
elseif Number.Value == 11 then
	Image.Image = "rbxassetid://13766901372"
	Image.Parent.Parent.Parent.Name = "Canon moment"
	TitleNumber.Value = "Canon moment"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Canon moment".')
	end)
end