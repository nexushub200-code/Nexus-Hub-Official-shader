local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--==================================================
-- THEME
--==================================================

local C = {
	BG = Color3.fromRGB(13, 11, 22),
	PANEL = Color3.fromRGB(20, 17, 32),
	BUTTON = Color3.fromRGB(29, 25, 45),
	HOVER = Color3.fromRGB(48, 37, 70),
	PRESSED = Color3.fromRGB(65, 45, 92),
	PURPLE = Color3.fromRGB(170, 100, 255),
	TEXT = Color3.fromRGB(245, 242, 255),
	DIM = Color3.fromRGB(175, 168, 195)
}

local AnimFast = TweenInfo.new(
	0.12,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out
)

local AnimSmooth = TweenInfo.new(
	0.28,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out
)

local AnimPop = TweenInfo.new(
	0.42,
	Enum.EasingStyle.Back,
	Enum.EasingDirection.Out
)

local AnimClose = TweenInfo.new(
	0.25,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.In
)

--==================================================
-- HELPERS
--==================================================

local function Tween(Object, Info, Properties)
	local T = TweenService:Create(Object, Info, Properties)
	T:Play()
	return T
end

local function Round(Object, Radius)
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0, Radius)
	Corner.Parent = Object
	return Corner
end

local function Stroke(Object, Color, Thickness, Transparency)
	local S = Instance.new("UIStroke")
	S.Color = Color
	S.Thickness = Thickness or 1
	S.Transparency = Transparency or 0
	S.Parent = Object
	return S
end

local function Notify(Title, Text)
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = Title,
			Text = Text,
			Duration = 2
		})
	end)
end

--==================================================
-- SHADER SYSTEM
--==================================================

local function ClearShaders()
	for _, Object in ipairs(Lighting:GetChildren()) do
		if Object.Name:sub(1, 6) == "Nexus_" then
			Object:Destroy()
		end
	end
end

local function AddCC(Name, Saturation, Contrast, Brightness, Tint)
	local Effect = Instance.new("ColorCorrectionEffect")
	Effect.Name = "Nexus_" .. Name
	Effect.Saturation = Saturation
	Effect.Contrast = Contrast
	Effect.Brightness = Brightness
	Effect.TintColor = Tint
	Effect.Parent = Lighting
end

local function AddBloom(Name, Intensity, Size, Threshold)
	local Effect = Instance.new("BloomEffect")
	Effect.Name = "Nexus_" .. Name
	Effect.Intensity = Intensity
	Effect.Size = Size
	Effect.Threshold = Threshold
	Effect.Parent = Lighting
end

local function AddAtmosphere(Name, Density, Offset, Color, Decay, Glare, Haze)
	local Effect = Instance.new("Atmosphere")
	Effect.Name = "Nexus_" .. Name
	Effect.Density = Density
	Effect.Offset = Offset
	Effect.Color = Color
	Effect.Decay = Decay
	Effect.Glare = Glare
	Effect.Haze = Haze
	Effect.Parent = Lighting
end

local function ClassicDay()
	ClearShaders()

	Lighting.ClockTime = 12
	Lighting.Brightness = 1.7
	Lighting.ExposureCompensation = 0.05
	Lighting.Ambient = Color3.fromRGB(135, 135, 145)
	Lighting.OutdoorAmbient = Color3.fromRGB(170, 170, 180)
	Lighting.FogColor = Color3.fromRGB(205, 215, 230)
	Lighting.FogEnd = 30000

	AddCC(
		"DayCC",
		0.08,
		0.12,
		0.03,
		Color3.fromRGB(245, 248, 255)
	)

	AddAtmosphere(
		"DayAtm",
		0.08,
		0.1,
		Color3.fromRGB(205, 220, 245),
		Color3.fromRGB(180, 190, 210),
		0.05,
		0.08
	)

	AddBloom("DayBloom", 0.08, 18, 1.2)

	Notify("☀️ Classic / Day", "Shader applied")
end

