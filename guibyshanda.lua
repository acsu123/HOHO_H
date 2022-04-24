local NameofHub = 'HUB'
local NameofHub2 = 'HUB'

function loadbn()
    do
    if game:GetService("CoreGui"):FindFirstChild("SOME") then
        game:GetService("CoreGui"):FindFirstChild("SOME"):Destroy()
    end
    if game:GetService("CoreGui"):FindFirstChild("SOMEUI") then
        game:GetService("CoreGui"):FindFirstChild("SOMEUI"):Destroy()
    end
end

_G.TopBackgroundColor = Color3.fromRGB(40, 40, 40)
_G.TopTextColor = Color3.fromRGB(150, 150, 150)
_G.HubTitleColor = Color3.fromRGB(55, 122, 204)
_G.WindowBackgroundColor = Color3.fromRGB(40, 40, 40)
_G.TabWindowColor = Color3.fromRGB(30, 30, 30)
_G.TabTextColor = Color3.fromRGB(180, 180, 180)
_G.ImageColor = Color3.fromRGB(180, 180, 180)
_G.ElementTextColor = Color3.fromRGB(180, 180, 180)
_G.ElementThemeColor = Color3.fromRGB(39, 86, 144)

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local SOME = Instance.new("ScreenGui")
local WN = Instance.new("Frame")
local WNUICorner = Instance.new("UICorner")
local IM = Instance.new("ImageLabel")
local OCBUTTON = Instance.new("TextButton")
local OCBUTTONUICorner = Instance.new("UICorner")
local TXT = Instance.new("TextLabel")
SOME.Name = "SOME"
SOME.Parent = game.CoreGui
SOME.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
SOME.ResetOnSpawn = false
WN.Name = "WN"
WN.Parent = SOME
WN.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
WN.Position = UDim2.new(0.0162532087, 0, 0.159420297, 0)
WN.Size = UDim2.new(0.0855432004, 0, 0.161030591, 0)
WN.ZIndex = 20
WNUICorner.CornerRadius = UDim.new(0, 10000)
WNUICorner.Name = "WNUICorner"
WNUICorner.Parent = WN
IM.Name = "IM"
IM.Parent = WN
IM.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
IM.BackgroundTransparency = 1.000
IM.BorderSizePixel = 0
IM.Position = UDim2.new(0.400000006, 0, 0.0500000007, 0)
IM.Size = UDim2.new(0.200000003, 0, 0.200000003, 0)
IM.ZIndex = 20
IM.Image = "rbxassetid://8113888560"
OCBUTTON.Name = "OCBUTTON"
OCBUTTON.Parent = WN
OCBUTTON.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OCBUTTON.BackgroundTransparency = 1.000
OCBUTTON.Size = UDim2.new(1, 0, 1, 0)
OCBUTTON.ZIndex = 10
OCBUTTON.Font = Enum.Font.SourceSans
OCBUTTON.Text = ""
OCBUTTON.TextColor3 = Color3.fromRGB(0, 0, 0)
OCBUTTON.TextSize = 14.000
OCBUTTONUICorner.CornerRadius = UDim.new(0, 200000)
OCBUTTONUICorner.Name = "OCBUTTONUICorner"
OCBUTTONUICorner.Parent = OCBUTTON
TXT.Name = "TXT"
TXT.Parent = WN
TXT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TXT.BackgroundTransparency = 1.000
TXT.BorderSizePixel = 0
TXT.Size = UDim2.new(1, 0, 1, 0)
TXT.ZIndex = 20
TXT.Font = Enum.Font.Gotham
TXT.Text = "Open/Close"
TXT.TextColor3 = Color3.fromRGB(255, 255, 255)
TXT.TextSize = 14.000
function DragOnMobile(dragger, todrag)
    local UserInputService = game:GetService("UserInputService")
    local gui = dragger
    local guitodrag = todrag
    
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        guitodrag.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = guitodrag.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end
DragOnMobile(TXT, WN)
OCBUTTON.MouseButton1Click:Connect(function()
    game.CoreGui:FindFirstChild("SOMEUI").Enabled = not game.CoreGui:FindFirstChild("SOMEUI").Enabled
end)
local Dino = {}
function Dino:CreateWindow(dinotitle, hubtitle)
    local SOMEUI = Instance.new("ScreenGui")
    local Window = Instance.new("Frame")
    local DinoHubText1 = Instance.new("TextLabel")
    local DinoHubText2 = Instance.new("TextLabel")
    local WindowText = Instance.new("TextLabel")
    local TabWindow = Instance.new("ScrollingFrame")
    local TabWindowList = Instance.new("UIListLayout")
    local ContainerHolder = Instance.new("Frame")
    
    --Properties:
    
    SOMEUI.Name = "SOMEUI"
    SOMEUI.Parent = game.CoreGui
    SOMEUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    Window.Name = "Window"
    Window.Parent = SOMEUI
    Window.BackgroundColor3 = _G.TopBackgroundColor
    Window.BorderSizePixel = 0
    Window.Position = UDim2.new(0, 392, 0, 264)
    Window.Size = UDim2.new(0, 390, 0, 350)
    
    DinoHubText1.Name = "DinoHubText1"
    DinoHubText1.Parent = Window
    DinoHubText1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DinoHubText1.BackgroundTransparency = 1.000
    DinoHubText1.BorderSizePixel = 0
    DinoHubText1.Position = UDim2.new(0, 5, 0, 0)
    DinoHubText1.Size = UDim2.new(0, 35, 0, 20)
    DinoHubText1.Font = Enum.Font.GothamSemibold
    DinoHubText1.Text = hubtitle or "Nil"
    DinoHubText1.TextColor3 = _G.TopTextColor
    DinoHubText1.TextSize = 13.000
    
    DinoHubText2.Name = "DinoHubText2"
    DinoHubText2.Parent = Window
    DinoHubText2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    DinoHubText2.BackgroundTransparency = 1.000
    DinoHubText2.BorderSizePixel = 0
    DinoHubText2.Position = UDim2.new(0, 40, 0, 0)
    DinoHubText2.Size = UDim2.new(0, 35, 0, 20)
    DinoHubText2.Font = Enum.Font.GothamSemibold
    DinoHubText2.Text = "Hub |"
    DinoHubText2.TextColor3 = _G.HubTitleColor
    DinoHubText2.TextSize = 13.000
    
    WindowText.Name = "WindowText"
    WindowText.Parent = Window
    WindowText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    WindowText.BackgroundTransparency = 1.000
    WindowText.BorderSizePixel = 0
    WindowText.Position = UDim2.new(0, 85, 0, 0)
    WindowText.Size = UDim2.new(0, 305, 0, 20)
    WindowText.Font = Enum.Font.GothamSemibold
    WindowText.Text = dinotitle or "Game Title"
    WindowText.TextColor3 = _G.TopTextColor
    WindowText.TextSize = 13.000
    WindowText.TextXAlignment = Enum.TextXAlignment.Left
    
    TabWindow.Name = "TabWindow"
    TabWindow.Parent = Window
    TabWindow.Active = true
    TabWindow.BackgroundColor3 = _G.TabWindowColor
    TabWindow.BorderSizePixel = 0
    TabWindow.Position = UDim2.new(0, 7, 0, 20)
    TabWindow.Size = UDim2.new(0, 375, 0, 20)
    TabWindow.CanvasSize = UDim2.new(2, 0, 0, 0)
    TabWindow.ScrollBarThickness = 2
    
    TabWindowList.Name = "TabWindowList"
    TabWindowList.Parent = TabWindow
    TabWindowList.FillDirection = Enum.FillDirection.Horizontal
    TabWindowList.SortOrder = Enum.SortOrder.LayoutOrder
    
    ContainerHolder.Name = "ContainerHolder"
    ContainerHolder.Parent = Window
    ContainerHolder.BackgroundColor3 = _G.WindowBackgroundColor
    ContainerHolder.BorderSizePixel = 0
    ContainerHolder.Position = UDim2.new(0, 0, 0, 40)
    ContainerHolder.Size = UDim2.new(0, 390, 0, 310)
    -- Don't Touch This Script Or It Will Mess Up --
    TabWindow.CanvasSize = UDim2.new(0, 0 + TabWindowList.AbsoluteContentSize.X, 0, 0)
    TabWindowList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabWindow.CanvasSize = UDim2.new(0, 0 + TabWindowList.AbsoluteContentSize.X, 0, 0)
    end)
    local gui = Window
    
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
    local DinoWindow = {}
    function DinoWindow:NewPage(pagetitle)
        local Container = Instance.new("ScrollingFrame")
        local ContainerList = Instance.new("UIListLayout")
        
        --Properties:
        
        Container.Name = pagetitle or "Container"
        Container.Parent = ContainerHolder
        Container.Active = true
        Container.BackgroundColor3 = _G.WindowBackgroundColor
        Container.BorderSizePixel = 0
        Container.Position = UDim2.new(0, 5, 0, 5)
        Container.Size = UDim2.new(0, 380, 0, 300)
        Container.Visible = false
        Container.CanvasSize = UDim2.new(0, 0, 0, 5 + ContainerList.Padding.Offset + ContainerList.AbsoluteContentSize.Y)
        Container.ScrollBarThickness = 2
        
        ContainerList.Name = "ContainerList"
        ContainerList.Parent = Container
        ContainerList.HorizontalAlignment = Enum.HorizontalAlignment.Center
        ContainerList.SortOrder = Enum.SortOrder.LayoutOrder
        ContainerList.Padding = UDim.new(0, 5)
        -- Don't Touch This Script Or It Will Mess Up --
        ContainerList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            Container.CanvasSize = UDim2.new(0, 0, 0, 0 + ContainerList.Padding.Offset + ContainerList.AbsoluteContentSize.Y)
        end)
        
        Container.ChildAdded:Connect(function()
            Container.CanvasSize = UDim2.new(0, 0, 0, 0 + ContainerList.Padding.Offset + ContainerList.AbsoluteContentSize.Y)
        end)
        local TabButton = Instance.new("TextButton")
        --Properties:
        
        TabButton.Name = "TabButton"
        TabButton.Parent = TabWindow
        TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.BackgroundTransparency = 1.000
        TabButton.BorderSizePixel = 0
        TabButton.Position = UDim2.new(0, 5, 0, 0)
        TabButton.Size = UDim2.new(0, 100, 0, 20)
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.Text = pagetitle or "Tab"
        TabButton.TextColor3 = _G.TabTextColor
        TabButton.TextSize = 13.000
        -- Don't Touch This Script Or It Will Mess Up --
        TabButton.Size = UDim2.new(0, 10 + TabButton.TextBounds.X, 0, 20)
        
        TabButton.MouseButton1Click:Connect(function()
            for _, co in pairs(ContainerHolder:GetChildren()) do
                if co:IsA("ScrollingFrame") then
                    co.Visible = false
                end
            end
            for _, tb in pairs(TabWindow:GetChildren()) do
                if tb:IsA("TextButton") then
                    TweenService:Create(tb, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0}):Play()
                end
            end
            TweenService:Create(TabButton, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0.4}):Play()
            Container.Visible = true
        end)
        local DinoPage = {}
        function DinoPage:NewSection(sectiontitle)
            local Section = Instance.new("Frame")
            local SectionTitle = Instance.new("TextLabel")
            local SectionIn = Instance.new("Frame")
            local SectionInUICorner = Instance.new("UICorner")
            local SectionInList = Instance.new("UIListLayout")
            
            --Properties:
            
            Section.Name = sectiontitle or "Section"
            Section.Parent = Container
            Section.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            Section.Position = UDim2.new(0.0263157897, 0, 0, 0)
            Section.Size = UDim2.new(0, 360, 0, 20)
            
            SectionTitle.Name = "SectionTitle"
            SectionTitle.Parent = Section
            SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionTitle.BackgroundTransparency = 1.000
            SectionTitle.BorderSizePixel = 0
            SectionTitle.Size = UDim2.new(0, 360, 0, 15)
            SectionTitle.Font = Enum.Font.GothamSemibold
            SectionTitle.Text = sectiontitle or "Section"
            SectionTitle.TextColor3 = _G.ElementTextColor
            SectionTitle.TextSize = 13.000
            
            SectionIn.Name = "SectionIn"
            SectionIn.Parent = Section
            SectionIn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            SectionIn.BorderSizePixel = 0
            SectionIn.Position = UDim2.new(0, 0, 0, 20)
            SectionIn.Size = UDim2.new(0, 360, 0, 70)
            
            SectionInUICorner.CornerRadius = UDim.new(0, 2)
            SectionInUICorner.Name = "SectionInUICorner"
            SectionInUICorner.Parent = SectionIn
            
            SectionInList.Name = "SectionInList"
            SectionInList.Parent = SectionIn
            SectionInList.HorizontalAlignment = Enum.HorizontalAlignment.Center
            SectionInList.SortOrder = Enum.SortOrder.LayoutOrder
            SectionInList.Padding = UDim.new(0, 10)
            -- Don't Touch This Script Or It Will Mess Up --
            SectionIn.Size = UDim2.new(0, 360, 0, 5 + SectionInList.AbsoluteContentSize.Y + SectionInList.Padding.Offset)
            SectionInList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                SectionIn.Size = UDim2.new(0, 360, 0, 5 + SectionInList.AbsoluteContentSize.Y + SectionInList.Padding.Offset)
            end)
            
            local function ContainerSizeChange()
                local largestListSize = 0
				largestListSize = SectionInList.AbsoluteContentSize.Y
				
				Container.CanvasSize = UDim2.new(0, 0, 0, largestListSize + 35 + SectionInList.Padding.Offset)
			end
            local function sectionsizechange()
				Section.Size = UDim2.new(0, 360, 0, 20 + SectionInList.AbsoluteContentSize.Y + SectionInList.Padding.Offset)
			end
            ContainerSizeChange()
            sectionsizechange()
            SectionInList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
                ContainerSizeChange()
                sectionsizechange()
            end)
            local DinoElement = {}
            function DinoElement:CreateButton(buttontitle, img, buttoncallback)
                local ButtonHolder = Instance.new("TextButton")
                local ButtonHolderUICorner = Instance.new("UICorner")
                local ButtonHolderUIStroke = Instance.new("UIStroke")
                local ButtonImage = Instance.new("ImageLabel")
                
                ButtonHolder.Name = buttontitle or "ButtonHolder"
                ButtonHolder.Parent = SectionIn
                ButtonHolder.BackgroundColor3 = _G.ElementThemeColor
                ButtonHolder.BackgroundTransparency = 0.4
                ButtonHolder.BorderSizePixel = 0
                ButtonHolder.Position = UDim2.new(0, 5, 0, 0)
                ButtonHolder.Size = UDim2.new(0, 350, 0, 25)
                ButtonHolder.AutoButtonColor = false
                ButtonHolder.Font = Enum.Font.GothamSemibold
                ButtonHolder.Text = buttontitle or "Button | Click Me"
                ButtonHolder.TextColor3 = _G.ElementTextColor
                ButtonHolder.TextSize = 13.000
                
                ButtonHolderUICorner.CornerRadius = UDim.new(0, 4)
                ButtonHolderUICorner.Name = "ButtonHolderUICorner"
                ButtonHolderUICorner.Parent = ButtonHolder
                
                ButtonHolderUIStroke.Name = "ButtonHolderUIStroke"
                ButtonHolderUIStroke.Parent = ButtonHolder
                ButtonHolderUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                ButtonHolderUIStroke.Color = _G.ElementThemeColor
                ButtonHolderUIStroke.LineJoinMode = Enum.LineJoinMode.Round
                ButtonHolderUIStroke.Thickness = 1.6
                ButtonHolderUIStroke.Transparency = 0
                ButtonHolderUIStroke.Enabled = true
                ButtonHolderUIStroke.Archivable = true
                
                ButtonImage.Name = "ButtonImage"
                ButtonImage.Parent = ButtonHolder
                ButtonImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ButtonImage.BackgroundTransparency = 1.000
                ButtonImage.BorderSizePixel = 0
                ButtonImage.Position = UDim2.new(0, 5, 0, 3)
                ButtonImage.Size = UDim2.new(0, 18, 0, 18)
                ButtonImage.Image = img or "rbxassetid://7839505809"
                ButtonImage.ImageColor3 = _G.ImageColor
                -- Don't Touch This Script Or It Will Mess Up --
                ButtonHolder.MouseEnter:Connect(function()
                    TweenService:Create(ButtonHolder, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0.6}):Play()
                    TweenService:Create(ButtonImage, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 0.4}):Play()
                end)
                ButtonHolder.MouseLeave:Connect(function()
                    TweenService:Create(ButtonHolder, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0}):Play()
                    TweenService:Create(ButtonImage, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 0}):Play()
                    TweenService:Create(ButtonHolder, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 350, 0, 25)}):Play()
                end)
                ButtonHolder.MouseButton1Down:Connect(function()
                    TweenService:Create(ButtonHolder, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 345, 0, 23)}):Play()
                end)
                ButtonHolder.MouseButton1Up:Connect(function()
                    TweenService:Create(ButtonHolder, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 350, 0, 25)}):Play()
                end)
                ButtonHolder.MouseButton1Click:Connect(function()
                    pcall(function()
                        buttoncallback()
                    end)
                end)
            end
            function DinoElement:CreateToggle(toggletitle, img, togglecallback)
                local ToggleHolder = Instance.new("Frame")
                local ToggleHolderUICorner = Instance.new("UICorner")
                local ToggleImage = Instance.new("ImageLabel")
                local ToggleTitle = Instance.new("TextLabel")
                local ToggleOut = Instance.new("ImageLabel")
                local ToggleOutUICorner = Instance.new("UICorner")
                local ToggleIn = Instance.new("ImageLabel")
                local ToggleInUICorner = Instance.new("UICorner")
                local ToggleHolderButton = Instance.new("TextButton")
                local ToggleHolderUIStroke = Instance.new("UIStroke")
                
                --Properties:
                
                ToggleHolder.Name = toggletitle or "ToggleHolder"
                ToggleHolder.Parent = SectionIn
                ToggleHolder.BackgroundColor3 = _G.WindowBackgroundColor
                ToggleHolder.BorderSizePixel = 0
                ToggleHolder.Size = UDim2.new(0, 350, 0, 25)
                
                ToggleHolderUICorner.CornerRadius = UDim.new(0, 1)
                ToggleHolderUICorner.Name = "ToggleHolderUICorner"
                ToggleHolderUICorner.Parent = ToggleHolder
                
                ToggleImage.Name = "ToggleImage"
                ToggleImage.Parent = ToggleHolder
                ToggleImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleImage.BackgroundTransparency = 1.000
                ToggleImage.BorderSizePixel = 0
                ToggleImage.Position = UDim2.new(0, 5, 0, 3)
                ToggleImage.Size = UDim2.new(0, 18, 0, 18)
                ToggleImage.Image = img or "rbxassetid://7832083744"
                ToggleImage.ImageColor3 = _G.ImageColor
                
                ToggleTitle.Name = "ToggleTitle"
                ToggleTitle.Parent = ToggleHolder
                ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleTitle.BackgroundTransparency = 1.000
                ToggleTitle.BorderSizePixel = 0
                ToggleTitle.Position = UDim2.new(0, 25, 0, 0)
                ToggleTitle.Size = UDim2.new(0, 250, 0, 25)
                ToggleTitle.Font = Enum.Font.GothamSemibold
                ToggleTitle.Text = toggletitle or "Toggle | Toggle Me !"
                ToggleTitle.TextColor3 = _G.ElementTextColor
                ToggleTitle.TextSize = 13.000
                ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
                
                ToggleOut.Name = "ToggleOut"
                ToggleOut.Parent = ToggleHolder
                ToggleOut.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                ToggleOut.Position = UDim2.new(0, 310, 0, 4)
                ToggleOut.Size = UDim2.new(0, 34, 0, 16)
                ToggleOut.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
                ToggleOut.ImageTransparency = 1.000
                
                ToggleOutUICorner.CornerRadius = UDim.new(0, 1000)
                ToggleOutUICorner.Name = "ToggleOutUICorner"
                ToggleOutUICorner.Parent = ToggleOut
                
                ToggleIn.Name = "ToggleIn"
                ToggleIn.Parent = ToggleOut
                ToggleIn.BackgroundColor3 = _G.ElementThemeColor
                ToggleIn.Position = UDim2.new(0, 2, 0, 2)
                ToggleIn.Size = UDim2.new(0, 12, 0, 12)
                ToggleIn.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
                ToggleIn.ImageTransparency = 1.000
                
                ToggleInUICorner.CornerRadius = UDim.new(0, 1000)
                ToggleInUICorner.Name = "ToggleInUICorner"
                ToggleInUICorner.Parent = ToggleIn
                
                ToggleHolderButton.Name = "ToggleHolderButton"
                ToggleHolderButton.Parent = ToggleHolder
                ToggleHolderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                ToggleHolderButton.BackgroundTransparency = 1.000
                ToggleHolderButton.BorderSizePixel = 0
                ToggleHolderButton.Size = UDim2.new(0, 350, 0, 25)
                ToggleHolderButton.ZIndex = 2
                ToggleHolderButton.Font = Enum.Font.SourceSans
                ToggleHolderButton.Text = ""
                ToggleHolderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                ToggleHolderButton.TextSize = 14.000
                ToggleHolderUIStroke.Name = "ToggleHolderUIStroke"
                ToggleHolderUIStroke.Parent = ToggleHolder
                ToggleHolderUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                ToggleHolderUIStroke.Color = _G.ElementThemeColor
                ToggleHolderUIStroke.LineJoinMode = Enum.LineJoinMode.Round
                ToggleHolderUIStroke.Thickness = 1.6
                ToggleHolderUIStroke.Transparency = 0
                ToggleHolderUIStroke.Enabled = true
                ToggleHolderUIStroke.Archivable = true
                -- Don't Touch This Script Or It Will Mess Up --
                local toggled = false
                ToggleHolderButton.MouseEnter:Connect(function()
                    TweenService:Create(ToggleTitle, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0.2}):Play()
                    TweenService:Create(ToggleImage, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 0.2}):Play()
                end)
                ToggleHolderButton.MouseLeave:Connect(function()
                    TweenService:Create(ToggleTitle, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {TextTransparency = 0}):Play()
                    TweenService:Create(ToggleImage, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {ImageTransparency = 0}):Play()
                    TweenService:Create(ToggleHolder, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 350, 0, 25)}):Play()
                end)
                ToggleHolderButton.MouseButton1Down:Connect(function()
                    TweenService:Create(ToggleHolder, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 345, 0, 23)}):Play()
                end)
                ToggleHolderButton.MouseButton1Up:Connect(function()
                    TweenService:Create(ToggleHolder, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 350, 0, 25)}):Play()
                end)
                ToggleHolderButton.MouseButton1Click:Connect(function()
                    if toggled then
                        TweenService:Create(ToggleIn, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Position = UDim2.new(0, 2, 0, 2)}):Play()
                        toggled = false
                        pcall(function()
                            togglecallback(toggled)
                        end)
                    else
                        TweenService:Create(ToggleIn, TweenInfo.new(0.12, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {Position = UDim2.new(0, 20, 0, 2)}):Play()
                        toggled = true
                        pcall(function()
                            togglecallback(toggled)
                        end)
                    end
                end)
                
            end
            function DinoElement:CreateSlider(slidertitle, img, minvalue, maxvalue, callback)
                local SliderHolder = Instance.new("Frame")
                local SliderHolderUICorner = Instance.new("UICorner")
                local SliderImage = Instance.new("ImageLabel")
                local SliderHolderTitle = Instance.new("TextLabel")
                local SliderButton = Instance.new("ImageButton")
                local SliderButtonUICorner = Instance.new("UICorner")
                local SliderIn = Instance.new("ImageLabel")
                local SliderInUICorner = Instance.new("UICorner")
                local Val = Instance.new("TextLabel")
                local SliderHolderUIStroke = Instance.new("UIStroke")
                
                --Properties:
                
                SliderHolder.Name = slidertitle or "SliderHolder"
                SliderHolder.Parent = SectionIn
                SliderHolder.BackgroundColor3 = _G.WindowBackgroundColor
                SliderHolder.BorderSizePixel = 0
                SliderHolder.Position = UDim2.new(0, 5, 0, 60)
                SliderHolder.Size = UDim2.new(0, 350, 0, 40)
                
                SliderHolderUICorner.CornerRadius = UDim.new(0, 1)
                SliderHolderUICorner.Name = "SliderHolderUICorner"
                SliderHolderUICorner.Parent = SliderHolder
                
                SliderImage.Name = "SliderImage"
                SliderImage.Parent = SliderHolder
                SliderImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderImage.BackgroundTransparency = 1.000
                SliderImage.BorderSizePixel = 0
                SliderImage.Position = UDim2.new(0, 5, 0, 3)
                SliderImage.Size = UDim2.new(0, 18, 0, 18)
                SliderImage.Image = img or "rbxassetid://7839722369"
                SliderImage.ImageColor3 = _G.ImageColor
                
                SliderHolderTitle.Name = "SliderHolderTitle"
                SliderHolderTitle.Parent = SliderHolder
                SliderHolderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SliderHolderTitle.BackgroundTransparency = 1.000
                SliderHolderTitle.BorderSizePixel = 0
                SliderHolderTitle.Position = UDim2.new(0, 25, 0, 0)
                SliderHolderTitle.Size = UDim2.new(0, 250, 0, 25)
                SliderHolderTitle.Font = Enum.Font.GothamSemibold
                SliderHolderTitle.Text = slidertitle or "Slider | Hold Me !"
                SliderHolderTitle.TextColor3 = _G.ElementTextColor
                SliderHolderTitle.TextSize = 13.000
                SliderHolderTitle.TextXAlignment = Enum.TextXAlignment.Left
                
                SliderButton.Name = "SliderButton"
                SliderButton.Parent = SliderHolder
                SliderButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                SliderButton.Position = UDim2.new(0, 10, 0, 25)
                SliderButton.Size = UDim2.new(0, 300, 0, 7)
                SliderButton.AutoButtonColor = false
                SliderButton.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
                SliderButton.ImageTransparency = 1.000
                
                SliderButtonUICorner.CornerRadius = UDim.new(0, 1000)
                SliderButtonUICorner.Name = "SliderButtonUICorner"
                SliderButtonUICorner.Parent = SliderButton
                
                SliderIn.Name = "SliderIn"
                SliderIn.Parent = SliderButton
                SliderIn.BackgroundColor3 = _G.ElementThemeColor
                SliderIn.Size = UDim2.new(0, 0, 0, 7)
                SliderIn.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
                SliderIn.ImageTransparency = 1.000
                
                SliderInUICorner.CornerRadius = UDim.new(0, 1000)
                SliderInUICorner.Name = "SliderInUICorner"
                SliderInUICorner.Parent = SliderIn
                
                Val.Name = "Val"
                Val.Parent = SliderHolder
                Val.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Val.BackgroundTransparency = 1.000
                Val.BorderSizePixel = 0
                Val.Position = UDim2.new(0, 282, 0, 0)
                Val.Size = UDim2.new(0, 60, 0, 25)
                Val.Font = Enum.Font.GothamSemibold
                Val.Text = minvalue or "0"
                Val.TextColor3 = Color3.fromRGB(150, 150, 150)
                Val.TextSize = 13.000
                Val.TextXAlignment = Enum.TextXAlignment.Right
                SliderHolderUIStroke.Name = "SliderHolderUIStroke"
                SliderHolderUIStroke.Parent = SliderHolder
                SliderHolderUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                SliderHolderUIStroke.Color = _G.ElementThemeColor
                SliderHolderUIStroke.LineJoinMode = Enum.LineJoinMode.Round
                SliderHolderUIStroke.Thickness = 1.6
                SliderHolderUIStroke.Transparency = 0
                SliderHolderUIStroke.Enabled = true
                SliderHolderUIStroke.Archivable = true
                minvalue = minvalue or 0
                maxvalue = maxvalue or 100
                
                
                -----Callback-----
                callback = callback or function() end
                
                
                -----Variables-----
                local mouse = game.Players.LocalPlayer:GetMouse()
                local uis = game:GetService("UserInputService")
                local Value;
                
                
                
                
                -----Main Code-----
                
                SliderButton.MouseButton1Down:Connect(function()
                    Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 300) * SliderIn.AbsoluteSize.X) + tonumber(minvalue)) or 0
                    pcall(function()
                        callback(Value)
                    end)
                    SliderIn.Size = UDim2.new(0, math.clamp(mouse.X - SliderIn.AbsolutePosition.X, 0, 300), 0, 7)
                    moveconnection = mouse.Move:Connect(function()
                        Val.Text = Value
                        Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 300) * SliderIn.AbsoluteSize.X) + tonumber(minvalue))
                        pcall(function()
                            callback(Value)
                        end)
                        SliderIn.Size = UDim2.new(0, math.clamp(mouse.X - SliderIn.AbsolutePosition.X, 0, 300), 0, 7)
                    end)
                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 300) * SliderIn.AbsoluteSize.X) + tonumber(minvalue))
                            pcall(function()
                                callback(Value)
                            end)
                            SliderIn.Size = UDim2.new(0, math.clamp(mouse.X - SliderIn.AbsolutePosition.X, 0, 300), 0, 7)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
            end
            function DinoElement:CreateTextBox(textboxtitle, img, textboxplaceholdertitle,textboxcallback)
                local TextBoxToggle = Instance.new("Frame")
                local TextBoxToggleUICorner = Instance.new("UICorner")
                local TextBoxImage = Instance.new("ImageLabel")
                local TextBoxTitle = Instance.new("TextLabel")
                local TextBox = Instance.new("TextBox")
                local TextBoxHolderUIStroke = Instance.new("UIStroke")
                
                --Properties:
                
                TextBoxToggle.Name = textboxtitle or "TextBoxToggle"
                TextBoxToggle.Parent = SectionIn
                TextBoxToggle.BackgroundColor3 = _G.WindowBackgroundColor
                TextBoxToggle.BorderSizePixel = 0
                TextBoxToggle.Size = UDim2.new(0, 350, 0, 25)
                
                TextBoxToggleUICorner.CornerRadius = UDim.new(0, 1)
                TextBoxToggleUICorner.Name = "TextBoxToggleUICorner"
                TextBoxToggleUICorner.Parent = TextBoxToggle
                
                TextBoxImage.Name = "TextBoxImage"
                TextBoxImage.Parent = TextBoxToggle
                TextBoxImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextBoxImage.BackgroundTransparency = 1.000
                TextBoxImage.BorderSizePixel = 0
                TextBoxImage.Position = UDim2.new(0, 5, 0, 3)
                TextBoxImage.Size = UDim2.new(0, 18, 0, 18)
                TextBoxImage.Image = img or "rbxassetid://7832050494"
                TextBoxImage.ImageColor3 = _G.ImageColor
                
                TextBoxTitle.Name = "TextBoxTitle"
                TextBoxTitle.Parent = TextBoxToggle
                TextBoxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextBoxTitle.BackgroundTransparency = 1.000
                TextBoxTitle.BorderSizePixel = 0
                TextBoxTitle.Position = UDim2.new(0, 25, 0, 0)
                TextBoxTitle.Size = UDim2.new(0, 175, 0, 25)
                TextBoxTitle.Font = Enum.Font.GothamSemibold
                TextBoxTitle.Text = textboxtitle or "TextBox"
                TextBoxTitle.TextColor3 = _G.ElementTextColor
                TextBoxTitle.TextSize = 13.000
                TextBoxTitle.TextXAlignment = Enum.TextXAlignment.Left
                
                TextBox.Parent = TextBoxToggle
                TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                TextBox.BorderSizePixel = 0
                TextBox.Position = UDim2.new(0, 210, 0, 4)
                TextBox.Size = UDim2.new(0, 135, 0, 18)
                TextBox.Font = Enum.Font.GothamSemibold
                TextBox.PlaceholderText = textboxplaceholdertitle or "Enter Text"
                TextBox.Text = ""
                TextBox.TextColor3 = _G.ElementTextColor
                TextBox.TextSize = 12.000
                TextBoxHolderUIStroke.Name = "TextBoxHolderUIStroke"
                TextBoxHolderUIStroke.Parent = TextBoxToggle
                TextBoxHolderUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                TextBoxHolderUIStroke.Color = _G.ElementThemeColor
                TextBoxHolderUIStroke.LineJoinMode = Enum.LineJoinMode.Round
                TextBoxHolderUIStroke.Thickness = 1.6
                TextBoxHolderUIStroke.Transparency = 0
                TextBoxHolderUIStroke.Enabled = true
                TextBoxHolderUIStroke.Archivable = true
                TextBox.FocusLost:Connect(function()
                    pcall(function()
                        textboxcallback(TextBox.Text)
                    end)
                end)
            end
            function DinoElement:CreateDropdown(dropdowntitle, img, list, dropdowncallback)
                list = list or {}
                local DropdownHolder = Instance.new("Frame")
                local DropdownHolderUICorner = Instance.new("UICorner")
                local DropdownImage = Instance.new("ImageLabel")
                local DropdownHolderTitle = Instance.new("TextLabel")
                local DropdownButton = Instance.new("TextButton")
                local DropdownIn = Instance.new("Frame")
                local DropdownInList = Instance.new("UIListLayout")
                local DropdownSelectedTitle = Instance.new("TextLabel")
                local DropdownHolderUIStroke = Instance.new("UIStroke")
                
                --Properties:
                
                DropdownHolder.Name = dropdowntitle or "DropdownHolder"
                DropdownHolder.Parent = SectionIn
                DropdownHolder.BackgroundColor3 = _G.WindowBackgroundColor
                DropdownHolder.BorderSizePixel = 0
                DropdownHolder.ClipsDescendants = true
                DropdownHolder.Size = UDim2.new(0, 350, 0, 25)
                
                DropdownHolderUICorner.CornerRadius = UDim.new(0, 1)
                DropdownHolderUICorner.Name = "DropdownHolderUICorner"
                DropdownHolderUICorner.Parent = DropdownHolder
                
                DropdownImage.Name = "DropdownImage"
                DropdownImage.Parent = DropdownHolder
                DropdownImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropdownImage.BackgroundTransparency = 1.000
                DropdownImage.BorderSizePixel = 0
                DropdownImage.Position = UDim2.new(0, 5, 0, 3)
                DropdownImage.Size = UDim2.new(0, 18, 0, 18)
                DropdownImage.Image = img or "rbxassetid://7831282709"
                DropdownImage.ImageColor3 = _G.ImageColor
                
                DropdownHolderTitle.Name = "DropdownHolderTitle"
                DropdownHolderTitle.Parent = DropdownHolder
                DropdownHolderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropdownHolderTitle.BackgroundTransparency = 1.000
                DropdownHolderTitle.BorderSizePixel = 0
                DropdownHolderTitle.Position = UDim2.new(0, 25, 0, 0)
                DropdownHolderTitle.Size = UDim2.new(0, 175, 0, 25)
                DropdownHolderTitle.Font = Enum.Font.GothamSemibold
                DropdownHolderTitle.Text = dropdowntitle or "Dropdown | Drop Me !"
                DropdownHolderTitle.TextColor3 = _G.ElementTextColor
                DropdownHolderTitle.TextSize = 13.000
                DropdownHolderTitle.TextXAlignment = Enum.TextXAlignment.Left
                
                DropdownButton.Name = "DropdownButton"
                DropdownButton.Parent = DropdownHolder
                DropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropdownButton.BackgroundTransparency = 1.000
                DropdownButton.BorderSizePixel = 0
                DropdownButton.Size = UDim2.new(0, 350, 0, 25)
                DropdownButton.ZIndex = 2
                DropdownButton.Font = Enum.Font.SourceSans
                DropdownButton.Text = ""
                DropdownButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                DropdownButton.TextSize = 14.000
                
                DropdownIn.Name = "DropdownIn"
                DropdownIn.Parent = DropdownHolder
                DropdownIn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropdownIn.BackgroundTransparency = 1.000
                DropdownIn.BorderSizePixel = 0
                DropdownIn.Position = UDim2.new(0, 0, 0, 25)
                DropdownIn.Size = UDim2.new(0, 350, 0, 1)
                
                DropdownInList.Name = "DropdownInList"
                DropdownInList.Parent = DropdownIn
                DropdownInList.SortOrder = Enum.SortOrder.LayoutOrder
                
                DropdownSelectedTitle.Name = "DropdownSelectedTitle"
                DropdownSelectedTitle.Parent = DropdownHolder
                DropdownSelectedTitle.BackgroundColor3 = _G.ElementThemeColor
                DropdownSelectedTitle.BorderSizePixel = 0
                DropdownSelectedTitle.Position = UDim2.new(0, 345, 0, 2)
                DropdownSelectedTitle.Size = UDim2.new(0, -50, 0, 20)
                DropdownSelectedTitle.Font = Enum.Font.GothamSemibold
                DropdownSelectedTitle.Text = "NONE"
                DropdownSelectedTitle.TextColor3 = _G.ElementTextColor
                DropdownSelectedTitle.TextSize = 12.000
                DropdownHolderUIStroke.Name = "DropdownHolderUIStroke"
                DropdownHolderUIStroke.Parent = TextBoxToggle
                DropdownHolderUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                DropdownHolderUIStroke.Color = Color3.fromRGB(35, 78, 130)
                DropdownHolderUIStroke.LineJoinMode = Enum.LineJoinMode.Round
                DropdownHolderUIStroke.Thickness = 1.6
                DropdownHolderUIStroke.Transparency = 0
                DropdownHolderUIStroke.Enabled = true
                DropdownHolderUIStroke.Archivable = true
                -- Don't Touch This Script Or It Will Mess Up --
                DropdownButton.MouseButton1Click:Connect(function()
                    DropdownHolder:TweenSize(UDim2.new(0, 350, 0, 25 + DropdownInList.AbsoluteContentSize.Y), "InOut", "Quad", 0.08, true)
                end)
                DropdownSelectedTitle.Size = UDim2.new(0, 0 - DropdownSelectedTitle.TextBounds.X - 5, 0, 20)
                DropdownSelectedTitle:GetPropertyChangedSignal("Text"):Connect(function()
                    DropdownSelectedTitle.Size = UDim2.new(0, 0 - DropdownSelectedTitle.TextBounds.X - 5, 0, 20)
                end)
                for listindex, listvalue in next, list do
                    local ListButton = Instance.new("TextButton")
                    --Properties:
                    
                    ListButton.Name = listvalue or "ListButton"
                    ListButton.Parent = DropdownIn
                    ListButton.BackgroundColor3 = _G.ElementThemeColor
                    ListButton.BorderSizePixel = 0
                    ListButton.Size = UDim2.new(0, 350, 0, 25)
                    ListButton.AutoButtonColor = false
                    ListButton.Font = Enum.Font.GothamSemibold
                    ListButton.Text = listvalue or "List"
                    ListButton.TextColor3 = _G.ElementTextColor
                    ListButton.TextSize = 14.000
                    ListButton.MouseButton1Click:Connect(function()
                        DropdownHolder:TweenSize(UDim2.new(0, 350, 0, 25), "InOut", "Quad", 0.08, true)
                        DropdownSelectedTitle.Text = ListButton.Text
                        pcall(function()
                            dropdowncallback(ListButton.Text)
                        end)
                    end)
                    
                end
                local DinoDropdown = {}
                function DinoDropdown:RefreshDropdown(newlist)
                    newlist = newlist or {}
                    for _, alllist in pairs(DropdownIn:GetChildren()) do
                        if alllist:IsA("TextButton") then
                            alllist:Destroy()
                        end
                    end
                    for newlistindex, newlistvalue in next, newlist do
                        local ListButton = Instance.new("TextButton")
                        --Properties:
                        
                        ListButton.Name = newlistvalue or "ListButton"
                        ListButton.Parent = DropdownIn
                        ListButton.BackgroundColor3 = _G.ElementThemeColor
                        ListButton.BorderSizePixel = 0
                        ListButton.Size = UDim2.new(0, 350, 0, 25)
                        ListButton.AutoButtonColor = false
                        ListButton.Font = Enum.Font.GothamSemibold
                        ListButton.Text = newlistvalue or "List"
                        ListButton.TextColor3 = _G.ElementTextColor
                        ListButton.TextSize = 14.000
    
                        ListButton.MouseButton1Click:Connect(function()
                            DropdownHolder:TweenSize(UDim2.new(0, 350, 0, 25), "InOut", "Quad", 0.08, true)
                            DropdownSelectedTitle.Text = ListButton.Text
                            pcall(function()
                                dropdowncallback(ListButton.Text)
                            end)
                        end)
                    end
                end
                return DinoDropdown
            end
            function DinoElement:CreateLabel(labeltitle)
                local DropdownHolderTitle = Instance.new("TextLabel")
                --Properties:
                
                DropdownHolderTitle.Name = labeltitle or "DropdownHolderTitle"
                DropdownHolderTitle.Parent = SectionIn
                DropdownHolderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                DropdownHolderTitle.BackgroundTransparency = 1.000
                DropdownHolderTitle.BorderSizePixel = 0
                DropdownHolderTitle.Position = UDim2.new(0, 5, 0, 190)
                DropdownHolderTitle.Size = UDim2.new(0, 350, 0, 15)
                DropdownHolderTitle.Font = Enum.Font.GothamSemibold
                DropdownHolderTitle.Text = labeltitle or "This Is A Description"
                DropdownHolderTitle.TextColor3 = _G.ElementTextColor
                DropdownHolderTitle.TextSize = 13.000
                DropdownHolderTitle.TextXAlignment = Enum.TextXAlignment.Left
                local DinoLabel = {}
                function DinoLabel:ChangeLabel(newlabeltitle)
                    DropdownHolderTitle.Text = newlabeltitle
                end
                return DinoLabel
            end
            return DinoElement
        end
        
        return DinoPage
    end
    return DinoWindow
