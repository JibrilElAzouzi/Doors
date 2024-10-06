local RoomGeneration = require(script.RoomGeneration)


if game.Workspace.Rooms.CurrentRoom.Value >= 1 then
	while true do
		wait(1.5)
		if workspace.Rooms:FindFirstChild(game.Workspace.Rooms.CurrentRoom.Value - 1)--[[:FindFirstChild("Lock")--]] then
			local currentRoom = game.Workspace.Rooms.CurrentRoom.Value
			local room = workspace.Rooms:FindFirstChild(tostring(currentRoom - 1))
			for i,v in pairs(workspace.Rooms:FindFirstChild(game.Workspace.Rooms.CurrentRoom.Value - 1):GetChildren()) do
				if workspace.Rooms:FindFirstChild(game.Workspace.Rooms.CurrentRoom.Value - 1):GetAttribute("Seek") == "true" then
					return
				else
					if v:GetAttribute("LoadModule") == "Door" then

						RoomGeneration:Open(v:FindFirstChild("Hidden"))
						RoomGeneration:Generate(v:FindFirstChild("Hidden"))
						v:SetAttribute("LoadModule", "Loaded")
					end
				end
			end
			RoomGeneration:Open(game.ServerScriptService.Server.Assets.Door.Hidden)
			RoomGeneration:Generate(game.ServerScriptService.Server.Assets.Door.Hidden)

			local currentRoom = game.Workspace.Rooms.CurrentRoom.Value
		end
	end
end

for i = 1, 1 do
	RoomGeneration:OpenLock(workspace.Rooms:FindFirstChild("0").Door.Hidden)
end

for i,v in pairs(game.ServerStorage.Rooms:GetChildren())do
	for i, room in pairs(v:GetChildren()) do
		if room:IsA("Model") and room.Name=="Wardrobe" then
			room:Destroy()
		elseif room:IsA("Folder") then
			for i, y in pairs(room:GetChildren()) do
				if y:IsA("Model") and y.Name=="Wardrobe" then
					y:Destroy()
				end
			end


		end
	end

end