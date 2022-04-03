--[[
hoho ui lib by @acsu123#9826
hoho dis: discord.gg/9TawdWNchg
-----------------------------------------------------
local lib = loadstring(game:HttpGet("link", true))()
local win = lib:Window("Hub Name","Game Name",Color3.new(0.333333, 0.666667, 1))
local tab = win:Tab("Tab Name")
local label = tab:Label("Label", properties) --properties: {["Visible"] = flase}
label:NewLabel("New Text", properties)
tab:Line()
tab:Button("Button", function()
	print("clicked")
end)
local toggle = tab:Toggle("Toggle", false, function(val)
	print(val)
    lib:Nof("notifi", 3)
end)
toggle:NewText("New Toggle")
toggle:NewState(true)
local slider = tab:Slider("Slider",1,100,30,function(val)
	print(val)
end)
local drop = tab:Dropdown("Drop New", {"a", 1, 5466}, function(val)
	print(val)
end)
drop:NewText("Drop New 2")
drop:NewDrop({1,'asdiowna',"aweqq"})
local txtbox = tab:Textbox("Textbox","write here",function(val)
	print(val)
end)
lib:Nof("notifi",3)
]]

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local HoHo_Video_Display = "false"
local HoHo_Video_Id = "0"
local HoHo_Tog_Fast = "true"

local hoho = {}
local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")
local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()

local Circle = Instance.new("ImageLabel")
Circle.Name = "Circle"
Circle.BackgroundColor3 = Color3.new(1, 1, 1)
Circle.BackgroundTransparency = 1
Circle.Image = "rbxassetid://266543268"
Circle.ImageTransparency = 0.5

function hoho:DraggingEnabled(frame, parent)
	parent = parent or frame
	-- stolen from wally or kiriot, kek
	--[[
	local dragging = false
	local dragInput, mousePos, framePos

	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			mousePos = input.Position
			framePos = parent.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)

	input.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - mousePos
			parent.Position  = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
		end
	end)
	]]
	
	local gui = parent
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		game:GetService("TweenService"):Create(gui,TweenInfo.new(0.25), {
			Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		}):Play()
		--gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
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
end

local function Resize(part, new, _delay)
	_delay = _delay or 0.5
	local tweenInfo = TweenInfo.new(_delay, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tween = tween:Create(part, tweenInfo, new)
	tween:Play()
end

local function ripple(button, x, y)
	spawn(function()
		button.ClipsDescendants = true
		local circle = Circle:Clone()
		circle.Parent = button
		circle.ZIndex = 1000
		local new_x = x - circle.AbsolutePosition.X
		local new_y = y - circle.AbsolutePosition.Y
		circle.Position = UDim2.new(0, new_x, 0, new_y)
		local size = 0
		if button.AbsoluteSize.X > button.AbsoluteSize.Y then
			size = button.AbsoluteSize.X * 1.5
		elseif button.AbsoluteSize.X < button.AbsoluteSize.Y then
			size = button.AbsoluteSize.Y * 1.5
		elseif button.AbsoluteSize.X == button.AbsoluteSize.Y then
			size = button.AbsoluteSize.X * 1.5
		end
		circle:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, -size / 2, 0.5, -size / 2), "Out", "Quad", 0.5, false, nil)
		Resize(circle, {ImageTransparency = 1}, 0.5)

		wait(0.5)
		circle:Destroy()
	end)
end


