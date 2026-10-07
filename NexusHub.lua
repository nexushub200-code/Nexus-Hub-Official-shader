local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local TargetParent = (gethui and gethui()) or LocalPlayer:WaitForChild("PlayerGui")

if TargetParent:FindFirstChild("NexusShaderV5Canvas") then
    TargetParent.NexusShaderV5Canvas:Destroy()
end

local function clearEffects()
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("PostEffect") or v:IsA("Atmosphere") then
            v:Destroy()
        end
    end
end

local function applyDaytime()
    clearEffects()
    Lighting.ClockTime = 14.0
    Lighting.Brightness = 3.5
    Lighting.Ambient = Color3.fromRGB(130, 130, 140)
    Lighting.OutdoorAmbient = Color3.fromRGB(220, 220, 230)
    Lighting.GlobalShadows = true
    Lighting.ShadowSoftness = 0.2

    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Contrast = 0.15
    cc.Saturation = 0.25

    local bloom = Instance.new("BloomEffect", Lighting)
    bloom.Intensity = 0.5
    bloom.Size = 20
end

local function applySunset()
    clearEffects()
    Lighting.ClockTime = 17.45
    Lighting.Brightness = 4.0
    Lighting.GlobalShadows = true
    Lighting.ShadowSoftness = 0.0
    Lighting.EnvironmentDiffuseScale = 1.0
    Lighting.EnvironmentSpecularScale = 1.0
    Lighting.Ambient = Color3.fromRGB(45, 30, 40)
    Lighting.OutdoorAmbient = Color3.fromRGB(110, 65, 55)

    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Contrast = 0.35
    cc.Saturation = 0.55
    cc.TintColor = Color3.fromRGB(255, 155, 90)

    local bloom = Instance.new("BloomEffect", Lighting)
    bloom.Intensity = 1.2
    bloom.Size = 35
    bloom.Threshold = 0.5

    local rays = Instance.new("SunRaysEffect", Lighting)
    rays.Intensity = 0.35
    rays.Spread = 0.8

    local atm = Instance.new("Atmosphere", Lighting)
    atm.Density = 0.35
    atm.Color = Color3.fromRGB(255, 100, 40)
    atm.Glare = 1.8
    atm.Haze = 2.0
end

local function applyNight()
    clearEffects()
    Lighting.ClockTime = 0.0
    Lighting.Brightness = 1.8
    Lighting.GlobalShadows = true
    Lighting.ShadowSoftness = 0.2
    Lighting.EnvironmentDiffuseScale = 0.8
    Lighting.EnvironmentSpecularScale = 1.0
    Lighting.Ambient = Color3.fromRGB(15, 15, 30)
    Lighting.OutdoorAmbient = Color3.fromRGB(30, 30, 50)

    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Contrast = 0.35
    cc.Saturation = 0.4
    cc.TintColor = Color3.fromRGB(175, 185, 255)

    local bloom = Instance.new("BloomEffect", Lighting)
    bloom.Intensity = 1.5
    bloom.Size = 40
    bloom.Threshold = 0.25

    local atm = Instance.new("Atmosphere", Lighting)
    atm.Density = 0.4
    atm.Color = Color3.fromRGB(10, 10, 25)
    atm.Haze = 1.5
end

local function applyCloudy()
    clearEffects()
    Lighting.ClockTime = 12.0
    Lighting.Brightness = 1.5
    Lighting.GlobalShadows = true
    Lighting.ShadowSoftness = 0.9
    Lighting.Ambient = Color3.fromRGB(100, 105, 115)
    Lighting.OutdoorAmbient = Color3.fromRGB(130, 135, 145)

    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Contrast = 0.1
    cc.Saturation = -0.15
    cc.TintColor = Color3.fromRGB(210, 215, 225)

    local atm = Instance.new("Atmosphere", Lighting)
    atm.Density = 0.55
    atm.Color = Color3.fromRGB(180, 185, 195)
    atm.Haze = 3.0
end

local function applyShore()
    clearEffects()
    Lighting.ClockTime = 16.8
    Lighting.Brightness = 4.5
    Lighting.GlobalShadows = true
    Lighting.EnvironmentDiffuseScale = 1.0
    Lighting.EnvironmentSpecularScale = 1.0
    Lighting.Ambient = Color3.fromRGB(50, 40, 50)
    Lighting.OutdoorAmbient = Color3.fromRGB(130, 85, 65)

    pcall(function()
        local terrain = Workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            terrain.WaterWaveSize = 0.4
            terrain.WaterWaveSpeed = 24
            terrain.WaterTransparency = 0.9
            terrain.WaterColor = Color3.fromRGB(245, 125, 70)
        end
    end)

    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Contrast = 0.4
    cc.Saturation = 0.65
    cc.TintColor = Color3.fromRGB(255, 160, 95)

    local bloom = Instance.new("BloomEffect", Lighting)
    bloom.Intensity = 1.3
    bloom.Size = 35

    local rays = Instance.new("SunRaysEffect", Lighting)
    rays.Intensity = 0.45
    rays.Spread = 0.85
