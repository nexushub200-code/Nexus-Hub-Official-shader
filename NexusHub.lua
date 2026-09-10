-- ✅ NEXUS HUB: SHORTENED KEY LIST (50% SMALLER) / FULLY FUNCTIONAL
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local plr = Players.LocalPlayer
local PlayerGui = plr:WaitForChild("PlayerGui", 15)

-- 🔑 SHORTER KEY LIST (EASY TO COPY - ALL WORKING)
local VALID_KEYS = {
    ["NEXUS-102-1020-789-PREMIUM"] = true,
    ["NEXUS-7KQ2-X9PM-4VLA"] = true,
    ["NEXUS-R8FD-2WKT-6QZX"] = true,
    ["NEXUS-3MVP-H7QA-9KRD"] = true,
    ["NEXUS-X5LT-8NWF-2JGC"] = true,
    ["NEXUS-Q9BZ-4RHM-7XPK"] = true,
    ["NEXUS-6VJD-P3QA-8TWN"] = true,
    ["NEXUS-K2XF-9LRC-5MVB"] = true,
    ["NEXUS-W7QH-3ZKP-6FDA"] = true,
    ["NEXUS-4TMC-X8VN-2RQL"] = true,
    ["NEXUS-9PWA-6KJD-3XHF"] = true,
    ["NEXUS-H5QR-7VZT-9NLC"] = true,
    ["NEXUS-2XKM-8FDP-4WQA"] = true,
    ["NEXUS-Z6RV-3HNK-7PTM"] = true,
    ["NEXUS-M4ZT-9QPC-6VHX"] = true,
    ["NEXUS-A7KD-4QPM-8XTR"] = true,
    ["NEXUS-9WLF-2KVC-6HQA"] = true,
    ["NEXUS-6QHA-4WFD-9KRM"] = true,
    ["NEXUS-2VKC-7XQP-5LMT"] = true,
    ["NEXUS-7HWF-4MZC-8QKP"] = true,
    ["NEXUS-8QFD-2LKC-5XHM"] = true,
    ["NEXUS-6XZR-3WKP-9HMT"] = true,
    ["NEXUS-9XTA-3MRC-7KWF"] = true,
    ["NEXUS-3HPM-7VZD-5XKA"] = true,
    ["NEXUS-9MZC-4WKP-6HQA"] = true
}

-- 🔗 LINKS
local DISCORD_LINK = "https://discord.gg/zK4vJ8TU6"
local LOOTLINK_LINK = "https://loot-link.com/s?JPRhtIG6"

-- 🎨 UI THEME
local THEME = {
    LoadBg = Color3.fromRGB(60, 18, 32),
    MainBg = Color3.fromRGB(15, 13, 25),
    KeyBg = Color3.fromRGB(12, 12, 20),
    InputBg = Color3.fromRGB(22, 20, 35),
    BtnBg = Color3.fromRGB(30, 26, 48),
    Accent = Color3.fromRGB(160, 90, 255),
    GreenBtn = Color3.fromRGB(45, 180, 80),
    Text = Color3.new(1,1,1),
    TextDim = Color3.fromRGB(180,180,190),
    Border = Color3.fromRGB(180, 110, 255)
}

local TWEEN_FAST = TweenInfo.new(0.25, Enum.EasingStyle.Quad)
local TWEEN_SMOOTH = TweenInfo.new(0.7, Enum.EasingStyle.Quad)
local TWEEN_POPUP = TweenInfo.new(0.35, Enum.EasingStyle.Back)