local function Sunset()
	ClearShaders()

	Lighting.ClockTime = 17.75
	Lighting.Brightness = 1.8
	Lighting.ExposureCompensation = 0.1
	Lighting.Ambient = Color3.fromRGB(180, 105, 85)
	Lighting.OutdoorAmbient = Color3.fromRGB(205, 125, 95)
	Lighting.FogColor = Color3.fromRGB(255, 175, 125)
	Lighting.FogEnd = 22000

	AddCC(
		"SunsetCC",
		0.18,
		0.18,
		0.04,
		Color3.fromRGB(255, 210, 175)
	)

	AddBloom("SunsetBloom", 0.28, 28, 0.85)

	AddAtmosphere(
		"SunsetAtm",
		0.12,
		0.05,
		Color3.fromRGB(255, 185, 145),
		Color3.fromRGB(255, 110, 75),
		0.18,
		0.15
	)

	local Rays = Instance.new("SunRaysEffect")
	Rays.Name = "Nexus_Rays"
	Rays.Intensity = 0.22
	Rays.Spread = 0.8
	Rays.Parent = Lighting

	Notify("🌅 Sunset", "Shader applied")
end

local function BrightClear()
	ClearShaders()

	Lighting.ClockTime = 13
	Lighting.Brightness = 2.1
	Lighting.ExposureCompensation = 0.12
	Lighting.Ambient = Color3.fromRGB(220, 225, 240)
	Lighting.OutdoorAmbient = Color3.fromRGB(200, 205, 220)
	Lighting.FogColor = Color3.fromRGB(220, 230, 245)
	Lighting.FogEnd = 35000

	AddCC(
		"BrightCC",
		0.05,
		0.1,
		0.08,
		Color3.fromRGB(245, 248, 255)
	)

	AddBloom("BrightBloom", 0.12, 18, 1.5)

	AddAtmosphere(
		"BrightAtm",
		0.035,
		0.15,
		Color3.fromRGB(215, 225, 245),
		Color3.fromRGB(190, 205, 225),
		0.02,
		0.02
	)

	Notify("✨ Bright / Clear", "Shader applied")
end

local function DeepNight()
	ClearShaders()

	Lighting.ClockTime = 0.15
	Lighting.Brightness = 0.28
	Lighting.ExposureCompensation = -0.55
	Lighting.Ambient = Color3.fromRGB(8, 8, 25)
	Lighting.OutdoorAmbient = Color3.fromRGB(12, 15, 40)
	Lighting.FogColor = Color3.fromRGB(5, 7, 20)
	Lighting.FogEnd = 8500

	AddCC(
		"NightCC",
		-0.1,
		0.2,
		-0.08,
		Color3.fromRGB(125, 145, 255)
	)

	AddBloom("NightBloom", 0.18, 22, 1)

	AddAtmosphere(
		"NightAtm",
		0.16,
		-0.15,
		Color3.fromRGB(25, 35, 85),
		Color3.fromRGB(5, 8, 30),
		0.05,
		0.3
	)

	Notify("🌙 Deep Dark Night", "Shader applied")
end

local function Cloudy()
	ClearShaders()

	Lighting.ClockTime = 12.5
	Lighting.Brightness = 0.95
	Lighting.ExposureCompensation = -0.08
	Lighting.Ambient = Color3.fromRGB(145, 148, 155)
	Lighting.OutdoorAmbient = Color3.fromRGB(160, 162, 170)
	Lighting.FogColor = Color3.fromRGB(170, 175, 185)
	Lighting.FogEnd = 15000

	AddCC(
		"CloudCC",
		-0.12,
		-0.02,
		-0.03,
		Color3.fromRGB(215, 218, 225)
	)

	AddAtmosphere(
		"CloudAtm",
		0.19,
		0.05,
		Color3.fromRGB(170, 175, 185),
		Color3.fromRGB(135, 140, 150),
		0.03,
		0.35
	)

	Notify("☁️ Cloudy", "Shader applied")
end

local function Shore()
	ClearShaders()

	Lighting.ClockTime = 14
	Lighting.Brightness = 1.5
	Lighting.ExposureCompensation = 0.08
	Lighting.Ambient = Color3.fromRGB(165, 180, 195)
	Lighting.OutdoorAmbient = Color3.fromRGB(190, 195, 205)
	Lighting.FogColor = Color3.fromRGB(195, 215, 230)
	Lighting.FogEnd = 30000

	AddCC(
		"ShoreCC",
		0.15,
		0.08,
		0.04,
		Color3.fromRGB(215, 235, 255)
	)

	AddBloom("ShoreBloom", 0.1, 20, 1.4)

	AddAtmosphere(
		"ShoreAtm",
		0.075,
		0.1,
		Color3.fromRGB(170, 215, 240),
		Color3.fromRGB(235, 205, 175),
		0.12,
		0.12
	)

	Notify("🏖️ Shore", "Shader applied")
