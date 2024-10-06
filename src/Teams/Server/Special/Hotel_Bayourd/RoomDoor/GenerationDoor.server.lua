local ReplicatedStorage = game:GetService("ServerScriptService")

prevRoom = script.Parent.Parent

function generateDoor() -- Function Generator Doors
	local cloneddoor = ReplicatedStorage.Server.Assets.Doors["100"].Door:Clone()
	
	cloneddoor.Parent = script.Parent.Parent
	
	cloneddoor:PivotTo(script.Parent.Parent.RoomDoor.CFrame)
end

for i = 1, 1 do
	generateDoor()
	script.Parent.Parent.RoomStart.CanTouch = false
	script.Enabled = false
end