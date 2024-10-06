local randomPainting = math.random(1, 10)
local Image = script.Parent.ImageLabel
local Number = Instance.new("NumberValue")
Number.Value = randomPainting
Number.Parent = script.Parent

script.Parent.Parent.Parent.InteractPrompt.Triggered:Connect(function(plr)
	game.ReplicatedStorage.Bricks.Caption:FireClient(plr, 'This painting is titled "".')
end)

if Number.Value == 1 then
	Image.Image = "rbxassetid://10500853479"
	Image.Parent.Parent.Parent.Name = "Unfathomable"
elseif Number.Value == 2 then
	Image.Image = "rbxassetid://13114548841"
	Image.Parent.Parent.Parent.Name = "This Is Not A Violin"
elseif Number.Value == 3 then
	Image.Image = "rbxassetid://13114575301"
	Image.Parent.Parent.Parent.Name = "Deepness"
elseif Number.Value == 4 then
	Image.Image = "rbxassetid://13114582360"
	Image.Parent.Parent.Parent.Name = "Captain Jack"
elseif Number.Value == 5 then
	Image.Image = "rbxassetid://13114586302" 
	Image.Parent.Parent.Parent.Name = "Station"
elseif Number.Value == 6 then
	Image.Image = "rbxassetid://13114590522" 
	Image.Parent.Parent.Parent.Name = "Terminal"
elseif Number.Value == 7 then
	Image.Image = "rbxassetid://13114595794"
	Image.Parent.Parent.Parent.Name = "Field"
elseif Number.Value == 8 then
	Image.Image = "rbxassetid://13114604765"
	Image.Parent.Parent.Parent.Name = "Mona Thump"
elseif Number.Value == 9 then
	Image.Image = "rbxassetid://13114613583"
	Image.Parent.Parent.Parent.Name = "Late For Work"
elseif Number.Value == 10 then
	Image.Image = "rbxassetid://13114621368"
	Image.Parent.Parent.Parent.Name = "Alley"
end