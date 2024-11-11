local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/mobilesupport.lua"))()
local Window = Library.CreateLib("Diddy Plinko - boggle.cc", "DarkTheme")
local Main = Window:NewTab("Main")

-- main thing
local MainSection = Main:NewSection("Main")

MainSection:NewButton("Get money!!!!!!!", "", function()
    local args = {
        [1] = "x100part",
        [2] = math.huge
    }

    game:GetService("ReplicatedStorage"):WaitForChild("PlinkoBallTouched"):FireServer(unpack(args))
end)

MainSection:NewButton("Rebirth", "", function()
    game:GetService("ReplicatedStorage"):WaitForChild("RebirthEvent"):FireServer()
end)

-- loop
local LoopSection = Main:NewSection("Loop")

LoopSection:NewToggle("Loop Money", "loop da money", function(state)
    if state then
        coroutine.wrap(function()
            while state do
                local args = {
                    [1] = "x100part",
                    [2] = math.huge
                }
                game:GetService("ReplicatedStorage"):WaitForChild("PlinkoBallTouched"):FireServer(unpack(args))
                wait()
            end
        end)()
    end
end)

LoopSection:NewToggle("Loop Rebirth", "looping rebirth", function(state)
    if state then
        coroutine.wrap(function()
            while state do
                game:GetService("ReplicatedStorage"):WaitForChild("RebirthEvent"):FireServer()
                wait()
            end
        end)()
    end
end)

LoopSection:NewToggle("Loop Drop", "looping drop", function(state)
    if state then
        coroutine.wrap(function()
            while state do
                local args = {
                    [1] = 9.34593543549355e+28
                }
                game:GetService("ReplicatedStorage"):WaitForChild("CheckAndDeductMoney"):InvokeServer(unpack(args))
                game:GetService("ReplicatedStorage"):WaitForChild("IncrementDropCount"):FireServer()
                wait()
            end
        end)()
    end
end)