end

_G.TopBackgroundColor = Color3.fromRGB(40, 40, 40)
_G.TopTextColor = Color3.fromRGB(255, 0, 0)
_G.HubTitleColor = Color3.fromRGB(255, 0, 0)
_G.WindowBackgroundColor = Color3.fromRGB(40, 40, 40)
_G.TabWindowColor = Color3.fromRGB(30,30,30)
_G.TabTextColor = Color3.fromRGB(255, 0, 0)
_G.ImageColor = Color3.fromRGB(180, 180, 180)
_G.ElementTextColor = Color3.fromRGB(180, 180, 180)
_G.ElementThemeColor = Color3.fromRGB(255, 0, 0)

local DinoWindow = Dino:CreateWindow("",NameofHub2)
local DinoPage = DinoWindow:NewPage("")
local DinoElement = DinoPage:NewSection("")

local DinoPage = DinoWindow:NewPage("")
local page = DinoPage:NewSection("")
page:CreateLabel("")
return Dino
end

function loadsc()


_G.SchemeColor = Color3.fromRGB(100, 175, 255)
_G.Background = Color3.fromRGB(61, 61, 61)
_G.Header = Color3.fromRGB(41,41, 41)
_G.TextColor = Color3.fromRGB(255,255,255)
local library = {
	themes = {
        original = {
            SchemeColor = _G.SchemeColor,
            Background = _G.Background,
            Header = _G.Header ,
            TextColor = _G.TextColor
        }
    }
}
local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
local length = 20
local randomString = ''
math.randomseed(os.time())
local charTable = {}
for c in chars:gmatch"." do
    table.insert(charTable, c)
