local drawer = require(game.ServerScriptService.Drawer.Drawer)

for i,v in pairs(script.Parent.Furnitures:GetChildren()) do
	if v.Name == "Dresser" then
		drawer:New(v)
	end
end