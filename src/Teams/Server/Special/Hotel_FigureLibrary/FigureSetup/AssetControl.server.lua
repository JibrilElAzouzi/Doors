local FigureCutscene = script.Parent.FigureRagdoll
local l__TweenService__1 = game:GetService("TweenService");
local NodesChildren = script.Parent.Parent.Nodes:GetChildren()
function croarfigure(figure)
	l__TweenService__1:Create(figure.Head.AttachmentLight.BlisterLight, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
		Brightness = 6
	}):Play();
	wait(1.3)
	l__TweenService__1:Create(figure.Head.AttachmentLight.BlisterLight, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
		Brightness = 4
	}):Play();
	wait(1.5)
	l__TweenService__1:Create(figure.Head.AttachmentLight.BlisterLight, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
		Brightness = 7
	}):Play();
	wait(2)
	l__TweenService__1:Create(figure.Head.AttachmentLight.BlisterLight, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
		Brightness = 3
	}):Play();
	wait(1.7)
	l__TweenService__1:Create(figure.Head.AttachmentLight.BlisterLight, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
		Brightness = 0
	}):Play();
end
local Animation = {
	Walk = script.Parent.Figure.Humanoid.Animator:LoadAnimation(script.Parent.Animations.Walk),
	Intro = script.Parent.Figure.Humanoid:LoadAnimation(script.Parent.Animations.Intro),
	Decapitate = script.Parent.Figure.Humanoid.Animator:LoadAnimation(script.Parent.Animations.Decapitate),
	Scan = script.Parent.Figure.Humanoid.Animator:LoadAnimation(script.Parent.Animations.Scan),
	Ponder = script.Parent.Figure.Humanoid.Animator:LoadAnimation(script.Parent.Animations.Ponder),
}
local figureAllParts = script.Parent.FigureRagdoll.Root
local pathParams = {
	["AgentHeight"] = 4,
	["AgentRadius"] = script.Parent.FigureRagdoll.Root.Size.X * 1.554,
	["AgentCanJump"] = false
}
local figure = {}
local figureragdoll = script.Parent.FigureRagdoll
local checkCloset = false
local ischasingcheck
local ischasingvalue = Instance.new("BoolValue", game.ServerStorage)
ischasingvalue.Value = false
local ischasingcheckpathfind
figure.random = Random.new()
local nodetogoto = 0
local isChasing = false
Animation.Intro:Play(1)
Animation.Intro:AdjustSpeed(0)
local PathfindingService = game:GetService("PathfindingService")
local footstep = 1
local EngagedLeft = 5
local ResetWaypoints = false
local introstopped = false
local raycast
local speed = 11
local speedanim = 0.75
local isEngaged = false
local v65 = math.random(5, 30) / 10;
local v66 = v65 + math.random(10, 60) / 10;
spawn(function()
	--if isChasing then
	--	v65 = math.random(5, 30) / 10;
	--v66 = v65 + math.random(10, 60) / 10;
	--wait(1)
	--end
end)
local footstep = 1
local EngagedLeft = 5
local speed = 14
local speedanim = 1.4
local isEngaged = false
function FootstepEvent()
	Animation.Walk:AdjustSpeed(speedanim)
	if footstep==1 then
		footstep=2
		script.Parent.FigureRagdoll.RightFoot.Footstep:Play()
		script.Parent.FigureRagdoll.RightFoot.FootstepLow:Play()
	elseif footstep==2 then
		footstep=1
		script.Parent.FigureRagdoll.LeftFoot.Footstep:Play()
		script.Parent.FigureRagdoll.LeftFoot.FootstepLow:Play()
	end