end

--==================================================
-- GUI
--==================================================

local Old = PlayerGui:FindFirstChild("NexusHub")
if Old then
	Old:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NexusHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = PlayerGui

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(270, 390)
Main.Position = UDim2.new(1, 20, 0, 18)
Main.BackgroundColor3 = C.BG
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = ScreenGui

Round(Main, 18)
Stroke(Main, C.PURPLE, 1.5, 0)

--==================================================
-- TOP BAR
--==================================================

local Top = Instance.new("Frame")
Top.Size = UDim2.new(1, 0, 0, 45)
Top.BackgroundColor3 = C.PANEL
Top.BorderSizePixel = 0
Top.Active = true
Top.Parent = Main

Round(Top, 18)

local Logo = Instance.new("TextLabel")
Logo.Size = UDim2.fromOffset(35, 35)
Logo.Position = UDim2.fromOffset(7, 5)
Logo.BackgroundColor3 = C.PURPLE
Logo.Text = "N"
Logo.TextColor3 = Color3.new(1, 1, 1)
Logo.Font = Enum.Font.GothamBlack
Logo.TextSize = 20
Logo.Parent = Top

Round(Logo, 11)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -115, 0, 23)
Title.Position = UDim2.fromOffset(48, 3)
Title.BackgroundTransparency = 1
Title.Text = "Nexus Hub"
Title.TextColor3 = C.TEXT
Title.Font = Enum.Font.GothamBold
Title.TextSize = 17
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Top

local Version = Instance.new("TextLabel")
Version.Size = UDim2.new(1, -115, 0, 15)
Version.Position = UDim2.fromOffset(49, 25)
Version.BackgroundTransparency = 1
Version.Text = "Shader Edition • v1.0"
Version.TextColor3 = C.DIM
Version.Font = Enum.Font.Gotham
Version.TextSize = 9
Version.TextXAlignment = Enum.TextXAlignment.Left
Version.Parent = Top

local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.fromOffset(29, 25)
Minimize.Position = UDim2.new(1, -64, 0, 9)
Minimize.BackgroundColor3 = C.BUTTON
Minimize.Text = "−"
Minimize.TextColor3 = C.TEXT
Minimize.Font = Enum.Font.GothamBold
Minimize.TextSize = 17
Minimize.AutoButtonColor = false
Minimize.Parent = Top

Round(Minimize, 7)

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(29, 25)
Close.Position = UDim2.new(1, -32, 0, 9)
Close.BackgroundColor3 = C.BUTTON
Close.Text = "×"
Close.TextColor3 = C.TEXT
Close.Font = Enum.Font.GothamBold
Close.TextSize = 17
Close.AutoButtonColor = false
Close.Parent = Top

Round(Close, 7)

--==================================================
-- BUTTON ANIMATION
--==================================================

local function ButtonHover(Button)
	local NormalSize = Button.Size

	Button.MouseEnter:Connect(function()
		Tween(Button, AnimFast, {
			BackgroundColor3 = C.HOVER,
			Size = UDim2.new(
				NormalSize.X.Scale,
				NormalSize.X.Offset + 2,
				NormalSize.Y.Scale,
				NormalSize.Y.Offset + 1
			)
		})
	end)

	Button.MouseLeave:Connect(function()
		Tween(Button, AnimFast, {
			BackgroundColor3 = C.BUTTON,
			Size = NormalSize
		})
	end)

	Button.MouseButton1Down:Connect(function()
		Tween(Button, TweenInfo.new(
			0.07,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		), {
			BackgroundColor3 = C.PRESSED,
			Size = UDim2.new(
				NormalSize.X.Scale,
				NormalSize.X.Offset - 3,
				NormalSize.Y.Scale,
				NormalSize.Y.Offset - 2
			)
		})
	end)

	Button.MouseButton1Up:Connect(function()
		Tween(Button, AnimFast, {
			BackgroundColor3 = C.HOVER,
			Size = UDim2.new(
				NormalSize.X.Scale,
				NormalSize.X.Offset + 2,
				NormalSize.Y.Scale,
				NormalSize.Y.Offset + 1
			)
		})
	end)
end

ButtonHover(Minimize)
ButtonHover(Close)

--==================================================
-- SCROLLING AREA
--==================================================

