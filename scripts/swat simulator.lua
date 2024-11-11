local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/mobilesupport.lua"))()
local Window = Library.CreateLib("Swat Simulator - boggle.cc", "DarkTheme")
local Main = Window:NewTab("Main")

local MainSection = Main:NewSection("Made by the boggle.cc Team")

MainSection:NewLabel("Free Gamepass")

MainSection:NewButton("Light Machine Gunner", "Get gamepass for free", function()
    local args = {
        [1] = "DLight Machine Gunner"
    }
    
    game:GetService("ReplicatedStorage").giveTool:FireServer(unpack(args))
end)

MainSection:NewButton("Sniper", "Get gamepass for free", function()
    local args = {
        [1] = "ESniper"
    }
    
    game:GetService("ReplicatedStorage").giveTool:FireServer(unpack(args))
end)

MainSection:NewButton("K9 Unit", "Get gamepass for free", function()
    local args = {
        [1] = "FK9 Unit"
    }
    
    game:GetService("ReplicatedStorage").giveTool:FireServer(unpack(args))
end)

MainSection:NewButton("Hacker", "Get gamepass for free", function()
    local args = {
        [1] = "GHacker"
    }
    
    game:GetService("ReplicatedStorage").giveTool:FireServer(unpack(args))
end)

MainSection:NewButton("Ballistic Shield", "Get gamepass for free", function()
    local args = {
        [1] = "HBallistic Shield"
    }
    
    game:GetService("ReplicatedStorage").giveTool:FireServer(unpack(args))
end)

MainSection:NewLabel("Free XP")

MainSection:NewButton("Inf XP", "self explanitory", function()
    local args = {
        [1] = math.huge
    }
    
    game:GetService("ReplicatedStorage").addXP:FireServer(unpack(args))
end)