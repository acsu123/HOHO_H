local Flux = {RainbowColorValue = 0, HueSelectionPosition = 0}
local PresetColor = Color3.fromRGB(66, 134, 255)
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local CloseBind = Enum.KeyCode.RightControl

local list = {
    --BedWars
    [2619619496] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/GAME/main/bedwar.txt'))()",
    
    --Element Battle Ground
    [224422602] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/elementBattlegr.lua'))()",
  
    --King Legacy
    [1451439645] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/KingPiece.lua'))()",
  
    --Blox Fruit
    [994732206] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/HohoHub.lua'))()",
    
    --Pet Simulator X
    [2316994223] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/PetXfolder/PetSimXMobile.lua'))()",
    
    --Zombie Attack
    [504035427]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/ZombieAtack.lua'))()",
    
    --Two Piece
    [5303541547]="loadstring(game:HttpGet('https://raw.githubusercontent.com/AlongNgu/alonebruh/main/twoPiecehoho.lua'))()",
    
    --Dungeon Quest
    [848145103]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/Paid/DunegonQuest.lua'))()",
    
    --Tradelands
    [92096286]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/TradeLands.lua'))()",
	
    --Anime Fighters Simulator
    [2324662457]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/anime%20fighters%20simulator.lua'))()",

    --Arsenal
    [111958650]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/Arsenal.lua'))()",

    --Break In
    [1318971886]="loadstring(game:HttpGet('https://pastebin.com/raw/xUGJt9Ry', true))()",
    
    --Tower of Hell
    [703124385]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/TowerOfHell.lua'))()",
    
    --steve's one piece
    [741590026]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/SteveOnePiece.lua'))()",
    
    --Murder Mystery 2
    [66654135]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/GAME/main/muder%20mys..2.txt'))()",
    
    --Giant Survival!
    [1342991001]="loadstring(game:HttpGet('https://pastebin.com/raw/zABEESgr', true))()",
  
    --Field Trip Z
    [1701332290]="loadstring(game:HttpGet('https://pastebin.com/raw/aY7Z3Nd3', true))()",

    --Mad City
    [498490399]="loadstring(game:HttpGet('https://pastebin.com/raw/EwnNCfin', true))()",
	
    --vn piece
    [1493595237]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/vn%20Piece%20script-obfuscated.lua', true))()",

}

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
  
if list[game.GameId] ~= nil then
    if game.CoreGui:FindFirstChild("Hoho_Hub") then game.CoreGui:FindFirstChild("Hoho_Hub"):Destroy() end
    if game.CoreGui:FindFirstChild("Toggle HOHO") then game.CoreGui:FindFirstChild("Toggle HOHO"):Destroy() end
    wait()
    function pe_Button()
        local ui = Instance.new("ScreenGui")
        ui.Name = "Toggle HOHO"
        ui.Parent = game.CoreGui
        ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        
        local OPENCLOSE = Instance.new("TextButton")
        OPENCLOSE.Name = "HoHo"
        OPENCLOSE.Parent = ui
        OPENCLOSE.BackgroundColor3 = Color3.fromRGB(0, 0, 102)
        OPENCLOSE.BorderSizePixel = 0
        OPENCLOSE.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
        OPENCLOSE.Size = UDim2.new(0.0447916649, 0, 0.0845824406, 0)
        OPENCLOSE.Text = "HoHo"
        OPENCLOSE.TextColor3 = Color3.fromRGB(255, 255, 255)
        OPENCLOSE.TextScaled = true
        OPENCLOSE.TextSize = 14.000
        OPENCLOSE.TextWrapped = true
        Instance.new("UICorner",OPENCLOSE)
        OPENCLOSE.MouseButton1Click:Connect(function()
            pcall(function()
                game.CoreGui:FindFirstChild("Hoho_Hub").Enabled = not game.CoreGui:FindFirstChild("Hoho_Hub").Enabled
            end)
        end)
        MakeDraggable(OPENCLOSE,OPENCLOSE)
    end
    loadstring(list[tonumber(game.GameId)])()
    repeat wait() until game.CoreGui:FindFirstChild("Hoho_Hub")
    pe_Button()
    game:GetService("UserInputService").InputBegan:Connect(function(input, chat)
        if not chat and input.KeyCode == Enum.KeyCode.RightControl then
            pcall(function()
                game.CoreGui:FindFirstChild("Hoho_Hub").Enabled = not game.CoreGui:FindFirstChild("Hoho_Hub").Enabled
            end)
        end
    end)
else
    game.Players.LocalPlayer:Kick("game not support")
end
