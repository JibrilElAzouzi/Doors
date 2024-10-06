local SeekRig = script.Parent:WaitForChild("SeekRig") -- SeekRig from this model
local waypointmove = game.Workspace.Rooms:FindFirstChild(game.Workspace.Rooms:GetAttribute("SeekRoomMain")).PathWay
local Figure = script.Parent:WaitForChild("Figure") -- Figure from this model
local RunSrevice = game:GetService('RunService')
local canLerp = true --  lerp
local Kill = true --  true will kill plr, false wont kill plr
local hum = SeekRig.AnimationController
local runanim = SeekRig.AnimRun
local raiseanim = SeekRig.AnimRaise
local running = hum:LoadAnimation(runanim)
local rising = hum:LoadAnimation(raiseanim)
rising.Looped = false
running.Looped = true
waypointmove.Parent = workspace.Rooms

local SpawnerLibrary = {
	LerpTo = function(object, offset, speed)
		local alpha = 0
		local object = object or error("object must be part.")
		local offset = offset or error("offset Recommended")
		local speed = speed or 21
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

wait()
game.ReplicatedStorage.GameData.ChaseInSession.Value = true
SeekRig:PivotTo(game.Workspace.Rooms:FindFirstChild(game.Workspace.Rooms:GetAttribute("SeekRoomMain")).SeekNewPos.CFrame)
local Music = Instance.new("Sound")
Music.Volume = 0.4
Music.Name = "ChaseInSession"
Music.SoundId = "rbxassetid://13330944342"
Music.Parent = game:GetService("SoundService").Main
Music:Play()
rising:Play()
rising.Stopped:Wait()
workspace.Camera.FieldOfView = 100
Figure.Footsteps:Play()
Figure.FootstepsFar:Play()
running:Play()

for i = 1, #waypointmove:GetChildren() do
	SpawnerLibrary.LerpTo(waypointmove:GetChildren()[i], CFrame.new(0, 4, 0), 20)
	if i == 10 then
		Figure.Scream:Play()
	end
	if i == 12 then
		game.ReplicatedStorage.GameData.SeekInLastHallway.Value = true
	end
	if i == 13 then
		game.ReplicatedStorage.Bricks.Door:FireAllClients()
	end
end
Figure.Knock:Play()
Figure.Footsteps:Stop()
Figure.FootstepsFar:Stop()
wait(3)
SpawnerLibrary.LerpTo(waypointmove["12"], CFrame.new(0, 4, 0), 20)
wait(8)
script.Parent:Destroy()