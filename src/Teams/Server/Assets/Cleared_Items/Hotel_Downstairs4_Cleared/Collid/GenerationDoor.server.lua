local ServerScriptService = game:GetService("ServerScriptService")

prevRoom = script.Parent.Parent

function generateDoor() -- Function Generator Doors
	local cloneddoor = ServerScriptService.Server.Assets.DoorKey:Clone()
	
	cloneddoor.Parent = script.Parent.Parent
	cloneddoor:PivotTo(script.Parent.Parent.RoomDoor.CFrame)
	cloneddoor.Name = "Door"
end

script.Parent.Parent.RoomStart.Touched:Connect(function(hit)
	generateDoor()
	script.Parent.Parent.RoomStart.CanTouch = false
	script.Enabled = false
end)