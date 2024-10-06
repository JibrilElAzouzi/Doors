local ReplicatedStorage = game:GetService("ServerScriptService")

prevRoom = script.Parent.Parent

function generateDoor() -- Function Generator Doors
	local cloneddoor = ReplicatedStorage.Server.Assets["Doors"]["Seek"]["EntranceSeekRooms"]["4EyeballSeek"]:Clone()
	
	cloneddoor.Parent = script.Parent.Parent
	cloneddoor.Name = "Door"
	
	cloneddoor:PivotTo(script.Parent.Parent.RoomDoor.CFrame)
end

script.Parent.Parent.RoomStart.Touched:Connect(function(hit)
	generateDoor()
	script.Parent.Parent.RoomStart.CanTouch = false
	script.Enabled = false
end)