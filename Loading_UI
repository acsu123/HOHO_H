spawn(function()
	if game.CoreGui:FindFirstChild("Hoho_Hub") then game.CoreGui:FindFirstChild("Hoho_Hub"):Destroy() end
end)
function pe_Button()
local ui = Instance.new("ScreenGui")
ui.Name = "Toggle HOHO"
ui.Parent = game.CoreGui
ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local OPENCLOSE = Instance.new("TextButton")
OPENCLOSE.Name = "Button"
OPENCLOSE.Parent = ui
OPENCLOSE.BackgroundColor3 = Color3.fromRGB(0, 0, 102)
OPENCLOSE.BorderSizePixel = 0
OPENCLOSE.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
OPENCLOSE.Size = UDim2.new(0.0447916649, 0, 0.0845824406, 0)
OPENCLOSE.Text = "Toggle"
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
end
if game.PlaceId == 7449423635 or game.PlaceId == 2753915549 or game.PlaceId == 4442272183 then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/bloxfruitracvcl.lua", true))()
end
if game.PlaceId == 4520749081 or game.PlaceId == 6381829480 or game.PlaceId == 5931540094 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/KingPiece.lua'))()
end
if game.PlaceId == 1240123653 or game.PlaceId == 1632210982 then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/ZombieAtack.lua'))()
end
if game.PlaceId == 6284583030 then
	if not game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").KeyboardEnabled == false then
		loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/PetSim10.lua'))()
	else
		loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/PetXfolder/PetSimXMobile.lua'))()
	end
end
if workspace:FindFirstChild('.Ignore') then
	loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/elementBattlegr.lua'))()
end
repeat wait() until game.CoreGui:FindFirstChild("Hoho_Hub")
pe_Button()
game:GetService("UserInputService").InputBegan:Connect(function(input, chat)
	if not chat and input.KeyCode == Enum.KeyCode.RightControl then
		pcall(function()
			game.CoreGui:FindFirstChild("Hoho_Hub").Enabled = not game.CoreGui:FindFirstChild("Hoho_Hub").Enabled
		end)
	end
end)
