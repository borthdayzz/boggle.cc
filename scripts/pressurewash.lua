local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/other/mobilesupport.lua"))()
local Window = Library.CreateLib("Pressure Wash for Brainrots - boggle.cc", "DarkTheme")

-- Main Tab
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Made by the boggle.cc Team")

MainSection:NewButton("Remove Dirty Tiles", "", function()
for _, v in pairs(game.Workspace.PowerWashTargets:GetChildren()) do
    if v:IsA("BasePart") and v.Name == "DirtyTile" then
        v:Destroy()
    end
end
end)

MainSection:NewButton("Remove VIP Zone", "", function()
for _, v in pairs(workspace:GetChildren()) do
    if v.Name == "VIP Zone" then
        v:Destroy()
    end
end
end)

MainSection:NewButton("Instant Proximity Prompt", "", function()
    game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt) prompt.HoldDuration = 0 end)
end)

-- Auto Tab
local Auto = Window:NewTab("Auto")
local AutoSection = Auto:NewSection("Made by the boggle.cc Team")


local upgradeRunning = false

AutoSection:NewToggle("Auto Upgrade", "Upgrade plots automatically", function(state)
    upgradeRunning = state

    if state then
        task.spawn(function()
            while upgradeRunning do
                for i = 1, 50 do
                    game.ReplicatedStorage.Events.PlotHandler:FireServer("Upgrade", i)
                end
                task.wait(1)
            end
        end)
    end
end)

local collectRunning = false

AutoSection:NewToggle("Auto Collect", "Collect money from plots", function(state)
    collectRunning = state

    if state then
        task.spawn(function()
            while collectRunning do
                for i = 1, 50 do
                    game.ReplicatedStorage.Events.PlotHandler:FireServer("Collect", i)
                end
                task.wait(1)
            end
        end)
    end
end)

-- Teleport Tab
local Teleport = Window:NewTab("Teleport")
local TeleportSection = Teleport:NewSection("Made by the boggle.cc Team")

TeleportSection:NewButton("Teleport to Start", "", function()
    game.Players.LocalPlayer.Character:PivotTo(CFrame.new(-12.6202078, 16.3827324, -137.874557, -0.0240905602, -2.62738027e-08, -0.999709785, -4.66932057e-08, 1, -2.5156238e-08, 0.999709785, 4.60736267e-08, -0.0240905602))
end)

TeleportSection:NewButton("Teleport to VIP Zone 1", "", function()
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(215.432755, 15.6460085, -198.853912, 0.999937415, 6.8982503e-10, -0.0111851674, -1.2246596e-09, 1, -4.78095608e-08, 0.0111851674, 4.78202686e-08, 0.999937415))
end)

TeleportSection:NewButton("Teleport to VIP Zone 2", "", function()
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(513.028137, 15.6460085, -195.535706, 0.999936342, -1.96247498e-08, -0.0112844529, 2.03497681e-08, 1, 6.41343831e-08, 0.0112844529, -6.43599307e-08, 0.999936342))
end)

TeleportSection:NewButton("Teleport to VIP Zone 3", "", function()
    game.Players.LocalPlayer.Character:PivotTo(CFrame.new(1022.96521, 15.6460085, -203.536179, 0.999078691, -9.32769737e-08, -0.0429163761, 9.01703956e-08, 1, -7.43226352e-08, 0.0429163761, 7.03843739e-08, 0.999078691))
end)

TeleportSection:NewButton("Teleport to VIP Zone 4", "", function()
game.Players.LocalPlayer.Character:PivotTo(CFrame.new(1270.03296, 15.6460085, -205.018585, 0.999997914, 2.93078783e-09, -0.00203091116, -2.87430368e-09, 1, 2.78151351e-08, 0.00203091116, -2.78092394e-08, 0.999997914))
end)