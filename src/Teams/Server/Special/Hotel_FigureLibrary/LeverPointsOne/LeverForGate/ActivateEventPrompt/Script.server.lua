script.Parent.Triggered:Connect(function()
	script.Parent.Parent.Main.ToUnanchor.Anchored = false
	script.Parent.Parent.Main.SoundToPlay:Play()
	game.Workspace.Rooms:FindFirstChild("50").FigureSetup.Modules.Lever2.Value = true
	game.Workspace.Rooms:FindFirstChild("50").FigureSetup.Modules.Lever1Triggered.Value = true
	wait(0.1)
	script.Parent.Enabled = false
end)

local random = math.random(1, 6)
if random == 1 then
	script.Parent.Parent:PivotTo(script.Parent.Parent.Parent.DaskpointGate1.Leverpoint1.CFrame)
elseif random == 2 then
	script.Parent.Parent:PivotTo(script.Parent.Parent.Parent.DaskpointGate1.Leverpoint2.CFrame)
elseif random == 3 then
	script.Parent.Parent:PivotTo(script.Parent.Parent.Parent.DaskpointGate1.Leverpoint3.CFrame)
elseif random == 4 then
	script.Parent.Parent:PivotTo(script.Parent.Parent.Parent.DaskpointGate1.Leverpoint4.CFrame)
elseif random == 5 then
	script.Parent.Parent:PivotTo(script.Parent.Parent.Parent.DaskpointGate1.Leverpoint5.CFrame)
elseif random == 6 then
	script.Parent.Parent:PivotTo(script.Parent.Parent.Parent.DaskpointGate1.Leverpoint2.CFrame)
end