end

local function applyCinematic()
    clearEffects()
    Lighting.ClockTime = 16.2
    Lighting.Brightness = 3.8
    Lighting.GlobalShadows = true
    Lighting.ShadowSoftness = 0.1
    Lighting.EnvironmentDiffuseScale = 1.0
    Lighting.EnvironmentSpecularScale = 1.0
    Lighting.Ambient = Color3.fromRGB(35, 35, 45)
    Lighting.OutdoorAmbient = Color3.fromRGB(115, 100, 90)

    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Brightness = 0.03
    cc.Contrast = 0.42
    cc.Saturation = 0.48
    cc.TintColor = Color3.fromRGB(255, 235, 205)

    local bloom = Instance.new("BloomEffect", Lighting)
    bloom.Intensity = 1.1
    bloom.Size = 32
    bloom.Threshold = 0.45

    local rays = Instance.new("SunRaysEffect", Lighting)
    rays.Intensity = 0.3
    rays.Spread = 0.8

    local dof = Instance.new("DepthOfFieldEffect", Lighting)
    dof.FarIntensity = 0.65
    dof.FocusDistance = 25
    dof.InFocusRadius = 45
    dof.NearIntensity = 0.0
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NexusShaderV5Canvas"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = TargetParent

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.BackgroundTransparency = 0.08
MainFrame.Position = UDim2.new(0.08, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 250, 0, 305)
MainFrame.Active = true
MainFrame.ClipsDescendants = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

local FrameGradient = Instance.new("UIGradient")
FrameGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(105, 20, 145)),
    ColorSequenceKeypoint.new(0.48, Color3.fromRGB(48, 12, 72)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(175, 15, 45))
})
FrameGradient.Rotation = 45
FrameGradient.Parent = MainFrame

local FrameStroke = Instance.new("UIStroke")
FrameStroke.Color = Color3.fromRGB(190, 70, 255)
FrameStroke.Transparency = 0.35
FrameStroke.Thickness = 1
FrameStroke.Parent = MainFrame

local NLogoBox = Instance.new("Frame")
NLogoBox.Name = "NLogoBox"
NLogoBox.Parent = MainFrame
NLogoBox.BackgroundColor3 = Color3.fromRGB(55, 20, 70)
NLogoBox.BackgroundTransparency = 0.12
NLogoBox.Position = UDim2.new(0, 15, 0, 11)
NLogoBox.Size = UDim2.new(0, 31, 0, 31)
NLogoBox.ZIndex = 10

local NLogoCorner = Instance.new("UICorner")
NLogoCorner.CornerRadius = UDim.new(0, 9)
NLogoCorner.Parent = NLogoBox

local NLogoStroke = Instance.new("UIStroke")
NLogoStroke.Color = Color3.fromRGB(220, 95, 255)
NLogoStroke.Transparency = 0.05
NLogoStroke.Thickness = 1.2
NLogoStroke.Parent = NLogoBox

local NLogoGradient = Instance.new("UIGradient")
NLogoGradient.Color = ColorSequence.new(
    Color3.fromRGB(105, 35, 145),
    Color3.fromRGB(180, 25, 55)
)
NLogoGradient.Rotation = 45
NLogoGradient.Parent = NLogoBox

local NLogo = Instance.new("TextLabel")
NLogo.Name = "N"
NLogo.Parent = NLogoBox
NLogo.BackgroundTransparency = 1
NLogo.Size = UDim2.new(1, 0, 1, 0)
NLogo.Font = Enum.Font.GothamBlack
NLogo.Text = "N"
NLogo.TextColor3 = Color3.fromRGB(255, 220, 100)
NLogo.TextSize = 19
NLogo.TextXAlignment = Enum.TextXAlignment.Center
NLogo.TextYAlignment = Enum.TextYAlignment.Center
NLogo.ZIndex = 11

