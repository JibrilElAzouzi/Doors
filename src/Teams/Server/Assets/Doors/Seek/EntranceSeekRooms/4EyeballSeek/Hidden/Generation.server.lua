local ReplicatedStoragee = game:GetService("ReplicatedStorage")
local ReplicatedStorage = game:GetService("ServerScriptService")
local PossibleHallways = ReplicatedStorage.Server:WaitForChild("Rooms")
local SpecialHallways = ReplicatedStorage.Server:WaitForChild("Special")
local SeekSpecialHallway = ReplicatedStorage.Server:WaitForChild("Special"):WaitForChild("EntranceSeekRooms"):WaitForChild("8Eyeball")

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
	local randomroom = SeekSpecialHallway:GetChildren()[math.random(1, #SeekSpecialHallway:GetChildren())]
	local clonedroom = randomroom:Clone()

	clonedroom.PrimaryPart = clonedroom.RoomStart -- Clone room get a Primaty part
	clonedroom:PivotTo(script.Parent.Parent.Parent.RoomEnd.CFrame) -- Cloned room moving to generate part
	clonedroom.Name = RoomNumber  -- Changing name to Current room
	workspace.Rooms.CurrentRoom.Value += 1
	clonedroom.Parent = GeneratedRooms -- Parent to Rooms
	prevRoom = clonedroom -- Prev room this Cloned Roo
end

local generatedrooms = {prevRoom}

script.Parent.Touched:Connect(function(roomNum)
	generateRoom(game.Workspace.Rooms.CurrentRoom.Value)
	script.Parent.Parent.Parent.ValueC.Value = true
	script.Parent.CanTouch = false
end)
if workspace.Rooms.CurrentRoom.Value >= 4 then
	local cur = game.Workspace.Rooms.CurrentRoom.Despawn.Value
	local cur1 = game.Workspace.Rooms.CurrentRoom.Despawn.Value - 1
	local cur2 = game.Workspace.Rooms.CurrentRoom.Despawn.Value - 2
	local cur3 = game.Workspace.Rooms.CurrentRoom.Despawn.Value - 3
	local cur4 = game.Workspace.Rooms.CurrentRoom.Despawn.Value - 4
	local g = game.Workspace.Rooms.CurrentRoom.Value - 4

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
end