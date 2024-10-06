local module = {}

function module:Open(Hidden)
	if workspace.Rooms.CurrentRoom.Value == 100 then
		for i, v in pairs(game.Players:GetPlayers()) do 
			if v.Character then 
				v.Character.Humanoid:TakeDamage(100)
			end
		end
	else
		Hidden.Touched:Connect(function()
			Hidden.Parent.KnobConstraint.TargetAngle = 45
			Hidden.Parent.Door.Anchored = false
			Hidden.Parent.Door.CanCollide = false
			Hidden.CanTouch = false
			Hidden.Parent.Door.Open:Play()
			wait(0.5)
			Hidden.Parent.KnobConstraint.TargetAngle = 0
		end)
	end
end

function module:Generate(Hidden, Start)
	
	-- ADDING CODES --
	
	local ReplicatedStoragee = game:GetService("ReplicatedStorage")
	local ReplicatedStorage = game:GetService("ServerScriptService")
	local PossibleHallways = ReplicatedStorage.Server:WaitForChild("Rooms")
	local Furnitures = ReplicatedStorage:WaitForChild("Server"):WaitForChild("Assets"):WaitForChild("Furnitures")
	local SpecialHallways = ReplicatedStorage.Server:WaitForChild("Special")
	local SeekSpecialHallway = ReplicatedStorage.Server:WaitForChild("Special"):WaitForChild("EntranceSeekRooms"):WaitForChild("4Eyeball")

	local GeneratedRooms = workspace:WaitForChild("Rooms")
	local Paintings = ReplicatedStorage:WaitForChild("Server"):WaitForChild("Assets"):WaitForChild("Paintings")
	local Items = ReplicatedStorage:WaitForChild("Server"):WaitForChild("Assets"):WaitForChild("Items"):WaitForChild("Handles")
	local RunSrevice = game:GetService('RunService')
	local prevRoom = script.Parent.Parent

	-- ROOM SETTINGS -- 

	local DarkRoomRandom = math.random(8, 13)

	
	-- GENERATOR SEEK ENTRANCE ROOMS --

	local function generateSeekEntrance(RoomNumber)
		local randomroom = SeekSpecialHallway:GetChildren()[math.random(1, #SeekSpecialHallway:GetChildren())]
		local clonedroom = randomroom:Clone()
		clonedroom.PrimaryPart = clonedroom.RoomStart
		clonedroom:PivotTo(Hidden.Parent.Parent.RoomEnd.CFrame)
		clonedroom.Name = RoomNumber
		workspace.Rooms.CurrentRoom.Value += 1
		clonedroom.Parent = GeneratedRooms
		prevRoom = clonedroom
	end
	
	-- MAIN GENERATOR OF ALL ROOMS --
	-- (generating room: Color walls, Color and texture rug, generating random furnitures, generating random paintings) --
	

	local function generateRoom(RoomNumber, Dark, Special, SpecialRoom)
		local randomroom
		if Special == true then
			randomroom = SpecialHallways:FindFirstChild("Hotel_"..SpecialRoom)
		else
			randomroom = PossibleHallways:GetChildren()[math.random(1, #PossibleHallways:GetChildren())]
		end
		if SpecialRoom == "JeffShop" then
			randomroom.ShopStuff.RadioShop.Hitbox.MusicFar:Play()
			randomroom.ShopStuff.RadioShop.Hitbox.MusicClose:Play()
		end
		local clonedroom = randomroom:Clone()
		local Type = "Hotel_"
		local DarkRoom = false

		if Dark == true then
			clonedroom.Assets:WaitForChild("Light_Fixtures"):Destroy()
			game.Workspace.Ambience_Dark:Play()
			DarkRoom = true
			if randomroom:FindFirstChild("Collid") then
				clonedroom:FindFirstChild("Collid").CanTouch = true
				local DarkBadBoi = script.Dark:Clone()
				DarkBadBoi.Enabled = true
				DarkBadBoi.Parent = clonedroom:FindFirstChild("Collid")
			end
		end

		local rolltop_point = randomroom:FindFirstChild("RolltopDeskPoint")
		local keyobtain = clonedroom:FindFirstChild("KeyObtain", true)
		local colors = clonedroom.Colors
		local randomwallcolor = math.random(1, 6)
		local randomcarpetcolor = math.random(1, 9)
		local coloratribute
		local keyatribute = false

		if rolltop_point then
			local randompoint = clonedroom.RolltopDeskPoint:GetChildren()[math.random(1, #clonedroom.RolltopDeskPoint:GetChildren())]
			local rolltop_desk = Furnitures.Rolltop_Desk:GetChildren()[math.random(1, #Furnitures.Rolltop_Desk:GetChildren())]
			local cloned = rolltop_desk:Clone()
			cloned.Name = "Rolltop_Desk"
			cloned.Parent = clonedroom.Assets
			cloned:PivotTo(randompoint.CFrame)
		end

		if keyobtain then
			keyatribute = true
		end

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

		if randomcarpetcolor == 1 then
			local Carpet = Instance.new("Color3Value")
			Carpet.Value = Color3.fromRGB(106, 79, 70)
			Carpet.Name = "Carpet"
			Carpet.Parent = colors.Carpet

			local CarpetLight = Instance.new("Color3Value")
			CarpetLight.Value = Color3.fromRGB(156, 116, 103)
			CarpetLight.Name = "CarpetLight"
			CarpetLight.Parent = colors.Carpet

			local Texture = Instance.new("Texture")
			Texture.Texture = "rbxassetid://12002739056"
			Texture.StudsPerTileU = 9
			Texture.StudsPerTileV = 9
			Texture.OffsetStudsU = 0
			Texture.OffsetStudsV = 0
			Texture.Transparency = 0.85
			Texture.Face = "Top"
			Texture.Parent = colors.Carpet
		elseif randomcarpetcolor == 2 then
			local Carpet = Instance.new("Color3Value")
			Carpet.Value = Color3.fromRGB(71, 77, 69)
			Carpet.Name = "Carpet"
			Carpet.Parent = colors.Carpet

			local CarpetLight = Instance.new("Color3Value")
			CarpetLight.Value = Color3.fromRGB(102, 117, 102)
			CarpetLight.Name = "CarpetLight"
			CarpetLight.Parent = colors.Carpet

			local Texture = Instance.new("Texture")
			Texture.Color3 = Color3.fromRGB(0, 0, 0)
			Texture.Texture = "rbxassetid://9820813087"
			Texture.StudsPerTileU = 3
			Texture.StudsPerTileV = 3
			Texture.OffsetStudsU = 0
			Texture.OffsetStudsV = 0
			Texture.Transparency = 0.88
			Texture.Face = "Top"
			Texture.Parent = colors.Carpet
		elseif randomcarpetcolor == 3 then
			local Carpet = Instance.new("Color3Value")
			Carpet.Value = Color3.fromRGB(81, 70, 61)
			Carpet.Name = "Carpet"
			Carpet.Parent = colors.Carpet

			local CarpetLight = Instance.new("Color3Value")
			CarpetLight.Value = Color3.fromRGB(77, 63, 63)
			CarpetLight.Name = "CarpetLight"
			CarpetLight.Parent = colors.Carpet

			local Texture = Instance.new("Texture")
			Texture.Color3 = Color3.fromRGB(198, 187, 162)
			Texture.Texture = "rbxassetid://849185396"
			Texture.StudsPerTileU = 6
			Texture.StudsPerTileV = 6
			Texture.OffsetStudsU = 0
			Texture.OffsetStudsV = 0
			Texture.Transparency = 0.85
			Texture.Face = "Top"
			Texture.Parent = colors.Carpet
		elseif randomcarpetcolor == 4 then
			local Carpet = Instance.new("Color3Value")
			Carpet.Value = Color3.fromRGB(79, 51, 51)
			Carpet.Name = "Carpet"
			Carpet.Parent = colors.Carpet

			local CarpetLight = Instance.new("Color3Value")
			CarpetLight.Value = Color3.fromRGB(91, 68, 73)
			CarpetLight.Name = "CarpetLight"
			CarpetLight.Parent = colors.Carpet

			local Texture = Instance.new("Texture")
			Texture.Color3 = Color3.fromRGB(255, 247, 179)
			Texture.Texture = "rbxassetid://7960579811"
			Texture.StudsPerTileU = 72
			Texture.StudsPerTileV = 72
			Texture.OffsetStudsU = 0
			Texture.OffsetStudsV = 0.5
			Texture.Transparency = 0.9
			Texture.Face = "Top"
			Texture.Parent = colors.Carpet
		elseif randomcarpetcolor == 5 then
			local Carpet = Instance.new("Color3Value")
			Carpet.Value = Color3.fromRGB(65, 63, 63)
			Carpet.Name = "Carpet"
			Carpet.Parent = colors.Carpet

			local CarpetLight = Instance.new("Color3Value")
			CarpetLight.Value = Color3.fromRGB(71, 69, 69)
			CarpetLight.Name = "CarpetLight"
			CarpetLight.Parent = colors.Carpet

			local Texture = Instance.new("Texture")
			Texture.Color3 = Color3.fromRGB(255, 255, 255)
			Texture.Texture = "rbxassetid://2062021684"
			Texture.StudsPerTileU = 10
			Texture.StudsPerTileV = 10
			Texture.OffsetStudsU = 0
			Texture.OffsetStudsV = 0.5
			Texture.Transparency = 0.97
			Texture.Face = "Top"
			Texture.Parent = colors.Carpet
		elseif randomcarpetcolor == 6 then
			local Carpet = Instance.new("Color3Value")
			Carpet.Value = Color3.fromRGB(79, 86, 77)
			Carpet.Name = "Carpet"
			Carpet.Parent = colors.Carpet

			local CarpetLight = Instance.new("Color3Value")
			CarpetLight.Value = Color3.fromRGB(95, 109, 95)
			CarpetLight.Name = "CarpetLight"
			CarpetLight.Parent = colors.Carpet

			local Texture = Instance.new("Texture")
			Texture.Color3 = Color3.fromRGB(0, 0, 0)
			Texture.Texture = "rbxassetid://3476500459"
			Texture.StudsPerTileU = 4
			Texture.StudsPerTileV = 4
			Texture.OffsetStudsU = 0
			Texture.OffsetStudsV = 0
			Texture.Transparency = 0.88
			Texture.Face = "Top"
			Texture.Parent = colors.Carpet
		elseif randomcarpetcolor == 7 then
			local Carpet = Instance.new("Color3Value")
			Carpet.Value = Color3.fromRGB(79, 51, 51)
			Carpet.Name = "Carpet"
			Carpet.Parent = colors.Carpet

			local CarpetLight = Instance.new("Color3Value")
			CarpetLight.Value = Color3.fromRGB(91, 68, 73)
			CarpetLight.Name = "CarpetLight"
			CarpetLight.Parent = colors.Carpet

			local Texture = Instance.new("Texture")
			Texture.Color3 = Color3.fromRGB(153, 148, 107)
			Texture.Texture = "rbxassetid://2279603548"
			Texture.StudsPerTileU = 15
			Texture.StudsPerTileV = 15
			Texture.OffsetStudsU = 0
			Texture.OffsetStudsV = 0.5
			Texture.Transparency = 0.93
			Texture.Face = "Top"
			Texture.Parent = colors.Carpet
		elseif randomcarpetcolor == 8 then
			local Carpet = Instance.new("Color3Value")
			Carpet.Value = Color3.fromRGB(91, 62, 71)
			Carpet.Name = "Carpet"
			Carpet.Parent = colors.Carpet

			local CarpetLight = Instance.new("Color3Value")
			CarpetLight.Value = Color3.fromRGB(72, 74, 83)
			CarpetLight.Name = "CarpetLight"
			CarpetLight.Parent = colors.Carpet

			local Texture = Instance.new("Texture")
			Texture.Color3 = Color3.fromRGB(255, 255, 255)
			Texture.Texture = "rbxassetid://2535177972"
			Texture.StudsPerTileU = 10
			Texture.StudsPerTileV = 10
			Texture.OffsetStudsU = 0
			Texture.OffsetStudsV = 0.5
			Texture.Transparency = 0.6
			Texture.Face = "Top"
			Texture.Parent = colors.Carpet
		elseif randomcarpetcolor == 9 then
			local Carpet = Instance.new("Color3Value")
			Carpet.Value = Color3.fromRGB(77, 63, 63)
			Carpet.Name = "Carpet"
			Carpet.Parent = colors.Carpet

			local CarpetLight = Instance.new("Color3Value")
			CarpetLight.Value = Color3.fromRGB(102, 83, 83)
			CarpetLight.Name = "CarpetLight"
			CarpetLight.Parent = colors.Carpet

			local Texture = Instance.new("Texture")
			Texture.Color3 = Color3.fromRGB(0, 0, 0)
			Texture.Texture = "rbxassetid://273619459"
			Texture.StudsPerTileU = 18
			Texture.StudsPerTileV = 15
			Texture.OffsetStudsU = 0
			Texture.OffsetStudsV = 0
			Texture.Transparency = 0.85
			Texture.Face = "Top"
			Texture.Parent = colors.Carpet
		end

		clonedroom.PrimaryPart = clonedroom.RoomStart
		if Hidden.Parent.Parent:FindFirstChild("RoomEnd") then
			clonedroom:PivotTo(Hidden.Parent.Parent.RoomEnd.CFrame)
		else
			clonedroom:PivotTo(Hidden.Parent.Parent.RoomStart.CFrame)
		end
		clonedroom.Name = RoomNumber
		workspace.Rooms.CurrentRoom.Value += 1
		clonedroom.Parent = GeneratedRooms
		prevRoom = clonedroom

		clonedroom:SetAttribute("ColorAmbient", coloratribute)
		clonedroom:SetAttribute("RoomNumber", workspace.Rooms.CurrentRoom.Value -1)
		clonedroom:SetAttribute("KeyRequire", keyatribute)
		clonedroom:SetAttribute("Dark", DarkRoom)
		clonedroom:SetAttribute(Type, true)
		
		if clonedroom:FindFirstChild("PaintingPoint") then
			for i, v in pairs(clonedroom:WaitForChild("PaintingPoint"):GetChildren()) do
				local addPainting = math.random(1, 6) 

				if addPainting < 3 then
					local Painting = Paintings:WaitForChild("Painting_Small"):Clone()
					Painting.Parent = Hidden.Parent.Parent:WaitForChild("Assets")
					Painting.Canvas.SurfaceGui.Script.Enabled = true
					Painting:PivotTo(v.CFrame)
				elseif addPainting < 4 then
					local Painting = Paintings:WaitForChild("Painting_Tall"):Clone()
					Painting.Parent = Hidden.Parent.Parent:WaitForChild("Assets")
					Painting.Canvas.SurfaceGui.Script.Enabled = true
					Painting:PivotTo(v.CFrame)
				elseif addPainting < 6 then
					local Painting = Paintings:WaitForChild("Painting_VeryBig"):Clone()
					Painting.Parent = Hidden.Parent.Parent:WaitForChild("Assets")
					Painting.Canvas.SurfaceGui.Script.Enabled = true
					Painting:PivotTo(v.CFrame)
				end
			end
		else
			return
		end

		local keyspawned = false
		
		if clonedroom:FindFirstChild("FurniturePoint") then
			for i, v in pairs(clonedroom:WaitForChild("FurniturePoint"):GetChildren()) do
				local addFurniture = math.random(1, 200) 

				if addFurniture < 25 then
					local Dresser = Furnitures:WaitForChild("TableObtain"):Clone()
					Dresser.Name = "Table"
					Dresser.Parent = clonedroom:WaitForChild("Assets")
					Dresser:PivotTo(v.CFrame)

					if keyobtain then
						if keyspawned == false then
							keyspawned = true
							keyobtain:PivotTo(Dresser:FindFirstChild("MainObtain").CFrame)
						end
					end
				elseif addFurniture < 50 then
					local Dresser = Furnitures:WaitForChild("DresserObtain"):Clone()
					Dresser.Name = "Dresser"
					Dresser.Parent = clonedroom:WaitForChild("Assets")
					Dresser:PivotTo(v.CFrame)

					if keyobtain then
						if keyspawned == false then
							keyspawned = true
							keyobtain:PivotTo(Dresser:FindFirstChild("MainObtain").CFrame)
						end
					end
				elseif addFurniture < 75 then
					local Dresser = Furnitures:WaitForChild("Table"):Clone()
					Dresser.Name = "Table"
					Dresser.Parent = clonedroom:WaitForChild("Assets")
					Dresser:PivotTo(v.CFrame)

					if keyobtain then
						if keyspawned == false then
							keyspawned = true
							keyobtain:PivotTo(Dresser:FindFirstChild("MainObtain").CFrame)
						end
					end
				elseif addFurniture < 100 then
					local Dresser = Furnitures:WaitForChild("ExcelentTable"):Clone()
					Dresser.Name = "Table"
					Dresser.Parent = clonedroom:WaitForChild("Assets")
					Dresser:PivotTo(v.CFrame)
				elseif addFurniture < 110 then
					local Dresser = Furnitures:WaitForChild("TableObtain1"):Clone()
					Dresser.Name = "Table"
					Dresser.Parent = clonedroom:WaitForChild("Assets")
					Dresser:PivotTo(v.CFrame)
				elseif addFurniture < 120 then
					local Dresser = Furnitures:WaitForChild("TableObtain1_1"):Clone()
					Dresser.Name = "Table"
					Dresser.Parent = clonedroom:WaitForChild("Assets")
					Dresser:PivotTo(v.CFrame)
				elseif addFurniture < 130 then
					local Dresser = Furnitures:WaitForChild("TableObtain1_2"):Clone()
					Dresser.Name = "Table"
					Dresser.Parent = clonedroom:WaitForChild("Assets")
					Dresser:PivotTo(v.CFrame)
				elseif addFurniture < 140 then
					local Dresser = Furnitures:WaitForChild("TableObtain1_3"):Clone()
					Dresser.Name = "Table"
					Dresser.Parent = clonedroom:WaitForChild("Assets")
					Dresser:PivotTo(v.CFrame)
				elseif addFurniture < 150 then
					local Dresser = Furnitures:WaitForChild("TableObtain1_4"):Clone()
					Dresser.Name = "Dresser"
					Dresser.Parent = clonedroom:WaitForChild("Assets")
					Dresser:PivotTo(v.CFrame)
				elseif addFurniture < 155 then
					local Dresser = Furnitures:WaitForChild("TableObtain2_1"):Clone()
					Dresser.Name = "Dresser"
					Dresser.Parent = clonedroom:WaitForChild("Assets")
					Dresser:PivotTo(v.CFrame)
				elseif addFurniture < 158 then
					local Dresser = Furnitures:WaitForChild("TableObtain2_2"):Clone()
					Dresser.Name = "Dresser"
					Dresser.Parent = clonedroom:WaitForChild("Assets")
					Dresser:PivotTo(v.CFrame)
				elseif addFurniture < 160 then
					local Dresser = Furnitures:WaitForChild("TableObtain2_3"):Clone()
					Dresser.Name = "Dresser"
					Dresser.Parent = clonedroom:WaitForChild("Assets")
					Dresser:PivotTo(v.CFrame)
				elseif addFurniture < 161 then
					local Dresser = Furnitures:WaitForChild("TableObtain2_4"):Clone()
					Dresser.Name = "Dresser"
					Dresser.Parent = clonedroom:WaitForChild("Assets")
					Dresser:PivotTo(v.CFrame)
				elseif addFurniture < 165 then
					local Dresser = Furnitures:WaitForChild("DresserObtain1_1"):Clone()
					Dresser.Name = "Dresser"
					Dresser.Parent = clonedroom:WaitForChild("Assets")
					Dresser:PivotTo(v.CFrame)
				elseif addFurniture < 175 then
					local Dresser = Furnitures:WaitForChild("DresserObtain1_2"):Clone()
					Dresser.Name = "Dresser"
					Dresser.Parent = clonedroom:WaitForChild("Assets")
					Dresser:PivotTo(v.CFrame)
				else
					return
				end
			end
		end
	end

	local generatedrooms = {prevRoom}

	Hidden.Touched:Connect(function(roomNum)
		if workspace.Rooms.CurrentRoom.Value == game:GetService("Workspace").Rooms:GetAttribute("SeekRoom") then
			generateSeekEntrance(game.Workspace.Rooms.CurrentRoom.Value)
			Hidden.CanTouch = false
		elseif workspace.Rooms.CurrentRoom.Value == 49 then
			generateRoom(game.Workspace.Rooms.CurrentRoom.Value, false, true, "PreFigureRoom")
			Hidden.CanTouch = false
		elseif workspace.Rooms.CurrentRoom.Value == game.Workspace.Rooms:GetAttribute("LookmanRoom") then
			generateRoom(game.Workspace.Rooms.CurrentRoom.Value)
			Hidden.CanTouch = false 
		elseif workspace.Rooms.CurrentRoom.Value == game.Workspace.Rooms:GetAttribute("JackRoom") then
			generateRoom(game.Workspace.Rooms.CurrentRoom.Value)
			Hidden.CanTouch = false 
		elseif workspace.Rooms.CurrentRoom.Value == game.Workspace.Rooms:GetAttribute("NextDarkRoom") then
			generateRoom(game.Workspace.Rooms.CurrentRoom.Value, true)
			Hidden.CanTouch = false	
		elseif workspace.Rooms.CurrentRoom.Value == 52 then
			generateRoom(game.Workspace.Rooms.CurrentRoom.Value, false, true, "JeffShop")
			Hidden.CanTouch = false
		elseif workspace.Rooms.CurrentRoom.Value == 99 then
			generateRoom(game.Workspace.Rooms.CurrentRoom.Value, false, true, "Bayourd")
			Hidden.CanTouch = false
		elseif workspace.Rooms.CurrentRoom.Value == game:GetService("Workspace").Rooms:GetAttribute("CourtyardRoom") then
			generateRoom(game.Workspace.Rooms.CurrentRoom.Value, false, true, "Courtyard")
			Hidden.CanTouch = false
		else
			generateRoom(game.Workspace.Rooms.CurrentRoom.Value)
			Hidden.CanTouch = false
		end
	end)
	
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
			moveToOnDeletedDoors(cur)

			for _, roomNum in ipairs({cur1, cur2, cur3, cur4}) do
				local room = game.Workspace.Rooms:FindFirstChild(tostring(roomNum))
				if room then
					room:Destroy()
					moveToOnDeletedDoors(roomNum)
				end
			end

			wait(.1)
			game.Workspace.Rooms.CurrentRoom.Door.Value += 1
			game.Workspace.Rooms.CurrentRoom.Door.DoorAlt.Value += 1
		end
	end
end

function module:OpenLock(Hidden)
	while true do
		wait(0.01)
		if Hidden:GetAttribute("Locked") == true then
			return
		else
			module:Open(Hidden)
			module:Generate(Hidden)
		end
	end
end

return module