local LogoTextStroke = Instance.new("UIStroke")
LogoTextStroke.Color = Color3.fromRGB(255, 150, 50)
LogoTextStroke.Transparency = 0.5
LogoTextStroke.Thickness = 0.6
LogoTextStroke.Parent = NLogo

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 53, 0, 10)
TitleLabel.Size = UDim2.new(1, -95, 0, 25)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Nexus Shader V5"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 16
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local SubtitleLabel = Instance.new("TextLabel")
SubtitleLabel.Name = "Subtitle"
SubtitleLabel.Parent = MainFrame
SubtitleLabel.BackgroundTransparency = 1
SubtitleLabel.Position = UDim2.new(0, 54, 0, 31)
SubtitleLabel.Size = UDim2.new(1, -95, 0, 17)
SubtitleLabel.Font = Enum.Font.GothamMedium
SubtitleLabel.Text = "by Kingflame / nexushub team"
SubtitleLabel.TextColor3 = Color3.fromRGB(225, 205, 235)
SubtitleLabel.TextSize = 8
SubtitleLabel.TextTransparency = 0.05
SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "Close"
CloseBtn.Parent = MainFrame
CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 25, 45)
CloseBtn.BackgroundTransparency = 0.05
CloseBtn.Position = UDim2.new(1, -34, 0, 13)
CloseBtn.Size = UDim2.new(0, 22, 0, 22)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 15
CloseBtn.AutoButtonColor = false
CloseBtn.ZIndex = 20

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 7)
CloseCorner.Parent = CloseBtn

local CloseGradient = Instance.new("UIGradient")
CloseGradient.Color = ColorSequence.new(
    Color3.fromRGB(235, 50, 65),
    Color3.fromRGB(125, 15, 30)
)
CloseGradient.Rotation = 90
CloseGradient.Parent = CloseBtn

local CloseStroke = Instance.new("UIStroke")
CloseStroke.Color = Color3.fromRGB(255, 100, 120)
CloseStroke.Transparency = 0.35
CloseStroke.Parent = CloseBtn

local HeaderLine = Instance.new("Frame")
HeaderLine.Parent = MainFrame
HeaderLine.BackgroundColor3 = Color3.fromRGB(220, 80, 255)
HeaderLine.BackgroundTransparency = 0.35
HeaderLine.BorderSizePixel = 0
HeaderLine.Position = UDim2.new(0, 15, 0, 51)
HeaderLine.Size = UDim2.new(1, -30, 0, 1)

local HeaderGradient = Instance.new("UIGradient")
HeaderGradient.Color = ColorSequence.new(
    Color3.fromRGB(150, 50, 255),
    Color3.fromRGB(255, 50, 80)
)
HeaderGradient.Parent = HeaderLine

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Name = "ShaderList"
ScrollFrame.Parent = MainFrame
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.BorderSizePixel = 0
ScrollFrame.Position = UDim2.new(0, 12, 0, 62)
ScrollFrame.Size = UDim2.new(1, -24, 1, -73)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollFrame.ScrollBarThickness = 3
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(215, 170, 255)
ScrollFrame.ScrollBarImageTransparency = 0.25
ScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
ScrollFrame.ZIndex = 4

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ScrollFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

local ButtonNormal = Color3.fromRGB(42, 28, 55)
local ButtonHover = Color3.fromRGB(65, 35, 78)
local ButtonPressed = Color3.fromRGB(82, 35, 88)

local ButtonTween = TweenInfo.new(
    0.18,
    Enum.EasingStyle.Quint,
    Enum.EasingDirection.Out
)

local PressTween = TweenInfo.new(
    0.10,
    Enum.EasingStyle.Quad,
    Enum.EasingDirection.Out
)

