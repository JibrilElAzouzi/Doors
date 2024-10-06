local TweenService = game:GetService("TweenService")
local doorTweenInfo = TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut,0,false,0)
local doorModel = script.Parent.Parent

local doorTween2 = TweenService:Create(doorModel.Door, doorTweenInfo, {CFrame = doorModel.DoorTarget.CFrame})
local doorTween3 = TweenService:Create(doorModel.Door1, doorTweenInfo, {CFrame = doorModel.Door1Target.CFrame})

script.Parent.Touched:Connect(function(Hit)
	if Hit.Parent:FindFirstChild("Humanoid") then
		for i, v in pairs(game.Players:GetPlayers()) do
			if v.Character then
				local l__ElevatorCar__1 = script.Parent.Parent.Parent.ElevatorCar
				local v3 = 1;
				script.Parent.CanTouch = false
				script.Parent.Parent.Door1Target.Transparency = 0
				script.Parent.Parent.DoorTarget.Transparency = 0
				game.ReplicatedStorage.Bricks.Cutscene:FireClient(v ,"Elevator1")
				game.ReplicatedStorage.Bricks.CutsceneFollowup:FireClient(v)
				v.Character:PivotTo(script.Parent.Parent.Spawns:FindFirstChild("PlayerWeld"..v3).CFrame)
				script.Parent.Parent.Spawns:FindFirstChild("PlayerWeld"..v3).Weld.Part1 = v.Character.HumanoidRootPart
				script.Parent.Parent.Spawns:FindFirstChild("PlayerWeld"..v3).Constraint.Attachment0 = v.Character.HumanoidRootPart.RootAttachment
				v.Character.Humanoid.WalkSpeed = 0
				wait(0.6)
				v3 = v3 + 1
				v.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(script.Parent.Parent.Animations:FindFirstChild("Character"..v3)):Play()
				--[[v.Character:PivotTo(script.Parent.Parent.Spawns:FindFirstChild("PlayerWeld1").CFrame)
				script.Parent.Parent.Spawns:FindFirstChild("PlayerWeld1").Weld.Part1 = v.Character.HumanoidRootPart
				wait(0.6)
				v.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(script.Parent.Parent.Animations:FindFirstChild("Character")):Play()--]]
			end
		end
	end
end)