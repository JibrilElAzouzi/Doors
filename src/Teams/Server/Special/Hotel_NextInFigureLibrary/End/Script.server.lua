script.Parent.Touched:Connect(function(part)
	local player = game.Players:GetPlayerFromCharacter(part.Parent)
	if not game:GetService("BadgeService"):UserHasBadgeAsync(player.UserId, 2150016683) then
		wait(1)
		game.ReplicatedStorage.Achievement:FireClient(player, true, "SurviveFigureLibrary")
		game:GetService("BadgeService"):AwardBadge(player.UserId, 2150016683)
		print("Player now have a Achievement.")
	else
		return print("Player have a Achievement.")
	end
end)