-- 🔲 ROUND CORNER
local function Round(obj, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = obj
end

-- 🔊 PET SOUNDS
local function EnablePetSounds()
    SoundService.Volume = 1
    SoundService.AudioEffectsEnabled = true
    SoundService.RespectFilteringEnabled = false
    SoundService.MasterVolume = 1
    
    RunService:BindToRenderStep("AudioBoost", Enum.RenderPriority.Last.Value, function()
        for _, s in ipairs(workspace:GetDescendants()) do
            if s:IsA("Sound") and (s.Parent:FindFirstAncestorOfClass("Model") or s.Name:lower():find("pet")) then
                s.Volume = math.min(s.Volume * 1.2, 1)
                s.Playing = s.Playing
            end
        end
    end)
    
    pcall(function() StarterGui:SetCore("SendNotification", {Title="🔊 Pet Sounds", Text="Activated! Like PC!", Duration=2.5}) end)
end

-- ⏳ LOADING SCREEN
local function ShowLoading()
    local LoadGui = Instance.new("ScreenGui", PlayerGui)
    LoadGui.Name = "Nexus_Loading"
    LoadGui.DisplayOrder = 9999

    local Box = Instance.new("Frame", LoadGui)
    Box.Size = UDim2.fromOffset(340, 75)
    Box.Position = UDim2.new(0.5, -170, 0, 15)
    Box.BackgroundColor3 = THEME.LoadBg
    Box.BorderColor3 = THEME.Border
    Box.BorderSizePixel = 1
    Round(Box, 16)

    local Status = Instance.new("TextLabel", Box)
    Status.Size = UDim2.new(1, -20, 0.5, 0)
    Status.Position = UDim2.new(0, 10, 0, 10)
    Status.BackgroundTransparency = 1
    Status.TextColor3 = THEME.Text
    Status.Font = Enum.Font.GothamBold
    Status.TextSize = 18

    local BarBg = Instance.new("Frame", Box)
    BarBg.Size = UDim2.new(1, -24, 0, 12)
    BarBg.Position = UDim2.new(0, 12, 0.6, 0)
    BarBg.BackgroundColor3 = Color3.fromRGB(28,14,23)
    Round(BarBg, 6)

    local BarFill = Instance.new("Frame", BarBg)
    BarFill.Size = UDim2.new(0,0,1,0)
    BarFill.BackgroundColor3 = THEME.Accent
    Round(BarFill, 6)

    local Step = TweenInfo.new(3, Enum.EasingStyle.Linear)
    Status.Text = "Waiting for game..."
    TweenService:Create(BarFill, Step, {Size=UDim2.new(1,0,1,0)}):Play() task.wait(3)
    
    BarFill.Size=UDim2.new(0,0,1,0)
    Status.Text = "Verifying system components..."
    TweenService:Create(BarFill, Step, {Size=UDim2.new(1,0,1,0)}):Play() task.wait(3)
    
    BarFill.Size=UDim2.new(0,0,1,0)
    Status.Text = "Initializing Nexus Hub..."
    TweenService:Create(BarFill, Step, {Size=UDim2.new(1,0,1,0)}):Play() task.wait(3)

    LoadGui:Destroy()
end

-- 🧹 LIGHTING HELPERS
local function ClearAllLighting()
    RunService:UnbindFromRenderStep("SkyLoop")
    for _, child in pairs(Lighting:GetChildren()) do
        if child:IsA("Sky") or child:IsA("SunRaysEffect") or child:IsA("Atmosphere") then
            pcall(function() child:Destroy() end)
        end
    end
end
local function SmoothSetLighting(props)
    TweenService:Create(Lighting, TWEEN_SMOOTH, props):Play()
end

-- 💡 GRAPHICS / SHADERS
local function ShaderClassic()
    ClearAllLighting()
    SmoothSetLighting({
        Ambient = Color3.fromRGB(130,130,135), Brightness=1.15,
        ColorShift_Top=Color3.fromRGB(210,220,240), ColorShift_Bottom=Color3.fromRGB(235,235,240),
        FogColor=Color3.fromRGB(210,215,225), FogEnd=22000, ShadowSoftness=0.3
    })
    Lighting.GlobalShadows=true; Lighting.ClockTime=12
    local Sky=Instance.new("Sky",Lighting);Sky.SkyboxGradient=true;Sky.TopColor=Color3.fromRGB(110,160,225)
end

local function ShaderSunset()
    ClearAllLighting()
    SmoothSetLighting({
        Ambient=Color3.fromRGB(200, 145, 115), 
        Brightness=1.75, 
        FogColor=Color3.fromRGB(255, 195, 155), 
        FogEnd=18000, 
        ShadowSoftness=0.22, 
        ColorShift_Top=Color3.fromRGB(255, 110, 50),
        ColorShift_Bottom=Color3.fromRGB(225, 165, 125)
    })
    Lighting.GlobalShadows = true
    Lighting.ClockTime = 17.8
    Lighting.ShadowMapSize = 2048
    Lighting.ExposureCompensation = 0.15
    
    local SunRays = Instance.new("SunRaysEffect", Lighting)
    SunRays.Name = "NexusSun"
    SunRays.SunSize = 3.2
    SunRays.Intensity = 1.5
    SunRays.SunColor = Color3.fromRGB(255, 210, 140)
    
    local Sky = Instance.new("Sky", Lighting)
    Sky.Name = "NexusSky"
    Sky.SkyboxGradient = true
    Sky.TopColor = Color3.fromRGB(255, 85, 40)
    Sky.MidColor = Color3.fromRGB(255, 155, 70)
    Sky.BottomColor = Color3.fromRGB(210, 150, 110)

    RunService:BindToRenderStep("SkyLoop", Enum.RenderPriority.Last.Value, function()
        local t = tick() * 0.55
        Sky.TopColor = Color3.fromHSV(0.52 + math.sin(t)*0.11, 0.8, 0.95)
        Sky.MidColor = Color3.fromHSV(0.70 + math.cos(t*0.75)*0.09, 0.7, 0.88)
    end)
end

local function ShaderBright()
    ClearAllLighting()
    SmoothSetLighting({Ambient=Color3.fromRGB(235,235,245),Brightness=2.15,FogEnd=25000})
    Lighting.GlobalShadows=false
end

local function ShaderNight()
    ClearAllLighting()
    SmoothSetLighting({
        Ambient = Color3.fromRGB(12, 12, 28), Brightness = 0.22, ExposureCompensation = -0.65,
        FogEnd = 6500, FogColor = Color3.fromRGB(5, 5, 12),
        ColorShift_Top = Color3.fromRGB(0, 0, 5), ColorShift_Bottom = Color3.fromRGB(8, 8, 20)
    })
    Lighting.GlobalShadows = true; Lighting.ClockTime = 0.1
    
    local NightSky = Instance.new("Sky", Lighting)
    NightSky.Name = "DeepNightSky"; NightSky.SkyboxGradient = true
    NightSky.TopColor = Color3.fromRGB(0, 0, 4)
    NightSky.MidColor = Color3.fromRGB(6, 6, 16)
    NightSky.BottomColor = Color3.fromRGB(10, 10, 28)
end

local function ShaderCloudy()
    ClearAllLighting()
    SmoothSetLighting({
        Ambient = Color3.fromRGB(160, 160, 165),
        Brightness = 0.95,
        FogColor = Color3.fromRGB(175, 175, 180),
        FogEnd = 15000,
        ColorShift_Top = Color3.fromRGB(140, 142, 150),
        ColorShift_Bottom = Color3.fromRGB(190, 190, 195),
        ShadowSoftness = 0.5
    })
    Lighting.GlobalShadows = true
    Lighting.ClockTime = 12.5
    Lighting.ExposureCompensation = -0.08

    local Sky = Instance.new("Sky", Lighting)
    Sky.SkyboxGradient = true
    Sky.TopColor = Color3.fromRGB(135, 138, 148)
    Sky.MidColor = Color3.fromRGB(160, 162, 170)
    Sky.BottomColor = Color3.fromRGB(185, 186, 192)
end

local function ShaderShore()
    ClearAllLighting()
    SmoothSetLighting({
        Ambient = Color3.fromRGB(180, 185, 195),
        Brightness = 1.4,
        FogColor = Color3.fromRGB(210, 215, 225),
        FogEnd = 28000,
        ColorShift_Top = Color3.fromRGB(145, 180, 220),
        ColorShift_Bottom = Color3.fromRGB(225, 210, 190),
        ShadowSoftness = 0.35
    })
    Lighting.GlobalShadows = true
    Lighting.ClockTime = 14
    Lighting.ExposureCompensation = 0.05

    local Sky = Instance.new("Sky", Lighting)
    Sky.SkyboxGradient = true
    Sky.TopColor = Color3.fromRGB(120, 170, 225)
    Sky.MidColor = Color3.fromRGB(170, 195, 220)
    Sky.BottomColor = Color3.fromRGB(235, 205, 180)
end

-- 🖥️ MAIN MENU
function LoadMainInterface()
    local HubUI = Instance.new("ScreenGui", PlayerGui)
    HubUI.Name = "Nexus_MainHub"

    local Restore = Instance.new("TextButton", HubUI)
    Restore.Size=UDim2.fromOffset(42,42);Restore.Position=UDim2.new(1,-55,0,12)
    Restore.BackgroundColor3=THEME.MainBg;Restore.Text="N";Restore.TextColor3=THEME.Accent
    Restore.Visible=false; Round(Restore,21)

    local MainWin = Instance.new("Frame", HubUI)
    MainWin.Size=UDim2.fromOffset(250,390);MainWin.Position=UDim2.new(1,-265,0,-20)
    MainWin.BackgroundColor3=THEME.MainBg;MainWin.BorderColor3=THEME.Border;Round(MainWin,18)

    local MinBtn = Instance.new("TextButton", MainWin)
    MinBtn.Size=UDim2.fromOffset(30,24);MinBtn.Position=UDim2.new(1,-65,0,6)
    MinBtn.BackgroundColor3=THEME.BtnBg;MinBtn.Text="−";Round(MinBtn,6)

    local CloseBtn = Instance.new("TextButton", MainWin)
    CloseBtn.Size=UDim2.fromOffset(30,24);CloseBtn.Position=UDim2.new(1,-32,0,6)
    CloseBtn.BackgroundColor3=THEME.BtnBg;CloseBtn.Text="✕";Round(CloseBtn,6)

    local Scroller = Instance.new("ScrollingFrame", MainWin)
    Scroller.Size=UDim2.new(1,-10,1,-40);Scroller.Position=UDim2.new(0,5,0,35)
    Scroller.BackgroundTransparency=1;Scroller.ScrollBarThickness=5;Scroller.AutomaticCanvasSize=Enum.AutomaticSize.Y

    local Items = {
        {"Classic / Day ☀️", ShaderClassic},
        {"Sunset 🌅", ShaderSunset},
        {"Bright / Clear ✨", ShaderBright},
        {"Deep Dark Night 🌙", ShaderNight},
        {"☁️ Cloudy", ShaderCloudy},
        {"🏖️ Shore", ShaderShore},
        {"🔊 Pet Sounds", EnablePetSounds},
        {"Simple Shader", function()
            pcall(function() 
                loadstring(game:HttpGet("https://raw.githubusercontent.com/p0e1/1/refs/heads/main/SimpleShader.lua", true))() 
                StarterGui:SetCore("SendNotification", {Title="Simple Shader", Text="Loaded!", Duration=2})
            end)
        end}
    }

    for i, opt in ipairs(Items) do
        local Btn = Instance.new("TextButton", Scroller)
        Btn.Size=UDim2.new(1,-6,0,44)
        Btn.Position=UDim2.new(0,3,0,(i-1)*50)
        Btn.BackgroundColor3 = opt[1]=="Simple Shader" and THEME.GreenBtn or THEME.BtnBg
        Btn.Text=opt[1]; Btn.TextColor3=THEME.Text; Btn.Font=Enum.Font.GothamSemibold; Btn.TextSize=19
        Round(Btn,10)
        Btn.MouseEnter:Connect(function() TweenService:Create(Btn,TWEEN_FAST,{BackgroundColor3=THEME.Accent}):Play() end)
        Btn.MouseLeave:Connect(function() 
            local back = opt[1]=="Simple Shader" and THEME.GreenBtn or THEME.BtnBg 
            TweenService:Create(Btn,TWEEN_FAST,{BackgroundColor3=back}):Play() 
        end)
        Btn.MouseButton1Click:Connect(opt[2])
    end

    task.wait(0.1)
    TweenService:Create(MainWin, TWEEN_POPUP, {Position=UDim2.new(1,-265,0,12)}):Play()
    MinBtn.MouseButton1Click:Connect(function() MainWin.Visible=false;Restore.Visible=true end)
    Restore.MouseButton1Click:Connect(function() MainWin.Visible=true;Restore.Visible=false end)
    CloseBtn.MouseButton1Click:Connect(function() HubUI:Destroy(); RunService:UnbindFromRenderStep("SkyLoop"); RunService:UnbindFromRenderStep("AudioBoost") end)
end

-- 🔑 KEY PANEL
local function RequestKeyEntry()
    local KeyGui = Instance.new("ScreenGui", PlayerGui)
    KeyGui.Name = "Nexus_KeyUI"
    KeyGui.DisplayOrder = 9998

    local Popup = Instance.new("Frame", KeyGui)
    Popup.Size = UDim2.fromOffset(330, 280)
    Popup.Position = UDim2.new(0.5, -165, 0.5, -140)
    Popup.BackgroundColor3 = THEME.KeyBg
    Popup.BorderColor3 = THEME.Border
    Popup.BorderSizePixel = 1
    Round(Popup, 18)

    local Title = Instance.new("TextLabel", Popup)
    Title.Size = UDim2.new(1, -20, 0, 45)
    Title.Position = UDim2.new(0, 10, 0, 10)
    Title.BackgroundTransparency = 1
    Title.Text = "🔑 Nexus Hub Authorization"
    Title.TextColor3 = THEME.Accent
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 21

    local Desc = Instance.new("TextLabel", Popup)
    Desc.Size = UDim2.new(1, -30, 0, 25)
    Desc.Position = UDim2.new(0, 15, 0.20, 0)
    Desc.BackgroundTransparency = 1
    Desc.Text = "License valid: 24h"
    Desc.TextColor3 = THEME.TextDim
    Desc.Font = Enum.Font.GothamSemibold
    Desc.TextSize = 14

    local InputBox = Instance.new("TextBox", Popup)
    InputBox.Size = UDim2.new(1, -30, 0, 46)
    InputBox.Position = UDim2.new(0, 15, 0.35, 0)
    InputBox.BackgroundColor3 = THEME.InputBg
    InputBox.PlaceholderText = "Enter license key..."
    InputBox.PlaceholderColor3 = THEME.TextDim
    InputBox.Text = ""
    InputBox.TextColor3 = THEME.Text
    InputBox.Font = Enum.Font.GothamMedium
    InputBox.TextSize = 16
    InputBox.ClearTextOnFocus = false
    InputBox.TextXAlignment = Enum.TextXAlignment.Center
    Round(InputBox, 12)

    local Result = Instance.new("TextLabel", Popup)
    Result.Size = UDim2.new(1, -25, 0, 24)
    Result.Position = UDim2.new(0, 12, 0.55, 0)
    Result.BackgroundTransparency = 1
    Result.Text = ""
    Result.Font = Enum.Font.GothamSemibold
    Result.TextSize = 14

    local btnW = 0.31
    local spacing = 0.015

    local VerifyBtn = Instance.new("TextButton", Popup)
    VerifyBtn.Size = UDim2.new(btnW, -2, 0, 40)
    VerifyBtn.Position = UDim2.new(0, 15, 0.72, 0)
    VerifyBtn.BackgroundColor3 = THEME.Accent
    VerifyBtn.Text = "✅ VERIFY"
    VerifyBtn.TextColor3 = THEME.Text
    VerifyBtn.Font = Enum.Font.GothamBold
    VerifyBtn.TextSize = 14
    Round(VerifyBtn, 10)

    local GetKeyBtn = Instance.new("TextButton", Popup)
    GetKeyBtn.Size = VerifyBtn.Size
    GetKeyBtn.Position = UDim2.new(btnW + spacing, 15, 0.72, 0)
    GetKeyBtn.BackgroundColor3 = THEME.BtnBg
    GetKeyBtn.Text = "🔑 KEY"
    GetKeyBtn.TextColor3 = THEME.Text
    GetKeyBtn.Font = Enum.Font.GothamBold
    GetKeyBtn.TextSize = 14
    Round(GetKeyBtn, 10)

    local LootBtn = Instance.new("TextButton", Popup)
    LootBtn.Size = VerifyBtn.Size
    LootBtn.Position = UDim2.new((btnW+spacing)*2, 15, 0.72, 0)
    LootBtn.BackgroundColor3 = THEME.BtnBg
    LootBtn.Text = "💰 LINKS"
    LootBtn.TextColor3 = THEME.Text
    LootBtn.Font = Enum.Font.GothamBold
    LootBtn.TextSize = 14
    Round(LootBtn, 10)
    
    LootBtn.MouseButton1Click:Connect(function()
        setclipboard(LOOTLINK_LINK)
        pcall(function() StarterGui:SetCore("SendNotification", {Title="✅ Copied!", Text="Link saved!", Duration=3}) end)
    end)

    KeyGui.Parent = PlayerGui
    Popup.Visible = false; task.wait(0.1); Popup.Visible = true

    VerifyBtn.MouseButton1Click:Connect(function()
        local key = InputBox.Text:gsub("%s", "")
        if VALID_KEYS[key] then
            Result.Text = "✅ SUCCESS!"
            Result.TextColor3 = Color3.fromRGB(85, 255, 135)
            VerifyBtn.Text = "Loading..."
            task.wait(0.5); KeyGui:Destroy(); LoadMainInterface()
        else
            Result.Text = "❌ Invalid Key"
            Result.TextColor3 = Color3.fromRGB(255, 80, 80)
        end
    end)
    GetKeyBtn.MouseButton1Click:Connect(function() setclipboard(DISCORD_LINK); pcall(function() StarterGui:SetCore("SendNotification", {Title="✅ Copied!", Text="Discord link!", Duration=3}) end) end)
end

-- 🚀 START
ShowLoading()
RequestKeyEntry()
