local CheemHubUiLib = {}
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local CloseBind = Enum.KeyCode.RightControl
local HttpService = game:GetService("HttpService")
local UIParent = game.CoreGui

if UIParent:FindFirstChild("CheemHubUi") then
    UIParent:FindFirstChild("CheemHubUi"):Destroy()
end

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
			local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		    Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
					input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

function CheemHubUiLib:Window(Namehub,LOGOlink,keycode)
local Tabs = {}
local keycodegg = keycode or CloseBind
local CheemHubUi = Instance.new("ScreenGui")
local eMain = Instance.new("Frame")
local eMainConner = Instance.new("UICorner")
local Main = Instance.new("Frame")
local Mainconner = Instance.new("UICorner")
local Topbar = Instance.new("Frame")
local TopbarCorner = Instance.new("UICorner")
local LOGO = Instance.new("ImageLabel")
local Name_HUB = Instance.new("TextLabel")
local MainTab = Instance.new("Frame")
local ScrollingTab = Instance.new("ScrollingFrame")
local UICorner = Instance.new("UICorner")
local TabLaout = Instance.new("UIListLayout")
local TabFolder = Instance.new("Folder")

CheemHubUi.Name = "CheemHubUi"
CheemHubUi.Parent = UIParent
CheemHubUi.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

eMain.Name = "eMain"
eMain.Parent = CheemHubUi
eMain.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
eMain.Position = UDim2.new(0.25836575, 0, 0.261349708, 0)
eMain.Size = UDim2.new(0, 620, 0, 388)
eMain.BackgroundTransparency = 1

eMainConner.Name = "eMainConner"
eMainConner.Parent = eMain

Main.Name = "Main"
Main.Parent = eMain
Main.BackgroundColor3 = Color3.fromRGB(30,30,30)
Main.Position = UDim2.new(0, 1, 0, 1)
Main.Size = UDim2.new(0, 618, 0, 386)

local uitoggled = false
UserInputService.InputBegan:Connect(function(io, p)
	if io.KeyCode == keycodegg then
		if uitoggled == false then
			uitoggled = true
			pcall(function()
                CheemHubUi.Enabled = false
			end)
		else
		    pcall(function()
                CheemHubUi.Enabled = true
			end)
			uitoggled = false
		end
	end
end)

Mainconner.Name = "Mainconner"
Mainconner.Parent = Main

Topbar.Name = "Topbar"
Topbar.Parent = Main
Topbar.BackgroundColor3 = Color3.fromRGB(15,15,15)
Topbar.Size = UDim2.new(0, 618, 0, 34)

TopbarCorner.Name = "TopbarCorner"
TopbarCorner.Parent = Topbar

LOGO.Name = "LOGO"
LOGO.Parent = Topbar
LOGO.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LOGO.BackgroundTransparency = 1.000
LOGO.Position = UDim2.new(0, 0, -0.0294117648, 0)
LOGO.Size = UDim2.new(0, 34, 0, 34)
LOGO.Image = LOGOlink

Name_HUB.Parent = Topbar
Name_HUB.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name_HUB.BackgroundTransparency = 1.000
Name_HUB.Position = UDim2.new(0.0728155375, 0, 0.0294117648, 0)
Name_HUB.Size = UDim2.new(0, 140, 0, 33)
Name_HUB.Font = Enum.Font.SourceSans
Name_HUB.Text = Namehub or 'Noname'
Name_HUB.TextColor3 = Color3.fromRGB(255, 255, 255)
Name_HUB.TextSize = 20.000
Name_HUB.TextXAlignment = Enum.TextXAlignment.Left
MakeDraggable(Topbar,eMain)

MainTab.Name = "MainTab"
MainTab.Parent = eMain
MainTab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainTab.BorderColor3 = Color3.fromRGB(45, 45, 45)
MainTab.Position = UDim2.new(0.0209677424, 0, 0.108247414, 0)
MainTab.Size = UDim2.new(0, 594, 0, 27)

ScrollingTab.Name = "ScrollingTab"
ScrollingTab.Parent = MainTab
ScrollingTab.Active = true
ScrollingTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingTab.BackgroundTransparency = 1.000
ScrollingTab.BorderColor3 = Color3.fromRGB(45, 45, 45)
ScrollingTab.Position = UDim2.new(0, 0, 0.075974077, 0)
ScrollingTab.Size = UDim2.new(0, 594, 0, 32)
ScrollingTab.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingTab.ScrollBarThickness = 3

UICorner.Parent = MainTab

TabLaout.Name = "TabLaout"
TabLaout.Parent = ScrollingTab
TabLaout.FillDirection = Enum.FillDirection.Horizontal
TabLaout.SortOrder = Enum.SortOrder.LayoutOrder
TabLaout.Padding = UDim.new(0, 3)

