-- =======================================================
-- NEXUS SHADER V4 - CRIMSON & PURPLE GRADIENT EDITION
-- Features: N Logo, Half Purple Half Crimson Style, Exact Layout
-- List of Shaders: Daytime, Sunset, Night, Cloudy, Shore, Cinematic
-- =======================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local TargetParent = (gethui and gethui()) or LocalPlayer:WaitForChild("PlayerGui")

if TargetParent:FindFirstChild("NexusShaderV4Canvas") then
    TargetParent.NexusShaderV4Canvas:Destroy()
end

local function clearEffects()
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("PostEffect") or v:IsA("Atmosphere") then v:Destroy() end
    end
end

-- ==========================================
-- 1. HIGH-END VISUAL SHADER FUNCTIONS
-- ==========================================

local function applyDaytime()
    clearEffects()
    Lighting.ClockTime = 14.0
    Lighting.Brightness = 3.5
    Lighting.Ambient = Color3.fromRGB(130, 130, 140)
    Lighting.OutdoorAmbient = Color3.fromRGB(220, 220, 230)
    Lighting.GlobalShadows = true
    Lighting.ShadowSoftness = 0.2
    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Contrast = 0.15 ; cc.Saturation = 0.25
    local bloom = Instance.new("BloomEffect", Lighting)
    bloom.Intensity = 0.5 ; bloom.Size = 20
end

local function applySunset()
    clearEffects()
    Lighting.ClockTime = 17.45
    Lighting.Brightness = 4.0
    Lighting.GlobalShadows = true
    Lighting.ShadowSoftness = 0.0
    Lighting.EnvironmentDiffuseScale = 1.0 ; Lighting.EnvironmentSpecularScale = 1.0
    Lighting.Ambient = Color3.fromRGB(45, 30, 40)
    Lighting.OutdoorAmbient = Color3.fromRGB(110, 65, 55)
    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Contrast = 0.35 ; cc.Saturation = 0.55 ; cc.TintColor = Color3.fromRGB(255, 155, 90)
    local bloom = Instance.new("BloomEffect", Lighting)
    bloom.Intensity = 1.2 ; bloom.Size = 35 ; bloom.Threshold = 0.5
    local rays = Instance.new("SunRaysEffect", Lighting)
    rays.Intensity = 0.35 ; rays.Spread = 0.8
    local atm = Instance.new("Atmosphere", Lighting)
    atm.Density = 0.35 ; atm.Color = Color3.fromRGB(255, 100, 40) ; atm.Glare = 1.8 ; atm.Haze = 2.0
end

local function applyNight()
    clearEffects()
    Lighting.ClockTime = 0.0
    Lighting.Brightness = 1.8
    Lighting.GlobalShadows = true
    Lighting.ShadowSoftness = 0.2
    Lighting.EnvironmentDiffuseScale = 0.8 ; Lighting.EnvironmentSpecularScale = 1.0
    Lighting.Ambient = Color3.fromRGB(15, 15, 30)
    Lighting.OutdoorAmbient = Color3.fromRGB(30, 30, 50)
    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Contrast = 0.35 ; cc.Saturation = 0.4 ; cc.TintColor = Color3.fromRGB(175, 185, 255)
    local bloom = Instance.new("BloomEffect", Lighting)
    bloom.Intensity = 1.5 ; bloom.Size = 40 ; bloom.Threshold = 0.25
    local atm = Instance.new("Atmosphere", Lighting)
    atm.Density = 0.4 ; atm.Color = Color3.fromRGB(10, 10, 25) ; atm.Haze = 1.5
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
    cc.Contrast = 0.1 ; cc.Saturation = -0.15 ; cc.TintColor = Color3.fromRGB(210, 215, 225)
    local atm = Instance.new("Atmosphere", Lighting)
    atm.Density = 0.55 ; atm.Color = Color3.fromRGB(180, 185, 195) ; atm.Haze = 3.0
end

local function applyShore()
    clearEffects()
    Lighting.ClockTime = 16.8
    Lighting.Brightness = 4.5
    Lighting.GlobalShadows = true
    Lighting.EnvironmentDiffuseScale = 1.0 ; Lighting.EnvironmentSpecularScale = 1.0
    Lighting.Ambient = Color3.fromRGB(50, 40, 50) ; Lighting.OutdoorAmbient = Color3.fromRGB(130, 85, 65)
    pcall(function()
        local terrain = Workspace:FindFirstChildOfClass("Terrain")
        if terrain then
            terrain.WaterWaveSize = 0.4 ; terrain.WaterWaveSpeed = 24
            terrain.WaterTransparency = 0.9 ; terrain.WaterColor = Color3.fromRGB(245, 125, 70)
        end
    end)
    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Contrast = 0.4 ; cc.Saturation = 0.65 ; cc.TintColor = Color3.fromRGB(255, 160, 95)
    local bloom = Instance.new("BloomEffect", Lighting)
    bloom.Intensity = 1.3 ; bloom.Size = 35
    local rays = Instance.new("SunRaysEffect", Lighting)
    rays.Intensity = 0.45 ; rays.Spread = 0.85
