local ReplicatedStorage = game:GetService("ServerScriptService")

prevRoom = script.Parent.Parent

function generateDoor() -- Function Generator Doors
	local cloneddoor = ReplicatedStorage.Server.Assets.Door:Clone()
	local requd = require(game.ServerScriptService.Game.RoomGeneration)
	requd:Open(cloneddoor.Hidden)
	requd:Generate(cloneddoor.Hidden)
	cloneddoor.Parent = script.Parent.Parent
	
	cloneddoor:PivotTo(script.Parent.Parent.RoomDoor.CFrame)
end

script.Parent.Parent.RoomStart.Touched:Connect(function(hit)
	generateDoor()
	script.Parent.Parent.RoomStart.CanTouch = false
	script.Enabled = false
end)