local l__TweenService__1 = game:GetService("TweenService");
local v3 = script.Parent

local v4 = script.Parent.WindowTallSingleUnique
local v5 = script.Parent.WindowTallSingleUnique1

script.Parent.Parent.Parent.Colors.Wall:FindFirstChild("colortrue").Changed:Connect(function()
	if script.Parent.Parent.Parent.Colors.Wall:FindFirstChild("colortrue").Value == true then
		while true do
			local m = math.random(8, 24)
			wait(m)
			coroutine.wrap(function()
				delay(math.random(0, 10) / 100, function()
					l__TweenService__1:Create(v3.LightPanel.Lightning, TweenInfo.new(0.065, Enum.EasingStyle.Back, Enum.EasingDirection.InOut, 3, true, 0), {
						Brightness = 2
					}):Play();
					l__TweenService__1:Create(v4.LightPanel.Lightning, TweenInfo.new(0.065, Enum.EasingStyle.Back, Enum.EasingDirection.InOut, 3, true, 0), {
						Brightness = 2
					}):Play();
					l__TweenService__1:Create(v5.LightPanel.Lightning, TweenInfo.new(0.065, Enum.EasingStyle.Back, Enum.EasingDirection.InOut, 3, true, 0), {
						Brightness = 2
					}):Play();
					v3.LightPanel.Attachment.Thunder.Pitch = 1 + math.random(-100, 100) / 1000;
					v3.LightPanel.Attachment.Thunder:Play();
					v4.LightPanel.Attachment.Thunder.Pitch = 1 + math.random(-100, 100) / 1000;
					v4.LightPanel.Attachment.Thunder:Play();
					v5.LightPanel.Attachment.Thunder.Pitch = 1 + math.random(-100, 100) / 1000;
					v5.LightPanel.Attachment.Thunder:Play();
					if v3.LightPanel.Parent:FindFirstChild("Sally") then
						v3.LightPanel.Parent:FindFirstChild("Sally"):Destroy();
					end;
				end);
			end)();
		end
	else
		print("Waiting for colortrue Room: " .. script.Parent.Parent.Parent.Name)
	end
end)