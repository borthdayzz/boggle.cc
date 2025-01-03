local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/other/mobilesupport.lua"))()
local Window = Library.CreateLib("Money Grab Simulator - boggle.cc", "DarkTheme")

-- Main Tab
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Made by the boggle.cc Team")

MainSection:NewLabel("Inf Stuff")

MainSection:NewButton("Inf Training", "", function()
    local args = {
        [1] = math.huge
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Event"):WaitForChild("Train"):FireServer(unpack(args))
end)

MainSection:NewButton("Inf Money", "", function()
    local args = {
        [1] = math.huge
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Event"):WaitForChild("WinGain"):FireServer(unpack(args))
end)