function hoho:Window(hub, the_game_name, main_color)
	local openned = true
	local openning = false
	
	local DevGui = Instance.new("ScreenGui")
	local Top_Bar = Instance.new("Frame")
	local BlackBackground = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local LeftTab = Instance.new("Frame")
	local Tabs = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local line = Instance.new("Frame")
	local GameName = Instance.new("TextLabel")
	local RightTab = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local UICorner_3 = Instance.new("UICorner")
	local FixBetter = Instance.new("Frame")
	local VideoBackground = Instance.new("VideoFrame")
	
	local SettingFrame = Instance.new("Frame")
	local UICornerZ = Instance.new("UICorner")
	local GameNameZ = Instance.new("TextLabel")
	local LamMo = Instance.new("Frame")
	local videoId = Instance.new("TextBox")
	local ToggVideo = Instance.new("TextButton")
	local UICornerz = Instance.new("UICorner")
	local VideoText = Instance.new("TextLabel")
	local UICornerc = Instance.new("UICorner")
	local ToggleFastLoad = Instance.new("TextButton")
	local UICornerx = Instance.new("UICorner")
	local FastLoadText = Instance.new("TextLabel")
	local UICornerd = Instance.new("UICorner")


	DevGui.Name = "Hoho_Hub"
	DevGui.Parent = game.CoreGui or game.Players.LocalPlayer:WaitForChild("PlayerGui")
	DevGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Top_Bar.Name = "Top_Bar"
	Top_Bar.Parent = DevGui
	Top_Bar.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
	Top_Bar.BorderSizePixel = 0
	Top_Bar.Position = UDim2.new(0.199795082, 0, 0.178649232, 0)
	Top_Bar.Size = UDim2.new(0, 450, 0, 24)
	Top_Bar.ZIndex = 2
	hoho:DraggingEnabled(Top_Bar)
	
	local TrueGame = Instance.new("TextLabel")
	TrueGame.Name = "TrueGame"
	TrueGame.Parent = Top_Bar
	TrueGame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TrueGame.BackgroundTransparency = 1.000
	TrueGame.BorderSizePixel = 0
	TrueGame.Position = UDim2.new(0.04933336, 0, 0.27000013, 0)
	TrueGame.Size = UDim2.new(0, 332, 0, 17)
	TrueGame.ZIndex = 4
	TrueGame.Font = Enum.Font.Cartoon
	TrueGame.Text = the_game_name or game.Name or "Game name"
	TrueGame.TextColor3 = Color3.fromRGB(255, 255, 255)
	TrueGame.TextScaled = true
	TrueGame.TextSize = 14.000
	TrueGame.TextStrokeTransparency = 0.100
	TrueGame.TextWrapped = true
	TrueGame.TextXAlignment = Enum.TextXAlignment.Left
	
	local NewDropShadow = Instance.new("ImageLabel")
	NewDropShadow.Name = "DropShadow"
	NewDropShadow.BackgroundTransparency = 1
	NewDropShadow.Image = "rbxassetid://297774371"
	NewDropShadow.ImageTransparency = 0.3
	NewDropShadow.ZIndex = -1
	NewDropShadow.Position = UDim2.new(-0.0343199335, 0, 1.29166663, 0)
	NewDropShadow.Size = UDim2.new(0, 495, 0, 286)
	NewDropShadow.Parent = Top_Bar
	
	BlackBackground.Name = "BlackBackground"
	BlackBackground.Parent = Top_Bar
	BlackBackground.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
	BlackBackground.BackgroundTransparency = 0.200
	BlackBackground.BorderSizePixel = 0
	BlackBackground.Position = UDim2.new(-0.000204942495, 0, 1, 0)
	BlackBackground.Size = UDim2.new(0, 450, 0, 272)
	BlackBackground.ZIndex = 3
	BlackBackground.ClipsDescendants = true
	if HoHo_Video_Display == "true" then
		BlackBackground.BackgroundTransparency = 0.9
	else
		BlackBackground.BackgroundTransparency = 0
	end

	
	VideoBackground.Name = "VideoBackground"
	VideoBackground.Parent = Top_Bar
	VideoBackground.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
	VideoBackground.BackgroundTransparency = 0
	VideoBackground.BorderSizePixel = 0
	VideoBackground.Position = UDim2.new(-0.000204942495, 0, 1, 0)
	VideoBackground.Size = UDim2.new(0, 450, 0, 272)
	VideoBackground.ZIndex = 2
	VideoBackground.Playing = true
	VideoBackground.Looped = true
	VideoBackground.Volume = 0
	VideoBackground.ClipsDescendants = true
	VideoBackground.Video = "rbxassetid://"..HoHo_Video_Id
	if HoHo_Video_Display == "true" then
		VideoBackground.Visible = true
		VideoBackground.Video = "rbxassetid://"..HoHo_Video_Id
	else
		VideoBackground.Visible = false
	end


	UICorner.CornerRadius = UDim.new(0, 5)
	UICorner.Parent = BlackBackground

	LeftTab.Name = "LeftTab"
	LeftTab.Parent = BlackBackground
	LeftTab.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
	LeftTab.BackgroundTransparency = 0.500
	LeftTab.BorderColor3 = Color3.fromRGB(27, 42, 53)
	LeftTab.BorderSizePixel = 0
	LeftTab.Position = UDim2.new(0, 0, 0.0257352944, 0)
	LeftTab.Size = UDim2.new(0, 123, 0, 265)
	LeftTab.ZIndex = 3
	LeftTab.BackgroundTransparency = 0.9


	Tabs.Name = "Tabs"
	Tabs.Parent = LeftTab
	Tabs.Active = true
	Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Tabs.BackgroundTransparency = 1.000
	Tabs.BorderSizePixel = 0
	Tabs.Position = UDim2.new(0, 0, 0.128301889, 0)
	Tabs.Size = UDim2.new(0, 123, 0, 231)
	Tabs.ZIndex = 4
	Tabs.CanvasPosition = Vector2.new(0, 4.58874464)
	Tabs.ScrollBarThickness = 5
	Tabs.ScrollBarImageColor3 = main_color or Color3.new(1, 1, 1)

	UIListLayout.Parent = Tabs
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	
	Tabs.CanvasSize = UDim2.new(0, 0, 0, 10 + UIListLayout.AbsoluteContentSize.Y)
	UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		Tabs.CanvasSize = UDim2.new(0, 0, 0, 10 + UIListLayout.AbsoluteContentSize.Y)
	end)

	line.Name = "line"
	line.Parent = LeftTab
	line.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
	line.BorderSizePixel = 0
	line.Position = UDim2.new(0, 0, 0.124528289, 0)
	line.Size = UDim2.new(0, 123, 0, 1)
	line.ZIndex = 4

	GameName.Name = "GameName"
	GameName.Parent = LeftTab
	GameName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GameName.BackgroundTransparency = 1.000
	GameName.BorderSizePixel = 0
	GameName.Position = UDim2.new(-0.00400000019, 0, 0.0199999996, 0)
	GameName.Size = UDim2.new(0, 123, 0, 23)
	GameName.ZIndex = 999
	GameName.Font = Enum.Font.Cartoon
	GameName.Text = hub or "HoHo Hub"
	GameName.TextColor3 = Color3.fromRGB(255, 170, 0)
	GameName.TextScaled = true
	GameName.TextSize = 14.000
	GameName.TextStrokeTransparency = 0.100
	GameName.TextWrapped = true

	RightTab.Name = "RightTab"
	RightTab.Parent = BlackBackground
	RightTab.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
	RightTab.BackgroundTransparency = 0.500
	RightTab.BorderColor3 = Color3.fromRGB(27, 42, 53)
	RightTab.BorderSizePixel = 0
	RightTab.Position = UDim2.new(0.288888901, 0, 0.0257352944, 0)
	RightTab.Size = UDim2.new(0, 313, 0, 265)
	RightTab.ZIndex = 3
	RightTab.BackgroundTransparency = 0.9


	UICorner_2.Parent = RightTab

	UICorner_3.Parent = Top_Bar

	FixBetter.Name = "FixBetter"
	FixBetter.Parent = Top_Bar
	FixBetter.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
	FixBetter.BackgroundTransparency = 0.200
	FixBetter.BorderColor3 = Color3.fromRGB(27, 42, 53)
	FixBetter.BorderSizePixel = 0
	FixBetter.Position = UDim2.new(-0.000204942495, 0, 0.709089935, 0)
	FixBetter.Size = UDim2.new(0, 450, 0, 14)
	FixBetter.ZIndex = 3
	
	local SettingBt = Instance.new("ImageButton")
	local Minimize = Instance.new("ImageButton")

	SettingBt.Name = "SettingBt"
	SettingBt.Parent = Top_Bar
	SettingBt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SettingBt.BackgroundTransparency = 1.000
	SettingBt.Position = UDim2.new(0.855528295, 0, 0.25, 0)
	SettingBt.Size = UDim2.new(0, 22, 0, 22)
	SettingBt.ZIndex = 15
	SettingBt.Image = "rbxassetid://6863506969"
	SettingBt.HoverImage = "rbxassetid://3340612992"
	SettingBt.ImageColor3 = Color3.fromRGB(0, 0, 0)
	
	SettingBt.MouseButton1Click:Connect(function()
		pcall(function()
			SettingFrame.Visible = not SettingFrame.Visible
		end)
	end)

	Minimize.Name = "Minimize"
	Minimize.Parent = Top_Bar
	Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Minimize.BackgroundTransparency = 1.000
	Minimize.Position = UDim2.new(0.923261642, 0, 0.125, 0)
	Minimize.Size = UDim2.new(0, 27, 0, 27)
	Minimize.ZIndex = 15
	Minimize.Image = "rbxassetid://4373917715"
	Minimize.HoverImage = "rbxassetid://848237313"
	Minimize.ImageColor3 = Color3.fromRGB(0, 0, 0)
	
	Minimize.MouseButton1Click:Connect(function()
		if openning == false then
			openning = true
			if openned == true then
				openned = false
				NewDropShadow.Visible = false
				tween:Create(VideoBackground,tweeninfo(0.5),
					{Position = UDim2.new(-0, 0,1, 0),
						Size = UDim2.new(0, 450,0, 6)
					}
				):Play()
				tween:Create(BlackBackground,tweeninfo(0.5),
					{Position = UDim2.new(-0, 0,1, 0),
						Size = UDim2.new(0, 450,0, 6)
					}
				):Play()
				wait(0.5)
				openning = false
			else
				openned = true
				tween:Create(VideoBackground,tweeninfo(0.5),
					{Position = UDim2.new(-0, 0,1, 0),
						Size = UDim2.new(0, 450,0, 272)
					}
				):Play()
				tween:Create(BlackBackground,tweeninfo(0.5),
					{Position = UDim2.new(-0, 0,1, 0),
						Size = UDim2.new(0, 450,0, 272)
					}
				):Play()
				wait(0.5)
				NewDropShadow.Visible = true
				openning = false
			end
		end
	end)
	
	local ListNof = Instance.new("Frame")
	local NofList = Instance.new("UIListLayout")

	ListNof.Name = "ListNof"
	ListNof.Parent = DevGui
	ListNof.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ListNof.BackgroundTransparency = 1.000
	ListNof.Position = UDim2.new(0.778017223, 0, -0.00217864919, 0)
	ListNof.Size = UDim2.new(0, 206, 0, 460)

	NofList.Name = "NofList"
	NofList.Parent = ListNof
	NofList.SortOrder = Enum.SortOrder.LayoutOrder
	NofList.VerticalAlignment = Enum.VerticalAlignment.Top
	
	function hoho:Nof(txt,tine)
		spawn(function()
			local Nof1 = Instance.new("Frame")
			local Nof2 = Instance.new("Frame")
			local Nof3 = Instance.new("Frame")
			local NofLabel = Instance.new("TextLabel")
			local slidenof = Instance.new("Frame")
			local Slide2 = Instance.new("Frame")

			Nof1.Name = "Nof1"
			Nof1.Parent = ListNof
			Nof1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Nof1.BackgroundTransparency = 1.000
			Nof1.BorderSizePixel = 0
			Nof1.Size = UDim2.new(0, 206, 0, 83)

			Nof2.Name = "Nof2"
			Nof2.Parent = Nof1
			Nof2.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
			Nof2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Nof2.Position = UDim2.new(0, 0, 0.0120481923, 0)
			Nof2.Size = UDim2.new(0, 189, 0, 65)
			Instance.new("UICorner",Nof2)
			Instance.new("UICorner",slidenof)
			Instance.new("UICorner",Slide2)


			Nof3.Name = "Nof3"
			Nof3.Parent = Nof1
			Nof3.BackgroundColor3 = Color3.fromRGB(0, 53, 25)
			Nof3.BorderSizePixel = 0
			Nof3.Position = UDim2.new(0, 0, 0.638554215, 0)
			Nof3.Size = UDim2.new(0, 189, 0, 7)

			NofLabel.Name = "NofLabel"
			NofLabel.Parent = Nof1
			NofLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			NofLabel.BackgroundTransparency = 1.000
			NofLabel.BorderSizePixel = 0
			NofLabel.Position = UDim2.new(0, 0, 0.00463949936, 0)
			NofLabel.Size = UDim2.new(0, 188, 0, 52)
			NofLabel.ZIndex = 4
			NofLabel.Font = Enum.Font.Cartoon
			NofLabel.TextColor3 = main_color or Color3.fromRGB(0, 255, 127)
			NofLabel.TextScaled = true
			NofLabel.TextSize = 14.000
			NofLabel.TextStrokeTransparency = 0.100
			NofLabel.TextTransparency = 0.100
			NofLabel.TextWrapped = true
			NofLabel.Text = txt or ""

			slidenof.Name = "slidenof"
			slidenof.Parent = Nof1
			slidenof.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
			slidenof.BorderSizePixel = 0
			slidenof.Position = UDim2.new(0, 0, 0.638554215, 0)
			slidenof.Size = UDim2.new(0, 189, 0, 7)

			Slide2.Name = "Slide2"
			Slide2.Parent = Nof1
			Slide2.BorderSizePixel = 0
			Slide2.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
			Slide2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Slide2.Position = UDim2.new(0, 0, 0.0120481923, 0)
			Slide2.Size = UDim2.new(0, 0, 0, 65)
			Slide2.ZIndex = 15
			Slide2.Visible = false

			tween:Create(slidenof,tweeninfo(tine or 2),{Size = UDim2.new(0, 0, 0, 7)}):Play()
			wait(tine or 2)
			Slide2.Visible = true
			tween:Create(Slide2,tweeninfo(0.2),{Size = UDim2.new(0, 190, 0, 65)}):Play()
			wait(0.2)
			tween:Create(Slide2,tweeninfo(0.2),{Size = UDim2.new(0, 0, 0, 65)}):Play()
			tween:Create(Nof3,tweeninfo(0.2),{Size = UDim2.new(0, 0, 0, 7)}):Play()
			tween:Create(NofLabel,tweeninfo(0.2),{Size = UDim2.new(0, 0, 0, 52)}):Play()
			tween:Create(Nof2,tweeninfo(0.2),{Size = UDim2.new(0, 0, 0, 65)}):Play()
			wait(0.2)
			game.Debris:AddItem(Nof1,0)
		end)
	end
	
	local first_tab = false
	local tab_count = 0
	local hoho_wind = {}
	
	function hoho_wind:Tab(tab_name)
		local TabFrame = Instance.new("ScrollingFrame")
		local UIListLayout2 = Instance.new("UIListLayout")
		tab_count = tab_count + 1 or 0
		local this_ = "tab"..tab_count
		TabFrame.Name = this_ or "TabFrame"
		TabFrame.Parent = RightTab
		TabFrame.Active = true
		TabFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabFrame.BackgroundTransparency = 1.000
		TabFrame.BorderSizePixel = 0
		TabFrame.Position = UDim2.new(0, 0, 0.00377358496, 0)
		TabFrame.Size = UDim2.new(0, 313, 0, 264)
		TabFrame.Visible = false
		TabFrame.ZIndex = 5
		TabFrame.ScrollBarThickness = 5
		TabFrame.ScrollBarImageColor3 = main_color or Color3.new(1, 1, 1)

		UIListLayout2.Parent = TabFrame
		UIListLayout2.Padding = UDim.new(0,3)
		UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
		
		TabFrame.CanvasSize = UDim2.new(0, 0, 0, 10 + UIListLayout2.AbsoluteContentSize.Y)
		UIListLayout2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			TabFrame.CanvasSize = UDim2.new(0, 0, 0, 10 + UIListLayout2.AbsoluteContentSize.Y)
		end)
		
		if first_tab == false then
			first_tab = true
			TabFrame.Visible = true
		end
		
		local ButtonTest = Instance.new("Frame")
		local ClickHere = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")

		ButtonTest.Name = this_ or "ButtonTest"
		ButtonTest.Parent = Tabs
		ButtonTest.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ButtonTest.BackgroundTransparency = 1.000
		ButtonTest.BorderSizePixel = 0
		ButtonTest.Position = UDim2.new(0, 0, -0.019864697, 0)
		ButtonTest.Size = UDim2.new(0, 122, 0, 30)
		ButtonTest.ZIndex = 4

		ClickHere.Name = "ClickHere"
		ClickHere.Parent = ButtonTest
		ClickHere.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
		ClickHere.BorderSizePixel = 0
		ClickHere.Position = UDim2.new(0.0901639313, 0, 0.321909577, 0)
		ClickHere.Size = UDim2.new(0, 100, 0, 24)
		ClickHere.ZIndex = 5
		ClickHere.Font = Enum.Font.Cartoon
		ClickHere.Text = "  "..tab_name or "  Button"
		ClickHere.TextColor3 = Color3.fromRGB(255, 255, 255)
		ClickHere.TextStrokeTransparency = 0.5
		ClickHere.TextSize = 16.000
		ClickHere.TextXAlignment = Enum.TextXAlignment.Left

		UICorner.CornerRadius = UDim.new(0, 5)
		UICorner.Parent = ClickHere
		
		ClickHere.MouseButton1Click:Connect(function()
			ripple(ClickHere, mouse.X, mouse.Y)
			for i,v in pairs(RightTab:GetChildren()) do
				pcall(function()
					v.Visible = false
				end)
			end
			RightTab:FindFirstChild(this_).Visible = true
		end)
		
		local hoho_tab = {}
		function hoho_tab:Line()
			local linetemp = Instance.new("Frame")
			linetemp.Name = "linetemp"
			linetemp.Parent = TabFrame
			linetemp.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
			linetemp.BorderSizePixel = 0
			linetemp.Position = UDim2.new(0, 0, 0.102272727, 0)
			linetemp.Size = UDim2.new(0, 301, 0, 1)
			linetemp.ZIndex = 4
		end
		
		function hoho_tab:Button(text, func)
			local ButtenTemp = Instance.new("Frame")
			local ClickMe = Instance.new("TextButton")
			local UICorner = Instance.new("UICorner")

			ButtenTemp.Name = "ButtenTemp"
			ButtenTemp.Parent = TabFrame
			ButtenTemp.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
			ButtenTemp.BackgroundTransparency = 1.000
			ButtenTemp.BorderColor3 = Color3.fromRGB(27, 42, 53)
			ButtenTemp.BorderSizePixel = 0
			ButtenTemp.Size = UDim2.new(0, 307, 0, 27)

			ClickMe.Name = "ClickMe"
			ClickMe.Parent = ButtenTemp
			ClickMe.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
			ClickMe.Position = UDim2.new(0.0325732902, 0, 0.0740740672, 0)
			ClickMe.Size = UDim2.new(0, 291, 0, 22)
			ClickMe.ZIndex = 5
			ClickMe.Font = Enum.Font.Cartoon
			ClickMe.Text = text.." 🖱️" or "Button 🖱️"
			ClickMe.TextColor3 = Color3.fromRGB(0, 0, 0)
			ClickMe.TextSize = 19.000
			ClickMe.TextWrapped = true

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = ClickMe
			
			local uistroke = Instance.new("UIStroke")
			uistroke.Name = "stroke"
			uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uistroke.Color = Color3.new(1, 1, 1)
			uistroke.LineJoinMode = Enum.LineJoinMode.Round
			uistroke.Thickness = 2
			uistroke.Parent = ClickMe
			
			local bt_click = false
			
			ClickMe.MouseButton1Click:Connect(function()
				if bt_click == false then
					bt_click = true
					ripple(ClickMe, mouse.X, mouse.Y)
					pcall(func)
					tween:Create(ClickMe,tweeninfo(0.1),{Size = UDim2.new(0, 276,0, 20)}):Play()
					wait(0.1)
					tween:Create(ClickMe,tweeninfo(0.1),{Size = UDim2.new(0, 291,0, 22)}):Play()
					wait(0.1)
					bt_click = false
				end
			end)
			
			local hoho_button = {}
			function hoho_button:NewButton(new)
				ClickMe.Text = new.." 🖱️" or "Button 🖱️"
			end
			return hoho_button
		end
		
		function hoho_tab:Label(label_text, properties)
			local TextForm = Instance.new("Frame")
			local TextHere = Instance.new("TextLabel")
			TextForm.Name = "TextForm"
			TextForm.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
			TextForm.BackgroundTransparency = 1.000
			TextForm.BorderSizePixel = 0
			TextForm.Size = UDim2.new(0, 307, 0, 27)
			TextHere.Name = "TextHere"
			TextHere.Parent = TextForm
			TextHere.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextHere.BackgroundTransparency = 1.000
			TextHere.BorderSizePixel = 0
			TextHere.Position = UDim2.new(0.0122866556, 0, 0.113073282, 0)
			TextHere.Size = UDim2.new(0, 289, 0, 24)
			TextHere.ZIndex = 4
			TextHere.Font = Enum.Font.Cartoon
			TextHere.TextColor3 = main_color or Color3.fromRGB(0, 255, 127)
			TextHere.TextScaled = true
			TextHere.TextSize = 14.000
			TextHere.TextStrokeTransparency = 0.100
			TextHere.TextTransparency = 0.100
			TextHere.TextWrapped = true
			TextHere.Text = label_text or "Text here"
			if properties then
				for i,v in pairs(properties) do
					pcall(function()
						TextHere[i] = v
					end)
				end
			end			
			TextForm.Parent = TabFrame
			local hoho_label = {}
			function hoho_label:NewLabel(label_text, properties)
				TextHere.Text = label_text or "Text here"
				if properties then
					for i,v in pairs(properties) do
						pcall(function()
							TextHere[i] = v
						end)
					end
				end	
			end
			return hoho_label
		end
		function hoho_tab:Toggle(toggle_text, state, func)
			local ToggleTemp = Instance.new("Frame")
			local TextHere = Instance.new("TextLabel")
			local UICorner = Instance.new("UICorner")
			local ClickThis = Instance.new("TextButton")
			local UICorner_2 = Instance.new("UICorner")

			ToggleTemp.Name = "ToggleTemp"
			ToggleTemp.Parent = TabFrame
			ToggleTemp.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
			ToggleTemp.BackgroundTransparency = 1.000
			ToggleTemp.BorderSizePixel = 0
			ToggleTemp.Position = UDim2.new(0, 0, 0.265151501, 0)
			ToggleTemp.Size = UDim2.new(0, 307, 0, 32)

			TextHere.Name = "TextHere"
			TextHere.Parent = ToggleTemp
			TextHere.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextHere.BackgroundTransparency = 1.000
			TextHere.BorderSizePixel = 0
			TextHere.Position = UDim2.new(0.0325732902, 0, 0.113073282, 0)
			TextHere.Size = UDim2.new(0, 290, 0, 24)
			TextHere.ZIndex = 4
			TextHere.Font = Enum.Font.Cartoon
			TextHere.Text = "  "..toggle_text or "text"
			TextHere.TextColor3 = main_color or Color3.fromRGB(0, 255, 127)
			TextHere.TextScaled = true
			TextHere.TextSize = 14.000
			TextHere.TextStrokeTransparency = 0.100
			TextHere.TextTransparency = 0.100
			TextHere.TextWrapped = true
			TextHere.TextXAlignment = Enum.TextXAlignment.Left
			
			local uistroke = Instance.new("UIStroke")
			uistroke.Name = "stroke"
			uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uistroke.Color = Color3.new(1, 1, 1)
			uistroke.LineJoinMode = Enum.LineJoinMode.Round
			uistroke.Thickness = 2
			uistroke.Parent = TextHere

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = TextHere

			ClickThis.Name = "ClickThis"
			ClickThis.Parent = ToggleTemp
			ClickThis.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ClickThis.Position = UDim2.new(0.863192201, 0, 0.1875, 0)
			ClickThis.Size = UDim2.new(0, 27, 0, 18)
			ClickThis.ZIndex = 7
			ClickThis.Font = Enum.Font.SourceSans
			ClickThis.Text = ""
			ClickThis.TextColor3 = Color3.fromRGB(0, 0, 0)
			ClickThis.TextSize = 14.000
			
			UICorner_2.Parent = ClickThis
			
			local toggled = state or false
			if toggled == true then
				ClickThis.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
			end
			ClickThis.MouseButton1Click:Connect(function()
				if toggled == true then
					toggled = false
					pcall(function()
						func(toggled)
					end)
					ripple(ClickThis, mouse.X, mouse.Y)
					ClickThis.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				else
					toggled = true
					pcall(function()
						func(toggled)
					end)
					ripple(ClickThis, mouse.X, mouse.Y)
					ClickThis.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
				end
			end)
			local hoho_toggle = {}
			function hoho_toggle:NewText(new_t)
				TextHere.Text = "  "..new_t
			end
			function hoho_toggle:NewState(new_state)
				if new_state == true then
					toggled = true
					ripple(ClickThis, mouse.X, mouse.Y)
					ClickThis.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
				else
					toggled = false
					ripple(ClickThis, mouse.X, mouse.Y)
					ClickThis.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				end
			end
			return hoho_toggle
		end
		function hoho_tab:Slider(txt, min, max, mid, func)
			local mouse = game.Players.LocalPlayer:GetMouse()
			local uis = game:GetService("UserInputService")
			
			local maxvalue = max or 10
			local minvalue = min or 1
			local mid = mid or 3
			
			local SliderTemp = Instance.new("Frame")
			local Slidenum = Instance.new("TextButton")
			local Slide1 = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local HoldButton = Instance.new("ImageButton")
			local Slide = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local TextHere = Instance.new("TextLabel")

			SliderTemp.Name = "SliderTemp"
			SliderTemp.Parent = TabFrame
			SliderTemp.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
			SliderTemp.BackgroundTransparency = 1.000
			SliderTemp.BorderSizePixel = 0
			SliderTemp.Position = UDim2.new(0, 0, 0.265151501, 0)
			SliderTemp.Size = UDim2.new(0, 307, 0, 32)

			Slidenum.Name = "Slidenum"
			Slidenum.Parent = SliderTemp
			Slidenum.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Slidenum.BorderSizePixel = 0
			Slidenum.Position = UDim2.new(0.863192201, 0, 0.1875, 0)
			Slidenum.Size = UDim2.new(0, 27, 0, 18)
			Slidenum.ZIndex = 7
			Slidenum.Font = Enum.Font.Cartoon
			Slidenum.Text = mid or "3"
			Slidenum.TextColor3 = Color3.fromRGB(0, 0, 0)
			Slidenum.TextScaled = true
			Slidenum.TextSize = 14.000
			Slidenum.TextWrapped = true

			Slide1.Name = "Slide1"
			Slide1.Parent = SliderTemp
			Slide1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Slide1.Position = UDim2.new(0.0325732902, 0, 0.5, 0)
			Slide1.Size = UDim2.new(0, 246, 0, 8)
			Slide1.ZIndex = 9

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = Slide1

			HoldButton.Name = "HoldButton"
			HoldButton.Parent = Slide1
			HoldButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			HoldButton.BackgroundTransparency = 1.000
			HoldButton.BorderSizePixel = 0
			HoldButton.Position = UDim2.new(0, 0, -0.625, 0)
			HoldButton.Size = UDim2.new(0, 245, 0, 18)
			HoldButton.ZIndex = 11
			HoldButton.ImageTransparency = 1.000

			Slide.Name = "Slide"
			Slide.Parent = Slide1
			Slide.BackgroundColor3 = main_color or Color3.fromRGB(85, 255, 127)
			Slide.Size = UDim2.new(0, 0, 0, 8)
			local SliderCaculate = (246/100)*(mid/maxvalue*100)
			Slide.Size = UDim2.new(0, SliderCaculate, 0, 8)
			Slide.ZIndex = 10

			UICorner_2.CornerRadius = UDim.new(0, 5)
			UICorner_2.Parent = Slide

			TextHere.Name = "TextHere"
			TextHere.Parent = SliderTemp
			TextHere.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextHere.BackgroundTransparency = 1.000
			TextHere.BorderSizePixel = 0
			TextHere.Position = UDim2.new(0.0122866556, 0, -0.074426651, 0)
			TextHere.Size = UDim2.new(0, 289, 0, 18)
			TextHere.ZIndex = 4
			TextHere.Font = Enum.Font.Cartoon
			TextHere.TextColor3 = main_color or Color3.fromRGB(0, 255, 127)
			TextHere.TextScaled = true
			TextHere.TextSize = 14.000
			TextHere.TextStrokeTransparency = 0.100
			TextHere.TextTransparency = 0.100
			TextHere.TextWrapped = true
			TextHere.Text = txt or "test"
			
			local Value;
			local SliderIn = Slide
			local Val = Slidenum
			
			HoldButton.MouseButton1Down:Connect(function()
				Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 246) * SliderIn.AbsoluteSize.X) + tonumber(minvalue)) or 0
				SliderIn.Size = UDim2.new(0, math.clamp(mouse.X - SliderIn.AbsolutePosition.X, 0, 246), 0, 8)
				Val.Text = Value
				local moveconnection, releaseconnection
				pcall(function()
					func(Value)
				end)
				moveconnection = mouse.Move:Connect(function()
					Val.Text = Value
					Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 246) * SliderIn.AbsoluteSize.X) + tonumber(minvalue))
					SliderIn.Size = UDim2.new(0, math.clamp(mouse.X - SliderIn.AbsolutePosition.X, 0, 246), 0, 8)
					pcall(function()
						func(Value)
					end)
				end)
				releaseconnection = uis.InputEnded:Connect(function(Mouse)
					Val.Text = Value
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
						Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 246) * SliderIn.AbsoluteSize.X) + tonumber(minvalue))
						SliderIn.Size = UDim2.new(0, math.clamp(mouse.X - SliderIn.AbsolutePosition.X, 0, 246), 0, 8)
						pcall(function()
							func(Value)
						end)
						moveconnection:Disconnect()
						releaseconnection:Disconnect()
					end
				end)
			end)
		end
		
		function hoho_tab:Dropdown(txt,list,func)
			local DropTemp = Instance.new("Frame")
			local DropButton = Instance.new("TextButton")
			local UICorner = Instance.new("UICorner")
			local DropList = Instance.new("ScrollingFrame")
			local UIListLayoutZZZ = Instance.new("UIListLayout")

			DropTemp.Name = "DropTemp"
			DropTemp.Parent = TabFrame
			DropTemp.BackgroundColor3 = Color3.fromRGB(0, 255, 127)
			DropTemp.BackgroundTransparency = 1.000
			DropTemp.BorderColor3 = Color3.fromRGB(27, 42, 53)
			DropTemp.BorderSizePixel = 0
			DropTemp.Position = UDim2.new(0, 0, 0.545454562, 0)
			DropTemp.Size = UDim2.new(0, 307, 0, 36)
			DropTemp.ZIndex = 10

			DropButton.Name = "DropButton"
			DropButton.Parent = DropTemp
			DropButton.BackgroundColor3 = Color3.fromRGB(0, 255, 127)
			DropButton.BackgroundTransparency = 1.000
			DropButton.Position = UDim2.new(0.0325732902, 0, 0.0740740672, 0)
			DropButton.Size = UDim2.new(0, 291, 0, 22)
			DropButton.ZIndex = 11
			DropButton.Font = Enum.Font.Cartoon
			DropButton.Text = txt..": nil 💬"
			DropButton.TextColor3 = main_color or Color3.fromRGB(0, 255, 127)
			DropButton.TextSize = 19.000
			DropButton.TextStrokeTransparency = 0.100
			DropButton.TextTransparency = 0.100
			DropButton.TextWrapped = true
			
			local uistroke = Instance.new("UIStroke")
			uistroke.Name = "stroke"
			uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uistroke.Color = Color3.new(1, 1, 1)
			uistroke.LineJoinMode = Enum.LineJoinMode.Round
			uistroke.Thickness = 2
			uistroke.Parent = DropButton

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = DropButton

			DropList.Name = "DropList"
			DropList.Parent = DropTemp
			DropList.Active = true
			DropList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropList.BackgroundTransparency = 1
			DropList.BorderSizePixel = 0
			DropList.Position = UDim2.new(0.0325732902, 0, 0.685184896, 0)
			DropList.Size = UDim2.new(0, 290, 0, 0)
			DropList.ZIndex = 12
			DropList.CanvasSize = UDim2.new(0, 0, 1, 0)
			DropList.ScrollBarThickness = 5
			DropList.Visible = false
			DropList.ScrollBarImageColor3 = main_color or Color3.new(1, 1, 1)

			
			local uistroke2 = Instance.new("UIStroke")
			uistroke2.Name = "stroke"
			uistroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			uistroke2.Color = Color3.new(1, 1, 1)
			uistroke2.LineJoinMode = Enum.LineJoinMode.Round
			uistroke2.Thickness = 2
			uistroke2.Parent = DropList

			UIListLayoutZZZ.Name = "UIListLayoutZZZ"
			UIListLayoutZZZ.Parent = DropList
			UIListLayoutZZZ.SortOrder = Enum.SortOrder.LayoutOrder
			
			local ButtonInsideDrop = Instance.new("TextButton")
			ButtonInsideDrop.Name = "ButtonInsideDrop"
			ButtonInsideDrop.BackgroundColor3 = Color3.fromRGB(0, 255, 127)
			ButtonInsideDrop.BackgroundTransparency = 1.000
			ButtonInsideDrop.Size = UDim2.new(0, 282, 0, 22)
			ButtonInsideDrop.ZIndex = 15
			ButtonInsideDrop.Font = Enum.Font.Cartoon
			ButtonInsideDrop.Text = "Button 🖱️"
			ButtonInsideDrop.TextColor3 = main_color or Color3.fromRGB(0, 255, 127)
			ButtonInsideDrop.TextSize = 19.000
			ButtonInsideDrop.TextStrokeTransparency = 0.100
			ButtonInsideDrop.TextTransparency = 0.100
			ButtonInsideDrop.TextWrapped = true
			
			DropList.CanvasSize = UDim2.new(0, 0, 0, 0 + UIListLayoutZZZ.AbsoluteContentSize.Y)
			UIListLayoutZZZ:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				DropList.CanvasSize = UDim2.new(0, 0, 0, 0 + UIListLayoutZZZ.AbsoluteContentSize.Y)
			end)
			
			local opendr = false
			for i,v in pairs(list) do
				local bt = ButtonInsideDrop:Clone()
				bt.Text = tostring(v)
				bt.Parent = DropList
				bt.MouseButton1Click:Connect(function()
					DropButton.Text = txt..": "..v.." 💬"
					opendr = false
					tween:Create(DropList,tweeninfo(0.2),{
						Size = UDim2.new(0, 290, 0, 0),
						Position = UDim2.new(0.03, 0, 0.726, 0),
						Visible = false
					}):Play()
					tween:Create(DropTemp,tweeninfo(0.2),{
						Position = UDim2.new(0, 0, 0.359, 0),
						Size = UDim2.new(0, 307, 0, 30)
					}):Play()
					pcall(function()
						func(v)
					end)
				end)
			end
			DropButton.MouseButton1Click:Connect(function()
				if opendr == true then
					opendr = false
					tween:Create(DropList,tweeninfo(0.2),{
						Size = UDim2.new(0, 290, 0, 0),
						Position = UDim2.new(0.03, 0, 0.726, 0),
						Visible = false
					}):Play()
					tween:Create(DropTemp,tweeninfo(0.2),{
						Position = UDim2.new(0, 0, 0.359, 0),
						Size = UDim2.new(0, 307, 0, 30)
					}):Play()
				else
					opendr = true
					tween:Create(DropList,tweeninfo(0.2),{
						Size = UDim2.new(0, 290,0, 89),
						Position = UDim2.new(0.03, 0, 0.273, 0),
						Visible = true
					}):Play()
					tween:Create(DropTemp,tweeninfo(0.2),{
						Position = UDim2.new(0, 0, 0.359, 0),
						Size = UDim2.new(0, 307, 0, 139),
					}):Play()
				end
			end)
			local hoho_drop = {}
			function hoho_drop:NewText(ntxt)
				DropButton.Text = txt..": "..ntxt.." 💬"
			end
			function hoho_drop:NewDrop(nlist)
				for i,v in pairs(DropList:GetChildren()) do
					if v:IsA("TextButton") then
						pcall(function()
							v:Destroy()
						end)
					end
				end
				for i,v in pairs(nlist) do
					local bt = ButtonInsideDrop:Clone()
					bt.Text = tostring(v)
					bt.Parent = DropList
					bt.MouseButton1Click:Connect(function()
						DropButton.Text = txt..": "..v.." 💬"
						opendr = false
						tween:Create(DropList,tweeninfo(0.2),{
							Size = UDim2.new(0, 290, 0, 0),
							Position = UDim2.new(0.03, 0, 0.726, 0),
							Visible = false
						}):Play()
						tween:Create(DropTemp,tweeninfo(0.2),{
							Position = UDim2.new(0, 0, 0.359, 0),
							Size = UDim2.new(0, 307, 0, 30)
						}):Play()
						pcall(function()
							func(v)
						end)
					end)
				end
			end
			return hoho_drop
		end
		
		function hoho_tab:Textbox(txt,txt_hold,func)
			local TypeZone = Instance.new("Frame")
			local TextHere = Instance.new("TextLabel")
			local Re = Instance.new("TextBox")

			TypeZone.Name = "TypeZone"
			TypeZone.Parent = TabFrame
			TypeZone.BackgroundColor3 = Color3.fromRGB(0, 255, 127)
			TypeZone.BackgroundTransparency = 1.000
			TypeZone.BorderSizePixel = 0
			TypeZone.Size = UDim2.new(0, 307, 0, 27)

			TextHere.Name = "TextHere"
			TextHere.Parent = TypeZone
			TextHere.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextHere.BackgroundTransparency = 1.000
			TextHere.BorderSizePixel = 0
			TextHere.Position = UDim2.new(0.0122866556, 0, 0.113073282, 0)
			TextHere.Size = UDim2.new(0, 220, 0, 24)
			TextHere.ZIndex = 4
			TextHere.Font = Enum.Font.Cartoon
			TextHere.TextColor3 = main_color or Color3.fromRGB(0, 255, 127)
			TextHere.TextScaled = true
			TextHere.TextSize = 14.000
			TextHere.TextStrokeTransparency = 0.100
			TextHere.TextTransparency = 0.100
			TextHere.TextWrapped = true
			TextHere.Text = txt..":"

			Re.Name = "Re"
			Re.Parent = TypeZone
			Re.BackgroundColor3 = Color3.fromRGB(193, 193, 193)
			Re.BorderSizePixel = 0
			Re.Position = UDim2.new(0.730593622, 0, 0.113073282, 0)
			Re.Size = UDim2.new(0, 67, 0, 23)
			Re.ZIndex = 11
			Re.Font = Enum.Font.Cartoon
			Re.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
			Re.PlaceholderText = txt_hold or "HoldTxt"
			Re.Text = ""
			Re.TextColor3 = main_color or Color3.fromRGB(0, 170, 255)
			Re.TextScaled = true
			Re.TextSize = 14.000
			Re.TextStrokeTransparency = 0.500
			Re.TextWrapped = true
			
			Re.FocusLost:Connect(function()
				pcall(function()
					func(Re.Text)
				end)
			end)
		end

		return hoho_tab
	end
	

	SettingFrame.Name = "SettingFrame"
	SettingFrame.Parent = DevGui
	SettingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SettingFrame.Position = UDim2.new(0.599137962, 0, 0.257080615, 0)
	SettingFrame.Size = UDim2.new(0, 241, 0, 258)
	SettingFrame.Visible = false
	local UIGradient = Instance.new("UIGradient")

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 85, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 255, 255))}
	UIGradient.Rotation = 30
	UIGradient.Parent = SettingFrame
	hoho:DraggingEnabled(SettingFrame)


	UICornerZ.Name = "UICornerZ"
	UICornerZ.Parent = SettingFrame

	GameNameZ.Name = "GameName"
	GameNameZ.Parent = SettingFrame
	GameNameZ.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GameNameZ.BackgroundTransparency = 1.000
	GameNameZ.BorderSizePixel = 0
	GameNameZ.Position = UDim2.new(0.0457925312, 0, 0.0316279083, 0)
	GameNameZ.Size = UDim2.new(0, 123, 0, 23)
	GameNameZ.ZIndex = 4
	GameNameZ.Font = Enum.Font.Cartoon
	GameNameZ.Text = "Setting"
	GameNameZ.TextColor3 = Color3.fromRGB(255, 170, 0)
	GameNameZ.TextScaled = true
	GameNameZ.TextSize = 14.000
	GameNameZ.TextStrokeTransparency = 0.100
	GameNameZ.TextWrapped = true
	GameNameZ.TextXAlignment = Enum.TextXAlignment.Left

	LamMo.Name = "LamMo"
	LamMo.Parent = SettingFrame
	LamMo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	LamMo.BackgroundTransparency = 0.500
	LamMo.BorderSizePixel = 0
	LamMo.Position = UDim2.new(0, 0, 0.0316279195, 0)
	LamMo.Size = UDim2.new(0, 241, 0, 22)

	videoId.Name = "videoId"
	videoId.Parent = SettingFrame
	videoId.BackgroundColor3 = Color3.fromRGB(193, 193, 193)
	videoId.BorderSizePixel = 0
	videoId.Position = UDim2.new(0.10818696, 0, 0.144081056, 0)
	videoId.Size = UDim2.new(0, 188, 0, 23)
	videoId.ZIndex = 11
	videoId.Font = Enum.Font.Cartoon
	videoId.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
	videoId.PlaceholderText = "ID Video"
	videoId.Text = HoHo_Video_Id or ""
	videoId.TextColor3 = main_color or Color3.fromRGB(0, 255, 127)
	videoId.TextScaled = true
	videoId.TextSize = 14.000
	videoId.TextStrokeTransparency = 0.500
	videoId.TextWrapped = true
	videoId.FocusLost:Connect(function()
		HoHo_Video_Id = videoId.Text
		VideoBackground.Video = "rbxassetid://"..HoHo_Video_Id
	end)
	
	ToggVideo.Name = "ToggVideo"
	ToggVideo.Parent = SettingFrame
	ToggVideo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggVideo.Position = UDim2.new(0.773261726, 0, 0.292151153, 0)
	ToggVideo.Size = UDim2.new(0, 19, 0, 18)
	ToggVideo.ZIndex = 7
	ToggVideo.Font = Enum.Font.SourceSans
	ToggVideo.Text = ""
	ToggVideo.TextColor3 = Color3.fromRGB(0, 0, 0)
	ToggVideo.TextSize = 14.000
	if HoHo_Video_Display == "true" then
		ToggVideo.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
	end
	
	
	ToggVideo.MouseButton1Click:Connect(function()
		if HoHo_Video_Display == "true" then
			HoHo_Video_Display = ""
			ripple(ToggVideo, mouse.X, mouse.Y)
			ToggVideo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			VideoBackground.Visible = false
			BlackBackground.BackgroundTransparency = 0
		else
			HoHo_Video_Display = "true"
			ripple(ToggVideo, mouse.X, mouse.Y)
			ToggVideo.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
			VideoBackground.Visible = true
			BlackBackground.BackgroundTransparency = 0.9
		end
	end)

	UICornerz.Name = "UICornerz"
	UICornerz.Parent = ToggVideo

	VideoText.Name = "VideoText"
	VideoText.Parent = SettingFrame
	VideoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	VideoText.BackgroundTransparency = 1.000
	VideoText.BorderSizePixel = 0
	VideoText.Position = UDim2.new(0.107262067, 0, 0.283615947, 0)
	VideoText.Size = UDim2.new(0, 188, 0, 24)
	VideoText.ZIndex = 4
	VideoText.Font = Enum.Font.Cartoon
	VideoText.Text = "  Video Background:"
	VideoText.TextColor3 = main_color or Color3.fromRGB(0, 255, 127)
	VideoText.TextSize = 19.000
	VideoText.TextStrokeTransparency = 0.100
	VideoText.TextTransparency = 0.100
	VideoText.TextWrapped = true
	VideoText.TextXAlignment = Enum.TextXAlignment.Left
	local uistroke = Instance.new("UIStroke")
	uistroke.Name = "stroke"
	uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uistroke.Color = Color3.new(1, 1, 1)
	uistroke.LineJoinMode = Enum.LineJoinMode.Round
	uistroke.Thickness = 2
	uistroke.Parent = VideoText

	UICornerc.CornerRadius = UDim.new(0, 5)
	UICornerc.Name = "UICornerc"
	UICornerc.Parent = VideoText

	ToggleFastLoad.Name = "ToggleFastLoad"
	ToggleFastLoad.Parent = SettingFrame
	ToggleFastLoad.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ToggleFastLoad.Position = UDim2.new(0.773261726, 0, 0.427810073, 0)
	ToggleFastLoad.Size = UDim2.new(0, 19, 0, 18)
	ToggleFastLoad.ZIndex = 7
	ToggleFastLoad.Font = Enum.Font.SourceSans
	ToggleFastLoad.Text = ""
	ToggleFastLoad.TextColor3 = Color3.fromRGB(0, 0, 0)
	ToggleFastLoad.TextSize = 14.000
	if HoHo_Tog_Fast == "true" then
		ToggleFastLoad.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
	end

	
	ToggleFastLoad.MouseButton1Click:Connect(function()
		if HoHo_Tog_Fast == "true" then
			HoHo_Tog_Fast = ""
			ripple(ToggleFastLoad, mouse.X, mouse.Y)
			ToggleFastLoad.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		else
			HoHo_Tog_Fast = "true"
			ripple(ToggleFastLoad, mouse.X, mouse.Y)
			ToggleFastLoad.BackgroundColor3 = main_color or Color3.fromRGB(0, 255, 127)
		end
	end)

	UICornerx.Name = "UICornerx"
	UICornerx.Parent = ToggleFastLoad

	FastLoadText.Name = "FastLoadText"
	FastLoadText.Parent = SettingFrame
	FastLoadText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	FastLoadText.BackgroundTransparency = 1.000
	FastLoadText.BorderSizePixel = 0
	FastLoadText.Position = UDim2.new(0.107262067, 0, 0.419274867, 0)
	FastLoadText.Size = UDim2.new(0, 188, 0, 24)
	FastLoadText.ZIndex = 4
	FastLoadText.Font = Enum.Font.Cartoon
	FastLoadText.Text = "  Fast Load (PC):"
	FastLoadText.TextColor3 = main_color or Color3.fromRGB(0, 255, 127)
	FastLoadText.TextSize = 19.000
	FastLoadText.TextStrokeTransparency = 0.100
	FastLoadText.TextTransparency = 0.100
	FastLoadText.TextWrapped = true
	FastLoadText.TextXAlignment = Enum.TextXAlignment.Left
	local uistroke = Instance.new("UIStroke")
	uistroke.Name = "stroke"
	uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	uistroke.Color = Color3.new(1, 1, 1)
	uistroke.LineJoinMode = Enum.LineJoinMode.Round
	uistroke.Thickness = 2
	uistroke.Parent = FastLoadText

	UICornerd.CornerRadius = UDim.new(0, 5)
	UICornerd.Name = "UICornerd"
	UICornerd.Parent = FastLoadText
	
	local UIS = game:GetService("UserInputService")
	local GuiService = game:GetService("GuiService")

	if UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled
		and not UIS.GamepadEnabled and not GuiService:IsTenFootInterface() then
		
	end
	return hoho_wind
end
_G.hoho = hoho
return hoho
