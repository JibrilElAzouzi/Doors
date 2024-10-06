local ReplicatedStoragee = game:GetService("ReplicatedStorage")
local ReplicatedStorage = game:GetService("ServerScriptService")
local PossibleHallways = ReplicatedStorage.Server:WaitForChild("Rooms")
local SpecialHallways = ReplicatedStorage.Server:WaitForChild("Special")
local SeekSpecialHallway = ReplicatedStorage.Server:WaitForChild("Special")

local GeneratedRooms = workspace:WaitForChild("Rooms")
local Paintings = ReplicatedStorage:WaitForChild("Server"):WaitForChild("Assets"):WaitForChild("Paintings")
local Furnitures = ReplicatedStorage:WaitForChild("Server"):WaitForChild("Assets"):WaitForChild("Furnitures")
local Items = ReplicatedStorage:WaitForChild("Server"):WaitForChild("Assets"):WaitForChild("Items"):WaitForChild("Handles")
local RunSrevice = game:GetService('RunService')
prevRoom = script.Parent.Parent

-- ROOM SETTINGS -- 

local DarkRoomRandom = math.random(11, 20)

-- GENERATOR SCRIPT --

function generateRoom(RoomNumber) -- Function Generator Rooms
	local randomroom = SpecialHallways.Hotel_NextInFigureLibrary
	local clonedroom = randomroom:Clone()
	local colors = clonedroom.Colors
	local randomwallcolor = math.random(1, 7)
	--local randomclearcarpet = math.random(1, 5)

	if randomwallcolor == 1 then
		local color = Instance.new("Color3Value")
		color.Value = Color3.fromRGB(109, 70, 70)
		color.Name = "color"
		color.Parent = colors.Wall
		colors.Wall.colortrue.Value = true
	elseif randomwallcolor == 2 then
		local color = Instance.new("Color3Value")
		color.Value = Color3.fromRGB(89, 116, 117)
		color.Name = "color"
		color.Parent = colors.Wall
		colors.Wall.colortrue.Value = true
	elseif randomwallcolor == 3 then
		local color = Instance.new("Color3Value")
		color.Value = Color3.fromRGB(69, 81, 109)
		color.Name = "color"
		color.Parent = colors.Wall
		colors.Wall.colortrue.Value = true
	elseif randomwallcolor == 4 then
		local color = Instance.new("Color3Value")
		color.Value = Color3.fromRGB(76, 109, 91)
		color.Name = "color"
		color.Parent = colors.Wall
		colors.Wall.colortrue.Value = true
	elseif randomwallcolor == 5 then
		local color = Instance.new("Color3Value")
		color.Value = Color3.fromRGB(134, 116, 95)
		color.Name = "color"
		color.Parent = colors.Wall
		colors.Wall.colortrue.Value = true
	elseif randomwallcolor == 6 then
		local color = Instance.new("Color3Value")
		color.Value = Color3.fromRGB(72, 88, 125)
		color.Name = "color"
		color.Parent = colors
		colors.Wall.colortrue.Value = true
	end

	--if randomclearcarpet == 5 then
	--	clonedroom.Assets:WaitForChild("Rug"):Destroy()
	--end

	clonedroom.PrimaryPart = clonedroom.RoomStart -- Clone room get a Primaty part
	clonedroom:PivotTo(script.Parent.Parent.RoomEnd.CFrame) -- Cloned room moving to generate part
	clonedroom.Name = RoomNumber  -- Changing name to Current room
	workspace.Rooms.CurrentRoom.Value += 1
	clonedroom.Parent = GeneratedRooms -- Parent to Rooms
	prevRoom = clonedroom -- Prev room this Cloned Room
end

local generatedrooms = {prevRoom}

generateRoom(game.Workspace.Rooms.CurrentRoom.Value)

local currentRoomValue = game.Workspace.Rooms.CurrentRoom.Value
if currentRoomValue >= 4 then
	local cur = game.Workspace.Rooms.CurrentRoom.Despawn.Value
	local cur1 = cur - 1
	local cur2 = cur - 2
	local cur3 = cur - 3
	local cur4 = cur - 4
	local g = currentRoomValue - 5

	if game.Workspace.Rooms:FindFirstChild(tostring(g)) then
		game.Workspace.Rooms.CurrentRoom.Despawn.Value = g + 1

		local curRoom = game.Workspace.Rooms:FindFirstChild(tostring(cur))

		-- Function to move the door to OnDeletedDoors
		local function moveToOnDeletedDoors(roomNum)
			local roomNumOld = roomNum - 1
			local door = curRoom:FindFirstChild("Door")
			if door then
				door.Name = "Door"..roomNum
				door.Parent = game.Workspace.OnDeletedDoors
				door.HingeConstraint.TargetAngle = 0
				door.HingeConstraint.ServoMaxTorque = 255565
				door.Collicion.CanCollide = true
				if game.Workspace.OnDeletedDoors:FindFirstChild("Door"..roomNumOld) then
					game.Workspace.OnDeletedDoors:FindFirstChild("Door"..roomNumOld):Destroy()
				end
			end
		end

		-- Move the current room's door to OnDeletedDoors
		moveToOnDeletedDoors(cur)

		-- Destroy the current room and previous rooms
		for _, roomNum in ipairs({cur1, cur2, cur3, cur4}) do
			local room = game.Workspace.Rooms:FindFirstChild(tostring(roomNum))
			if room then
					--[[local door = room:FindFirstChild("Door")
					if door then
						door:Destroy()
					end--]]
				room:Destroy()
				moveToOnDeletedDoors(roomNum)
			end
		end

		wait(.1)
		game.Workspace.Rooms.CurrentRoom.Door.Value += 1
		game.Workspace.Rooms.CurrentRoom.Door.DoorAlt.Value += 1
	end
end