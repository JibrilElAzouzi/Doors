script.Parent.Touched:Connect(function(part)
	local player = game.Players:GetPlayerFromCharacter(part.Parent)
	if not game:GetService("BadgeService"):UserHasBadgeAsync(player.UserId, 2146093931) then
		wait(4)
		game.ReplicatedStorage.Achievement:FireClient(player, true, "SurviveSeek")
		game:GetService("BadgeService"):AwardBadge(player.UserId, 2146093931)
		print("Player now have a Achievement.")
	else
		return print("Player have a Achievement.")
	end
end)