end

local function applyCinematic()
    clearEffects()
    Lighting.ClockTime = 16.2
    Lighting.Brightness = 3.8
    Lighting.GlobalShadows = true
    Lighting.ShadowSoftness = 0.1
    Lighting.EnvironmentDiffuseScale = 1.0 ; Lighting.EnvironmentSpecularScale = 1.0
    Lighting.Ambient = Color3.fromRGB(35, 35, 45)
    Lighting.OutdoorAmbient = Color3.fromRGB(115, 100, 90)
    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Brightness = 0.03 ; cc.Contrast = 0.42 ; cc.Saturation = 0.48 ; cc.TintColor = Color3.fromRGB(255, 235, 205)
    local bloom = Instance.new("BloomEffect", Lighting)
    bloom.Intensity = 1.1 ; bloom.Size = 32 ; bloom.Threshold = 0.45
    local rays = Instance.new("SunRaysEffect", Lighting)
    rays.Intensity = 0.3 ; rays.Spread = 0.8
    local dof = Instance.new("DepthOfFieldEffect", Lighting)
    dof.FarIntensity = 0.65 ; dof.FocusDistance = 25 ; dof.InFocusRadius = 45 ; dof.NearIntensity = 0.0
end

-- ==========================================
-- 2. CRIMSON PURPLE GRADIENT GUI SYSTEM
-- ==========================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NexusShaderV4Canvas"
ScreenGui.Parent = TargetParent
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainFrame.BackgroundTransparency = 0.15
MainFrame.Position = UDim2.new(0.08, 0, 0.15, 0)
MainFrame.Size = UDim2.new(0, 240, 0, 280)
MainFrame.Active = true

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 14)

local FrameGradient = Instance.new("UIGradient", MainFrame)
FrameGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.0, Color3.fromRGB(80, 15, 110)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(50, 10, 70)),
    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(160, 10, 35))
})
FrameGradient.Rotation = 45

local NLogo = Instance.new("TextLabel")
NLogo.Parent = MainFrame
NLogo.BackgroundTransparency = 1
NLogo.Position = UDim2.new(0, 16, 0, 12)
NLogo.Size = UDim2.new(0, 25, 0, 30)
NLogo.Font = Enum.Font.GothamBlack
NLogo.Text = "N"
NLogo.TextColor3 = Color3.fromRGB(255, 220, 100)
NLogo.TextSize = 22
NLogo.TextXAlignment = Enum.TextXAlignment.Left

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 42, 0, 12)
TitleLabel.Size = UDim2.new(1, -75, 0, 30)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Nexus shader V4"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 16
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton")
CloseBtn.Parent = MainFrame
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Position = UDim2.new(1, -32, 0, 14)
CloseBtn.Size = UDim2.new(0, 22, 0, 22)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 11
CloseBtn.ZIndex = 10

local CloseCorner = Instance.new("UICorner", CloseBtn)
CloseCorner.CornerRadius = UDim.new(0, 6)

local CloseGradient = Instance.new("UIGradient", CloseBtn)
CloseGradient.Color = ColorSequence.new(Color3.fromRGB(220, 40, 40), Color3.fromRGB(140, 20, 20))

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Parent = MainFrame
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.Position = UDim2.new(0, 12, 0, 55)
ScrollFrame.Size = UDim2.new(1, -24, 1, -65)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 345)
ScrollFrame.ScrollBarThickness = 3
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(200, 200, 200)

local UIListLayout = Instance.new("UIListLayout", ScrollFrame)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

local function createMenuButton(text, order, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = ScrollFrame
    btn.BackgroundColor3 = Color3.fromRGB(30, 25, 35)
    btn.BackgroundTransparency = 0.2
    btn.Size = UDim2.new(1, 0, 0, 48)
    btn.Font = Enum.Font.GothamMedium
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.LayoutOrder = order
    btn.ZIndex = 5
    
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 10)
    
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.fromRGB(180, 30, 50)
    stroke.Thickness = 1
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- ALL 6 BUTTONS
createMenuButton("Daytime",   1, applyDaytime)
createMenuButton("Sunset",    2, applySunset)
createMenuButton("Night",     3, applyNight)
createMenuButton("Cloudy",    4, applyCloudy)
createMenuButton("Shore",     5, applyShore)
createMenuButton("Cinematic", 6, applyCinematic)

-- ==========================================
-- 3. DRAGGING SYSTEM — MOBILE + PC
-- ==========================================
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(
        startPos.X.Scale, startPos.X.Offset + delta.X,
        startPos.Y.Scale, startPos.Y.Offset + delta.Y
    )
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local objects = ScreenGui:GetGuiObjectsAtPosition(input.Position.X, input.Position.Y)
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
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- CLOSE
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
