function onTouch(part) 
local human = part.Parent:findFirstChild("Humanoid") 
if (human == nil) then return end 
	--human.Health = 0 
	--game.ReplicatedStorage.Bricks.DeathHint:FireClient(game.Players:GetPlayerFromCharacter(hit.Parent), {"You died to A-60", "He lurks after rush", "after rush passes you, stay close to a closet to avoid A-60", "Sorry about that, "..game.Players:GetPlayerFromCharacter(hit.Parent).DisplayName})
	game.ReplicatedStorage.Bricks.Jumpscare:FireClient(game.Players:WaitForChild(human.Parent.Name), "Figure")
	local FigureDeath1 = game.Players:WaitForChild(human.Parent.Name).Deaths.FigureDeath1
	local FigureDeath2 = game.Players:WaitForChild(human.Parent.Name).Deaths.FigureDeath2
	if FigureDeath1.Value == true then
		game.ReplicatedStorage.Bricks.DeathHint:FireClient(game.Players:WaitForChild(human.Parent.Name), {"You died to who you call the Figure...", "It cannot see, but it will use sounds and vibrations to its advantage."})
		wait(0.5)
		human.Health = 0
		wait(4)
		FigureDeath1.Value = false
		FigureDeath2.Value = true
	elseif FigureDeath2.Value == true then
		game.ReplicatedStorage.Bricks.DeathHint:FireClient(game.Players:WaitForChild(human.Parent.Name), {"You died to the Figure again...", "It may be blind, but its other senses far surpass yours.", "If you have to walk near it, do so while crouching!"})
	end
end 
script.Parent.Touched:connect(onTouch)