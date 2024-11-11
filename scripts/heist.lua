local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/mobilesupport.lua"))()
local Window = Library.CreateLib("Heist Tycoon - boggle.cc", "DarkTheme")
local Main = Window:NewTab("Main")

local MainSection = Main:NewSection("Main")

MainSection:NewButton("Inf Yield", "Executes Inf Yield", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local PayIncomeToggle = MainSection:NewToggle("Auto Pay Income", "Automatically pays income", function(state)
    if state then
        PayIncomeLoop()
    else
        StopPayIncomeLoop()
    end
end)

local JumpToggle = MainSection:NewToggle("Infinite Jump", "inf jump thing", function(state)
    if state then
            StartInfiniteJump()
        else
            StopInfiniteJump()
        end
end)

local payingIncomeEnabled = false
local jumpingEnabled = false

function PayIncomeLoop()
    payingIncomeEnabled = true
    while payingIncomeEnabled do
        local args = {
            [1] = game:GetService("Players").LocalPlayer
        }
        game:GetService("ReplicatedStorage").Knit.Services.TycoonService.RF.PayIncome:InvokeServer(unpack(args))
        wait(0.1)
    end
end

function StopPayIncomeLoop()
    payingIncomeEnabled = false
end

function StartInfiniteJump()
    jumpingEnabled = true
        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
end

function StopInfiniteJump()
    jumpingEnabled = false
end