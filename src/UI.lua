local UI = {}

function UI:Button(parent, text, y)
	local b = Instance.new("TextButton")
	b.Parent = parent
	b.Size = UDim2.new(1, -12, 0, 44)
	b.Position = UDim2.new(0, 6, 0, y)
	b.Text = text
	b.Font = Enum.Font.GothamBold
	b.TextSize = 16
	b.TextColor3 = Color3.new(1,1,1)
	b.BackgroundColor3 = Color3.fromRGB(45,45,45)
	b.AutoButtonColor = true

	local c = Instance.new("UICorner", b)
	c.CornerRadius = UDim.new(0, 10)

	return b
end

return UI
