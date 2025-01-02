loadstring(game:HttpGet(('https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/notification.lua'),true))()

local function identifyExecutor()
    if identifyexecutor then
        return identifyexecutor()
    else
        return "Unknown"
    end
end
-- nigga exploits
    if identifyExecutor() == "Xeno" then
        game:GetService("StarterGui"):SetCore("SendNotification",{
            Title = "Xeno",
            Text = "Xeno has limited functions and ha",
            Icon = "rbxassetid://1234567890"
        })
    else
    if identifyExecutor() == "FluxTeam" then
        game:GetService("Players").LocalPlayer:Kick("FluxTeam will not work, fake ass unc why tf would you install this shit")
    else
    end
end
   -- destruction sim
    if game.PlaceId == 2248408710 then
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/scripts/destructionsim.lua'),true))()
    -- millionaire tycoon
    elseif game.PlaceId == 6677985923 then
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/scripts/millionaire.lua'),true))()
    -- heist tycoon
    elseif game.PlaceId == 11103424163 then
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/scripts/heist.lua'),true))()
    -- Diddy Plinko
    elseif game.PlaceId == 18939066871 then
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/scripts/diddyplinko.lua'),true))()
    -- Trench War
    elseif game.PlaceId == 6654918151 then
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/scripts/trenchwar.lua'),true))()
    -- Swat Simulator
    elseif game.PlaceId == 2906554815 then
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/scripts/swat%20simulator.lua'),true))()
    -- Red Light Green Light
    elseif game.PlaceId == 7540891731 then
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/scripts/squidgame.lua'),true))()
    -- Universal
    else
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/universal.lua'),true))()
    end