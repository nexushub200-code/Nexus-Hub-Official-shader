-- NEXUS HUB: IMPROVED SUNSET / NO CHANGES ELSEWHERE
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local plr = Players.LocalPlayer
local PlayerGui = plr:WaitForChild("PlayerGui", 10)

-- 🔑 ALL VALID KEYS (COMPLETE LIST)
local VALID_KEYS = {
    -- Original
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
    ["NEXUS-8LQF-5XWB-2KRD"] = true,
    ["NEXUS-M4ZT-9QPC-6VHX"] = true,
    ["NEXUS-7WKA-2RFM-8XQD"] = true,
    ["NEXUS-F9NP-4VLC-5ZKH"] = true,
    ["NEXUS-3QXD-7MRT-9WFB"] = true,
    ["NEXUS-V8HJ-6KQP-2LZN"] = true,
    ["NEXUS-5RMC-8XTA-4QWD"] = true,

    -- New Keys
    ["NEXUS-A7KD-4QPM-8XTR"] = true,
    ["NEXUS-9WLF-2KVC-6HQA"] = true,
    ["NEXUS-3RXT-8MNP-5VZK"] = true,
    ["NEXUS-6QHA-4WFD-9KRM"] = true,
    ["NEXUS-2VKC-7XQP-5LMT"] = true,
    ["NEXUS-8MZR-3HKA-6WFD"] = true,
    ["NEXUS-5KLP-9QXT-2VRA"] = true,
    ["NEXUS-7HWF-4MZC-8QKP"] = true,
    ["NEXUS-3XRA-6KVT-9MPW"] = true,
    ["NEXUS-8QFD-2LKC-5XHM"] = true,
    ["NEXUS-4WKP-7RZA-3VMT"] = true,
    ["NEXUS-9KHC-5QWM-6XPD"] = true,
    ["NEXUS-2MVT-8LQF-4KRA"] = true,
    ["NEXUS-6XZR-3WKP-9HMT"] = true,
    ["NEXUS-7QMA-5KFD-2VXC"] = true,
    ["NEXUS-4RWL-8HZN-6QKP"] = true,
    ["NEXUS-9XTA-3MRC-7KWF"] = true,
    ["NEXUS-5VQH-2ZKP-8LMD"] = true,
    ["NEXUS-6KRA-9WFX-4QTC"] = true,
    ["NEXUS-3HPM-7VZD-5XKA"] = true,
    ["NEXUS-8LWF-4QMC-2RZT"] = true,
    ["NEXUS-7XKP-5HVA-9MFD"] = true,
    ["NEXUS-2QRC-6WZT-8KMP"] = true,
    ["NEXUS-4MFD-9XKA-3VQP"] = true,
    ["NEXUS-5KWT-7RHM-2ZXC"] = true,
    ["NEXUS-8VQA-4LKP-6MZD"] = true,
    ["NEXUS-9HXF-3QRM-7WKC"] = true,
    ["NEXUS-6MTP-2KVA-8XQF"] = true,
    ["NEXUS-3ZKC-5WMR-9LQP"] = true,
    ["NEXUS-7KFD-8VXA-4QHM"] = true,
    ["NEXUS-2XMP-6RKT-9WZA"] = true,
    ["NEXUS-5QVC-3HWF-8KLR"] = true,
    ["NEXUS-4ZMA-7XKP-2VFD"] = true,
    ["NEXUS-9WKR-6QHC-3MPT"] = true,
    ["NEXUS-8KVA-5LXF-7QRM"] = true,
    ["NEXUS-3RFD-9MZK-4WQP"] = true,
    ["NEXUS-6HMT-2VKC-8XRA"] = true,
    ["NEXUS-7QXF-4KWP-5LZM"] = true,
    ["NEXUS-2KRC-9VTA-6HFD"] = true,
    ["NEXUS-5MZP-8QKA-3WXR"] = true,
    ["NEXUS-4XHF-7LMC-9KQT"] = true,
    ["NEXUS-8RWA-2QVD-6KMP"] = true,
    ["NEXUS-3KZT-5XRF-9HQA"] = true,
    ["NEXUS-7VKC-4MPL-8WFD"] = true,
    ["NEXUS-6QXR-9KHA-2ZMT"] = true,
    ["NEXUS-5HFD-3WKP-7VQA"] = true,
    ["NEXUS-9MRC-6XZT-4KWF"] = true,
    ["NEXUS-2LQA-8VKM-5RFD"] = true,
    ["NEXUS-4KXP-7ZHC-3MVT"] = true,
    ["NEXUS-8WFA-5QKR-2LMD"] = true,
    ["NEXUS-6VZT-3KQC-9XHP"] = true,
    ["NEXUS-7MKA-4RWF-8QZP"] = true,
    ["NEXUS-3XKC-9LVA-5HQT"] = true,
    ["NEXUS-5QFD-2WMR-7KXA"] = true,
    ["NEXUS-9KPT-6VHC-4ZRW"] = true,
    ["NEXUS-2HQA-8MFK-5XVD"] = true,
    ["NEXUS-4WZT-7KRC-9LMP"] = true,
    ["NEXUS-8XQF-3VMA-6KHD"] = true,
    ["NEXUS-6RKP-5ZWF-2QTA"] = true,
    ["NEXUS-7HMC-9XKR-4VFD"] = true,
    ["NEXUS-3QVA-8KZT-5WMP"] = true,
    ["NEXUS-5LXF-2RKC-9HQA"] = true,
    ["NEXUS-9VMP-4KWF-7XZT"] = true,
    ["NEXUS-2KHD-6QRA-8MVP"] = true,
    ["NEXUS-4ZKP-5WTC-9LXF"] = true,
    ["NEXUS-8MQA-3RVD-6KWP"] = true,
    ["NEXUS-7XHF-2KMC-5QZT"] = true,
    ["NEXUS-6WKR-9VQA-3HMP"] = true,
    ["NEXUS-3KFD-8ZRA-4XQT"] = true,
    ["NEXUS-5VLC-7QKP-2WFM"] = true,
    ["NEXUS-9HZA-6KXR-4MPT"] = true,
    ["NEXUS-2QWF-5LKC-8VMD"] = true,
    ["NEXUS-4MZR-9XKP-7HQA"] = true,
    ["NEXUS-8KTF-3VWC-6RMP"] = true,
    ["NEXUS-7QHD-5XKA-2LZT"] = true,
    ["NEXUS-6XMP-4KRV-9WQA"] = true,
    ["NEXUS-3RKC-8HWF-5VZT"] = true,
    ["NEXUS-5KQA-7MFD-2XRP"] = true,
    ["NEXUS-9WTC-4VKH-6QZM"] = true,
    ["NEXUS-2ZMF-8KXP-3RVA"] = true,
    ["NEXUS-4QKR-6WHD-9XMP"] = true,
    ["NEXUS-8VFA-5LZT-7KQC"] = true,
    ["NEXUS-7MHP-3QXA-9KWF"] = true,
    ["NEXUS-6KZT-2RMC-8VQP"] = true,
    ["NEXUS-3XFD-5WKA-7HMR"] = true,
    ["NEXUS-5QMP-9VKC-4ZXT"] = true,
    ["NEXUS-9KWA-6HFD-2RQP"] = true,
    ["NEXUS-2VZR-8XKM-5LQF"] = true,
    ["NEXUS-4HQA-7KTP-9WMC"] = true,
    ["NEXUS-8RFD-3MZK-6VXP"] = true,
    ["NEXUS-7XQC-5KWA-2HMT"] = true,
    ["NEXUS-6MPV-9QKR-4WFD"] = true,
    ["NEXUS-3KXA-8VHC-5ZQP"] = true,
    ["NEXUS-5WMT-2QFD-7KRC"] = true,
    ["NEXUS-9VKA-4XHP-6MZT"] = true,
    ["NEXUS-2LWF-8KQC-3RMP"] = true,
    ["NEXUS-4ZFD-7VXA-9KHT"] = true,
    ["NEXUS-8QMP-5RKC-2WVA"] = true,
    ["NEXUS-7KHF-3XZT-6QRM"] = true,
    ["NEXUS-6WQA-9MFK-4VXP"] = true,
    ["NEXUS-3RZT-5KWC-8HMQ"] = true,
    ["NEXUS-5XKP-2VFD-7LQA"] = true,
    ["NEXUS-9QHA-6KMT-4WZR"] = true,
    ["NEXUS-2KVC-8RXP-5ZFD"] = true,
    ["NEXUS-4MQA-7WKT-9XHC"] = true,
    ["NEXUS-8VZR-3KFD-6QMP"] = true,
    ["NEXUS-7HXC-5LQA-2WKR"] = true,
    ["NEXUS-6QMT-9VFD-4KXP"] = true,
    ["NEXUS-3WKA-8RHC-5ZMQ"] = true,
    ["NEXUS-5KFD-2XVT-7QRA"] = true,
    ["NEXUS-9MZC-4WKP-6HQA"] = true
}
local DISCORD_LINK = "https://discord.gg/zK4vJ8TU6"

