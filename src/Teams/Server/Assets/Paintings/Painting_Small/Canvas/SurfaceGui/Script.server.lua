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
	Image.Image = "rbxassetid://6525354226"
	Image.Parent.Parent.Parent.Name = "Quadrants"
	TitleNumber.Value = "Quadrants"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Quadrants".')
	end)
elseif Number.Value == 2 then
	Image.Image = "rbxassetid://13113410176"
	Image.Parent.Parent.Parent.Name = "Garden"
	TitleNumber.Value = "Garden"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Garden".')
	end)
elseif Number.Value == 3 then
	Image.Image = "rbxassetid://13113419079"
	Image.Parent.Parent.Parent.Name = "Structures"
	TitleNumber.Value = "Structures"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Structures".')
	end)
elseif Number.Value == 4 then
	Image.Image = "rbxassetid://13113428579"
	Image.Parent.Parent.Parent.Name = "Sprout"
	TitleNumber.Value = "Sprout"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Sprout".')
	end)
elseif Number.Value == 5 then
	Image.Image = "rbxassetid://13113433091" 
	Image.Parent.Parent.Parent.Name = "House"
	TitleNumber.Value = "House"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "House".')
	end)
elseif Number.Value == 6 then
	Image.Image = "rbxassetid://13113443813" 
	Image.Parent.Parent.Parent.Name = "Quietness"
	TitleNumber.Value = "Quietness"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Quietness".')
	end)
elseif Number.Value == 7 then
	Image.Image = "rbxassetid://13113456635"
	Image.Parent.Parent.Parent.Name = "Greediness"
	TitleNumber.Value = "Greediness"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Greediness".')
	end)
elseif Number.Value == 8 then
	Image.Image = "rbxassetid://13113472639"
	Image.Parent.Parent.Parent.Name = "Unknown Painting"
	TitleNumber.Value = "Unknown Painting"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Unknown Painting".')
	end)
elseif Number.Value == 9 then
	Image.Image = "rbxassetid://13113476351"
	Image.Parent.Parent.Parent.Name = "Three Balconies"
	TitleNumber.Value = "Three Balconies"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Three Balconies".')
	end)
elseif Number.Value == 10 then
	Image.Image = "rbxassetid://13113481630"
	Image.Parent.Parent.Parent.Name = "Streetlight"
	TitleNumber.Value = "Streetlight"
	script.Parent.Parent.Parent:SetAttribute("Title")
	script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
		game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "Streetlight".')
	end)
end