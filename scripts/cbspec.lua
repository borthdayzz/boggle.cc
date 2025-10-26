local SpectatorViewer = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Spectators = Instance.new("TextLabel")
local Background = Instance.new("Frame")
local UIGradient = Instance.new("UIGradient")
local SpectColor = Instance.new("Frame")
local UIGradient_2 = Instance.new("UIGradient")
local Frame = Instance.new("Frame")
local Example = Instance.new("TextLabel")
local UIListLayout = Instance.new("UIListLayout")
local RunService = game:GetService("RunService")

SpectatorViewer.Name = "SpectatorViewer"
SpectatorViewer.Parent = game.CoreGui

Main.Name = "Main"
Main.Parent = SpectatorViewer
Main.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
Main.BackgroundTransparency = 1.000
Main.BorderColor3 = Color3.fromRGB(20, 20, 20)
Main.Position = UDim2.new(0.0078, 0, 0.4004, 0)
Main.Size = UDim2.new(0, 153, 0, 20)
Main.Visible = true

Spectators.Name = "Spectators"
Spectators.Parent = Main
Spectators.BackgroundTransparency = 1.000
Spectators.Size = UDim2.new(1, 0, 1, 0)
Spectators.ZIndex = 4
Spectators.Font = Enum.Font.RobotoMono
Spectators.Text = " Spectators"
Spectators.TextColor3 = Color3.fromRGB(255, 255, 255)
Spectators.TextSize = 15
Spectators.TextStrokeTransparency = 0
Spectators.TextXAlignment = Enum.TextXAlignment.Left

Background.Name = "Background"
Background.Parent = Main
Background.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Background.BorderColor3 = Color3.fromRGB(20, 20, 20)
Background.Size = UDim2.new(1.006, 0, 1, 0)
Background.BorderSizePixel = 0  

UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), 
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(112, 112, 112))
})
UIGradient.Rotation = 90
UIGradient.Parent = Background

SpectColor.Name = "Color"
SpectColor.Parent = Main
SpectColor.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
SpectColor.BorderSizePixel = 0
SpectColor.Position = UDim2.new(0, 1, 0, 1)
SpectColor.Size = UDim2.new(0.991, 0, 0, 2)
SpectColor.ZIndex = 2

UIGradient_2.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), 
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(60, 60, 60))
})
UIGradient_2.Rotation = 90
UIGradient_2.Parent = SpectColor

Frame.Parent = Main
Frame.BackgroundColor3 = Color3.fromRGB(7, 7, 7)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 0, 1, 0)
Frame.Size = UDim2.new(0, 153, 0, 1)

Example.Name = "Example"
Example.Parent = Frame
Example.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
Example.BorderSizePixel = 0
Example.Position = UDim2.new(0, 0, 1, 0)
Example.Size = UDim2.new(0, 156, 0, 20)
Example.Font = Enum.Font.RobotoMono
Example.Text = "Name"
Example.Visible = false
Example.TextColor3 = Color3.fromRGB(255, 255, 255)
Example.TextSize = 13
Example.TextXAlignment = Enum.TextXAlignment.Left

UIListLayout.Parent = Frame
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local function GetSpectators()
    local CurrentSpectators = {}
    local players = game:GetService("Players")

    for _, player in ipairs(players:GetPlayers()) do
        if player ~= players.LocalPlayer and not player.Character and player:FindFirstChild("CameraCF") then
            local camPosition = player.CameraCF.Value.Position
            local localCamPosition = workspace.CurrentCamera.CFrame.Position
            if (camPosition - localCamPosition).Magnitude < 10 then
                table.insert(CurrentSpectators, player)
            end
        end
    end
    return CurrentSpectators
end

local function UpdateSpectatorList()
    for _, child in ipairs(Frame:GetChildren()) do
        if child.Name ~= "Example" and not child:IsA("UIListLayout") and not child:IsA("LocalScript") then
            child:Destroy()
        end
    end

    for _, spectator in ipairs(GetSpectators()) do
        local newEntry = Example:Clone()
        newEntry.Parent = Frame
        newEntry.Visible = true
        newEntry.ZIndex = 5
        newEntry.Name = spectator.Name
        newEntry.Text = " " .. spectator.Name
        newEntry.TextSize = 13
        newEntry.Size = UDim2.new(0, 154, 0, 20)
        newEntry.Font = Enum.Font.RobotoMono
        newEntry.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        newEntry.TextColor3 = Color3.fromRGB(225, 225, 225)
        newEntry.TextStrokeTransparency = 0
    end
end

RunService.RenderStepped:Connect(UpdateSpectatorList)
