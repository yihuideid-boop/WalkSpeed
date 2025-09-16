local plr = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local playerGui = plr:WaitForChild("PlayerGui")

-- 更新用のHumanoid
local humanoid

local function updateHumanoid()
	local character = plr.Character or plr.CharacterAdded:Wait()
	humanoid = character:WaitForChild("Humanoid")
end

updateHumanoid()

plr.CharacterAdded:Connect(function()
	updateHumanoid()
end)

--ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SpeedGui"
ScreenGui.Parent = playerGui

--Frame
local Frame = Instance.new("Frame")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 372, 0, 230)
Frame.Position = UDim2.new(0.31, 0, 0.281, 0)
Frame.Visible = false

-- +1 ボタン
local TextButton = Instance.new("TextButton")
TextButton.Parent = Frame
TextButton.Size = UDim2.new(0.4, 0, 0.3, 0)
TextButton.Position = UDim2.new(0.05, 0, 0.2, 0)
TextButton.Text = "+1"
TextButton.BackgroundColor3 = Color3.new(0.482353, 1, 0)
TextButton.MouseButton1Click:Connect(function()
	if humanoid and humanoid.WalkSpeed < 100 then
		humanoid.WalkSpeed += 1
	end
end)

-- -1 ボタン
local BackTextButton = Instance.new("TextButton")
BackTextButton.Parent = Frame
BackTextButton.Size = UDim2.new(0.4, 0, 0.3, 0)
BackTextButton.Position = UDim2.new(0.55, 0, 0.2, 0)
BackTextButton.Text = "-1"
BackTextButton.BackgroundColor3 = Color3.new(1, 0, 0)
BackTextButton.MouseButton1Click:Connect(function()
	if humanoid and humanoid.WalkSpeed > 1 then
		humanoid.WalkSpeed -= 1
	end
end)

-- Fキーで表示切替
UIS.InputBegan:Connect(function(input, processed)
	if processed then return end
	if input.KeyCode == Enum.KeyCode.L then
		Frame.Visible = not Frame.Visible
	end
end)
