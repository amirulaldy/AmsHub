local UI = {}

function UI:Gradient(obj, c1, c2)
	local g = Instance.new("UIGradient", obj)
	g.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, c1),
		ColorSequenceKeypoint.new(1, c2)
	}
end

function UI:Button(parent, text, y)
	local b = Instance.new("TextButton", parent)
	b.Size = UDim2.new(1,-10,0,42)
	b.Position = UDim2.new(0,5,0,y)
	b.Text = "  "..text
	b.TextXAlignment = Left
	b.Font = Enum.Font.Gotham
	b.TextSize = 14
	b.TextColor3 = Color3.new(1,1,1)
	b.BackgroundColor3 = Color3.fromRGB(40,40,40)
	Instance.new("UICorner", b).CornerRadius = UDim.new(0,10)
	return b
end

return UI