end
for i = 1, length do
    randomString = randomString .. charTable[math.random(1, #charTable)]
end
for i,v in pairs(game:GetService("CoreGui"):GetChildren()) do
	if v.ClassName == "ScreenGui" then
		for i1,v1 in pairs(v:GetChildren()) do
			if v1.Name == "Main" then
				for i2,v2 in pairs(v1:GetChildren()) do
					do
						local ui = v
						if ui then
                            ui:Destroy()
                        end
                    end
                end
            end
        end
    end
end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()

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
		object.Position = pos
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
local function RippleEffect(object)
    spawn(function()
        local Ripple = Instance.new("ImageLabel")

        Ripple.Name = "Ripple"
        Ripple.Parent = object
        Ripple.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Ripple.BackgroundTransparency = 1.000
        Ripple.ZIndex = 8
        Ripple.Image = "rbxassetid://2708891598"
        Ripple.ImageTransparency = 0.800
        Ripple.ScaleType = Enum.ScaleType.Fit

        Ripple.Position = UDim2.new((Mouse.X - Ripple.AbsolutePosition.X) / object.AbsoluteSize.X, 0, (Mouse.Y - Ripple.AbsolutePosition.Y) / object.AbsoluteSize.Y, 0)
        TweenService:Create(Ripple, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(-5.5, 0, -5.5, 0), Size = UDim2.new(12, 0, 12, 0)}):Play()

        wait(0.5)
        TweenService:Create(Ripple, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()

        wait(1)
        Ripple:Destroy()
    end)
end

local Ui = Instance.new("ScreenGui")
Ui.Name = randomString
Ui.Parent = game.CoreGui
Ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
UserInputService.InputBegan:Connect(function(io, p)
    if io.KeyCode == Enum.KeyCode.RightControl then
        if uitoggled == false then
            Ui.Enabled = false
            uitoggled = true
        else
            Ui.Enabled = true
            uitoggled = false
        end
    end
end)
if syn then
	syn.protect_gui(Ui)
end

function library:CreateWindow(title,theme,closebind)
    local tabs = {}
    local s = false
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local MainFrame = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local SectionBack = Instance.new("Frame")
    local UICorner_3 = Instance.new("UICorner")
    local search = Instance.new("ImageButton")
    local SearchBox = Instance.new("TextBox")
    local UICorner_25 = Instance.new("UICorner")

    Main.Name = "Main"
    Main.Parent = Ui
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.BackgroundColor3 = theme.Header
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(0, 900, 0, 500)
    Main.Size = UDim2.new(0, 556, 0, 366)
    Main.ZIndex = 3

    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = Main

    Title.Name = "Title"
    Title.Parent = Main
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0, 13, 0, 0)
    Title.Size = UDim2.new(0, 556, 0, 19)
    Title.ZIndex = 7
    Title.Font = Enum.Font.SourceSansBold
    Title.Text = title
    Title.TextColor3 = theme.TextColor
    Title.TextSize = 20.000
    Title.TextWrapped = true
    Title.TextXAlignment = Enum.TextXAlignment.Left

    MainFrame.Name = "MainFrame"
    MainFrame.Parent = Main
    MainFrame.BackgroundColor3 = theme.Background
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0, 0, 0, 19)
    MainFrame.Size = UDim2.new(0, 556, 0, 346)
    MainFrame.ZIndex = 3

    UICorner_2.CornerRadius = UDim.new(0, 5)
    UICorner_2.Parent = MainFrame

    SectionBack.Name = "SectionBack"
    SectionBack.Parent = MainFrame
    SectionBack.BackgroundColor3 = theme.Header
    SectionBack.BorderSizePixel = 0
    SectionBack.Position = UDim2.new(0, 6, 0, 35)
    SectionBack.Size = UDim2.new(0, 544, 0, 304)
    SectionBack.ZIndex = 5

    UICorner_3.CornerRadius = UDim.new(0, 3)
    UICorner_3.Parent = SectionBack
    MakeDraggable(Title,Main)
    search.Name = "search"
    search.Parent = Main
    search.BackgroundColor3 = Color3.fromRGB(198, 197, 200)
    search.BackgroundTransparency = 1.000
    search.LayoutOrder = 1
    search.Position = UDim2.new(0, 530, 0, 0)
    search.Size = UDim2.new(0, 18, 0, 19)
    search.ZIndex = 9
    search.Image = "rbxassetid://3926305904"
    search.ImageRectOffset = Vector2.new(964, 324)
    search.ImageRectSize = Vector2.new(36, 36)

    SearchBox.Name = "SearchBox"
    SearchBox.Parent = Main
    SearchBox.BackgroundColor3 = theme.Background
    SearchBox.Position = UDim2.new(0.825999975, 50, 0, 2)
    SearchBox.Size = UDim2.new(0, 0, 0, 15)
    SearchBox.ZIndex = 10
    SearchBox.BorderSizePixel = 0
    SearchBox.Font = Enum.Font.SourceSans
    SearchBox.PlaceholderColor3 = Color3.fromRGB(239, 239, 239)
    SearchBox.Text = ""
    SearchBox.TextColor3 = theme.TextColor
    SearchBox.TextSize = 14.000
    SearchBox.Visible = true
    local SearchBoxTog = false

    search.MouseButton1Click:Connect(function()
        SearchBoxTog = not SearchBoxTog
        TweenService:Create(SearchBox,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = SearchBoxTog and UDim2.new(0, 71, 0, 15) or UDim2.new(0, 0, 0, 15)}):Play()
        TweenService:Create(SearchBox,TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Position = SearchBoxTog and UDim2.new(0.825999975, 0, 0, 2) or UDim2.new(0.825999975, 50, 0, 2)}):Play()
    end)

    UICorner_25.Parent = SearchBox

    local TapBar = Instance.new("ScrollingFrame")
    local UICorner_16 = Instance.new("UICorner")
    local UIListLayout_3 = Instance.new("UIListLayout")

    TapBar.Name = "TapBar"
    TapBar.Parent = Main
    TapBar.BackgroundColor3 = Color3.fromRGB(41, 41, 41)
    TapBar.BorderSizePixel = 0
    TapBar.Position = UDim2.new(0, 6, 0, 28)
    TapBar.Size = UDim2.new(0, 544, 0, 21)
    TapBar.ZIndex = 5
    TapBar.ScrollBarThickness = 2
    TapBar.CanvasSize = UDim2.new(0,0,0,0)

    UICorner_16.CornerRadius = UDim.new(0, 3)
    UICorner_16.Parent = TapBar

    UIListLayout_3.Parent = TapBar
    UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
    local uitoggled = false
    UserInputService.InputBegan:Connect(
        function(io, p)
            if io.KeyCode == bind then
                if uitoggled == false then
                    uitoggled = true
                    wait(.5)
                    Ui.Enabled = false
                else
                    Ui.Enabled = true
                    uitoggled = false
                end
            end
        end
    )
    function library:Notification(title,desc,button)
        for i,v in pairs(MainFrame:GetChildren())do
            if v.Name == "NotiBackFrame" then
                v:Destroy()
            end
        end
        local NotiBackFrame = Instance.new("Frame")
        local Notification = Instance.new("Frame")
        local Frame = Instance.new("Frame")
        local UICorner = Instance.new("UICorner")
        local Main = Instance.new("Frame")
        local UICorner_2 = Instance.new("UICorner")
        local Main_2 = Instance.new("Frame")
        local UICorner_3 = Instance.new("UICorner")
        local TextButton = Instance.new("TextButton")
        local UICorner_4 = Instance.new("UICorner")
        local Title = Instance.new("TextLabel")
        local UICorner_5 = Instance.new("UICorner")
        local Title_2 = Instance.new("TextLabel")
        local notifications = Instance.new("ImageButton")
        

        NotiBackFrame.Name = "NotiBackFrame"
        NotiBackFrame.Parent = MainFrame
        NotiBackFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        NotiBackFrame.BackgroundTransparency = 1
        NotiBackFrame.Position = UDim2.new(-0.000238045119, 0, -0.0562442914, 0)
        NotiBackFrame.Size = UDim2.new(0, 556, 0, 366)
        NotiBackFrame.Visible = true
        NotiBackFrame.ZIndex = 100
        TweenService:Create(
            NotiBackFrame,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Position = UDim2.new(0, -500, -0.0562442914, 0)}
        ):Play()

        Notification.Name = "Notification"
        Notification.Parent = NotiBackFrame
        Notification.BackgroundColor3 = theme.Header
        Notification.BorderSizePixel = 0
        Notification.Position = UDim2.new(0, 83, 0, 55)
        Notification.Size = UDim2.new(0, 390, 0, 255)
        Notification.ZIndex = 10
        Notification.ClipsDescendants = true

        Frame.Parent = Notification
        Frame.BackgroundColor3 = theme.Background
        Frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
        Frame.BorderSizePixel = 0
        Frame.Position = UDim2.new(0, 0, 0, 17)
        Frame.Size = UDim2.new(0, 390, 0, 236)
        Frame.ZIndex = 11
        
        UICorner.CornerRadius = UDim.new(0, 5)
        UICorner.Parent = Frame
        
        Main.Name = "Main"
        Main.Parent = Frame
        Main.BackgroundColor3 = theme.Header
        Main.BorderColor3 = Color3.fromRGB(27, 42, 53)
        Main.BorderSizePixel = 0
        Main.Position = UDim2.new(0, 8, 0, 7)
        Main.Size = UDim2.new(0, 373, 0, 220)
        Main.ZIndex = 11
        
        UICorner_2.CornerRadius = UDim.new(0, 5)
        UICorner_2.Parent = Main
        
        Main_2.Name = "Main"
        Main_2.Parent = Main
        Main_2.BackgroundColor3 = theme.Background
        Main_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
        Main_2.BorderSizePixel = 0
        Main_2.Position = UDim2.new(0, 6, 0, 5)
        Main_2.Size = UDim2.new(0, 360, 0, 209)
        Main_2.ZIndex = 11
        
        UICorner_3.CornerRadius = UDim.new(0, 5)
        UICorner_3.Parent = Main_2
        
        TextButton.Parent = Main_2
        TextButton.BackgroundColor3 = theme.Header
        TextButton.Position = UDim2.new(0, 13, 0, 162)
        TextButton.Size = UDim2.new(0, 335, 0, 31)
        TextButton.ZIndex = 11
        TextButton.Font = Enum.Font.SourceSansBold
        TextButton.Text = button
        TextButton.TextColor3 = theme.TextColor
        TextButton.TextSize = 20.000
        
        UICorner_4.CornerRadius = UDim.new(0, 5)
        UICorner_4.Parent = TextButton
        TextButton.MouseButton1Click:Connect(function()

            NotiBackFrame:Destroy()

        end)
        Title.Name = "Title"
        Title.Parent = Main_2
        Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title.BackgroundTransparency = 1.000
        Title.BorderSizePixel = 0
        Title.Position = UDim2.new(0, 14, 0, 8)
        Title.Size = UDim2.new(0, 335, 0, 113)
        Title.ZIndex = 11
        Title.Font = Enum.Font.SourceSansBold
        Title.Text = desc
        Title.TextColor3 = theme.TextColor
        Title.TextSize = 20.000
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.TextYAlignment = Enum.TextYAlignment.Top
        
        UICorner_5.CornerRadius = UDim.new(0, 5)
        UICorner_5.Parent = Notification
        
        Title_2.Name = "Title"
        Title_2.Parent = Notification
        Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Title_2.BackgroundTransparency = 1.000
        Title_2.Position = UDim2.new(0, 28, 0, 1)
        Title_2.Size = UDim2.new(0, 191, 0, 19)
        Title_2.ZIndex = 10
        Title_2.Font = Enum.Font.SourceSansBold
        Title_2.Text = title
        Title_2.TextColor3 = theme.TextColor
        Title_2.TextSize = 20.000
        Title_2.TextXAlignment = Enum.TextXAlignment.Left
        
        notifications.Name = "notifications"
        notifications.Parent = Notification
        notifications.BackgroundTransparency = 1.000
        notifications.LayoutOrder = 1
        notifications.Position = UDim2.new(0, 7, 0, 0)
        notifications.Size = UDim2.new(0, 21, 0, 20)
        notifications.ZIndex = 11
        notifications.Image = "rbxassetid://3926305904"
        notifications.ImageRectOffset = Vector2.new(844, 564)
        notifications.ImageRectSize = Vector2.new(36, 36)
    end
    function tabs:CreateTab(title)
		local SectionContent = {}
		local Tab1 = Instance.new("TextButton")
		local UICorner_17 = Instance.new("UICorner")

		Tab1.Name = "Tab"
		Tab1.Parent = TapBar
		Tab1.BackgroundColor3 = theme.Header
		Tab1.Size = UDim2.new(0, 84, 0, 20)
		Tab1.ZIndex = 6
		Tab1.Font = Enum.Font.SourceSansBold
		Tab1.Text = title
		Tab1.TextColor3 = theme.TextColor
		Tab1.TextSize = 18.000
		Tab1.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
		Tab1.TextWrapped = true

		UICorner_17.CornerRadius = UDim.new(0, 3)
		UICorner_17.Parent = Tab1

		local ScrollingFrame = Instance.new("ScrollingFrame")
		local Left = Instance.new("Frame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local Right = Instance.new("Frame")
		local UIPadding_2 = Instance.new("UIPadding")

		ScrollingFrame.Parent = SectionBack
		ScrollingFrame.Active = true
		ScrollingFrame.BackgroundColor3 = theme.Header
		ScrollingFrame.BackgroundTransparency = 1.000
		ScrollingFrame.Position = UDim2.new(0, 0, 0.0197368413, 0)
		ScrollingFrame.Size = UDim2.new(0, 542, 0, 298)
		ScrollingFrame.ScrollBarThickness = 0
		ScrollingFrame.Visible = false
		Left.Name = "Left"
		Left.Parent = ScrollingFrame
		Left.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
		Left.BackgroundTransparency = 1.000
		Left.BorderSizePixel = 0
		Left.Position = UDim2.new(0, 7, 0, 5)
		Left.Size = UDim2.new(0, 262, 0, 299)
		Left.ZIndex = 6

		UIListLayout_2.Parent = ScrollingFrame
		UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 10)
		Right.Name = "Right"
		Right.Parent = ScrollingFrame
		Right.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
		Right.BackgroundTransparency = 1.000
		Right.BorderSizePixel = 0
		Right.Position = UDim2.new(0, 7, 0, 5)
		Right.Size = UDim2.new(0, 262, 0, 299)
		Right.ZIndex = 6
        local RightList = Instance.new("UIListLayout")
        local LeftList = Instance.new("UIListLayout")
        LeftList.Parent = Left
        LeftList.SortOrder = Enum.SortOrder.LayoutOrder
        LeftList.Padding = UDim.new(0, 5)
        RightList.Parent = Right
        RightList.SortOrder = Enum.SortOrder.LayoutOrder
        RightList.Padding = UDim.new(0, 5)

		TapBar.CanvasSize = UDim2.new(0,UIListLayout_3.AbsoluteContentSize.X,0,0)

		UIPadding_2.Parent = ScrollingFrame
		UIPadding_2.PaddingLeft = UDim.new(0, 5)
        if s == false then
			s = true
			Tab1.TextColor3 = theme.Header
			ScrollingFrame.Visible = true
            Tab1.BackgroundColor3 = theme.SchemeColor
		end

		local function GetSide(Longest)
			if Longest then
				if LeftList.AbsoluteContentSize.Y > RightList.AbsoluteContentSize.Y then
					return Left
				else
					return Right
				end
			else
				if LeftList.AbsoluteContentSize.Y > RightList.AbsoluteContentSize.Y then
					return Right
				else
					return Left
				end
			end
		end

		LeftList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			if GetSide(true).Name == Left.Name then
				ScrollingFrame.CanvasSize = UDim2.new(0,0,0,LeftList.AbsoluteContentSize.Y + 5)
			else
				ScrollingFrame.CanvasSize = UDim2.new(0,0,0,RightList.AbsoluteContentSize.Y + 5)
			end
		end)
		RightList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			if GetSide(true).Name == Left.Name then
				ScrollingFrame.CanvasSize = UDim2.new(0,0,0,LeftList.AbsoluteContentSize.Y + 5)
			else
				ScrollingFrame.CanvasSize = UDim2.new(0,0,0,RightList.AbsoluteContentSize.Y + 5)
			end
		end)
		Tab1.MouseButton1Click:Connect(function()
			for i, v in next, SectionBack:GetChildren() do
				if v.Name == "ScrollingFrame" then
					v.Visible = false
				end
				ScrollingFrame.Visible = true

			end
			for i, v in next, TapBar:GetChildren() do
				if v.Name == "Tab" then
					TweenService:Create(
						v,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = theme.TextColor}
					):Play()
					TweenService:Create(
						v,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = theme.Header}
					):Play()
					TweenService:Create(
						Tab1,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{TextColor3 = theme.Header}
					):Play()
					TweenService:Create(
						Tab1,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = theme.SchemeColor}
					):Play()
				end
			end
        end)



		function SectionContent:CreateSection(title)
			local Content = {}
			local SectionHold = Instance.new("Frame")
			local UICorner_4 = Instance.new("UICorner")
			local UIListLayout = Instance.new("UIListLayout")
			local UIPadding = Instance.new("UIPadding")
			SectionHold.Name = "SectionHold"
			SectionHold.Parent = GetSide(false)
			SectionHold.BackgroundColor3 = theme.Background
			SectionHold.Position = UDim2.new(0, 1, 0, 0)
			SectionHold.Size = UDim2.new(0, 260, 0, 100)
			SectionHold.ZIndex = 7

			UICorner_4.CornerRadius = UDim.new(0, 5)
			UICorner_4.Parent = SectionHold


			UIListLayout.Parent = SectionHold
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)
            UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				SectionHold.Size = UDim2.new(1,0,0,UIListLayout.AbsoluteContentSize.Y + 15)
			end)
			UIPadding.Parent = SectionHold
			UIPadding.PaddingLeft = UDim.new(0, 10)
			local Title_10 = Instance.new("TextLabel")

			Title_10.Name = "Title"
			Title_10.Parent = SectionHold
			Title_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title_10.BackgroundTransparency = 1.000
			Title_10.Position = UDim2.new(0.0449448675, 0, -0.00182170793, 0)
			Title_10.Size = UDim2.new(0, 211, 0, 31)
			Title_10.ZIndex = 8
			Title_10.Font = Enum.Font.SourceSansBold
			Title_10.Text = title
			Title_10.TextColor3 = theme.SchemeColor
			Title_10.TextSize = 20.000
			Title_10.TextXAlignment = Enum.TextXAlignment.Left
			
			function Content:CreateLine()
				local Line = Instance.new("Frame")
				local Frame_3 = Instance.new("Frame")
				local UICorner_8 = Instance.new('UICorner')

				Line.Name = "Line"
				Line.Parent = SectionHold
				Line.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Line.BackgroundTransparency = 1.000
				Line.BorderSizePixel = 0
				Line.Position = UDim2.new(0, 0, 0, 71)
				Line.Size = UDim2.new(0, 224, 0, 10)
				Line.ZIndex = 7

				Frame_3.Parent = Line
				Frame_3.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
				Frame_3.BorderColor3 = Color3.fromRGB(255, 255, 255)
				Frame_3.BorderSizePixel = 0
				Frame_3.Position = UDim2.new(0, 10, 0, 5)
				Frame_3.Size = UDim2.new(0, 215, 0, 5)
				Frame_3.ZIndex = 7
				UICorner_8.CornerRadius = UDim.new(0, 10)
				UICorner_8.Parent = Frame_3
			end

			function Content:CreateLabel(title)
				local LabelFunc = {}
				local Label2 = Instance.new("Frame")
				local Title_4 = Instance.new("TextLabel")
				
				Label2.Name = title
				Label2.Parent = SectionHold
				Label2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Label2.BackgroundTransparency = 1.000
				Label2.BorderSizePixel = 0
				Label2.Position = UDim2.new(0, -11, 0, 191)
				Label2.Size = UDim2.new(0, 261, 0, 22)
				Label2.ZIndex = 7
				
				Title_4.Name = "Title"
				Title_4.Parent = Label2
				Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title_4.BackgroundTransparency = 1.000
				Title_4.Position = UDim2.new(0, 12, 0, -6)
				Title_4.Size = UDim2.new(0, 211, 0, 31)
				Title_4.ZIndex = 8
				Title_4.Text = title
				Title_4.Font = Enum.Font.SourceSansBold
				Title_4.TextColor3 = theme.TextColor
				Title_4.TextSize = 20.000
				function LabelFunc:Update(text)
					Label2.Name = tostring(text)

					Title_4.Text = tostring(text)
				end
				return LabelFunc
			end
			function Content:CreateLabel2(title)
				local LabelFunc = {}
				local Label1 = Instance.new("Frame")
				local Frame_8 = Instance.new("Frame")
				local UICorner_14 = Instance.new("UICorner")
				local Frame_9 = Instance.new("Frame")
				local UICorner_15 = Instance.new("UICorner")
				local Title_9 = Instance.new("TextLabel")
				
				Label1.Name = title
				Label1.Parent = SectionHold
				Label1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Label1.BackgroundTransparency = 1.000
				Label1.BorderSizePixel = 0
				Label1.Position = UDim2.new(0, 0, 0, 30)
				Label1.Size = UDim2.new(0, 260, 0, 22)
				Label1.ZIndex = 7
				
				Frame_8.Parent = Label1
				Frame_8.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
				Frame_8.BorderColor3 = Color3.fromRGB(255, 255, 255)
				Frame_8.BorderSizePixel = 0
				Frame_8.Position = UDim2.new(0, 24, 0, 7)
				Frame_8.Size = UDim2.new(0, 62, 0, 4)
				Frame_8.ZIndex = 7
				
				UICorner_14.CornerRadius = UDim.new(0, 10)
				UICorner_14.Parent = Frame_8
				
				Frame_9.Parent = Label1
				Frame_9.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
				Frame_9.BorderColor3 = Color3.fromRGB(255, 255, 255)
				Frame_9.BorderSizePixel = 0
				Frame_9.Position = UDim2.new(0, 156, 0, 7)
				Frame_9.Size = UDim2.new(0, 62, 0, 4)
				Frame_9.ZIndex = 7
				
				UICorner_15.CornerRadius = UDim.new(0, 10)
				UICorner_15.Parent = Frame_9
				
				Title_9.Name = "Title"
				Title_9.Parent = Label1
				Title_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title_9.BackgroundTransparency = 1.000
				Title_9.Position = UDim2.new(0, 14, 0, -7)
				Title_9.Size = UDim2.new(0, 211, 0, 31)
				Title_9.ZIndex = 8
				Title_9.Text = title
				Title_9.Font = Enum.Font.SourceSansBold
				Title_9.TextColor3 = theme.TextColor
				Title_9.TextSize = 20.000
				function LabelFunc:Update(text)
					Label1.Name = tostring(text)
					Title_4.Text = tostring(text)
				end
				return LabelFunc
			end
			local focused = false
			SearchBox.Focused:Connect(function()
			
			end)
			SearchBox.FocusLost:Connect(function()
			
			end)

			function UpdateInputOfSearchText()
				local InputText = string.upper(SearchBox.Text)
				for _,button in pairs(SectionHold:GetChildren())do
					if button:IsA("Frame") then
								if InputText == "" or string.find(string.upper(button.Name),InputText) ~= nil then
									button.Visible = true
								else
									button.Visible = false
								end
					end
				end
			end

			SearchBox.Changed:Connect(UpdateInputOfSearchText)
			function Content:CreateButton(title,callback)
				local Button = Instance.new("Frame")
				local TextButton = Instance.new("TextButton")
				local UICorner_5 = Instance.new("UICorner")
				local touch_app = Instance.new("ImageButton")

				Button.Name = title
				Button.Parent = SectionHold
				Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Button.BackgroundTransparency = 1.000
				Button.BorderSizePixel = 0
                Button.ClipsDescendants = true
				Button.Position = UDim2.new(0, 0, 0, 87)
				Button.Size = UDim2.new(0, 240, 0, 34)
				Button.ZIndex = 8

				TextButton.Parent = Button
				TextButton.BackgroundColor3 = theme.Header
				TextButton.BorderSizePixel = 0
				TextButton.Position = UDim2.new(0, 12, 0, 5)
				TextButton.Size = UDim2.new(0, 212, 0, 26)
				TextButton.ZIndex = 7
				TextButton.Font = Enum.Font.SourceSansBold
				TextButton.TextColor3 = theme.TextColor
				TextButton.TextSize = 20.000
                TextButton.Text = title
				UICorner_5.CornerRadius = UDim.new(0, 5)
				UICorner_5.Parent = TextButton

				touch_app.Name = "touch_app"
				touch_app.Parent = Button
				touch_app.BackgroundTransparency = 1.000
				touch_app.LayoutOrder = 9
				touch_app.Position = UDim2.new(0, 197, 0, 5)
				touch_app.Size = UDim2.new(0, 26, 0, 22)
				touch_app.ZIndex = 11

				touch_app.Image = "rbxassetid://3926305904"
				touch_app.ImageRectOffset = Vector2.new(84, 204)
				touch_app.ImageRectSize = Vector2.new(36, 36)

				TextButton.MouseButton1Down:Connect(function()
					RippleEffect(Button)               
					pcall(callback)
				end)
			end
			function Content:CreateToggle(title,default,callback)
				local Toggled = false
				local ToggleFunc = {}
				local Toggle = Instance.new("Frame")
				local Title = Instance.new("TextLabel")
				local ToggleBack = Instance.new("TextButton")
				local UICorner = Instance.new("UICorner")
				local ImageLabel = Instance.new("ImageLabel")
				local UICorner_2 = Instance.new("UICorner")

				Toggle.Name = title
				Toggle.Parent = SectionHold
				Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Toggle.BackgroundTransparency = 1.000
				Toggle.BorderSizePixel = 0
				Toggle.Position = UDim2.new(0, 0, 0, 187)
				Toggle.Size = UDim2.new(0, 231, 0, 30)
				Toggle.ZIndex = 7

				Title.Name = "Title"
				Title.Parent = Toggle
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.Position = UDim2.new(0, 43, 0, 6)
				Title.Size = UDim2.new(0, 168, 0, 22)
				Title.ZIndex = 8
				Title.Font = Enum.Font.SourceSansBold
				Title.Text = title
				Title.TextColor3 = theme.TextColor
				Title.TextSize = 20.000
				Title.TextXAlignment = Enum.TextXAlignment.Left

				ToggleBack.Name = "ToggleBack"
				ToggleBack.Parent = Toggle
				ToggleBack.BackgroundColor3 = theme.Header
				ToggleBack.Position = UDim2.new(0.0173160173, 0, 0.0666666701, 0)
				ToggleBack.Size = UDim2.new(0, 26, 0, 26)
				ToggleBack.ZIndex = 11
                ToggleBack.ClipsDescendants = true
				ToggleBack.Font = Enum.Font.SourceSans
				ToggleBack.Text = ""
				ToggleBack.TextColor3 = Color3.fromRGB(0, 0, 0)
				ToggleBack.TextSize = 14.000

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = ToggleBack
				function ToggleFunc:Update(state)
					if state then
						Toggled = state
						TweenService:Create(
							ImageLabel,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Toggled and theme.SchemeColor or theme.Header}
						):Play()
						pcall(callback,Toggled)
					else
						Toggled = state
						TweenService:Create(
							ImageLabel,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Toggled and theme.SchemeColor or theme.Header}
						):Play()
						pcall(callback,Toggled)
					end
				end
				
				ToggleBack.MouseButton1Down:Connect(function()
					Toggled = not Toggled
					TweenService:Create(
						ImageLabel,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Toggled and theme.SchemeColor or theme.Header}
					):Play()
					RippleEffect(ToggleBack)               

					pcall(callback,Toggled)
				end)
				ImageLabel.Parent = ToggleBack
				ImageLabel.BackgroundColor3 = theme.Header
				ImageLabel.Position = UDim2.new(0, 1, 0, 1)
				ImageLabel.Size = UDim2.new(0, 24, 0, 24)
				ImageLabel.ZIndex = 11
				ImageLabel.Image = "rbxassetid://3926305904"
				ImageLabel.ImageColor3 = Color3.fromRGB(41, 41, 41)
				ImageLabel.ImageRectOffset = Vector2.new(312, 4)
				ImageLabel.ImageRectSize = Vector2.new(24, 24)

				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = ImageLabel

				if default then
					Toggled = default
					TweenService:Create(
						ImageLabel,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Toggled and theme.SchemeColor or theme.Header}
					):Play()
					pcall(callback,Toggled)
				end
				return ToggleFunc
			end
			function Content:CreateKeybind(title,ori,callback)
				local Keybind = Instance.new("Frame")
				local Title_4 = Instance.new("TextLabel")
				local TextButton2323 = Instance.new("TextButton")
				local UICorner_5 = Instance.new("UICorner")
				Keybind.Name = title
				Keybind.Parent = SectionHold
				Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Keybind.BackgroundTransparency = 1.000
				Keybind.BorderSizePixel = 0
				Keybind.Position = UDim2.new(0, 0, 0, 223)
				Keybind.Size = UDim2.new(0, 231, 0, 30)
				Keybind.ZIndex = 7

				Title_4.Name = "Title"
				Title_4.Parent = Keybind
				Title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title_4.BackgroundTransparency = 1.000
				Title_4.BorderSizePixel = 0
				Title_4.Position = UDim2.new(0, 10, 0, 4)
				Title_4.Size = UDim2.new(0, 98, 0, 22)
				Title_4.ZIndex = 8
				Title_4.Font = Enum.Font.SourceSansBold
				Title_4.Text = title
				Title_4.TextColor3 = theme.TextColor
				Title_4.TextSize = 18.000
				Title_4.TextXAlignment = Enum.TextXAlignment.Left

				TextButton2323.Parent = Keybind
				TextButton2323.BackgroundColor3 = theme.Header
				TextButton2323.Position = UDim2.new(0.744588733, 0, 0.13333334, 0)
				TextButton2323.Size = UDim2.new(0, 65, 0, 24)
				TextButton2323.ZIndex = 11
				TextButton2323.Font = Enum.Font.SourceSansBold
				TextButton2323.TextColor3 = theme.TextColor
				TextButton2323.TextSize = 15.000
				TextButton2323.Text = ori.Name or ""
				UICorner_5.CornerRadius = UDim.new(0, 5)
				UICorner_5.Parent = TextButton2323
				TextButton2323.MouseButton1Click:Connect(function()
                    
                TextButton2323.Text = "..."
                    local inputwait = UserInputService.InputBegan:wait()
                    if inputwait.KeyCode.Name ~= "Unknown" then
                        TextButton2323.Text = inputwait.KeyCode.Name
                        Key = inputwait.KeyCode.Name
                    end
                end)
                    
                UserInputService.InputBegan:connect(
                function(current, pressed)
                    if not pressed then
                        if current.KeyCode.Name == Key then
                            pcall(callback)
                        end
                    end
                end)
			end
			function Content:CreateSlider(title,min,max,default,callback)
				local SliderFunc = {}
				local Slider = Instance.new("Frame")
				local Title_2 = Instance.new("TextLabel")
				local Frame = Instance.new("Frame")
				local UICorner_2 = Instance.new("UICorner")
				local Title_3 = Instance.new("TextLabel")
				local add = Instance.new("ImageButton")
				local remove = Instance.new("ImageButton")
				local SliderFrame = Instance.new("TextButton")
				local UICorner_3 = Instance.new("UICorner")
				local Sliderin = Instance.new("TextButton")
				local UICorner_4 = Instance.new("UICorner")
				Slider.Name = title
				Slider.Parent = SectionHold
				Slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Slider.BackgroundTransparency = 1.000
				Slider.BorderSizePixel = 0
				Slider.Position = UDim2.new(0, 0, 0, 61)
				Slider.Size = UDim2.new(0, 231, 0, 39)
				Slider.ZIndex = 7
				
				Title_2.Name = "Title"
				Title_2.Parent = Slider
				Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title_2.BackgroundTransparency = 1.000
				Title_2.Position = UDim2.new(0.0519480482, 0, 0.128205135, 0)
				Title_2.Size = UDim2.new(0, 143, 0, 23)
				Title_2.ZIndex = 8
				Title_2.Font = Enum.Font.SourceSansBold
				Title_2.Text = title
				Title_2.TextColor3 = theme.TextColor
				Title_2.TextSize = 20.000
				Title_2.TextXAlignment = Enum.TextXAlignment.Left
				
				Frame.Parent = Slider
				Frame.BackgroundColor3 = theme.Header
				Frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
				Frame.BorderSizePixel = 0
				Frame.Position = UDim2.new(0, 181, 0, 5)
				Frame.Size = UDim2.new(0, 30, 0, 19)
				Frame.ZIndex = 9
				
				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = Frame
				
				Title_3.Name = "Title"
				Title_3.Parent = Frame
				Title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title_3.BackgroundTransparency = 1.000
				Title_3.BorderSizePixel = 0
				Title_3.Size = UDim2.new(0, 29, 0, 19)
				Title_3.ZIndex = 10
				Title_3.Font = Enum.Font.SourceSansBold
				Title_3.Text = "30"
				Title_3.TextColor3 = theme.TextColor
				Title_3.TextSize = 15.000
				
				add.Name = "add"
				add.Parent = Slider
				add.BackgroundTransparency = 1.000
				add.LayoutOrder = 3
				add.Position = UDim2.new(0, 210, 0, 4)
				add.Size = UDim2.new(0, 21, 0, 21)
				add.ZIndex = 9
                add.ClipsDescendants = true
				add.Image = "rbxassetid://3926307971"
				add.ImageRectOffset = Vector2.new(324, 364)
				add.ImageRectSize = Vector2.new(36, 36)
				
				remove.Name = "remove"
				remove.Parent = Slider
				remove.BackgroundTransparency = 1.000
				remove.LayoutOrder = 6
				remove.Position = UDim2.new(0, 156, 0, 4)
				remove.Size = UDim2.new(0, 21, 0, 21)
				remove.ZIndex = 9
                remove.ClipsDescendants = true
				remove.Image = "rbxassetid://3926307971"
				remove.ImageRectOffset = Vector2.new(884, 284)
				remove.ImageRectSize = Vector2.new(36, 36)
				
				SliderFrame.Name = "SliderFrame"
				SliderFrame.Parent = Slider
				SliderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderFrame.Position = UDim2.new(0.012987013, 0, 0.717948735, 0)
				SliderFrame.Size = UDim2.new(0, 225, 0, 6)
				SliderFrame.ZIndex = 11
				SliderFrame.Font = Enum.Font.SourceSans
				SliderFrame.Text = ""
				SliderFrame.TextColor3 = Color3.fromRGB(0, 0, 0)
				SliderFrame.TextSize = 14.000
				
				UICorner_3.CornerRadius = UDim.new(0, 5)
				UICorner_3.Parent = SliderFrame
				
				Sliderin.Name = "Sliderin"
				Sliderin.Parent = SliderFrame
				Sliderin.BackgroundColor3 = theme.SchemeColor
				Sliderin.Size = UDim2.new(0, 125, 0, 6)
				Sliderin.ZIndex = 11
				Sliderin.Font = Enum.Font.SourceSans
				Sliderin.Text = ""
				Sliderin.TextColor3 = Color3.fromRGB(0, 0, 0)
				Sliderin.TextSize = 14.000
				
				UICorner_4.CornerRadius = UDim.new(0, 5)
				UICorner_4.Parent = Sliderin

				local mouse = game:GetService("Players").LocalPlayer:GetMouse();  

                local Value = default
                SliderFrame.MouseButton1Down:Connect(function()
                    if not focusing then
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 225) * Sliderin.AbsoluteSize.X) + tonumber(min)) or 0
                        pcall(function()
                            callback(Value)
                        end)
                        Sliderin:TweenSize(UDim2.new(0, math.clamp(mouse.X - Sliderin.AbsolutePosition.X, 0, 225), 0, 6), "InOut", "Linear", 0.01, true)
                        moveconnection = mouse.Move:Connect(function()
                            Value = math.floor((((tonumber(max) - tonumber(min)) / 225) * Sliderin.AbsoluteSize.X) + tonumber(min))
                            Title_3.Text = Value
                            pcall(function()
                                callback(Value)
                            end)
                            Sliderin:TweenSize(UDim2.new(0, math.clamp(mouse.X - Sliderin.AbsolutePosition.X, 0, 225), 0, 6), "InOut", "Linear", 0.01, true)
                        end)
                        releaseconnection = UserInputService.InputEnded:Connect(function(Mouse)
                            if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                                Value = math.floor((((tonumber(max) - tonumber(min)) / 225) * Sliderin.AbsoluteSize.X) + tonumber(min))
                                Title_3.Text = Value
    
                                pcall(function()
                                    callback(Value)
                                end)
    
                                Sliderin:TweenSize(UDim2.new(0, math.clamp(mouse.X - Sliderin.AbsolutePosition.X, 0, 225), 0, 6), "InOut", "Linear", 0.01, true)
                                moveconnection:Disconnect()
                                releaseconnection:Disconnect()
                            end
                        end)
                    end
                end)
                Sliderin.MouseButton1Down:Connect(function()
                    if not focusing then
                        Value = math.floor((((tonumber(max) - tonumber(min)) / 225) * Sliderin.AbsoluteSize.X) + tonumber(min)) or 0
                        pcall(function()
                            callback(Value)
                        end)
                        Sliderin:TweenSize(UDim2.new(0, math.clamp(mouse.X - Sliderin.AbsolutePosition.X, 0, 225), 0, 6), "InOut", "Linear", 0.01, true)
                        moveconnection = mouse.Move:Connect(function()
                            Value = math.floor((((tonumber(max) - tonumber(min)) / 225) * Sliderin.AbsoluteSize.X) + tonumber(min))
                            Title_3.Text = Value
                            pcall(function()
                                callback(Value)
                            end)
                            Sliderin:TweenSize(UDim2.new(0, math.clamp(mouse.X - Sliderin.AbsolutePosition.X, 0, 225), 0, 6), "InOut", "Linear", 0.01, true)
                        end)
                        releaseconnection = UserInputService.InputEnded:Connect(function(Mouse)
                            if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                                Value = math.floor((((tonumber(max) - tonumber(min)) / 225) * Sliderin.AbsoluteSize.X) + tonumber(min))
                                Title_3.Text = Value
    
                                pcall(function()
                                    callback(Value)
                                end)
    
                                Sliderin:TweenSize(UDim2.new(0, math.clamp(mouse.X - Sliderin.AbsolutePosition.X, 0, 225), 0, 6), "InOut", "Linear", 0.01, true)
                                moveconnection:Disconnect()
                                releaseconnection:Disconnect()
                            end
                        end)
                    end
                end)
				add.MouseButton1Click:Connect(function()
					Value = math.clamp(Value + 1, 1, max)
					Sliderin.Size = UDim2.new(Value / max, 0, 0, 6)
                    Title_3.Text = Value
                    pcall(function()
                        callback(Value)
                    end)
					RippleEffect(add)               

				end)

				remove.MouseButton1Click:Connect(function()
					Value = math.clamp(Value - 1, min, max)
					Sliderin.Size = UDim2.new(Value / max, 0, 0, 6)
                    Title_3.Text = Value
                    pcall(function()
                        callback(Value)
                    end)
					RippleEffect(remove)               

				end)

                if default then
                    Sliderin.Size = UDim2.new((default or 0) / max, 0, 0, 6)
                    Title_3.Text = default
                    pcall(function()
                        callback(default)
                    end)
                end
                function SliderFunc:Update(value)
                    Sliderin.Size = UDim2.new((value or 0) / max, 0, 0, 6)
                    Title_3.Text = value
                    pcall(function()
                        callback(value)
                    end)
            	end
				return SliderFunc
			end
			function Content:CreateTextBox(title,disapper,callback)
				local TextBox = Instance.new("Frame")
				local Title = Instance.new("TextLabel")
				local TextBox_2 = Instance.new("TextBox")
				local UICorner = Instance.new("UICorner")
				
				TextBox.Name = title
				TextBox.Parent = SectionHold
				TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.BackgroundTransparency = 1.000
				TextBox.BorderSizePixel = 0
				TextBox.Position = UDim2.new(0, 0, 0, 187)
				TextBox.Size = UDim2.new(0, 231, 0, 30)
				TextBox.ZIndex = 7
				
				Title.Name = "Title"
				Title.Parent = TextBox
				Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title.BackgroundTransparency = 1.000
				Title.BorderSizePixel = 0
				Title.Position = UDim2.new(0, 20, 0, 5)
				Title.Size = UDim2.new(0, 98, 0, 22)
				Title.ZIndex = 8
				Title.Font = Enum.Font.SourceSansBold
				Title.Text = title
				Title.TextColor3 = theme.TextColor
				Title.TextSize = 20.000
				Title.TextXAlignment = Enum.TextXAlignment.Left
				
				TextBox_2.Parent = TextBox
				TextBox_2.BackgroundColor3 = theme.Header
				TextBox_2.Position = UDim2.new(0.597402573, 0, 0.166666672, 0)
				TextBox_2.Size = UDim2.new(0, 83, 0, 22)
				TextBox_2.ZIndex = 11
				TextBox_2.Font = Enum.Font.SourceSans
				TextBox_2.Text = ""
				TextBox_2.TextColor3 = theme.TextColor
				TextBox_2.TextSize = 14.000
				
				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = TextBox_2 
				TextBox_2.FocusLost:Connect(
                    function(ep)
                        if ep then
                            if #TextBox_2.Text > 0 then
                                pcall(callback, TextBox_2.Text)
                                if disapper then
                                    TextBox_2.Text = ""
                                end
                            end
                        end
                    end
                )
			end
            function Content:CreateDropdown(title,list,callback)
				local DropFunc = {}
				local Droptog = false
				local Dropdown = Instance.new("Frame")
				local Title_5 = Instance.new("TextLabel")
				local Frame_2 = Instance.new("Frame")
				local UICorner_6 = Instance.new("UICorner")
				local TextLabel = Instance.new("TextLabel")
				local expand_more = Instance.new("ImageButton")
				local DropHold = Instance.new("Frame")
				local Droplis = Instance.new("ScrollingFrame")
				local UIListLayout23423423423 = Instance.new("UIListLayout")
				local UIPadding = Instance.new("UIPadding")
				local UICorner_8 = Instance.new("UICorner")
							
				Dropdown.Name = title
				Dropdown.Parent = SectionHold
				Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Dropdown.BackgroundTransparency = 1.000
				Dropdown.BorderSizePixel = 0
				Dropdown.Position = UDim2.new(0, 0, 0, 187)
				Dropdown.Size = UDim2.new(0, 231, 0, 30)
				Dropdown.ZIndex = 7

				Title_5.Name = "Title"
				Title_5.Parent = Dropdown
				Title_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Title_5.BackgroundTransparency = 1.000
				Title_5.BorderSizePixel = 0
				Title_5.Position = UDim2.new(0, 20, 0, 5)
				Title_5.Size = UDim2.new(0, 98, 0, 22)
				Title_5.ZIndex = 10
				Title_5.Font = Enum.Font.SourceSansBold
				Title_5.Text = title
				Title_5.TextColor3 = theme.TextColor
				Title_5.TextSize = 18.000
				Title_5.TextXAlignment = Enum.TextXAlignment.Left

				Frame_2.Parent = Dropdown
				Frame_2.BackgroundColor3 = theme.Header
				Frame_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
				Frame_2.BorderSizePixel = 0
				Frame_2.Position = UDim2.new(0, 12, 0, 1)
				Frame_2.Size = UDim2.new(0, 212, 0, 31)
				Frame_2.ZIndex = 9

				UICorner_6.CornerRadius = UDim.new(0, 5)
				UICorner_6.Parent = Frame_2

				TextLabel.Parent = Frame_2
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.BackgroundTransparency = 1.000
				TextLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
				TextLabel.Size = UDim2.new(0, 59, 0, 24)
				TextLabel.ZIndex = 9
				TextLabel.Font = Enum.Font.SourceSansBold
				TextLabel.Text = ""
				TextLabel.TextColor3 = theme.TextColor
				TextLabel.TextSize = 20.000

				expand_more.Name = "expand_more"
				expand_more.Parent = Frame_2
				expand_more.BackgroundTransparency = 1.000
				expand_more.Position = UDim2.new(0.855562031, 0, 0.0551075041, 0)
				expand_more.Size = UDim2.new(0, 25, 0, 25)
				expand_more.ZIndex = 9
				expand_more.Image = "rbxassetid://3926305904"
				expand_more.ImageRectOffset = Vector2.new(564, 284)
				expand_more.ImageRectSize = Vector2.new(36, 36)
				expand_more.Rotation = 0
				
				DropHold.Name = "DropHold"
				DropHold.Parent = SectionHold
				DropHold.BackgroundColor3 = theme.Header
				DropHold.Position = UDim2.new(0, 0, 0.746887982, 0)
				DropHold.Size = UDim2.new(0, 500, 0, 0)
				DropHold.ZIndex = 10
				DropHold.Visible = false
				DropHold.BackgroundTransparency = 1

				Droplis.Name = "Droplis"
				Droplis.Parent = DropHold
				Droplis.Active = true
				Droplis.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Droplis.BackgroundTransparency = 1.000
				Droplis.Size = UDim2.new(0, 231, 0, 112)
				Droplis.ZIndex = 11
				Droplis.ScrollBarThickness = 0
				Droplis.Visible = false
				Droplis.Position = UDim2.new(0, 5, 0, 0)

				UIListLayout23423423423.Parent = Droplis
				UIListLayout23423423423.SortOrder = Enum.SortOrder.LayoutOrder

				UIPadding.Parent = Droplis
				UIPadding.PaddingTop = UDim.new(0, 3)
				
				expand_more.MouseButton1Click:Connect(function()
					Droptog = not Droptog
					DropHold.Visible = Droptog
					Droplis.Visible = Droptog
                    if expand_more.Rotation == 90 then
                        TweenService:Create(
                            expand_more,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                    else
                        TweenService:Create(
                            expand_more,
                            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 90}
                        ):Play()
                    end
					TweenService:Create(
						DropHold,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{Size = Droptog and UDim2.new(0, 500, 0, 80) or UDim2.new(0, 500, 0, 0)}
					):Play()
				end)
	
				UICorner_8.Parent = DropHold

				for i,v in next, list do

					local DrioBy = Instance.new("TextButton")
					local UICorner_7 = Instance.new("UICorner")
					DrioBy.Name = "DrioBy"
					DrioBy.Parent = Droplis
					DrioBy.BackgroundColor3 = Color3.fromRGB(71, 71, 71)
					DrioBy.Size = UDim2.new(0, 224, 0, 26)
					DrioBy.ZIndex = 12
					DrioBy.Text = v 
					DrioBy.Font = Enum.Font.SourceSansBold
					DrioBy.TextColor3 = theme.TextColor
					DrioBy.TextSize = 16.000
	
					UICorner_7.CornerRadius = UDim.new(0, 3)
					UICorner_7.Parent = DrioBy
	
    
                    DrioBy.MouseButton1Click:Connect(function()
                        pcall(callback, v)
                        Title_5.Text = title .. " : ".. v
                        Droptog = not Droptog
						DropHold.Visible = Droptog
						Droplis.Visible = Droptog
                        if expand_more.Rotation == 90 then
                            TweenService:Create(
                                expand_more,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {Rotation = 0}
                            ):Play()
                        end 
						TweenService:Create(
							DropHold,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = Droptog and UDim2.new(0, 500, 0, 80) or UDim2.new(0, 500, 0, 0)}
						):Play()
                    end)
                end

                function DropFunc:Clear()
                    for i, v in next, Droplis:GetChildren() do
                        if v.Name == "DrioBy" then
                            v:Destroy()
                        end
                    end
                    if Droptog == true then
                        Title_5.Text = Title
                    end
                end

                function DropFunc:Add(addtext)
					local DrioBy = Instance.new("TextButton")
					local UICorner_7 = Instance.new("UICorner")
					DrioBy.Name = "DrioBy"
					DrioBy.Parent = Droplis
					DrioBy.BackgroundColor3 = Color3.fromRGB(71, 71, 71)
					DrioBy.Size = UDim2.new(0, 224, 0, 26)
					DrioBy.ZIndex = 12
					DrioBy.Text = addtext 
					DrioBy.Font = Enum.Font.SourceSansBold
					DrioBy.TextColor3 = theme.TextColor
					DrioBy.TextSize = 16.000
	
					UICorner_7.CornerRadius = UDim.new(0, 3)
					UICorner_7.Parent = DrioBy
	
    
                    DrioBy.MouseButton1Click:Connect(function()
                        pcall(callback, addtext)
                        Title_5.Text = title .. " : ".. addtext
                        Droptog = not Droptog
						DropHold.Visible = Droptog
						Droplis.Visible = Droptog
                        if expand_more.Rotation == 90 then
                            TweenService:Create(
                                expand_more,
                                TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {Rotation = 0}
                            ):Play()
                        end 
						TweenService:Create(
							DropHold,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{Size = Droptog and UDim2.new(0, 500, 0, 80) or UDim2.new(0, 500, 0, 0)}
						):Play()
                    end)
                end
            return DropFunc
            end
		return Content
	end
	return SectionContent
