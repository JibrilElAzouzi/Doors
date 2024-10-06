local ReplicatedStoragee = game:GetService("ReplicatedStorage")
local ReplicatedStorage = game:GetService("ServerScriptService")
local PossibleHallways = ReplicatedStorage.Server:WaitForChild("Rooms")
local SpecialHallways = ReplicatedStorage.Server:WaitForChild("Special")
local SeekSpecialHallway = ReplicatedStorage.Server:WaitForChild("Special"):WaitForChild("EntranceSeekRooms"):WaitForChild("4Eyeball")

local GeneratedRooms = workspace:WaitForChild("Rooms")
local Paintings = ReplicatedStorage:WaitForChild("Server"):WaitForChild("Assets"):WaitForChild("Paintings")
local Furnitures = ReplicatedStorage:WaitForChild("Server"):WaitForChild("Assets"):WaitForChild("Furnitures")
local Items = ReplicatedStorage:WaitForChild("Server"):WaitForChild("Assets"):WaitForChild("Items"):WaitForChild("Handles")
local RunSrevice = game:GetService('RunService')
prevRoom = script.Parent.Parent

-- ROOM SETTINGS -- 

local DarkRoomRandom = math.random(8, 48)

-- GENERATOR SCRIPT --

function generateCourtyardEntrance(RoomNumber) -- Function Generator Seek Entrance Room
	local randomroom = SpecialHallways.Hotel_Courtyard
	local clonedroom = randomroom:Clone()
	clonedroom.PrimaryPart = clonedroom.RoomStart -- Clone room get a Primaty part
	clonedroom:PivotTo(script.Parent.Parent.Parent.RoomEnd.CFrame) -- Cloned room moving to generate part
	clonedroom.Name = RoomNumber -- Changing name to Current room
	workspace.Rooms.CurrentRoom.Value += 1
	clonedroom.Parent = GeneratedRooms -- Parent to Rooms
	prevRoom = clonedroom -- Prev room this Cloned Room
end