-- 🎨 THEME / EXACTLY ORIGINAL
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

local function Round(obj, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = obj
end

-- ⏳ LOADING SCREEN → TOP / NO CHANGES ✅
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
ShowLoading()

-- 🔑 KEY SYSTEM: VERIFY + GET KEY / INTACT ✅
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
    Desc.Text = "License valid: 24 hours (1 Day)"
    Desc.TextColor3 = THEME.TextDim
    Desc.Font = Enum.Font.GothamSemibold
    Desc.TextSize = 14

    local InputBox = Instance.new("TextBox", Popup)
    InputBox.Size = UDim2.new(1, -30, 0, 46)
    InputBox.Position = UDim2.new(0, 15, 0.35, 0)
    InputBox.BackgroundColor3 = THEME.InputBg
    InputBox.PlaceholderText = "Enter your license key here..."
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

    local VerifyBtn = Instance.new("TextButton", Popup)
    VerifyBtn.Size = UDim2.new(0.48, -5, 0, 42)
    VerifyBtn.Position = UDim2.new(0, 15, 0.72, 0)
    VerifyBtn.BackgroundColor3 = THEME.Accent
    VerifyBtn.Text = "✅ VERIFY KEY"
    VerifyBtn.TextColor3 = THEME.Text
    VerifyBtn.Font = Enum.Font.GothamBold
    VerifyBtn.TextSize = 15
    Round(VerifyBtn, 10)

    local GetKeyBtn = Instance.new("TextButton", Popup)
    GetKeyBtn.Size = VerifyBtn.Size
    GetKeyBtn.Position = UDim2.new(0.52, 5, 0.72, 0)
    GetKeyBtn.BackgroundColor3 = THEME.BtnBg
    GetKeyBtn.Text = "🔑 GET KEY"
    GetKeyBtn.TextColor3 = THEME.Text
    GetKeyBtn.Font = Enum.Font.GothamBold
    GetKeyBtn.TextSize = 15
    Round(GetKeyBtn, 10)

    KeyGui.Parent = PlayerGui
    Popup.Visible = false
    task.wait(0.1)
    Popup.Visible = true
    TweenService:Create(Popup, TWEEN_POPUP, {Transparency=0}):Play()

    VerifyBtn.MouseButton1Click:Connect(function()
        local key = InputBox.Text:gsub("%s", "")
        if VALID_KEYS[key] then
            Result.Text = "✅ SUCCESS — Activated!"
            Result.TextColor3 = Color3.fromRGB(85, 255, 135)
            VerifyBtn.Text = "Loading..."
            task.wait(1.2)
            KeyGui:Destroy()
            LoadMainInterface()
        else
            Result.Text = "❌ Invalid or Expired Key"
            Result.TextColor3 = Color3.fromRGB(255, 80, 80)
            InputBox.Position = InputBox.Position - UDim2.new(0,4,0,0)
            task.wait(0.06)
            InputBox.Position = InputBox.Position + UDim2.new(0,8,0,0)
            task.wait(0.06)
            InputBox.Position = InputBox.Position - UDim2.new(0,4,0,0)
        end
    end)

    GetKeyBtn.MouseButton1Click:Connect(function()
        setclipboard(DISCORD_LINK)
        pcall(function()
            StarterGui:SetCore("SendNotification", {
                Title = "✅ Copied!",
                Text = "Discord link saved!",
                Duration = 3
            })
        end)
        local orig = GetKeyBtn.BackgroundColor3
        TweenService:Create(GetKeyBtn, TWEEN_FAST, {BackgroundColor3=THEME.Accent}):Play()
        task.wait(0.2)
        TweenService:Create(GetKeyBtn, TWEEN_FAST, {BackgroundColor3=orig}):Play()
    end)
end

-- 🧹 GRAPHICS HELPERS / NO TOUCH ✅
local function ClearAllLighting()
    for _, child in pairs(Lighting:GetChildren()) do
        if child:IsA("Sky") or child:IsA("SunRaysEffect") or child:IsA("Atmosphere") then
            pcall(function() child:Destroy() end)
        end
    end
end
local function SmoothSetLighting(props)
    TweenService:Create(Lighting, TWEEN_SMOOTH, props):Play()
end

-- 🌅 SHADERS / SUNSET IMPROVED — BETTER SUN + SHADOWS ✅
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
    -- ✅ IMPROVED: Mas matingkad na kulay, matibay na ilaw + MALINAW NA ANINO
    SmoothSetLighting({
        Ambient=Color3.fromRGB(190,140,110), 
        Brightness=1.6, -- Mas maliwanag
        FogColor=Color3.fromRGB(255,190,150), 
        FogEnd=16000, 
        ShadowSoftness=0.25, -- Mas matalas/maayos na shadow edge
        ColorShift_Top=Color3.fromRGB(255,130,70),
        ColorShift_Bottom=Color3.fromRGB(220,160,120)
    })
    Lighting.GlobalShadows=true -- Siguradong naka-ON ang shadows
    Lighting.ClockTime = 18 -- Tamang oras para sa gilid na sikat ng araw
    Lighting.ShadowMapSize = 2048 -- ✅ Mas malinaw at detalyadong shadows
    
    -- ✅ Mas malaki at makinang na araw
    local Sun = Instance.new("SunRaysEffect",Lighting)
    Sun.SunSize = 3.0 
    Sun.Intensity = 1.3 -- Mas matapang na sikat
    
    local Sky=Instance.new("Sky",Lighting)
    Sky.SkyboxGradient=true
    Sky.TopColor=Color3.fromRGB(255,90,50) -- Mas matingkad na pula/orange
    Sky.MidColor=Color3.fromRGB(255,160,80)
    Sky.BottomColor=Color3.fromRGB(200,150,120)
end

local function ShaderBright()
    ClearAllLighting()
    SmoothSetLighting({Ambient=Color3.fromRGB(235,235,245),Brightness=2.15,FogEnd=25000})
    Lighting.GlobalShadows=false
end

local function ShaderNight()
    ClearAllLighting()
    SmoothSetLighting({Ambient=Color3.fromRGB(55,55,85),Brightness=0.62,FogEnd=9500})
    Lighting.GlobalShadows=true
end

-- 🖥️ MAIN MENU / NO CHANGES ✅
function LoadMainInterface()
    local HubUI = Instance.new("ScreenGui", PlayerGui)
    HubUI.Name = "Nexus_MainHub"

    local Restore = Instance.new("TextButton", HubUI)
    Restore.Size=UDim2.fromOffset(42,42);Restore.Position=UDim2.new(1,-55,0,12)
    Restore.BackgroundColor3=THEME.MainBg;Restore.Text="N";Restore.TextColor3=THEME.Accent
    Restore.Visible=false; Round(Restore,21)

    local MainWin = Instance.new("Frame", HubUI)
    MainWin.Size=UDim2.fromOffset(250,340);MainWin.Position=UDim2.new(1,-265,0,-20)
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
        {"Night / Dark 🌙", ShaderNight},
        {"Simple Shader", function()
            pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/p0e1/1/refs/heads/main/SimpleShader.lua"))() end)
        end}
    }

    for i, opt in ipairs(Items) do
        local Btn = Instance.new("TextButton", Scroller)
        Btn.Size=UDim2.new(1,-6,0,44)
        Btn.Position=UDim2.new(0,3,0,(i-1)*50)
        Btn.BackgroundColor3 = opt[1]=="Simple Shader" and THEME.GreenBtn or THEME.BtnBg
        Btn.Text=opt[1]; Btn.TextColor3=THEME.Text; Btn.Font=Enum.Font.GothamSemibold; Btn.TextSize=19
        Round(Btn,10)

        Btn.MouseEnter:Connect(function()
            TweenService:Create(Btn,TWEEN_FAST,{BackgroundColor3=THEME.Accent}):Play()
        end)
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
    CloseBtn.MouseButton1Click:Connect(function() HubUI:Destroy() end)
end

-- START
RequestKeyEntry()
