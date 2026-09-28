local Players=game:GetService("Players")
local TweenService=game:GetService("TweenService")
local Lighting=game:GetService("Lighting")
local StarterGui=game:GetService("StarterGui")
local UserInputService=game:GetService("UserInputService")

local Player=Players.LocalPlayer
local PlayerGui=Player:WaitForChild("PlayerGui")

local C={
	BG=Color3.fromRGB(12,10,18),PANEL=Color3.fromRGB(23,18,31),
	BUTTON=Color3.fromRGB(39,31,52),HOVER=Color3.fromRGB(61,43,75),
	RED=Color3.fromRGB(255,35,70),PURPLE=Color3.fromRGB(170,75,255),
	TEXT=Color3.fromRGB(250,247,255),DIM=Color3.fromRGB(185,175,198)
}

local Fast=TweenInfo.new(.12,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
local Smooth=TweenInfo.new(.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
local Pop=TweenInfo.new(.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
local CloseAnim=TweenInfo.new(.23,Enum.EasingStyle.Quint,Enum.EasingDirection.In)

local function Tween(o,i,p)local t=TweenService:Create(o,i,p)t:Play()return t end
local function Round(o,r)local x=Instance.new("UICorner")x.CornerRadius=UDim.new(0,r)x.Parent=o end
local function Stroke(o,c,t,tr)local x=Instance.new("UIStroke")x.Color=c;x.Thickness=t or 1;x.Transparency=tr or 0;x.Parent=o;return x end
local function Gradient(o,a,b,r)local x=Instance.new("UIGradient")x.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,a),ColorSequenceKeypoint.new(1,b)})x.Rotation=r or 0;x.Parent=o end
local function Notify(t,x)pcall(function()StarterGui:SetCore("SendNotification",{Title=t,Text=x,Duration=2})end)end

local function ClearShaders()
	for _,v in ipairs(Lighting:GetChildren())do
		if v.Name:sub(1,6)=="Nexus_"then v:Destroy()end
	end
end

local function CC(n,s,c,b,t)
	local e=Instance.new("ColorCorrectionEffect")
	e.Name="Nexus_"..n;e.Saturation=s;e.Contrast=c;e.Brightness=b;e.TintColor=t;e.Parent=Lighting
end

local function Bloom(n,i,z,t)
	local e=Instance.new("BloomEffect")
	e.Name="Nexus_"..n;e.Intensity=i;e.Size=z;e.Threshold=t;e.Parent=Lighting
end

local function Atmos(n,d,o,c,dc,g,h)
	local e=Instance.new("Atmosphere")
	e.Name="Nexus_"..n;e.Density=d;e.Offset=o;e.Color=c;e.Decay=dc;e.Glare=g;e.Haze=h;e.Parent=Lighting
end

local function Base()
	Lighting.GlobalShadows=true
	pcall(function()
		Lighting.EnvironmentDiffuseScale=1
		Lighting.EnvironmentSpecularScale=1
		Lighting.Technology=Enum.Technology.Future
	end)
end

local function ClassicDay()
	ClearShaders();Base()
	Lighting.ClockTime=12;Lighting.Brightness=1.8;Lighting.ExposureCompensation=.08
	Lighting.Ambient=Color3.fromRGB(150,150,165);Lighting.OutdoorAmbient=Color3.fromRGB(180,185,200)
	Lighting.FogColor=Color3.fromRGB(210,220,235);Lighting.FogEnd=30000
	CC("DayCC",.1,.14,.04,Color3.fromRGB(245,248,255))
	Atmos("DayAtm",.07,.1,Color3.fromRGB(205,220,245),Color3.fromRGB(180,190,210),.06,.06)
	Bloom("DayBloom",.1,20,1.2);Notify("☀️ Classic / Day","Shader applied")
end

