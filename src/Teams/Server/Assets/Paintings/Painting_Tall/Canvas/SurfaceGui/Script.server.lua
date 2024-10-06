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
	Image.Image = "rbxassetid://10500853479"
	Image.Parent.Parent.Parent.Name = "Unfathomable"
	TitleNumber.Value = "Unfathomable"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Unfathomable".')
	end)
elseif Number.Value == 2 then
	Image.Image = "rbxassetid://13114548841"
	Image.Parent.Parent.Parent.Name = "This Is Not A Violin"
	TitleNumber.Value = "This Is Not A Violin"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "This Is Not A Violin".')
	end)
elseif Number.Value == 3 then
	Image.Image = "rbxassetid://13114575301"
	Image.Parent.Parent.Parent.Name = "Deepness"
	TitleNumber.Value = "Deepness"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Deepness".')
	end)
elseif Number.Value == 4 then
	Image.Image = "rbxassetid://13114582360"
	Image.Parent.Parent.Parent.Name = "Captain Jack"
	TitleNumber.Value = "Captain Jack"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Captain Jack".')
	end)
elseif Number.Value == 5 then
	Image.Image = "rbxassetid://13114586302" 
	Image.Parent.Parent.Parent.Name = "Station"
	TitleNumber.Value = "Station"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Station".')
	end)
elseif Number.Value == 6 then
	Image.Image = "rbxassetid://13114590522" 
	Image.Parent.Parent.Parent.Name = "Terminal"
	TitleNumber.Value = "Terminal"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Terminal".')
	end)
elseif Number.Value == 7 then
	Image.Image = "rbxassetid://13114595794"
	Image.Parent.Parent.Parent.Name = "Field"
	TitleNumber.Value = "Field"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Field".')
	end)
elseif Number.Value == 8 then
	Image.Image = "rbxassetid://13114604765"
	Image.Parent.Parent.Parent.Name = "Mona Thump"
	TitleNumber.Value = "Mona Thump"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Mona Thump".')
	end)
elseif Number.Value == 9 then
	Image.Image = "rbxassetid://13114613583"
	Image.Parent.Parent.Parent.Name = "Late For Work"
	TitleNumber.Value = "Late For Work"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Late For Work".')
	end)
elseif Number.Value == 10 then
	Image.Image = "rbxassetid://13114621368"
	Image.Parent.Parent.Parent.Name = "Alley"
	TitleNumber.Value = "Alley"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Alley".')
	end)
end