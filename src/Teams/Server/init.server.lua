game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(c)
		c.Humanoid:SetAttribute("SpeedBoost", 0)
		c.Humanoid:SetAttribute("SpeedBoostExtra", 0)
		c.Humanoid:SetAttribute("SpeedBoostBehind", 0)
	end)
end)

local DarkRoomRandom = math.random(8, 13)
local JackRoomRandom = math.random(5, 23)
local SeekRoomRandom = math.random(25, 35)
local LookmanRoomRandom = math.random(6, 15)
local CourtyardRoomRandom = math.random(65, 75)

local DarkRoomRandomNumber = DarkRoomRandom + 1

local SeekRoomMain = SeekRoomRandom + 3

local OnDeletedDoors = Instance.new("Folder")
OnDeletedDoors.Parent = workspace
OnDeletedDoors.Name = "OnDeletedDoors"

local Thing = Instance.new("Folder")
Thing.Parent = workspace
Thing.Name = "Things"

local Rooms = game.Workspace.Rooms
Rooms:SetAttribute("CourtyardRoom", CourtyardRoomRandom)
Rooms:SetAttribute("SeekRoom", SeekRoomRandom)

Rooms:SetAttribute("Difficulty", 1)
Rooms:SetAttribute("SeekRoomMain", SeekRoomMain)
Rooms:SetAttribute("NextDarkRoom", DarkRoomRandom)
Rooms:SetAttribute("JackRoom", JackRoomRandom)
Rooms:SetAttribute("LookmanRoom", LookmanRoomRandom)

Rooms:SetAttribute("DarkActived", false)
Rooms:SetAttribute("RoomDespawn", 0)
Rooms:SetAttribute("SeekMode", false)

local Room = workspace.Rooms:FindFirstChild("0")
local randomwallcolor = math.random(1, 6)
local coloratribute
local keyatribute = false
local Type = "Hotel_"
local Dark = false
local colors = Room.Colors

--local Keycrept = script.Scripts.UnlockPrompt:Clone()
--Keycrept.Enabled = true
--Keycrept.Parent = Room.Lock.UnlockPrompt
--Keycrept.Name = "AssetControl"

if randomwallcolor == 1 then
	local color = Instance.new("Color3Value")
	color.Value = Color3.fromRGB(109, 70, 70)
	color.Name = "color"
	color.Parent = colors.Wall
	colors.Wall.colortrue.Value = true
	coloratribute = Color3.fromRGB(109, 70, 70)
elseif randomwallcolor == 2 then
	local color = Instance.new("Color3Value")
	color.Value = Color3.fromRGB(89, 116, 117)
	color.Name = "color"
	color.Parent = colors.Wall
	colors.Wall.colortrue.Value = true
	coloratribute = Color3.fromRGB(89, 116, 117)
elseif randomwallcolor == 3 then
	local color = Instance.new("Color3Value")
	color.Value = Color3.fromRGB(69, 81, 109)
	color.Name = "color"
	color.Parent = colors.Wall
	colors.Wall.colortrue.Value = true
	coloratribute = Color3.fromRGB(69, 81, 109)
elseif randomwallcolor == 4 then
	local color = Instance.new("Color3Value")
	color.Value = Color3.fromRGB(76, 109, 91)
	color.Name = "color"
	color.Parent = colors.Wall
	colors.Wall.colortrue.Value = true
	coloratribute = Color3.fromRGB(76, 109, 91)
elseif randomwallcolor == 5 then
	local color = Instance.new("Color3Value")
	color.Value = Color3.fromRGB(134, 116, 95)
	color.Name = "color"
	color.Parent = colors.Wall
	colors.Wall.colortrue.Value = true
	coloratribute = Color3.fromRGB(134, 116, 95)
elseif randomwallcolor == 6 then
	local color = Instance.new("Color3Value")
	color.Value = Color3.fromRGB(72, 88, 125)
	color.Name = "color"
	color.Parent = colors
	colors.Wall.colortrue.Value = true
	coloratribute = Color3.fromRGB(72, 88, 125)
end

Room:SetAttribute("ColorAmbient", coloratribute)
Room:SetAttribute("RoomNumber", workspace.Rooms.CurrentRoom.Value -1)
Room:SetAttribute("KeyRequire", keyatribute)
Room:SetAttribute("Dark", Dark)
Room:SetAttribute(Type, true)

while true do
	wait(1)
	
	local DarkRoomRandom1 = math.random(13, 26)
	local DarkRoomRandom2 = math.random(27, 43)
	local DarkRoomRandom3 = math.random(44, 67)
	local DarkRoomRandom4 = math.random(68, 71)
	local DarkRoomRandom5 = math.random(73, 78)
	local DarkRoomRandom6 = math.random(80, 85)
	local DarkRoomRandom7 = math.random(88, 93)
	local DarkRoomRandom8 = math.random(94, 98)
	
	DarkRoomRandom1 = DarkRoomRandom1 + 1
	DarkRoomRandom2 = DarkRoomRandom2 + 1
	DarkRoomRandom3 = DarkRoomRandom3 + 1
	DarkRoomRandom4 = DarkRoomRandom4 + 1
	DarkRoomRandom5 = DarkRoomRandom5 + 1
	DarkRoomRandom6 = DarkRoomRandom6 + 1
	DarkRoomRandom7 = DarkRoomRandom7 + 1
	DarkRoomRandom8 = DarkRoomRandom8 + 1
	
	if game.Workspace.Rooms.CurrentRoom.Value == DarkRoomRandomNumber then
		Rooms:SetAttribute("NextDarkRoom", DarkRoomRandom1)
	elseif game.Workspace.Rooms.CurrentRoom.Value == DarkRoomRandom1 then
		Rooms:SetAttribute("NextDarkRoom", DarkRoomRandom2)
	elseif game.Workspace.Rooms.CurrentRoom.Value == DarkRoomRandom2 then
		Rooms:SetAttribute("NextDarkRoom", DarkRoomRandom3)
	elseif game.Workspace.Rooms.CurrentRoom.Value == DarkRoomRandom3 then
		Rooms:SetAttribute("NextDarkRoom", DarkRoomRandom4)
	elseif game.Workspace.Rooms.CurrentRoom.Value == DarkRoomRandom4 then
		Rooms:SetAttribute("NextDarkRoom", DarkRoomRandom5)
	elseif game.Workspace.Rooms.CurrentRoom.Value == DarkRoomRandom5 then
		Rooms:SetAttribute("NextDarkRoom", DarkRoomRandom6)
	elseif game.Workspace.Rooms.CurrentRoom.Value == DarkRoomRandom6 then
		Rooms:SetAttribute("NextDarkRoom", DarkRoomRandom7)
	elseif game.Workspace.Rooms.CurrentRoom.Value == DarkRoomRandom7 then
		Rooms:SetAttribute("NextDarkRoom", DarkRoomRandom8)
	end
end