local ReplicatedStorage = game:GetService("ServerScriptService")
local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
local PossibleHallways = ReplicatedStorage.Server:WaitForChild("Rooms")
local GeneratedRooms = workspace:WaitForChild("Rooms")
local Paintings = ReplicatedStorage:WaitForChild("Server"):WaitForChild("Assets"):WaitForChild("Paintings")
local Furnitures = ReplicatedStorage:WaitForChild("Server"):WaitForChild("Assets"):WaitForChild("Furnitures")
prevRoom = script.Parent.Parent
--[[local SeekRoomRandom = math.random(25, 35)
local CourtyardRoomRandom = math.random(65, 75)
game:GetService("Workspace").Rooms.SeekRoom.Value = SeekRoomRandom
game:GetService("Workspace").Rooms.SeekRoom.SeekRoomMain.Value = SeekRoomRandom +3 
game:GetService("Workspace").Rooms.CourtyardRoom.Value = CourtyardRoomRandom--]]
--
function generateRoom() -- Function Generator Rooms
	local clonedroom = script.Parent.Parent.Parent:FindFirstChild("0")

	for i, v in pairs(clonedroom:WaitForChild("PaintingPoint"):GetChildren()) do
		local addPainting = math.random(1, 5) 

		if addPainting < 3 then
			local Painting = Paintings:WaitForChild("Painting_Small"):Clone()
			Painting.Parent = script.Parent.Parent:WaitForChild("Paintings")
			Painting.Canvas.SurfaceGui.Script.Enabled = true
			Painting:PivotTo(v.CFrame)
		end
	end
end

for i = 1, 1 do -- Generate Pre-Run Room
	generateRoom()
	local rep = require(ReplicatedStorage2.ClientModules.Module_Events)
end