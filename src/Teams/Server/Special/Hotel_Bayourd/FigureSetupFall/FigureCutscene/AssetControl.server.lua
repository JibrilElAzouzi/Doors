script.Parent.CutceneFigure.Event:Connect(function()
	local badboi = script.Parent.AnimationController:LoadAnimation(script.Parent.Animation)
	badboi:Play()
	badboi:AdjustSpeed(0)
end)