local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -12, 1, -55)
Scroll.Position = UDim2.fromOffset(6, 51)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 3
Scroll.ScrollBarImageColor3 = C.PURPLE
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.CanvasSize = UDim2.new()
Scroll.Parent = Main

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 6)
Padding.PaddingBottom = UDim.new(0, 8)
Padding.PaddingLeft = UDim.new(0, 3)
Padding.PaddingRight = UDim.new(0, 3)
Padding.Parent = Scroll

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 7)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = Scroll

local Header = Instance.new("TextLabel")
Header.Size = UDim2.new(1, 0, 0, 25)
Header.BackgroundTransparency = 1
Header.Text = "GRAPHICS & EFFECTS"
Header.TextColor3 = C.PURPLE
Header.Font = Enum.Font.GothamBold
Header.TextSize = 11
Header.TextXAlignment = Enum.TextXAlignment.Left
Header.LayoutOrder = 1
Header.Parent = Scroll

--==================================================
-- SHADER BUTTON
--==================================================

local function CreateShaderButton(Text, Callback, Order)
	local Button = Instance.new("TextButton")

	Button.Size = UDim2.new(1, 0, 0, 43)
	Button.BackgroundColor3 = C.BUTTON
	Button.BackgroundTransparency = 0
	Button.BorderSizePixel = 0
	Button.Text = Text
	Button.TextColor3 = C.TEXT
	Button.Font = Enum.Font.GothamSemibold
	Button.TextSize = 14
	Button.TextXAlignment = Enum.TextXAlignment.Left
	Button.AutoButtonColor = false
	Button.LayoutOrder = Order
	Button.Parent = Scroll

	Round(Button, 10)

	local ButtonStroke = Stroke(
		Button,
		C.PURPLE,
		1,
		0.78
	)

	Button.MouseEnter:Connect(function()
		Tween(Button, AnimSmooth, {
			BackgroundColor3 = C.HOVER
		})

		Tween(ButtonStroke, AnimSmooth, {
			Transparency = 0.15
		})
	end)

	Button.MouseLeave:Connect(function()
		Tween(Button, AnimSmooth, {
			BackgroundColor3 = C.BUTTON
		})

		Tween(ButtonStroke, AnimSmooth, {
			Transparency = 0.78
		})
	end)

	Button.MouseButton1Down:Connect(function()
		Tween(Button, TweenInfo.new(
			0.08,
			Enum.EasingStyle.Quad,
			Enum.EasingDirection.Out
		), {
			BackgroundColor3 = C.PRESSED,
			Size = UDim2.new(1, -4, 0, 40)
		})
	end)

	Button.MouseButton1Up:Connect(function()
		Tween(Button, AnimFast, {
			BackgroundColor3 = C.HOVER,
			Size = UDim2.new(1, 0, 0, 43)
		})
	end)

	Button.MouseButton1Click:Connect(function()
		-- Small press animation before applying shader
		Tween(Button, AnimFast, {
			BackgroundColor3 = C.PURPLE
		})

		task.delay(0.1, function()
			pcall(Callback)
		end)

		task.delay(0.25, function()
			if Button.Parent then
				Tween(Button, AnimSmooth, {
					BackgroundColor3 = C.BUTTON
				})
			end
		end)
	end)

	return Button
end

CreateShaderButton("☀️  Classic / Day", ClassicDay, 2)
CreateShaderButton("🌅  Sunset", Sunset, 3)
CreateShaderButton("✨  Bright / Clear", BrightClear, 4)
CreateShaderButton("🌙  Deep Dark Night", DeepNight, 5)
CreateShaderButton("☁️  Cloudy", Cloudy, 6)
CreateShaderButton("🏖️  Shore", Shore, 7)

--==================================================
-- DRAG SYSTEM
--==================================================

local Dragging = false
local DragStart = nil
local StartPosition = nil

Top.InputBegan:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton1
		or Input.UserInputType == Enum.UserInputType.Touch then

		Dragging = true
		DragStart = Input.Position
		StartPosition = Main.Position
	end
end)

UserInputService.InputEnded:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton1
		or Input.UserInputType == Enum.UserInputType.Touch then

		Dragging = false
	end
end)