local function Sunset()
	ClearShaders();Base()
	Lighting.ClockTime=17.75;Lighting.Brightness=1.65;Lighting.ExposureCompensation=.05
	Lighting.Ambient=Color3.fromRGB(155,82,68);Lighting.OutdoorAmbient=Color3.fromRGB(210,120,90)
	Lighting.FogColor=Color3.fromRGB(255,165,115);Lighting.FogEnd=20000
	CC("SunsetCC",.22,.2,.03,Color3.fromRGB(255,205,170))
	Bloom("SunsetBloom",.3,30,.8)
	Atmos("SunsetAtm",.1,.04,Color3.fromRGB(255,180,135),Color3.fromRGB(255,95,65),.2,.16)
	local r=Instance.new("SunRaysEffect")r.Name="Nexus_Rays"r.Intensity=.3;r.Spread=.85;r.Parent=Lighting
	Notify("🌅 Sunset","Shadows + reflection lighting applied")
end

local function BrightClear()
	ClearShaders();Base()
	Lighting.ClockTime=13;Lighting.Brightness=2.2;Lighting.ExposureCompensation=.13
	Lighting.Ambient=Color3.fromRGB(220,225,240);Lighting.OutdoorAmbient=Color3.fromRGB(205,210,225)
	Lighting.FogColor=Color3.fromRGB(220,230,245);Lighting.FogEnd=35000
	CC("BrightCC",.07,.11,.1,Color3.fromRGB(245,248,255))
	Bloom("BrightBloom",.14,20,1.4)
	Atmos("BrightAtm",.035,.15,Color3.fromRGB(215,225,245),Color3.fromRGB(190,205,225),.03,.02)
	Notify("✨ Bright / Clear","Shader applied")
end

local function DeepNight()
	ClearShaders();Base()
	Lighting.ClockTime=.15;Lighting.Brightness=.35;Lighting.ExposureCompensation=-.5
	Lighting.Ambient=Color3.fromRGB(10,10,28);Lighting.OutdoorAmbient=Color3.fromRGB(14,17,45)
	Lighting.FogColor=Color3.fromRGB(5,7,20);Lighting.FogEnd=8500
	CC("NightCC",-.08,.23,-.08,Color3.fromRGB(125,145,255))
	Bloom("NightBloom",.2,24,.9)
	Atmos("NightAtm",.15,-.15,Color3.fromRGB(25,35,85),Color3.fromRGB(5,8,30),.06,.3)
	Notify("🌙 Deep Dark Night","Shader applied")
end

local function Cloudy()
	ClearShaders();Base()
	Lighting.ClockTime=12.5;Lighting.Brightness=1.05;Lighting.ExposureCompensation=-.03
	Lighting.Ambient=Color3.fromRGB(150,153,162);Lighting.OutdoorAmbient=Color3.fromRGB(165,168,178)
	Lighting.FogColor=Color3.fromRGB(175,180,190);Lighting.FogEnd=15000
	CC("CloudCC",-.08,.02,-.02,Color3.fromRGB(220,223,230))
	Atmos("CloudAtm",.17,.05,Color3.fromRGB(170,175,185),Color3.fromRGB(135,140,150),.03,.3)
	Notify("☁️ Cloudy","Shader applied")
end

local function Shore()
	ClearShaders();Base()
	Lighting.ClockTime=14;Lighting.Brightness=1.6;Lighting.ExposureCompensation=.1
	Lighting.Ambient=Color3.fromRGB(165,185,200);Lighting.OutdoorAmbient=Color3.fromRGB(195,205,215)
	Lighting.FogColor=Color3.fromRGB(195,220,235);Lighting.FogEnd=30000
	CC("ShoreCC",.18,.1,.05,Color3.fromRGB(215,240,255))
	Bloom("ShoreBloom",.12,22,1.3)
	Atmos("ShoreAtm",.07,.1,Color3.fromRGB(170,215,240),Color3.fromRGB(235,205,175),.13,.1)
	Notify("🏖️ Shore","Shader applied")
end

local function Oceanic()
	ClearShaders();Base()
	Lighting.ClockTime=13.5;Lighting.Brightness=1.5;Lighting.ExposureCompensation=.05
	Lighting.Ambient=Color3.fromRGB(70,125,155);Lighting.OutdoorAmbient=Color3.fromRGB(95,165,190)
	Lighting.FogColor=Color3.fromRGB(65,155,190);Lighting.FogEnd=26000
	CC("OceanCC",.22,.16,.03,Color3.fromRGB(155,220,255))
	Bloom("OceanBloom",.2,26,1)
	Atmos("OceanAtm",.1,.08,Color3.fromRGB(80,180,220),Color3.fromRGB(30,90,120),.15,.13)
	Notify("🌊 Oceanic","Shader applied")