end
function GoTo(direction)
	local alpha = 0
	local speed2 = speed
	local distance = (direction.Position - script.Parent.FigureRagdoll.Torso.Position).Magnitude
	local relativeSpeed = distance / speed2
	local loop
	local reachedEvent = Instance.new("BindableEvent")
	loop = game:GetService("RunService").Heartbeat:Connect(function(delta)
		script.Parent.FigureRagdoll.Torso.BodyVelocity.Velocity = -(script.Parent.FigureRagdoll.Torso.Position - direction.Position).Unit * speed
		script.Parent.Figure.Humanoid:MoveTo( direction.Position )
		alpha += delta / relativeSpeed
		if alpha >= 1 then
			loop:Disconnect()
			reachedEvent:Fire()
		end
	end)
	reachedEvent.Event:Wait()
end
function Navigate()
	for nodesPathAble = 1, #NodesChildren, 1 do
		if not isEngaged and not script.Parent.Closet.Value then
			GoTo(NodesChildren[nodesPathAble])
		end
	end
end
script.Parent.SpeedBoost.Event:Connect(function()
	speedanim = speedanim + 0.15
	speed = speed + 2.5
	if EngagedLeft == 1 then
		script.Parent.BreakerEngaged:Fire()
	end
	EngagedLeft -= 1
	script.Parent.Figure.Humanoid.WalkSpeed += 2
end)
spawn(function()
	repeat
		task.wait(math.random(5,15))
		script.Parent.FigureRagdoll.Head.Click:Play()
		croarfigure(script.Parent.FigureRagdoll)
	until speedanim > math.huge
end)
script.Parent.TriggerFigure.Event:Connect(function(player)
		Animation.Intro:AdjustSpeed(1)
		workspace.Ambience_Figure.TimePosition = 0
		FigureCutscene.Head.Click:Play()
		wait(1.5)
		workspace.Ambience_Figure:Play()
		game.ReplicatedStorage.flicklights:FireAllClients()
		wait(2)
		FigureCutscene.Head.ClickLow:Play()
		wait(0.7)
		FigureCutscene.LeftFoot.Footstep:Play()
		FigureCutscene.LeftFoot.FootstepLow:Play()
	game.ReplicatedStorage.Bricks.FireCamera:FireAllClients(3, 18, 0, 0.7)
		wait(0.5)
		FigureCutscene.RightFoot.Footstep:Play()
		FigureCutscene.RightFoot.FootstepLow:Play()
	game.ReplicatedStorage.Bricks.FireCamera:FireAllClients(2, 18, 0, 0.7)
		wait(0.5)
		FigureCutscene.LeftFoot.Footstep:Play()
		FigureCutscene.LeftFoot.FootstepLow:Play()
	game.ReplicatedStorage.Bricks.FireCamera:FireAllClients(3, 18, 0, 0.7)
		wait(0.5)
		FigureCutscene.RightFoot.Footstep:Play()
		FigureCutscene.RightFoot.FootstepLow:Play()
	game.ReplicatedStorage.Bricks.FireCamera:FireAllClients(2, 18, 0, 0.7)
		wait(0.21)
		script.Parent.BreakSound.Break:Play()
		wait(1.2)
		FigureCutscene.Head.Growl:Play()
		wait(0.1)
		FigureCutscene.LeftFoot.Footstep:Play()
		FigureCutscene.LeftFoot.FootstepLow:Play()
	game.ReplicatedStorage.Bricks.FireCamera:FireAllClients(3, 18, 0, 0.7)
		wait(0.3)
		FigureCutscene.RightFoot.Footstep:Play()
		FigureCutscene.RightFoot.FootstepLow:Play()
	game.ReplicatedStorage.Bricks.FireCamera:FireAllClients(2, 18, 0, 0.7)
		FigureCutscene.Head.Break:Play()
		wait(0.3)
		FigureCutscene.LeftFoot.Footstep:Play()
		FigureCutscene.LeftFoot.FootstepLow:Play()
	game.ReplicatedStorage.Bricks.FireCamera:FireAllClients(3, 18, 0, 0.7)
		wait(0.3)
		FigureCutscene.RightFoot.Footstep:Play()
		FigureCutscene.RightFoot.FootstepLow:Play()
	game.ReplicatedStorage.Bricks.FireCamera:FireAllClients(2, 18, 0, 0.7)
		FigureCutscene.Head.Break3:Play()
		wait(1)
		script.Parent.FigureRagdoll:Destroy()
	script.Parent.FigureMovement.AssetControl.Enabled = true
		wait(5)
		introstopped = true
end)
script.Parent.BreakerEngaged.Event:Connect(function()
	isEngaged = true
	while wait() do
		if isEngaged == true then
			for i,p in pairs(game:GetService("Players"):GetPlayers()) do
				if p.Character then
					if (p.Character.HumanoidRootPart.Position - script.Parent.FigureRagdoll.Torso.Position).Magnitude < math.huge then
						local function checkw(t)
							local ci = 3
							if ci > #t then
								ci = 3
							end
							if t[ci] == nil and ci < #t then
								repeat
									ci = ci + 1
									wait()
								until t[ci] ~= nil
								return Vector3.new(1, 0, 0) + t[ci]
							else
								ci = 3
								return t[ci]
							end
						end
						local path = PathfindingService:FindPathAsync(script.Parent.FigureRagdoll.Torso.Position, p.Character.HumanoidRootPart.Position)
						local waypoints = path:GetWaypoints()
						for i, direction in pairs(waypoints) do
							if checkw(direction) ~= nil and checkw(direction).Action == Enum.PathWaypointAction.Walk then
								script.Parent.FigureRagdoll.Torso.BodyVelocity.Velocity = -(script.Parent.FigureRagdoll.Torso.Position - direction.Position).Unit * speed
								script.Parent.Figure.Humanoid:MoveTo( direction.Position )
							elseif checkw(direction) ~= nil and checkw(direction).Action == Enum.PathWaypointAction.Jump then
								script.Parent.FigureRagdoll.Torso.BodyVelocity.Velocity = -(script.Parent.FigureRagdoll.Torso.Position - direction.Position).Unit * speed
								script.Parent.Figure.Humanoid:MoveTo( direction.Position )
							end
						end
					end
				end
			end
		end
	end
end)
script.Parent.TriggerCloset.Event:Connect(function(player, partGoing)
	if not checkCloset then
		checkCloset = true
		script.Parent.Closet.Value = true
		local currentSpeed = script.Parent.Figure.Humanoid.WalkSpeed
		script.Parent.FigureRagdoll.Head.Growl3:Play()
		script.Parent.FigureRagdoll.Head.Click:Play()
		game.ReplicatedStorage.Bricks.FigureLight:FireAllClients(script.Parent.FigureRagdoll)
		script.Parent.FigureRagdoll.Head.Click.PlaybackSpeed = math.random(0.7,0.85)
		script.Parent.FigureRagdoll.Torso.BodyVelocity.P = "0"
		script.Parent.Figure.Humanoid:MoveTo(partGoing.Position)
		for i = 10/(1/60),1-1 do
			game:GetService("RunService").Heartbeat:Wait()
			if (script.Parent.FigureRagdoll.Torso.Position - partGoing.Position).Magnitude < 7 then
				break
			end
		end
		Animation.Ponder:Play()
		Animation.Walk:Stop()
		for _, alignFigure in ipairs(script.Parent.FigureRagdoll.Orientation:GetDescendants()) do
			if alignFigure:IsA("AlignOrientation") then
				alignFigure.RigidityEnabled = true
			end
		end
		script.Parent.Figure.Humanoid.WalkSpeed = 0
		script.Parent.FigureRagdoll.Head.Click:Play()
		game.ReplicatedStorage.Bricks.FigureLight:FireAllClients(script.Parent.FigureRagdoll)
		script.Parent.FigureRagdoll.Head.Click.PlaybackSpeed = math.random(0.7,0.85)
		script.Parent.FigureRagdoll.Torso.BodyVelocity.MaxForce = Vector3.new(0,0,0)
		script.Parent.FigureRagdoll.Torso.BodyVelocity.P = "5000"
		Animation.Ponder.Stopped:Wait()
		if player then
			script.Parent.FigureRagdoll.Head.Click:Play()
			game.ReplicatedStorage.Bricks.FigureLight:FireAllClients(script.Parent.FigureRagdoll)
			script.Parent.FigureRagdoll.Head.Click.PlaybackSpeed = math.random(0.7,0.85)
			Animation.Ponder:Play()
			Animation.Ponder.Stopped:Wait()
		end
		Animation.Walk:Play(0, 1, speedanim)
		script.Parent.FigureRagdoll.Torso.BodyVelocity.MaxForce = Vector3.new(40000000, 0, 400000000)
		for _, alignFigure in ipairs(script.Parent.FigureRagdoll.Orientation:GetDescendants()) do
			if alignFigure:IsA("AlignOrientation") then
				alignFigure.RigidityEnabled = false
			end
		end
		script.Parent.Closet.Value = false
		script.Parent.Figure.Humanoid.WalkSpeed = speed
		wait(30)
		checkCloset = false
	end
end)
local playerbeingkilled = false
local relocatedb = false
--[[
script.Parent.FigureRagdoll.Torso.Touched:Connect(function(obj)
	task.wait()
	if obj:IsA("BasePart") and obj.Parent.Name ~= "FigureRagdoll" and not game.Players:GetPlayerFromCharacter(obj.Parent) and obj.Name ~= "CarpetLight" and obj.Name ~= "Carpet" and obj.Name ~= "Floor" and obj.Name ~= "Collision" and obj.Name ~= "1" then
		if not isEngaged and not relocatedb and not isChasing and not script.Parent.Closet.Value then
			relocatedb = true
			ResetWaypoints = true
			task.wait(0.75)
			ResetWaypoints = false
			Navigate()
			task.wait(1)
			relocatedb = false
		end
	end
end)
]]
--[[script.Parent.FigureRagdoll.Root.Touched:Connect(function(obj)
	if obj.Parent and playerbeingkilled == false then
		if game.Players:GetPlayerFromCharacter(obj.Parent) then
			if obj.Parent:FindFirstChild("Humanoid") then
				if obj.Parent.Humanoid.Health <= 0 then
					return
				end
			end
			local player = game.Players:GetPlayerFromCharacter(obj.Parent) 
			game.ReplicatedStorage.Bricks.Jumpscare:FireClient(player, "Figure")
			playerbeingkilled = true
			local plr = game.Players:GetPlayerFromCharacter(obj.Parent)
			local chanceside = math.random(1,2)
			if chanceside == 1 then
				script.Parent.FigureRagdoll.Grab_Left.Attachment1 = plr.Character.PrimaryPart.RootRigAttachment
				script.Parent.FigureRagdoll.Grab_Head.Attachment1 = plr.Character.Head.NeckRigAttachment
			end
			if chanceside == 2 then
				script.Parent.FigureRagdoll.Grab_Right.Attachment1 = plr.Character.PrimaryPart.RootRigAttachment
				script.Parent.FigureRagdoll.Grab_Head.Attachment1 = plr.Character.Head.NeckRigAttachment
			end
			script.Parent.FigureRagdoll.Head.Growl:Play()
			task.wait(1)
			script.Parent.FigureRagdoll.Head.Kill:Play()
			plr.Character.Humanoid.Health = 0
			script.Parent.FigureRagdoll.Grab_Right.Attachment1 = nil
			script.Parent.FigureRagdoll.Grab_Left.Attachment1 = nil
			script.Parent.FigureRagdoll.Grab_Head.Attachment1 = nil
			playerbeingkilled = false
			--script.Parent.FigureRagdoll.Root.Anchored = false
			--Animation.Walk:Play()
			--for _, alignFigure in ipairs(script.Parent.FigureRagdoll.Orientation:GetDescendants()) do
			--if alignFigure:IsA("AlignOrientation") then
			--alignFigure.RigidityEnabled = false
			--end
			--end
		end
	end
end)--]]
local npcIsStuck = false
local stuckAmount = 0
local lastPosition
local root = script.Parent.FigureRagdoll.Torso
local originPos = root.CFrame