end
return tabs
end

if _G.HideGui then
	game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.RightControl, false, game)
end

  --[[
local Window = library:CreateWindow(NameofHub,library.themes.original,Enum.KeyCode.RightControl)
--Window1--
local LOL = Window:CreateTab('Main')
local Tab1 = LOL:CreateSection('Home Main 1 ')
local Tab11 = LOL:CreateSection('Home Main 2')

--Window2--
local EZ = Window:CreateTab('Main2')
local Main2 = EZ:CreateSection('Home Main1')

--Tan1--

Tab1:CreateLine()
Tab1:CreateLabel("Label")


Tab1:CreateDropdown("Dropdown",{"1","2","3"},function(vu)
_G.Dropdown = vu
end)


Tab1:CreateButton("Button",function()
end)

Tab1:CreateToggle("Toggle",nil,function(vu)
_G.Toggle = vu
end)

Tab1:CreateSlider("Slider",1,100,1,function(vu)
    Slider = vu
end)

Tab1:CreateTextBox("Textbox", "", true, function(Value)
Textbox = Value
end)


--Tab11--

Tab11:CreateLine()
Tab11:CreateLabel("Label")


Tab11:CreateDropdown("Dropdown",{"1","2","3"},function(vu)
_G.Dropdown = vu
end)


Tab11:CreateButton("Button",function()
end)

Tab11:CreateToggle("Toggle",nil,function(vu)
_G.Toggle = vu
end)

Tab11:CreateSlider("Slider",1,100,1,function(vu)
    Slider = vu
end)

Tab11:CreateTextBox("Textbox", "", true, function(Value)
Textbox = Value
end)
  ]]