end

local function Flames()
	ClearShaders();Base()
	Lighting.ClockTime=18;Lighting.Brightness=1.35;Lighting.ExposureCompensation=.12
	Lighting.Ambient=Color3.fromRGB(105,35,20);Lighting.OutdoorAmbient=Color3.fromRGB(180,65,25)
	Lighting.FogColor=Color3.fromRGB(125,38,20);Lighting.FogEnd=15000
	CC("FlameCC",.3,.25,.04,Color3.fromRGB(255,145,75))
	Bloom("FlameBloom",.4,32,.65)
	Atmos("FlameAtm",.13,.04,Color3.fromRGB(255,110,55),Color3.fromRGB(95,20,10),.25,.2)
	local r=Instance.new("SunRaysEffect")r.Name="Nexus_FlameRays"r.Intensity=.2;r.Spread=.8;r.Parent=Lighting
	Notify("🔥 Flames","Shader applied")
end

local function CrimsonMoon()
	ClearShaders();Base()
	Lighting.ClockTime=0;Lighting.Brightness=.45;Lighting.ExposureCompensation=-.25
	Lighting.Ambient=Color3.fromRGB(35,8,18);Lighting.OutdoorAmbient=Color3.fromRGB(65,12,30)
	Lighting.FogColor=Color3.fromRGB(24,4,15);Lighting.FogEnd=9500
	CC("CrimsonMoonCC",.18,.3,-.04,Color3.fromRGB(210,65,85))
	Bloom("CrimsonMoonBloom",.28,28,.75)
	Atmos("CrimsonMoonAtm",.12,-.12,Color3.fromRGB(95,20,42),Color3.fromRGB(25,4,18),.12,.25)
	local r=Instance.new("SunRaysEffect")r.Name="Nexus_CrimsonMoonRays"r.Intensity=.12;r.Spread=.75;r.Parent=Lighting
	Notify("🌑 Crimson Moon","Crimson night shader applied")
end

local function Cinematic()
	ClearShaders();Base()
	Lighting.ClockTime=18.2;Lighting.Brightness=1.05;Lighting.ExposureCompensation=-.08
	Lighting.Ambient=Color3.fromRGB(55,42,58);Lighting.OutdoorAmbient=Color3.fromRGB(100,75,85)
	Lighting.FogColor=Color3.fromRGB(45,35,52);Lighting.FogEnd=12000
	CC("CinematicCC",-.04,.35,-.03,Color3.fromRGB(255,190,175))
	Bloom("CinematicBloom",.18,24,1)
	Atmos("CinematicAtm",.09,.02,Color3.fromRGB(115,80,95),Color3.fromRGB(40,30,45),.12,.12)
	local r=Instance.new("SunRaysEffect")r.Name="Nexus_CinematicRays"r.Intensity=.18;r.Spread=.9;r.Parent=Lighting
	Notify("🎬 Cinematic","Cinematic shader applied")
end

local Old=PlayerGui:FindFirstChild("NexusHub")
if Old then Old:Destroy()end

--==================================================
-- INTRO
--==================================================

local Intro=Instance.new("ScreenGui")
Intro.Name="NexusXCrimsonIntro";Intro.IgnoreGuiInset=true;Intro.ResetOnSpawn=false
Intro.DisplayOrder=999;Intro.Parent=PlayerGui

local IntroBG=Instance.new("Frame")
IntroBG.Size=UDim2.fromScale(1,1);IntroBG.BackgroundColor3=Color3.fromRGB(7,5,12)
IntroBG.BorderSizePixel=0;IntroBG.Parent=Intro

Gradient(IntroBG,Color3.fromRGB(255,20,55),Color3.fromRGB(55,8,80),0)

