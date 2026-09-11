local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local plr = Players.LocalPlayer
local PlayerGui = plr:WaitForChild("PlayerGui", 15)

-- 🔗 LINKS
local DISCORD_LINK = "https://discord.gg/RBU4fNs8d" -- ✅ NEW LINK
local LOOT_LINKS = {
    "https://lootdest.org/s?efYFPxMt",
    "https://lootdest.org/s?wlEkMgwl",
    "https://loot-link.com/s?cc9w9VAl",
    "https://loot-link.com/s?JPRhtIG6"
}

-- 🎨 THEME
local THEME = {
    LoadBg = Color3.fromRGB(60, 18, 32),
    MainBg = Color3.fromRGB(15, 13, 25),
    BtnBg = Color3.fromRGB(30, 26, 48),
    Accent = Color3.fromRGB(160, 90, 255),
    GreenBtn = Color3.fromRGB(45, 180, 80),
    Text = Color3.new(1,1,1),
    TextDim = Color3.fromRGB(180,180,190),
    Border = Color3.fromRGB(180, 110, 255)
}

local TWEEN_FAST = TweenInfo.new(0.25, Enum.EasingStyle.Quad)
local TWEEN_SMOOTH = TweenInfo.new(0.4, Enum.EasingStyle.Quad)
local TWEEN_POP = TweenInfo.new(0.35, Enum.EasingStyle.Back)

local function GetRandomLink()
    local rng = Random.new(tick() * math.random(100000, 999999))
    local index = rng:NextInteger(1, #LOOT_LINKS)
    return LOOT_LINKS[index]
end

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
    Box.BackgroundTransparency = 1
    TweenService:Create(Box, TWEEN_POP, {BackgroundTransparency = 0}):Play()

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

    TweenService:Create(Box, TWEEN_SMOOTH, {BackgroundTransparency=1}):Play()
    task.wait(0.4)
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
    MainWin.BackgroundTransparency=1
    TweenService:Create(MainWin, TWEEN_POP, {Position=UDim2.new(1,-265,0,12), BackgroundTransparency=0}):Play()

    local MinBtn = Instance.new("TextButton", MainWin)
    MinBtn.Size=UDim2.fromOffset(30,24);MinBtn.Position=UDim2.new(1,-65,0,6)
    MinBtn.BackgroundColor3=THEME.BtnBg;MinBtn.Text="−";Round(MinBtn,6)

    local CloseBtn = Instance.new("TextButton", MainWin)
    CloseBtn.Size=UDim2.fromOffset(30,24);CloseBtn.Position=UDim2.new(1,-32,0,6)
    CloseBtn.BackgroundColor3=THEME.BtnBg;CloseBtn.Text="✕";Round(CloseBtn,6)

    local Scroller = Instance.new("ScrollingFrame", MainWin)
    Scroller.Size=UDim2.new(1,-10,1,-40);Scroller.Position=UDim2.new(0,5,0,35)
    Scroller.BackgroundTransparency=1;Scroller.ScrollBarThickness=5;Scroller.AutomaticCanvasSize=Enum.AutomaticSize.Y

    -- ✅ UPDATED LIST: ADDED JOIN DISCORD
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
        end},
        {"💬 Join Discord", function() -- ✅ NEW BUTTON
            setclipboard(DISCORD_LINK)
            pcall(function() 
                StarterGui:SetCore("SendNotification", {
                    Title="✅ Discord Copied!", 
                    Text=DISCORD_LINK, 
                    Duration=3
                }) 
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

    MinBtn.MouseButton1Click:Connect(function() MainWin.Visible=false;Restore.Visible=true end)
    Restore.MouseButton1Click:Connect(function() MainWin.Visible=true;Restore.Visible=false end)
    CloseBtn.MouseButton1Click:Connect(function() HubUI:Destroy(); RunService:UnbindFromRenderStep("SkyLoop"); RunService:UnbindFromRenderStep("AudioBoost") end)
end

-- 🚀 RUN
ShowLoading()
LoadMainInterface()
