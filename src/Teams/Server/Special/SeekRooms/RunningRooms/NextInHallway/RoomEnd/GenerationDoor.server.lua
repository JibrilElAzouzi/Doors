local ReplicatedStorage = game:GetService("ServerScriptService")

prevRoom = script.Parent.Parent

script.Parent.Parent.RoomStart.Touched:Connect(function(hit)
	script.Parent.Parent.RoomStart.CanTouch = false
	script.Parent.Parent.Door.Hidden.Generation.Enabled = true
end)