local IntroTitle=Instance.new("TextLabel")
IntroTitle.AnchorPoint=Vector2.new(.5,.5);IntroTitle.Position=UDim2.fromScale(.5,.48)
IntroTitle.Size=UDim2.new(.9,0,0,65);IntroTitle.BackgroundTransparency=1
IntroTitle.Text="NEXUS X CRIMSON";IntroTitle.TextColor3=C.TEXT
IntroTitle.Font=Enum.Font.GothamBlack;IntroTitle.TextSize=30;IntroTitle.TextTransparency=1
IntroTitle.Parent=Intro

local IntroSub=Instance.new("TextLabel")
IntroSub.AnchorPoint=Vector2.new(.5,.5);IntroSub.Position=UDim2.fromScale(.5,.57)
IntroSub.Size=UDim2.new(.8,0,0,30);IntroSub.BackgroundTransparency=1
IntroSub.Text="SHADER EDITION • V3";IntroSub.TextColor3=C.RED
IntroSub.Font=Enum.Font.GothamBold;IntroSub.TextSize=11;IntroSub.TextTransparency=1
IntroSub.Parent=Intro

local Spikes={}
for i=1,18 do
	local s=Instance.new("Frame")
	s.Size=UDim2.fromOffset(math.random(45,90),math.random(2,5))
	s.AnchorPoint=Vector2.new(.5,.5);s.Position=UDim2.fromScale(math.random(),math.random())
	s.BackgroundColor3=i%2==0 and C.RED or C.PURPLE;s.BorderSizePixel=0
	s.Rotation=math.random(-45,45);s.BackgroundTransparency=1;s.Parent=IntroBG
	Spikes[#Spikes+1]=s
end

Tween(IntroTitle,TweenInfo.new(.65,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency=0})
task.delay(.18,function()
	Tween(IntroSub,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency=0})
end)

for i,s in ipairs(Spikes)do
	task.delay(i*.035,function()
		if s.Parent then Tween(s,TweenInfo.new(.35,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=.18})end
	end)
end

task.wait(3)