TabFolder.Name = "TabFolder"
TabFolder.Parent = MainTab



local ctrc = 0
function Tabs:tab(tabtext)
    local TabButton = Instance.new("TextButton")
    local TabButtonCorner = Instance.new("UICorner")
    local tabContente = Instance.new("Frame")
    local tabContenteCorner = Instance.new("UICorner")
    local tabContent = {}
    
    TabButton.Name = "TabButton"
    TabButton.Parent = ScrollingTab
    TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    TabButton.BackgroundTransparency = 0
    TabButton.Position = UDim2.new(-5.13763929e-08, 0, 0, 0)
    TabButton.Size = UDim2.new(0, 83, 0, 24)
    TabButton.Font = Enum.Font.SourceSans
    TabButton.TextColor3 = Color3.fromRGB(0,0,0)
    TabButton.TextSize = 17.000
    TabButton.Text = tabtext or 'no text'
    TabButtonCorner.Name = "TabButtonCorner"
    TabButtonCorner.Parent = TabButton
    
    tabContente.Name = "tabContente"
    tabContente.Parent = TabFolder
    tabContente.BackgroundColor3 = Color3.fromRGB(45,45,45)
    tabContente.Position = UDim2.new(0, 0, 1.66666663, 0)
    tabContente.Size = UDim2.new(0, 594, 0, 278)
    
    if ctrc > 0 then
        tabContente.Visible = false
    else
        ctrc = ctrc +1
        tabContente.Visible = true
    end
    
    tabContenteCorner.Name = "tabContenteCorner"
    tabContenteCorner.Parent = tabContente
    
    TabButton.MouseEnter:Connect(function()
        TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
        tabnco = true
        -- TabButton:TweenSize(UDim2.new(0, 83, 0, 24),Enum.EasingDirection.In,Enum.EasingStyle.Sine,2,true)
    end)

	TabButton.MouseLeave:Connect(function()
            TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
	end)
	TabButton.MouseButton1Click:Connect(function()
        for i, v in next, TabFolder:GetChildren() do
    		if v.Name == "tabContente" then
    		    v.Visible = false
    		end
    		    tabContente.Visible = true
		  end
	end)
	
    function tabContent:Section()
        local UIListLayout = Instance.new("UIListLayout")
        local UIPadding = Instance.new("UIPadding")
        local Section = Instance.new("Frame")
        local SectionCorner = Instance.new("UICorner")
        local ScrollingSection = Instance.new("ScrollingFrame")
        local SecPadding = Instance.new("UIPadding")
        local functionlistlaout = Instance.new("UIListLayout")
        local Sectionfunc = {}
        
        
        SecPadding.Name = "SecPadding"
        SecPadding.Parent = ScrollingSection
        SecPadding.PaddingLeft = UDim.new(0, 9)
        SecPadding.PaddingRight = UDim.new(0, 10)
        SecPadding.PaddingTop = UDim.new(0, 0)
        SecPadding.PaddingBottom = UDim.new(0, 10)
        
        UIListLayout.Parent = tabContente
        UIListLayout.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 15)
        
        UIPadding.Parent = tabContente
        UIPadding.PaddingLeft = UDim.new(0, 15)
        UIPadding.PaddingTop = UDim.new(0, 15)
        
        Section.Name = "Section"
        Section.Parent = tabContente
        Section.BackgroundColor3 = Color3.fromRGB(40,40,40)
        Section.Size = UDim2.new(0, 275, 0, 248)
        
        SectionCorner.Name = "SectionCorner"
        SectionCorner.Parent = Section
        
        ScrollingSection.Name = "ScrollingSection"
        ScrollingSection.Parent = Section
        ScrollingSection.Active = true
        ScrollingSection.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
        ScrollingSection.BackgroundTransparency = 1.000
        ScrollingSection.BorderColor3 = Color3.fromRGB(30, 30, 30)
        ScrollingSection.Position = UDim2.new(0, 0, 0.0282258056, 0)
        ScrollingSection.Size = UDim2.new(0, 280, 0, 233)
        ScrollingSection.ScrollBarThickness = 3
        
        functionlistlaout.Name = "functionlistlaout"
        functionlistlaout.Parent = ScrollingSection
        functionlistlaout.SortOrder = Enum.SortOrder.LayoutOrder
        functionlistlaout.Padding = UDim.new(0, 5)
        
        function Sectionfunc:Label(messagelabel)
            local labelfunc = {}
            local eMainLabel = Instance.new("Frame")
            local eMainLabelCorner = Instance.new("UICorner")
            local Mainlabel = Instance.new("Frame")
            local MainlabelCorner = Instance.new("UICorner")
            local TextLabel = Instance.new("TextLabel")
            
            eMainLabel.Name = "eMainLabel"
            eMainLabel.Parent = ScrollingSection
            eMainLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            eMainLabel.Size = UDim2.new(0, 258, 0, 32)
            
            eMainLabelCorner.Name = "eMainLabelCorner"
            eMainLabelCorner.Parent = eMainLabel
            
            Mainlabel.Name = "Mainlabel"
            Mainlabel.Parent = eMainLabel
            Mainlabel.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
            Mainlabel.Position = UDim2.new(0, 1, 0, 1)
            Mainlabel.Size = UDim2.new(0, 256, 0, 30)
            
            MainlabelCorner.Name = "MainlabelCorner"
            MainlabelCorner.Parent = Mainlabel
            
            TextLabel.Parent = Mainlabel
            TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
            TextLabel.BackgroundTransparency = 1.000
            TextLabel.Position = UDim2.new(-0.012, 0,0.023, 0)
            TextLabel.Size = UDim2.new(0, 257, 0, 32)
            TextLabel.Font = Enum.Font.SourceSans
            TextLabel.TextColor3 = Color3.fromRGB(0,0,0)
            TextLabel.TextSize = 26.000
            TextLabel.TextWrapped = true
            TextLabel.Text = messagelabel or 'No Text'
            
            ScrollingSection.CanvasSize = UDim2.new(0, 0, 0, functionlistlaout.AbsoluteContentSize.Y)
            
            return labelfunc
        end
        function Sectionfunc:Button(Textmsg,callback)
            local Buttonfunc = {}
            local eMainButton = Instance.new("Frame")
            local eMainButtonCorner = Instance.new("UICorner")
            local MainButton = Instance.new("Frame")
            local MainButtonCorner = Instance.new("UICorner")
            local Buto = Instance.new("TextButton")
            local ButoCorner = Instance.new("UICorner")
            local Buttontext = Instance.new("TextLabel")
            
            eMainButton.Name = "eMainButton"
            eMainButton.Parent = ScrollingSection
            eMainButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
            eMainButton.Position = UDim2.new(0, 0, 0.167381972, 0)
            eMainButton.Size = UDim2.new(0, 258, 0, 36)
            
            eMainButtonCorner.Name = "eMainButtonCorner"
            eMainButtonCorner.Parent = eMainButton
            
            MainButton.Name = "MainButton"
            MainButton.Parent = eMainButton
            MainButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
            MainButton.Position = UDim2.new(0, 1, 0, 1)
            MainButton.Size = UDim2.new(0, 256, 0, 34)
            
            MainButtonCorner.Name = "MainButtonCorner"
            MainButtonCorner.Parent = MainButton
            
            Buto.Name = "Buto"
            Buto.Parent = MainButton
            Buto.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
            Buto.Size = UDim2.new(0, 256, 0, 34)
            Buto.Font = Enum.Font.SourceSans
            Buto.Text = ""
            Buto.TextColor3 = Color3.fromRGB(0,0,0)
            Buto.TextSize = 26.000
            
            ButoCorner.Name = "ButoCorner"
            ButoCorner.Parent = Buto
            
            Buttontext.Name = "Buttontext"
            Buttontext.Parent = Buto
            Buttontext.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
            Buttontext.BackgroundTransparency = 1.000
            Buttontext.Position = UDim2.new(0.03125, 0, 0, 0)
            Buttontext.Size = UDim2.new(0, 248, 0, 34)
            Buttontext.Font = Enum.Font.SourceSans
            Buttontext.Text = Textmsg or 'No Textmsg'
            Buttontext.TextColor3 = Color3.fromRGB(0,0,0)
            Buttontext.TextSize = 26.000
            Buto.MouseEnter:Connect(function()
                
			end)
			    
			Buto.MouseLeave:Connect(function()
			    
			end)
			Buto.MouseButton1Click:Connect(function()
				pcall(callback)
			end)
            ScrollingSection.CanvasSize = UDim2.new(0, 0, 0, functionlistlaout.AbsoluteContentSize.Y)
            return Buttonfunc
        end
        function Sectionfunc:toggle(texttoggle,def,callback)
        local togglefunc = {}
        local emaintoggle = Instance.new("Frame")
        local emaintoggleCorner = Instance.new("UICorner")
        local Maintoggle = Instance.new("Frame")
        local MaintoggleCorner = Instance.new("UICorner")
        local toggleButton = Instance.new("TextButton")
        local toggleButtonCorner = Instance.new("UICorner")
        local ButtonLabel = Instance.new("TextLabel")
        local toggleshowmain = Instance.new("Frame")
        local toggleshowmainCorner = Instance.new("UICorner")
        local ctog = Instance.new("Frame")
        local ctogICorner = Instance.new("UICorner")

        emaintoggle.Name = "emaintoggle"
        emaintoggle.Parent = ScrollingSection
        emaintoggle.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
        emaintoggle.Size = UDim2.new(0, 258, 0, 36)
        
        emaintoggleCorner.Name = "emaintoggleCorner"
        emaintoggleCorner.Parent = emaintoggle
        
        Maintoggle.Name = "Maintoggle"
        Maintoggle.Parent = emaintoggle
        Maintoggle.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
        Maintoggle.Position = UDim2.new(0, 1, 0, 1)
        Maintoggle.Size = UDim2.new(0, 256, 0, 34)
        
        MaintoggleCorner.Name = "MaintoggleCorner"
        MaintoggleCorner.Parent = Maintoggle
        
        toggleButton.Name = "toggleButton"
        toggleButton.Parent = Maintoggle
        toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
        toggleButton.Size = UDim2.new(0, 256, 0, 34)
        toggleButton.Font = Enum.Font.SourceSans
        toggleButton.Text = ""
        toggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
        toggleButton.TextSize = 14.000
        toggleButton.BackgroundTransparency = 1
        toggleButtonCorner.Name = "toggleButtonCorner"
        toggleButtonCorner.Parent = toggleButton
        
        ButtonLabel.Name = "ButtonLabel"
        ButtonLabel.Parent = toggleButton
        ButtonLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
        ButtonLabel.BackgroundTransparency = 1.000
        ButtonLabel.Size = UDim2.new(0, 256, 0, 34)
        ButtonLabel.Font = Enum.Font.SourceSans
        ButtonLabel.TextColor3 = Color3.fromRGB(0,0,0)
        ButtonLabel.TextSize = 26.000
        ButtonLabel.Text = "    "..texttoggle or "No Text"
        ButtonLabel.TextXAlignment = Enum.TextXAlignment.Left
        toggleshowmain.Name = "toggleshowmain"
        toggleshowmain.Parent = Maintoggle
        toggleshowmain.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
        toggleshowmain.Position = UDim2.new(0.83203125, 0, 0.294117659, 0)
        toggleshowmain.Size = UDim2.new(0, 36, 0, 16)
        
        toggleshowmainCorner.Name = "toggleshowmainCorner"
        toggleshowmainCorner.Parent = toggleshowmain
        
        ctog.Name = "ctog"
        ctog.Parent = toggleshowmain
        ctog.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ctog.Size = UDim2.new(0, 18, 0, 18)
        
        if def == false then
    	   ctog:TweenPosition(UDim2.new(0, 0, -0.06, 0),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0,true)
    	   toggleshowmain.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    	   --emaintoggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        else
    	   ctog:TweenPosition(UDim2.new(0, 18, -0.06, 0),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0,true)
    	   toggleshowmain.BackgroundColor3 = Color3.fromRGB(47, 255, 0)
    	   --emaintoggle.BackgroundColor3 = Color3.fromRGB(47, 255, 0)
        end
        
        ctogICorner.Name = "ctogICorner"
        ctogICorner.Parent = ctog
        if def == true then
        pcall(callbackdef)
        end
        toggleButton.MouseButton1Click:Connect(function()
            if def == false then
    	       ctog:TweenPosition(UDim2.new(0, 18, -0.06, 0),Enum.EasingDirection.In,Enum.EasingStyle.Sine,.1,true)
    	       toggleshowmain.BackgroundColor3 = Color3.fromRGB(47, 255, 0)
    	       --emaintoggle.BackgroundColor3 = Color3.fromRGB(47, 255, 0)
    	       def = true
    	    elseif def == true then
    	       ctog:TweenPosition(UDim2.new(0, 0, -0.06, 0),Enum.EasingDirection.In,Enum.EasingStyle.Sine,.1,true)
    	       toggleshowmain.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    	       --emaintoggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    	       def = false
    	    end
    	    if def == true or def == false then
	        pcall(callback,def)
	        end
        end)
        ScrollingSection.CanvasSize = UDim2.new(0, 0, 0, functionlistlaout.AbsoluteContentSize.Y)
        return togglefunc
        end
        
        function Sectionfunc:Category(TextCategory)
            local Category = Instance.new("TextLabel")
            
            Category.Name = "Category"
            Category.Parent = ScrollingSection
            Category.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Category.BackgroundTransparency = 1.000
            Category.Position = UDim2.new(0, 0, 0.548245609, 0)
            Category.Size = UDim2.new(0, 258, 0, 21)
            Category.Font = Enum.Font.SourceSans
            Category.Text = TextCategory or "No Text"
            Category.TextColor3 = Color3.fromRGB(255, 255, 255)
            Category.TextSize = 19.000
            Category.TextXAlignment = Enum.TextXAlignment.Left
            Category.TextYAlignment = Enum.TextYAlignment.Bottom
            ScrollingSection.CanvasSize = UDim2.new(0, 0, 0, functionlistlaout.AbsoluteContentSize.Y)
        end
        function Sectionfunc:Slider(Textslider,min,max,start,callback)
            local eMainslider = Instance.new("Frame")
            local eMainsliderCorner = Instance.new("UICorner")
            local Mainslider = Instance.new("Frame")
            local MainsliderCorner = Instance.new("UICorner")
            local TextSlider = Instance.new("TextLabel")
            local sliderbackg = Instance.new("Frame")
            local sliderbackgCorner = Instance.new("UICorner")
            local sliderbac = Instance.new("Frame")
            local sliderbacCorner = Instance.new("UICorner")
            local Circle = Instance.new("TextButton")
            local CircleCorner = Instance.new("UICorner")
            local SliderValue = Instance.new("TextLabel")
            local ResetButton = Instance.new("TextButton")
            local UPSliderButton = Instance.new("TextButton")
            local DownSliderButton = Instance.new("TextButton")
            
            eMainslider.Name = "eMainslider"
            eMainslider.Parent = ScrollingSection
            eMainslider.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
            eMainslider.Position = UDim2.new(0, 0, 0.357798159, 0)
            eMainslider.Size = UDim2.new(0, 258, 0, 68)
            
            eMainsliderCorner.Name = "eMainsliderCorner"
            eMainsliderCorner.Parent = eMainslider
            
            Mainslider.Name = "Mainslider"
            Mainslider.Parent = eMainslider
            Mainslider.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
            Mainslider.Position = UDim2.new(0, 1, 0, 1)
            Mainslider.Size = UDim2.new(0, 256, 0, 66)
            
            MainsliderCorner.Name = "MainsliderCorner"
            MainsliderCorner.Parent = Mainslider
            
            TextSlider.Name = "TextSlider"
            TextSlider.Parent = Mainslider
            TextSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextSlider.BackgroundTransparency = 1.000
            TextSlider.Position = UDim2.new(0.03515625, 0, 0.106060609, 0)
            TextSlider.Size = UDim2.new(0, 173, 0, 32)
            TextSlider.Font = Enum.Font.SourceSans
            TextSlider.TextColor3 = Color3.fromRGB(0,0,0)
            TextSlider.TextSize = 22.000
            TextSlider.TextXAlignment = Enum.TextXAlignment.Left
            TextSlider.TextYAlignment = Enum.TextYAlignment.Top
            TextSlider.Text = Textslider or 'No Text'
            
            sliderbackg.Name = "sliderbackg"
            sliderbackg.Parent = Mainslider
            sliderbackg.BackgroundColor3 = Color3.fromRGB(255,255,255)
            sliderbackg.Position = UDim2.new(0.03515625, 0, 0.727272749, 0)
            sliderbackg.Size = UDim2.new(0, 237, 0, 10)
            
            sliderbackgCorner.Name = "sliderbackgCorner"
            sliderbackgCorner.Parent = sliderbackg
            
            sliderbac.Name = "sliderbac"
            sliderbac.Parent = sliderbackg
            sliderbac.BackgroundColor3 = Color3.fromRGB(0, 255, 42)
            sliderbac.Size = UDim2.new((start or 0) / max, 0, 0, 10)
            sliderbac.Position = UDim2.new(0,0,0,0)
            
            SliderValue.Parent = Mainslider
            SliderValue.BackgroundColor3 = Color3.fromRGB(0,0,0)
            SliderValue.BackgroundTransparency = 1.000
            SliderValue.Position = UDim2.new(0.75, 0, 0, -5)
            SliderValue.Size = UDim2.new(0, 79, 0, 32)
            SliderValue.Font = Enum.Font.SourceSans
            SliderValue.Text = start
            SliderValue.TextColor3 = Color3.fromRGB(0,0,0)
            SliderValue.TextSize = 22.000
            SliderValue.TextStrokeColor3 = Color3.fromRGB(0,0,0)
            SliderValue.TextYAlignment = Enum.TextYAlignment.Bottom
                        
            sliderbacCorner.Name = "sliderbacCorner"
            sliderbacCorner.Parent = sliderbac
            
            ResetButton.Name = "ResetButton"
            ResetButton.Parent = Mainslider
            ResetButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
            ResetButton.BackgroundTransparency = 1.000
            ResetButton.Position = UDim2.new(0.740310073, 0, 0.411764711, 0)
            ResetButton.Size = UDim2.new(0, 64, 0, 18)
            ResetButton.Font = Enum.Font.SourceSans
            ResetButton.Text = "Default"
            ResetButton.TextColor3 = Color3.fromRGB(0,0,0)
            ResetButton.TextSize = 14.000
            
            UPSliderButton.Name = "UPSliderButton"
            UPSliderButton.Parent = Mainslider
            UPSliderButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
            UPSliderButton.BackgroundTransparency = 1.000
            UPSliderButton.Position = UDim2.new(0.667534709, 0, 0.393939376, 0)
            UPSliderButton.Size = UDim2.new(0, 21, 0, 19)
            UPSliderButton.Font = Enum.Font.SourceSans
            UPSliderButton.Text = "+"
            UPSliderButton.TextColor3 = Color3.fromRGB(0,0,0)
            UPSliderButton.TextSize = 20.000
            
            DownSliderButton.Name = "DownSliderButton"
            DownSliderButton.Parent = Mainslider
            DownSliderButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
            DownSliderButton.BackgroundTransparency = 1.000
            DownSliderButton.Position = UDim2.new(0.561999977, 0, 0.393999994, 0)
            DownSliderButton.Size = UDim2.new(0, 21, 0, 19)
            DownSliderButton.Font = Enum.Font.SourceSans
            DownSliderButton.Text = "-"
            DownSliderButton.TextColor3 = Color3.fromRGB(0,0,0)
            DownSliderButton.TextSize = 20.000
            
            ResetButton.MouseButton1Click:Connect(function()
                sliderbac:TweenSize(UDim2.new((start or 0) / max, 0, 0, 10), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
                SliderValue.Text = start
                pcall(callback,tonumber(start))
            end)
            UPSliderButton.MouseButton1Click:Connect(function()
                if tonumber(SliderValue.Text) < max then
                    sliderbac:TweenSize(UDim2.new((tonumber(SliderValue.Text) or 0) / (max-1), 0, 0, 10), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
                    SliderValue.Text = tonumber(SliderValue.Text) +1
                    pcall(callback,tonumber(SliderValue.Text)+1)
                end
            end)
            DownSliderButton.MouseButton1Click:Connect(function()
                if tonumber(SliderValue.Text) > min then
                    sliderbac:TweenSize(UDim2.new((tonumber(SliderValue.Text) or 0) / (max+1), 0, 0, 10), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
                    SliderValue.Text = tonumber(SliderValue.Text)-1
                    pcall(callback,tonumber(SliderValue.Text)-1)
                end
            end)
            dragging = false
            local function slide(input)
               local pos =
                  UDim2.new(
                  math.clamp((input.Position.X - sliderbackg.AbsolutePosition.X) / sliderbackg.AbsoluteSize.X, 0, 1),
                  0,
                  0,
                  10
               )
               sliderbac:TweenSize(pos, Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
               local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
               SliderValue.Text = value
               pcall(callback,value)
            end
            sliderbac.InputBegan:Connect(
               function(input)
                  if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        slide(input)
                        dragging = true
                  end
               end
            )

            sliderbac.InputEnded:Connect(
               function(input)
                  if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                  end
               end
            )

            UserInputService.InputChanged:Connect(
               function(input)
                  if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        slide(input)
                  end
               end
            )
            ScrollingSection.CanvasSize = UDim2.new(0, 0, 0, functionlistlaout.AbsoluteContentSize.Y)
        end
        function Sectionfunc:Dropdown(Dropdowntext,list,callback)
            local Dropdownfunc = {}
            local eMainDropdown = Instance.new("Frame")
            local eMainDropdown_2 = Instance.new("UICorner")
            local MainDropdown = Instance.new("Frame")
            local MainDropdown_2 = Instance.new("UICorner")
            local TextDropdown = Instance.new("TextLabel")
            local DropdownButton = Instance.new("TextButton")
            local BGSelectDropdown = Instance.new("Frame")
            local BGSelectDropdown_2 = Instance.new("UICorner")
            local ScrollingselectITEM = Instance.new("ScrollingFrame")
            local ScrollingselectITEMListLayout = Instance.new("UIListLayout")
            
            eMainDropdown.Name = "eMainDropdown"
            eMainDropdown.Parent = ScrollingSection
            eMainDropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
            eMainDropdown.Position = UDim2.new(0, 0, 0.152466372, 0)
            eMainDropdown.Size = UDim2.new(0, 258, 0, 38)
            
            eMainDropdown_2.Name = "eMainDropdown"
            eMainDropdown_2.Parent = eMainDropdown
            
            MainDropdown.Name = "MainDropdown"
            MainDropdown.Parent = eMainDropdown
            MainDropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
            MainDropdown.Position = UDim2.new(0, 1, 0, 1)
            MainDropdown.Size = UDim2.new(0, 256, 0, 36)
            
            MainDropdown_2.Name = "MainDropdown"
            MainDropdown_2.Parent = MainDropdown
            
            TextDropdown.Name = "TextDropdown"
            TextDropdown.Parent = MainDropdown
            TextDropdown.BackgroundColor3 = Color3.fromRGB(0,0,0)
            TextDropdown.BackgroundTransparency = 1.000
            TextDropdown.Position = UDim2.new(0.0313725509, 0, 0, 0)
            TextDropdown.Size = UDim2.new(0, 135, 0, 37)
            TextDropdown.Font = Enum.Font.SourceSans
            TextDropdown.Text = "Dropdown"
            TextDropdown.TextColor3 = Color3.fromRGB(0,0,0)
            TextDropdown.TextSize = 20.000
            TextDropdown.TextXAlignment = Enum.TextXAlignment.Left
            TextDropdown.Text = Dropdowntext or 'No Text'
            
            DropdownButton.Name = "DropdownButton"
            DropdownButton.Parent = MainDropdown
            DropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
            DropdownButton.BackgroundTransparency = 1.000
            DropdownButton.Size = UDim2.new(0, 256, 0, 34)
            DropdownButton.Font = Enum.Font.SourceSans
            DropdownButton.Text = ""
            DropdownButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            DropdownButton.TextSize = 14.000
            
            BGSelectDropdown.Name = "BGSelectDropdown"
            BGSelectDropdown.Parent = MainDropdown
            BGSelectDropdown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            BGSelectDropdown.Position = UDim2.new(0.03125, 0, 0.204419896, 0)
            BGSelectDropdown.Size = UDim2.new(0, 238, 0, 135)
            BGSelectDropdown.Visible = false
            
            BGSelectDropdown_2.Name = "BGSelectDropdown"
            BGSelectDropdown_2.Parent = BGSelectDropdown
            
            ScrollingselectITEM.Name = "ScrollingselectITEM"
            ScrollingselectITEM.Parent = BGSelectDropdown
            ScrollingselectITEM.Active = true
            ScrollingselectITEM.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
            ScrollingselectITEM.BackgroundTransparency = 1.000
            ScrollingselectITEM.BorderColor3 = Color3.fromRGB(45, 45, 45)
            ScrollingselectITEM.Position = UDim2.new(0.0294117648, 0, 0.05185185, 0)
            ScrollingselectITEM.Size = UDim2.new(0, 238, 0, 128)
            ScrollingselectITEM.ScrollBarThickness = 5
            
            ScrollingselectITEMListLayout.Name = "ScrollingselectITEMListLayout"
            ScrollingselectITEMListLayout.Parent = ScrollingselectITEM
            ScrollingselectITEMListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            ScrollingselectITEMListLayout.Padding = UDim.new(0, 2)
            
            ScrollingSection.CanvasSize = UDim2.new(0, 0, 0, functionlistlaout.AbsoluteContentSize.Y)
            toggledropdownonooff = false
            
            ItemCount = 0
            
            for i, v in next, list do
                ItemCount = ItemCount + 1
                local ITEM = Instance.new("TextButton")
                local ITEMCorner = Instance.new("UICorner")
                
                ITEM.Name = "ITEM"
                ITEM.Parent = ScrollingselectITEM
                ITEM.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                ITEM.Size = UDim2.new(0, 224, 0, 26)
                ITEM.Font = Enum.Font.SourceSans
                ITEM.TextColor3 = Color3.fromRGB(255, 255, 255)
                ITEM.TextSize = 20.000
                ITEM.Text = v
                
                ITEMCorner.Name = "ITEMCorner"
                ITEMCorner.Parent = ITEM
                ScrollingselectITEM.CanvasSize = UDim2.new(0, 0, 0, ScrollingselectITEMListLayout.AbsoluteContentSize.Y)
                ITEM.MouseButton1Click:Connect(function()
                    TextDropdown.Text = Dropdowntext..' | '..ITEM.Text or 'No Text'..' | '..ITEM.Text
                    BGSelectDropdown.Visible = false
                    eMainDropdown:TweenSize(UDim2.new(0,258,0,36), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
                    MainDropdown:TweenSize(UDim2.new(0,256,0,34), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
                    spawn(function()
                    repeat wait(.01)
                        ScrollingSection.CanvasSize = UDim2.new(0, 0, 0, functionlistlaout.AbsoluteContentSize.Y)
                    until toggledropdownonooff
                    end)
                    toggledropdownonooff = false
                    pcall(callback,ITEM.Text)
                end)
            end
            DropdownButton.MouseButton1Click:Connect(function()
                if not toggledropdownonooff then
                    eMainDropdown:TweenSize(UDim2.new(0,258,0,183), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.2, true)
                    MainDropdown:TweenSize(UDim2.new(0,256,0,181), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.2, true)
                    spawn(function()
                    repeat wait(.01)
                        ScrollingSection.CanvasSize = UDim2.new(0, 0, 0, functionlistlaout.AbsoluteContentSize.Y)
                    until not toggledropdownonooff
                    end)
                    BGSelectDropdown.Visible = true
                    toggledropdownonooff = true
                else
                    BGSelectDropdown.Visible = false
                    eMainDropdown:TweenSize(UDim2.new(0,258,0,36), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
                    MainDropdown:TweenSize(UDim2.new(0,256,0,34), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
                    spawn(function()
                    repeat wait(.01)
                        ScrollingSection.CanvasSize = UDim2.new(0, 0, 0, functionlistlaout.AbsoluteContentSize.Y)
                    until toggledropdownonooff
                    end)
                    toggledropdownonooff = false
                end
                function Dropdownfunc:Clear()
                    TextDropdown.Text = Dropdowntext or 'No Text'
                    ItemCount = 0
                    for i, v in next, ScrollingselectITEM:GetChildren() do
                       if v.Name == "ITEM" then
                             v:Destroy()
                       end
                    end
                    BGSelectDropdown.Visible = false
                    eMainDropdown:TweenSize(UDim2.new(0,258,0,36), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
                    MainDropdown:TweenSize(UDim2.new(0,256,0,34), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
                    spawn(function()
                    repeat wait(.01)
                        ScrollingSection.CanvasSize = UDim2.new(0, 0, 0, functionlistlaout.AbsoluteContentSize.Y)
                    until toggledropdownonooff
                    end)
                    toggledropdownonooff = false
                end
                function Dropdownfunc:Add(newbutton)
                    for i, v in next, newbutton do
                        wait(.1)
                        ItemCount = ItemCount + 1
                        local ITEM = Instance.new("TextButton")
                        local ITEMCorner = Instance.new("UICorner")
                        
                        ITEM.Name = "ITEM"
                        ITEM.Parent = ScrollingselectITEM
                        ITEM.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                        ITEM.Size = UDim2.new(0, 224, 0, 26)
                        ITEM.Font = Enum.Font.SourceSans
                        ITEM.TextColor3 = Color3.fromRGB(255, 255, 255)
                        ITEM.TextSize = 20.000
                        ITEM.Text = v
                        
                        ITEMCorner.Name = "ITEMCorner"
                        ITEMCorner.Parent = ITEM
                        ScrollingselectITEM.CanvasSize = UDim2.new(0, 0, 0, ScrollingselectITEMListLayout.AbsoluteContentSize.Y)
                        ITEM.MouseButton1Click:Connect(function()
                            TextDropdown.Text = Dropdowntext..' | '..ITEM.Text or 'No Text'..' | '..ITEM.Text
                            BGSelectDropdown.Visible = false
                            eMainDropdown:TweenSize(UDim2.new(0,258,0,36), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
                            MainDropdown:TweenSize(UDim2.new(0,256,0,34), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
                            spawn(function()
                            repeat wait(.01)
                                ScrollingSection.CanvasSize = UDim2.new(0, 0, 0, functionlistlaout.AbsoluteContentSize.Y)
                            until toggledropdownonooff
                            end)
                            toggledropdownonooff = false
                            pcall(callback,ITEM.Text)
                            end)
                            BGSelectDropdown.Visible = false
                            eMainDropdown:TweenSize(UDim2.new(0,258,0,36), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
                            MainDropdown:TweenSize(UDim2.new(0,256,0,34), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.5, true)
                            spawn(function()
                            repeat wait(.01)
                                ScrollingSection.CanvasSize = UDim2.new(0, 0, 0, functionlistlaout.AbsoluteContentSize.Y)
                            until toggledropdownonooff
                            end)
                            toggledropdownonooff = false
                    end
                end
            end)
            return Dropdownfunc
        end
        function Sectionfunc:Line()
            local eline = Instance.new("Frame")
            local elineCorner = Instance.new("UICorner")
            local line = Instance.new("Frame")
            local lineCorner = Instance.new("UICorner")

            eline.Name = "eline"
            eline.Parent = ScrollingSection
            eline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            eline.BackgroundTransparency = 1.000
            eline.Position = UDim2.new(0, 0, 0.183856502, 0)
            eline.Size = UDim2.new(0, 258, 0, 17)
            
            elineCorner.Name = "elineCorner"
            elineCorner.Parent = eline
            
            line.Name = "line"
            line.Parent = eline
            line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            line.Position = UDim2.new(0.00387596898, 0, 0.411764711, 0)
            line.Size = UDim2.new(0, 256, 0, 5)
            
            lineCorner.Name = "lineCorner"
            lineCorner.Parent = line
            
            ScrollingSection.CanvasSize = UDim2.new(0, 0, 0, functionlistlaout.AbsoluteContentSize.Y)
        end
        return Sectionfunc
    end
    
    ScrollingTab.CanvasSize = UDim2.new(0, TabLaout.AbsoluteContentSize.x, 0, 0)
    return tabContent
end
return Tabs
end