function generateSeekEntrance(RoomNumber) -- Function Generator Seek Entrance Room
	local randomroom = SeekSpecialHallway:GetChildren()[math.random(1, #SeekSpecialHallway:GetChildren())]
	local clonedroom = randomroom:Clone()
	clonedroom.PrimaryPart = clonedroom.RoomStart -- Clone room get a Primaty part
	clonedroom:PivotTo(script.Parent.Parent.Parent.RoomEnd.CFrame) -- Cloned room moving to generate part
	clonedroom.Name = RoomNumber -- Changing name to Current room
	workspace.Rooms.CurrentRoom.Value += 1
	clonedroom.Parent = GeneratedRooms -- Parent to Rooms
	prevRoom = clonedroom -- Prev room this Cloned Room
end

function generateDarkRoom(RoomNumber) -- Function Generator Dark Rooms
	local randomroom = PossibleHallways:GetChildren()[math.random(1, #PossibleHallways:GetChildren())]
	local clonedroom = randomroom:Clone()
	clonedroom.Assets:WaitForChild("Light_Fixtures"):Destroy()
	game.Workspace.Ambience_Dark:Play()
	clonedroom.PrimaryPart = clonedroom.RoomStart -- Clone room get a Primaty part
	clonedroom:PivotTo(script.Parent.Parent.Parent.RoomEnd.CFrame) -- Cloned room moving to generate part
	clonedroom.Name = RoomNumber -- Changing name to Current room
	workspace.Rooms.CurrentRoom.Value += 1
	clonedroom.Parent = GeneratedRooms -- Parent to Rooms
	prevRoom = clonedroom -- Prev room this Cloned Room
	
	for i, v in pairs(clonedroom:WaitForChild("PaintingPoint"):GetChildren()) do
		local addPainting = math.random(1, 5) 

		if addPainting < 3 then
			local Painting = Paintings:WaitForChild("Painting_Small"):Clone()
			Painting.Parent = script.Parent.Parent.Parent:WaitForChild("Paintings")
			Painting.Canvas.SurfaceGui.Script.Enabled = true
			Painting:PivotTo(v.CFrame)
		elseif addPainting < 4 then
			local Painting = Paintings:WaitForChild("Painting_Tall"):Clone()
			Painting.Parent = script.Parent.Parent.Parent:WaitForChild("Paintings")
			Painting.Canvas.SurfaceGui.Script.Enabled = true
			Painting:PivotTo(v.CFrame)
		end
	end

	for i, v in pairs(clonedroom:WaitForChild("FurniturePoint"):GetChildren()) do
		local addFurniture = math.random(1, 180) 

		if addFurniture < 40 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("Dresser"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 45 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("DresserFine"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 50 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("DresserGood"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 70 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("DresserObtainNoLoot"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 74 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("DresserTableFine"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 79 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("DresserTableGood"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 100 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("DresserTableNoLoot"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 105 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("DresserTableTiny"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 110 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("DresserTiny"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 111 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("TableBest"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 115 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("TableGood"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 140 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("TableNoLoot"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 143 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("TableOkay"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 180 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("TableWholeNoLoot"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		end
	end
end

function generateFigureLibrary(RoomNumber) -- Function Generator Room 50 - Figure boss
	local randomroom = SpecialHallways.Hotel_FigureLibrary
	local clonedroom = randomroom:Clone()

	clonedroom.PrimaryPart = clonedroom.RoomStart -- Clone room get a Primaty part
	clonedroom:PivotTo(script.Parent.Parent.Parent.RoomEnd.CFrame) -- Cloned room moving to generate part
	workspace.Rooms.CurrentRoom.Value += 1
	clonedroom.Parent = GeneratedRooms -- Parent to Rooms
	prevRoom = clonedroom -- Prev room this Cloned Room
end

function generateRoom(RoomNumber) -- Function Generator Rooms
	local randomroom = PossibleHallways:GetChildren()[math.random(1, #PossibleHallways:GetChildren())]
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
	clonedroom:PivotTo(script.Parent.Parent.Parent.RoomEnd.CFrame) -- Cloned room moving to generate part
	clonedroom.Name = RoomNumber  -- Changing name to Current room
	workspace.Rooms.CurrentRoom.Value += 1
	clonedroom.Parent = GeneratedRooms -- Parent to Rooms
	prevRoom = clonedroom -- Prev room this Cloned Room

	for i, v in pairs(clonedroom:WaitForChild("PaintingPoint"):GetChildren()) do
		local addPainting = math.random(1, 5) 
		
		if addPainting < 3 then
			local Painting = Paintings:WaitForChild("Painting_Small"):Clone()
			Painting.Parent = script.Parent.Parent.Parent:WaitForChild("Paintings")
			Painting.Canvas.SurfaceGui.Script.Enabled = true
			Painting:PivotTo(v.CFrame)
		elseif addPainting < 4 then
			local Painting = Paintings:WaitForChild("Painting_Tall"):Clone()
			Painting.Parent = script.Parent.Parent.Parent:WaitForChild("Paintings")
			Painting.Canvas.SurfaceGui.Script.Enabled = true
			Painting:PivotTo(v.CFrame)
		end
	end

	for i, v in pairs(clonedroom:WaitForChild("FurniturePoint"):GetChildren()) do
		local addFurniture = math.random(1, 180) 
		
		if addFurniture < 40 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("Dresser"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif clonedroom.Key == true then
			local Dresser = Furnitures:WaitForChild("TableWithKey"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 45 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("DresserFine"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 50 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("DresserGood"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 70 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("DresserObtainNoLoot"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 75 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("DresserTableFine"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 80 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("DresserTableGood"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 100 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("DresserTableNoLoot"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 105 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("DresserTableTiny"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 110 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("DresserTiny"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 115 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("TableBest"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 120 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("TableGood"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 140 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("TableNoLoot"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 145 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("TableOkay"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		elseif addFurniture < 180 then -- Random to spawn
			local Dresser = Furnitures:WaitForChild("TableWholeNoLoot"):Clone()
			Dresser.Name = "Dresser"
			Dresser.Parent = clonedroom:WaitForChild("Furnitures")
			Dresser:PivotTo(v.CFrame)
		end
	end
end
local generatedrooms = {prevRoom}

script.Parent.Touched:Connect(function(roomNum)
		generateRoom(game.Workspace.Rooms.CurrentRoom.Value)
		script.Parent.CanTouch = false
end)

--[[if workspace.Rooms.CurrentRoom.Value == 4 then
	local latectroom = workspace.Rooms.CurrentRoom.Value - 1
	
	workspace.Rooms:WaitForChild("Start").Collid.Touched:Connect(function(player)
		player:PivotTo(workspace.Rooms:WaitForChild(latectroom).Door.Door.CFrame)
	end)
	wait(0.1)
	workspace.Rooms:WaitForChild("Start").Door.Name = "DoorStart"
	workspace.Rooms:WaitForChild("Start").DoorStart.Parent = workspace.OnDeletedDoors
	workspace:WaitForChild("DoorStart").HingeConstraint.TargetAngle = 0
	wait(3)
	workspace.Rooms:WaitForChild("Start"):Destroy()
end--]]

local currentRoomValue = game.Workspace.Rooms.CurrentRoom.Value
if currentRoomValue >= 4 then
	local cur = game.Workspace.Rooms.CurrentRoom.Despawn.Value
	local cur1 = cur - 1
	local cur2 = cur - 2
	local cur3 = cur - 3
	local cur4 = cur - 4
	local g = currentRoomValue - 5 --4

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