for _,s in ipairs(Spikes)do
	if s.Parent then Tween(s,TweenInfo.new(.3,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{BackgroundTransparency=1})end
end

Tween(IntroTitle,TweenInfo.new(.3,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{TextTransparency=1})
Tween(IntroSub,TweenInfo.new(.25,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{TextTransparency=1})
Tween(IntroBG,TweenInfo.new(.4,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{BackgroundTransparency=1})
task.wait(.42)
Intro:Destroy()

--==================================================
-- MAIN UI
--==================================================

local Gui=Instance.new("ScreenGui")
Gui.Name="NexusHub";Gui.ResetOnSpawn=false;Gui.IgnoreGuiInset=true;Gui.Parent=PlayerGui

local Main=Instance.new("Frame")
Main.Size=UDim2.fromOffset(270,470);Main.Position=UDim2.new(1,20,0,18)
Main.BackgroundColor3=C.BG;Main.BorderSizePixel=0;Main.ClipsDescendants=true;Main.Parent=Gui
Round(Main,18);Stroke(Main,C.PURPLE,1.5);Gradient(Main,C.RED,Color3.fromRGB(35,15,55),90)

local Top=Instance.new("Frame")
Top.Size=UDim2.new(1,0,0,52);Top.BackgroundColor3=C.PANEL;Top.BorderSizePixel=0
Top.Active=true;Top.Parent=Main;Round(Top,18)
Gradient(Top,Color3.fromRGB(35,8,18),Color3.fromRGB(35,12,55),0)

local Logo=Instance.new("TextLabel")
Logo.Size=UDim2.fromOffset(39,39);Logo.Position=UDim2.fromOffset(7,6)
Logo.BackgroundColor3=C.RED;Logo.Text="N";Logo.TextColor3=Color3.new(1,1,1)
Logo.Font=Enum.Font.GothamBlack;Logo.TextSize=21;Logo.Parent=Top
Round(Logo,12);Gradient(Logo,C.RED,C.PURPLE,0)

local Title=Instance.new("TextLabel")
Title.Size=UDim2.new(1,-125,0,24);Title.Position=UDim2.fromOffset(52,5)
Title.BackgroundTransparency=1;Title.Text="Nexus X Crimson";Title.TextColor3=C.TEXT
Title.Font=Enum.Font.GothamBold;Title.TextSize=17;Title.TextXAlignment=Enum.TextXAlignment.Left
Title.Parent=Top

local Version=Instance.new("TextLabel")
Version.Size=UDim2.new(1,-125,0,15);Version.Position=UDim2.fromOffset(53,28)
Version.BackgroundTransparency=1;Version.Text="Shader Edition • V3";Version.TextColor3=C.DIM
Version.Font=Enum.Font.Gotham;Version.TextSize=9;Version.TextXAlignment=Enum.TextXAlignment.Left
Version.Parent=Top

local function TopButton(text,x)
	local b=Instance.new("TextButton")
	b.Size=UDim2.fromOffset(31,27);b.Position=UDim2.new(1,x,0,12)
	b.BackgroundColor3=C.BUTTON;b.Text=text;b.TextColor3=C.TEXT
	b.Font=Enum.Font.GothamBold;b.TextSize=17;b.AutoButtonColor=false;b.Active=true;b.Parent=Top
	Round(b,8);Gradient(b,C.RED,C.PURPLE,0)
	b.MouseEnter:Connect(function()Tween(b,Fast,{BackgroundColor3=C.HOVER})end)
	b.MouseLeave:Connect(function()Tween(b,Fast,{BackgroundColor3=C.BUTTON})end)
	return b
end

local Minimize=TopButton("−",-68)
local Close=TopButton("×",-34)

local Scroll=Instance.new("ScrollingFrame")
Scroll.Size=UDim2.new(1,-12,1,-62);Scroll.Position=UDim2.fromOffset(6,57)
Scroll.BackgroundTransparency=1;Scroll.BorderSizePixel=0;Scroll.ScrollBarThickness=4
Scroll.ScrollBarImageColor3=C.PURPLE;Scroll.ScrollingDirection=Enum.ScrollingDirection.Y
Scroll.AutomaticCanvasSize=Enum.AutomaticSize.None;Scroll.CanvasSize=UDim2.new(0,0,0,0)
Scroll.Active=true;Scroll.Parent=Main

local Pad=Instance.new("UIPadding")
Pad.PaddingTop=UDim.new(0,6);Pad.PaddingBottom=UDim.new(0,40)
Pad.PaddingLeft=UDim.new(0,4);Pad.PaddingRight=UDim.new(0,4);Pad.Parent=Scroll

local Layout=Instance.new("UIListLayout")
Layout.Padding=UDim.new(0,7);Layout.SortOrder=Enum.SortOrder.LayoutOrder;Layout.Parent=Scroll

local function UpdateCanvas()
	task.defer(function()
		if Scroll.Parent then
			Scroll.CanvasSize=UDim2.new(0,0,0,Layout.AbsoluteContentSize.Y+Pad.PaddingBottom.Offset+12)
		end
	end)
end

Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateCanvas)

local Header=Instance.new("TextLabel")
Header.Size=UDim2.new(1,0,0,25);Header.BackgroundTransparency=1
Header.Text="GRAPHICS & EFFECTS";Header.TextColor3=C.PURPLE
Header.Font=Enum.Font.GothamBold;Header.TextSize=11;Header.TextXAlignment=Enum.TextXAlignment.Left
Header.LayoutOrder=1;Header.Parent=Scroll

local function ShaderButton(text,callback,order)
	local b=Instance.new("TextButton")
	b.Size=UDim2.new(1,0,0,43);b.BackgroundColor3=C.BUTTON;b.BorderSizePixel=0
	b.Text=text;b.TextColor3=C.TEXT;b.Font=Enum.Font.GothamSemibold;b.TextSize=14
	b.TextXAlignment=Enum.TextXAlignment.Left;b.AutoButtonColor=false;b.Active=true
	b.LayoutOrder=order;b.Parent=Scroll;Round(b,11)

	local s=Stroke(b,C.PURPLE,1,.55)

	b.MouseEnter:Connect(function()
		Tween(b,Smooth,{BackgroundColor3=C.HOVER});Tween(s,Smooth,{Transparency=.12})
	end)

	b.MouseLeave:Connect(function()
		Tween(b,Smooth,{BackgroundColor3=C.BUTTON});Tween(s,Smooth,{Transparency=.55})
	end)

	b.Activated:Connect(function()
		Tween(b,Fast,{BackgroundColor3=C.PURPLE})
		pcall(callback)
		task.delay(.25,function()if b.Parent then Tween(b,Smooth,{BackgroundColor3=C.BUTTON})end end)
	end)
end

ShaderButton("☀️  Classic / Day",ClassicDay,2)
ShaderButton("🌅  Sunset",Sunset,3)
ShaderButton("✨  Bright / Clear",BrightClear,4)
ShaderButton("🌙  Deep Dark Night",DeepNight,5)
ShaderButton("☁️  Cloudy",Cloudy,6)
ShaderButton("🏖️  Shore",Shore,7)
ShaderButton("🌊  Oceanic",Oceanic,8)
ShaderButton("🔥  Flames",Flames,9)
ShaderButton("🌑  Crimson Moon",CrimsonMoon,10)
ShaderButton("🎬  Cinematic",Cinematic,11)

task.defer(UpdateCanvas)

local Restore=Instance.new("TextButton")
Restore.Size=UDim2.fromOffset(48,48);Restore.Position=UDim2.new(1,-62,0,18)
Restore.BackgroundColor3=C.BG;Restore.Text="N";Restore.TextColor3=C.TEXT
Restore.Font=Enum.Font.GothamBlack;Restore.TextSize=21;Restore.AutoButtonColor=false
Restore.Visible=false;Restore.Parent=Gui;Round(Restore,24)
Gradient(Restore,C.RED,C.PURPLE,0);Stroke(Restore,C.PURPLE,1.5)

--==================================================
-- DRAG
--==================================================

local Dragging=false
local DragStart
local StartPos

Top.InputBegan:Connect(function(input)
	if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
		Dragging=true;DragStart=input.Position;StartPos=Main.Position
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if Dragging and(input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch)then
		local d=input.Position-DragStart
		Main.Position=UDim2.new(StartPos.X.Scale,StartPos.X.Offset+d.X,StartPos.Y.Scale,StartPos.Y.Offset+d.Y)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then Dragging=false end
end)

local function RestoreUI()
	if Main.Visible then return end
	Restore.Visible=false;Main.Visible=true
	Main.Position=UDim2.new(1,20,0,18);Main.Size=UDim2.fromOffset(0,470)
	Tween(Main,Pop,{Position=UDim2.new(1,-280,0,18),Size=UDim2.fromOffset(270,470)})
	task.defer(UpdateCanvas)
end

Restore.Activated:Connect(RestoreUI)

Restore.MouseEnter:Connect(function()Tween(Restore,Fast,{Size=UDim2.fromOffset(52,52)})end)
Restore.MouseLeave:Connect(function()Tween(Restore,Fast,{Size=UDim2.fromOffset(48,48)})end)

local function MinimizeUI()
	if not Main.Visible then return end
	Dragging=false
	Tween(Main,CloseAnim,{Position=UDim2.new(1,20,0,18),Size=UDim2.fromOffset(0,470)})
	task.delay(.24,function()
		if not Main.Parent then return end
		Main.Visible=false;Main.Size=UDim2.fromOffset(270,470)
		Restore.Visible=true;Restore.Size=UDim2.fromOffset(0,0)
		Tween(Restore,Pop,{Size=UDim2.fromOffset(48,48)})
	end)
end

Minimize.Activated:Connect(MinimizeUI)

local Closing=false

Close.Activated:Connect(function()
	if Closing then return end
	Closing=true;Dragging=false
	Tween(Main,CloseAnim,{Position=UDim2.new(1,20,0,18),Size=UDim2.fromOffset(0,470)})
	task.delay(.28,function()
		ClearShaders()
		if Gui then Gui:Destroy()end
	end)
end)

UserInputService.InputBegan:Connect(function(input,processed)
	if processed or Closing then return end
	if input.KeyCode==Enum.KeyCode.H then
		if Main.Visible then MinimizeUI()else RestoreUI()end
	end
end)

Main.Position=UDim2.new(1,20,0,18)
Main.Size=UDim2.fromOffset(0,470)
task.wait(.08)
Tween(Main,Pop,{Position=UDim2.new(1,-280,0,18),Size=UDim2.fromOffset(270,470)})
task.defer(UpdateCanvas)
