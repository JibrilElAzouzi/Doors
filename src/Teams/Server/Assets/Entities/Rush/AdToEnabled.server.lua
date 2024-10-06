local latectroom = game.Workspace.Rooms.CurrentRoom.Value -3
local middleroom = game.Workspace.Rooms.CurrentRoom.Value -2
local leftroom = game.Workspace.Rooms.CurrentRoom.Value -1
--local waypointmove3 = game.Workspace.Rooms:WaitForChild(currentroom):FindFirstChild("Nodes")
local waypointmove2 = game.Workspace.Rooms:WaitForChild(leftroom):FindFirstChild("Nodes")
local waypointmove1 = game.Workspace.Rooms:WaitForChild(middleroom):FindFirstChild("Nodes")
local waypointmove = game.Workspace.Rooms:WaitForChild(latectroom):FindFirstChild("Nodes")
local Figure = script.Parent.Point
local SeekRig = script.Parent.RuchFigure
local RunSrevice = game:GetService('RunService')

local SpawnerLibrary = {
	LerpTo = function(object, offset, speed)
		local alpha = 0
		local object = object or error("object must be part.")
		local offset = offset or error("offset Recommended")
		local speed = speed
		local distance = (Figure.Position - object.Position).Magnitude
		local relativeSpeed = distance / speed
		local startCFrame = SeekRig.PrimaryPart.CFrame
		local loop
		local reachedEvent = Instance.new("BindableEvent")
		loop = RunSrevice.Heartbeat:Connect(function(delta)
			local goalCFrame = startCFrame:Lerp(object.CFrame * offset, alpha)
			SeekRig:PivotTo(goalCFrame)
			alpha += delta / relativeSpeed
			if alpha >= 1 then
				loop:Disconnect()
				reachedEvent:Fire()
			end
		end)
		reachedEvent.Event:Wait()
	end,
}

wait(1)

for i = 1, #waypointmove:GetChildren() do
	SpawnerLibrary.LerpTo(waypointmove:GetChildren()[i], CFrame.new(0, 4, 0), 4000)
end

--script.Parent:Destroy()

for i = 1, #waypointmove1:GetChildren() do
	SpawnerLibrary.LerpTo(waypointmove1:GetChildren()[i], CFrame.new(0, 4, 0), 3000)
end

for i = 1, #waypointmove2:GetChildren() do
	SpawnerLibrary.LerpTo(waypointmove2:GetChildren()[i], CFrame.new(0, 4, 0), 3000)
end

script.Parent:Destroy()