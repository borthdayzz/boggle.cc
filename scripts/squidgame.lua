local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/other/mobilesupport.lua"))()
local Window = Library.CreateLib("Squid Game - boggle.cc", "DarkTheme")

-- Main Tab
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Made by the boggle.cc Team")

MainSection:NewLabel("Free Gamepass")

MainSection:NewButton("Become Frontman", "Get gamepass for free", function()
    game:GetService("ReplicatedStorage").FrontmanRemotes.BecomeFrontman:InvokeServer(true)
end)

MainSection:NewButton("Become Guard", "Get gamepass for free", function()
    game:GetService("ReplicatedStorage").GuardRemotes.BecomeGuard:InvokeServer(true)
end)

-- Red Light Green Light Tab
local RLGL = Window:NewTab("Red Light Green Light")
local RLGLSection = RLGL:NewSection("Squid Game")

RLGLSection:NewButton("Teleport to the end", "yup", function()
    local plr = game:GetService("Players").LocalPlayer
    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(16, Enum.EasingStyle.Quad)

    local function tp(x, y, z)
        local goal = {CFrame = CFrame.new(x, y, z)}
        local tween = tweenService:Create(plr.Character.HumanoidRootPart, tweenInfo, goal)
        tween:Play()
    end

    tp(-313.14785766602, 2.9999992847443, 419.82235717773)
end)

-- Cookie Game Tab
local Cookie = Window:NewTab("Cookie")
local CookieSection = Cookie:NewSection("Cookie")

CookieSection:NewButton("Auto Cut Cookie", "yup", function()
    game.ReplicatedStorage.Remotes.HoneyCombResult:FireServer(true)
    game.workspace.Camera.CameraType = Enum.CameraType.Custom
    wait(0.1)
    game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
    game.UserInputService.ModalEnabled = false
end)

-- Tug of War Tab
local TugOfWar = Window:NewTab("Tug Of War")
local TugOfWarSection = TugOfWar:NewSection("Tug Of War")

TugOfWarSection:NewToggle("Auto Pull", "Auto pulls", function(state)
    if state then
        _G.tugs = game:GetService("RunService").Heartbeat:Connect(function()
            game:GetService("ReplicatedStorage").Pull:FireServer(1)
        end)
    else
        if _G.tugs then
            _G.tugs:Disconnect()
        end
    end
end)

-- Glass Game Tab
local GlassGame = Window:NewTab("Glass Game")
local GlassGameSection = GlassGame:NewSection("Glass Game")

GlassGameSection:NewToggle("Anti break glass", "self-explanatory", function(state)
    if state then
        local box = Instance.new("Part", workspace)
        box.Name = "WeLoveKids"
        box.Anchored = true
        box.CanCollide = true
        box.Size = Vector3.new(35, 0, 333)
        box.Position = Vector3.new(-500, 75.506, -337)
        box.Transparency = 0.2
    else
        if workspace:FindFirstChild("WeLoveKids") then
            workspace.WeLoveKids:Destroy()
        end
    end
end)

GlassGameSection:NewButton("Auto win glass", "yup", function()
    local plr = game:GetService("Players").LocalPlayer
    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Quad)

    local function tp(x, y, z)
        local goal = {CFrame = CFrame.new(x, y, z)}
        local tween = tweenService:Create(plr.Character.HumanoidRootPart, tweenInfo, goal)
        tween:Play()
    end

    tp(-500.35690307617, 78.206008911133, -470.29962158203)
end)

GlassGameSection:NewButton("No fall damage", "yup", function()
    pcall(function()
        game.Workspace.Mechanics.Kill:Destroy()
        game.Workspace.Mechanics.Kill2:Destroy()
    end)
end)

-- Squid Game Tab
local SquidGame = Window:NewTab("Squid Game")
local SquidGameSection = SquidGame:NewSection("Squid Game")

SquidGameSection:NewToggle("Stay on green circle", "ToggleInfo", function(state)
    while state do
        wait()
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-314.2951354980469, 3.0858848094940186, 328.0733642578125)
    end
end)