UserInputService.InputChanged:Connect(function(Input)
	if not Dragging then
		return
	end

	if Input.UserInputType == Enum.UserInputType.MouseMovement
		or Input.UserInputType == Enum.UserInputType.Touch then

		local Delta = Input.Position - DragStart

		-- Smooth drag interpolation
		local TargetPosition = UDim2.new(
			StartPosition.X.Scale,
			StartPosition.X.Offset + Delta.X,
			StartPosition.Y.Scale,
			StartPosition.Y.Offset + Delta.Y
		)

		Main.Position = Main.Position:Lerp(TargetPosition, 0.35)
	end
end)

--==================================================
-- RESTORE BUTTON
--==================================================

local Restore = Instance.new("TextButton")
Restore.Size = UDim2.fromOffset(46, 46)
Restore.Position = UDim2.new(1, -60, 0, 18)
Restore.BackgroundColor3 = C.BG
Restore.Text = "N"
Restore.TextColor3 = C.PURPLE
Restore.Font = Enum.Font.GothamBold
Restore.TextSize = 21
Restore.AutoButtonColor = false
Restore.Visible = false
Restore.Parent = ScreenGui

Round(Restore, 23)
Stroke(Restore, C.PURPLE, 1.5)

Restore.MouseEnter:Connect(function()
	Tween(Restore, AnimFast, {
		BackgroundColor3 = C.HOVER,
		Size = UDim2.fromOffset(50, 50)
	})
end)

Restore.MouseLeave:Connect(function()
	Tween(Restore, AnimFast, {
		BackgroundColor3 = C.BG,
		Size = UDim2.fromOffset(46, 46)
	})
end)

Restore.MouseButton1Down:Connect(function()
	Tween(Restore, AnimFast, {
		Size = UDim2.fromOffset(43, 43)
	})
end)

Restore.MouseButton1Up:Connect(function()
	Tween(Restore, AnimPop, {
		Size = UDim2.fromOffset(46, 46)
	})
end)

--==================================================
-- MINIMIZE
--==================================================

local function MinimizeUI()
	if not Main.Visible then
		return
	end

	Tween(Main, AnimClose, {
		Position = UDim2.new(1, 20, 0, 18),
		Size = UDim2.fromOffset(0, 390)
	})

	task.wait(0.25)

	Main.Visible = false
	Main.Size = UDim2.fromOffset(270, 390)

	Restore.Visible = true
	Restore.Size = UDim2.fromOffset(0, 0)

	Tween(Restore, AnimPop, {
		Size = UDim2.fromOffset(46, 46)
	})
end

Minimize.MouseButton1Click:Connect(MinimizeUI)

--==================================================
-- RESTORE
--==================================================

local function RestoreUI()
	if Main.Visible then
		return
	end

	Restore.Visible = false

	Main.Visible = true
	Main.Position = UDim2.new(1, 20, 0, 18)
	Main.Size = UDim2.fromOffset(0, 390)

	Tween(Main, AnimPop, {
		Position = UDim2.new(1, -280, 0, 18),
		Size = UDim2.fromOffset(270, 390)
	})
end

Restore.MouseButton1Click:Connect(RestoreUI)

--==================================================
-- CLOSE
--==================================================

Close.MouseButton1Click:Connect(function()

	Tween(Main, AnimClose, {
		Position = UDim2.new(1, 20, 0, 18),
		Size = UDim2.fromOffset(0, 390)
	})

	task.wait(0.3)

	ClearShaders()
	ScreenGui:Destroy()
end)

--==================================================
-- H = HIDE / SHOW
--==================================================

UserInputService.InputBegan:Connect(function(Input, Processed)
	if Processed then
		return
	end

	if Input.KeyCode == Enum.KeyCode.H then

		if Main.Visible then

			Tween(Main, AnimClose, {
				Position = UDim2.new(1, 20, 0, 18)
			})

			task.wait(0.22)

			Main.Visible = false

			Restore.Visible = true
			Restore.Size = UDim2.fromOffset(0, 0)

			Tween(Restore, AnimPop, {
				Size = UDim2.fromOffset(46, 46)
			})

		else

			RestoreUI()
		end
	end
end)

--==================================================
-- INITIAL OPEN ANIMATION
--==================================================

Main.Position = UDim2.new(1, 20, 0, 18)
Main.Size = UDim2.fromOffset(0, 390)

task.wait(0.08)

Tween(Main, AnimPop, {
	Position = UDim2.new(1, -280, 0, 18),
	Size = UDim2.fromOffset(270, 390)
})
