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
prevRoom = script.Parent.Parent

-- ROOM SETTINGS -- 

local DarkRoomRandom = math.random(8, 13)

-- GENERATOR SCRIPT --

function GameEntity(boolen1, boolen2)
	local folder = Instance.new("Folder")
	folder.Parent = workspace
	folder.Name = "Entities"
	
	folder:SetAttribute("CustomEntity", boolen1)
	folder:SetAttribute("GameEntity", boolen2)
end

function spawnEntity(entity)
	if entity == "Entities_Rush" then
		GameEntity(false, true)
		task.wait()
		local gamecode = game.Workspace.Rooms.CurrentRoom.Value - 3
		local rushcloned = game.ServerScriptService.Server.Assets.Entities.Rush:Clone()
		if workspace:FindFirstChild("Entities", true) then
			rushcloned.Parent = workspace:FindFirstChild("Entities", true)
		end
		rushcloned:PivotTo(game.Workspace.Rooms:FindFirstChild(gamecode).RoomStart.CFrame)

		rushcloned:SetAttribute("Entities_Rush", true)
		wait(3)
		rushcloned.AdToEnabled.Enabled = true
	end
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

function generateFigureLibrary(RoomNumber) -- Function Generator Room 50 - Figure boss
	local randomroom = SpecialHallways.Hotel_PreFigureRoom
	local clonedroom = randomroom:Clone()

	clonedroom.PrimaryPart = clonedroom.RoomStart -- Clone room get a Primaty part
	clonedroom:PivotTo(script.Parent.Parent.Parent.RoomEnd.CFrame) -- Cloned room moving to generate part
	clonedroom.Name = workspace.Rooms.CurrentRoom.Value
	workspace.Rooms.CurrentRoom.Value += 1
	clonedroom.Setting.Generation.Enabled = true
	clonedroom.Parent = GeneratedRooms -- Parent to Rooms
	prevRoom = clonedroom -- Prev room this Cloned Room
end

local generatedrooms = {prevRoom}

local Music = game.SoundService.Main:FindFirstChild("ChaseInSession")
local l__TweenService__1 = game:GetService("TweenService");

local requd = require(game.ServerScriptService.Game.RoomGeneration)
requd:Open(script.Parent)
requd:Generate(script.Parent)

script.Parent.Touched:Connect(function(hit)
	for i, v in pairs(game.Players:GetPlayers()) do
		if v.Character then
			v.Character.Humanoid:SetAttribute("SpeedBoostBehind", 0)
			v.Character.Humanoid:SetAttribute("SpeedBoost", 0)
			v.Character.Humanoid:SetAttribute("SpeedBoostExtra", 0)
			game.ReplicatedStorage.Bricks.ChangeModuleVariable:FireClient(v, "hideplayers", 0)
			game.ReplicatedStorage.Bricks.ChangeModuleVariable:FireClient(v, "chase", false)
		end
	end
	local Parent = hit.Parent

	Music.TimePosition = 92.5
	l__TweenService__1:Create(game:GetService("Lighting"), TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
		Ambient = Color3.new(0, 0, 0)
	}):Play();
	script.Parent.Parent.Door.LightAttach:Destroy()
	script.Parent.CanTouch = false
	wait(6)
	script.Parent.Parent.HingeConstraint.ServoMaxTorque = 7000
	script.Parent.Parent.HingeConstraint.TargetAngle = 0
	wait(3)
	if hit.Parent:FindFirstChild("Humanoid") then
		local player = game.Players:GetPlayerFromCharacter(hit.Parent)
		if not game:GetService("BadgeService"):UserHasBadgeAsync(player.UserId, 2144310351) then
			game.ReplicatedStorage.Achievement:FireClient(player, "You Can Run", "But you can't.. um... uhm... uhh....", "Successfully run from Seek.", "rbxassetid://13706649784")
			game:GetService("BadgeService"):AwardBadge(player.UserId, 2144310351)
		else
			return
		end
	end
	script.Parent.Parent.Door.Anchored = true
	--script.Parent.Parent.HingeConstraint:Destroy()
	script.Parent.Parent.Door.CanCollide = true
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