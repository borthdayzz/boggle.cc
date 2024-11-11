local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/mobilesupport.lua"))()

    local Window = Library.CreateLib("Destruction Sim - starhook.solutions", "DarkTheme")
    local Main = Window:NewTab("Main")
    local MainSection = Main:NewSection("Main")

    MainSection:NewButton("Loop Dupe Coins and Level", "Dupes coins and levels.", function()
        while true do
            game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)
            game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
            wait()
            end    
    end)

    MainSection:NewButton("Loop Dupe Level", "Loop Dupes Levels.", function()
        while true do
            game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Levels", 480, 10)
            wait()
            end  
    end)

    MainSection:NewButton("Loop Dupe Coins", "Loop Dupes Coins.", function()
        while true do
            game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer("Coins", 480, 99999999)        
            wait()
            end
    end)

MainSection:NewButton("No cooldown", "No cooldown for guns and bomb", function()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    require(v.Stats).Cooldown = 0
    end
end)

    -- Boosts

    local Boosts = Window:NewTab("Boosts")
    local BoostsSection = Boosts:NewSection("Boosts")

    BoostsSection:NewButton("Inf BrickBoost", "Inf BrickBoost.", function()
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("generateBoost"):FireServer("BrickBoost", 999999999999999999, 2)
    end)

    BoostsSection:NewButton("Inf XPBoost", "Inf XPBoost.", function()
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("generateBoost"):FireServer("XPBoost", 999999999999999999, 2)
    end)

    BoostsSection:NewButton("Inf CoinBoost", "Inf CoinBoost.", function()
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("generateBoost"):FireServer("CoinBoost", 999999999999999999, 2)
    end)

    BoostsSection:NewButton("Inf SuperJump", "Inf SuperJump.", function()
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("generateBoost"):FireServer("SuperJump", 999999999999999999, 2)
    end)

    BoostsSection:NewButton("Inf Extra Speed", "Inf Extra Speed.", function()
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("generateBoost"):FireServer("ExtraSpeed", 999999999999999999, 2)
    end)

    -- Useless

    local Useless = Window:NewTab("Useless")
    local UselessSection = Useless:NewSection("Useless")

    UselessSection:NewButton("Sell Bricks", "Sells Bricks without tp'ing.", function()
        game:GetService("ReplicatedStorage").Remotes.sellBricks:FireServer()
    end)

    UselessSection:NewButton("Rank Up", "Ranks Up.", function()
        game:GetService("ReplicatedStorage").Remotes.rankUp:FireServer()
    end)