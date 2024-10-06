local random = math.random(1)

if random == 1 then
	script.Parent.Parent:PivotTo(script.Parent.Parent.Parent.Parent.NodsKeys:WaitForChild(random).CFrame)
end

local ToolName = {"Key"}
local Storage = game.ServerStorage
local Part = script.Parent.Parent
local ProximityPrompt = script.Parent
local Sonido = script.Parent.Parent.Hitbox.Sound
local Anim = game.ServerStorage.Key.Animations.equip

ProximityPrompt.Triggered:connect(function(Player)
	if Player and Player.Character  then
		local Backpack = Player:WaitForChild("Backpack")
		for i = 1, #ToolName do
			local Tool = Storage:FindFirstChild(ToolName[i])
			if Tool then
				if Backpack:FindFirstChild("Key") or Player.Character:FindFirstChild("Key") then
					return
				end
				Sonido:Play()
				Tool:clone().Parent = Backpack
				game.StarterPlayer.StarterCharacterScripts.EquipTool:FireClient(Player, "Key")
			end
		end
	end
end)
