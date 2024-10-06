script.Parent.Touched:Connect(function()
	script.Parent.Parent.Door.Anchored = false
	script.Parent.Parent.Door.CanCollide = false
	script.Parent.CanTouch = false
	script.Parent.Parent.Door.Open:Play()
	workspace.Rooms.CurrentRoom.Value += 1
	wait(1)
	script.Parent.Parent.Door.Anchored = true
end)
