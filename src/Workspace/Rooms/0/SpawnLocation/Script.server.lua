function onTouch(hit)
	local d = hit.Parent:GetChildren()
	for i=1, #d do
		if (d[i].className == "Accessory") then
			d[i]:Destroy()
			--wait(10)
			--game.ReplicatedStorage.Bricks.Caption:FireClient(hit, 'Your accessory have been removed - ' .. d[i].Name)
		end
	end
end

script.Parent.Touched:Connect(onTouch)