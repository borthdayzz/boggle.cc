local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/other/mobilesupport.lua"))()
local Window = Library.CreateLib("Millionaire Empire Tycoon - boggle.cc", "DarkTheme")
local Main = Window:NewTab("Main")

local MainSection = Main:NewSection("Main")

MainSection:NewToggle("Infinite Money", "Toggle for infinite money", function(state)
    if state then
        loop()
    else
        stop()
    end
end)

function loop()
    enable = true
    while enable do
        local args = {
            [1] = 999999999999999
        }
        game:GetService("ReplicatedStorage"):WaitForChild("fewjnfejwb3"):FireServer(unpack(args))
        wait()
    end
end

function stop()
    enable = false
end

MainSection:NewToggle("Rebirth", "u need a lot of money to do this", function(robux)
    if robux then
        start()
    else
        plsstop()
    end
end)

function start()
    enableut = true
    while enableut do
        local args = {
            [1] = 999999999999999
        }
        game:GetService("ReplicatedStorage"):WaitForChild("fewjnfejwb3"):FireServer(unpack(args))
        wait()
        
        wait(0.1)
        game:GetService("ReplicatedStorage").rebirthEvent:FireServer()
    end
end

function plsstop()
    enableut = false
end