local function createMenuButton(text, order, callback)
    local btn = Instance.new("TextButton")
    btn.Name = text .. "Button"
    btn.Parent = ScrollFrame
    btn.BackgroundColor3 = ButtonNormal
    btn.BackgroundTransparency = 0.02
    btn.Size = UDim2.new(1, 0, 0, 44)
    btn.Font = Enum.Font.GothamMedium
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    btn.TextTransparency = 0
    btn.LayoutOrder = order
    btn.AutoButtonColor = false
    btn.ZIndex = 5

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 11)
    btnCorner.Parent = btn

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(190, 55, 90)
    stroke.Transparency = 0.15
    stroke.Thickness = 1
    stroke.Parent = btn

    local buttonGradient = Instance.new("UIGradient")
    buttonGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(55, 30, 72)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(42, 28, 58)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(65, 24, 48))
    })
    buttonGradient.Rotation = 20
    buttonGradient.Parent = btn

    local originalSize = btn.Size

    btn.MouseEnter:Connect(function()
        TweenService:Create(
            btn,
            ButtonTween,
            {
                BackgroundColor3 = ButtonHover
            }
        ):Play()

        TweenService:Create(
            stroke,
            ButtonTween,
            {
                Color = Color3.fromRGB(220, 85, 255),
                Transparency = 0
            }
        ):Play()

        TweenService:Create(
            btn,
            ButtonTween,
            {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }
        ):Play()
    end)

    btn.MouseLeave:Connect(function()
        TweenService:Create(
            btn,
            ButtonTween,
            {
                BackgroundColor3 = ButtonNormal,
                Size = originalSize
            }
        ):Play()

        TweenService:Create(
            stroke,
            ButtonTween,
            {
                Color = Color3.fromRGB(190, 55, 90),
                Transparency = 0.15
            }
        ):Play()
    end)

    btn.MouseButton1Down:Connect(function()
        TweenService:Create(
            btn,
            PressTween,
            {
                BackgroundColor3 = ButtonPressed,
                Size = UDim2.new(1, -4, 0, 42)
            }
        ):Play()
    end)

    btn.MouseButton1Up:Connect(function()
        TweenService:Create(
            btn,
            PressTween,
            {
                BackgroundColor3 = ButtonHover,
                Size = originalSize
            }
        ):Play()
    end)

    btn.MouseButton1Click:Connect(function()
        callback()

        TweenService:Create(
            stroke,
            TweenInfo.new(0.25, Enum.EasingStyle.Quad),
            {
                Color = Color3.fromRGB(255, 100, 130)
            }
        ):Play()

        task.delay(0.25, function()
            if stroke and stroke.Parent then
                TweenService:Create(
                    stroke,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quad),
                    {
                        Color = Color3.fromRGB(190, 55, 90)
                    }
                ):Play()
            end
        end)
    end)

    return btn
end

createMenuButton("Daytime", 1, applyDaytime)
createMenuButton("Sunset", 2, applySunset)
createMenuButton("Night", 3, applyNight)
createMenuButton("Cloudy", 4, applyCloudy)
createMenuButton("Shore", 5, applyShore)
createMenuButton("Cinematic", 6, applyCinematic)

local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart

    MainFrame.Position = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        local objects = ScreenGui:GetGuiObjectsAtPosition(
            input.Position.X,
            input.Position.Y
        )

        local hitButton = false

        for _, obj in pairs(objects) do
            if obj:IsA("TextButton") or obj:IsA("ScrollingFrame") then
                hitButton = true
                break
            end
        end

        if not hitButton then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local closing = false

CloseBtn.MouseButton1Click:Connect(function()
    if closing then
        return
    end

    closing = true

    local fadeInfo = TweenInfo.new(
        0.28,
        Enum.EasingStyle.Quint,
        Enum.EasingDirection.In
    )

    TweenService:Create(
        MainFrame,
        fadeInfo,
        {
            BackgroundTransparency = 1,
            Size = UDim2.new(0, 230, 0, 285)
        }
    ):Play()

    for _, obj in pairs(MainFrame:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            TweenService:Create(
                obj,
                fadeInfo,
                {
                    TextTransparency = 1
                }
            ):Play()
        elseif obj:IsA("UIStroke") then
            TweenService:Create(
                obj,
                fadeInfo,
                {
                    Transparency = 1
                }
            ):Play()
        end
    end

    task.wait(0.3)

    if ScreenGui then
        ScreenGui:Destroy()
    end
end)

MainFrame.Size = UDim2.new(0, 220, 0, 270)
MainFrame.BackgroundTransparency = 1

for _, obj in pairs(MainFrame:GetDescendants()) do
    if obj:IsA("TextLabel") or obj:IsA("TextButton") then
        obj.TextTransparency = 1
    elseif obj:IsA("UIStroke") then
        obj.Transparency = 1
    end
end

local openTween = TweenInfo.new(
    0.45,
    Enum.EasingStyle.Quint,
    Enum.EasingDirection.Out
)

TweenService:Create(
    MainFrame,
    openTween,
    {
        Size = UDim2.new(0, 250, 0, 305),
        BackgroundTransparency = 0.08
    }
):Play()

for _, obj in pairs(MainFrame:GetDescendants()) do
    if obj:IsA("TextLabel") or obj:IsA("TextButton") then
        TweenService:Create(
            obj,
            TweenInfo.new(
                0.35,
                Enum.EasingStyle.Quint,
                Enum.EasingDirection.Out
            ),
            {
                TextTransparency = 0
            }
        ):Play()
    elseif obj:IsA("UIStroke") then
        TweenService:Create(
            obj,
            TweenInfo.new(
                0.4,
                Enum.EasingStyle.Quint,
                Enum.EasingDirection.Out
            ),
            {
                Transparency = 0.35
            }
        ):Play()
    end
end
