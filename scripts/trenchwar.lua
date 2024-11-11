local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/mobilesupport.lua"))()
local Window = Library.CreateLib("Trench War", "DarkTheme")

local hitboxTab = Window:NewTab("Features")
local hitboxSection = hitboxTab:NewSection("Trench War")

local hitboxSlider = hitboxSection:NewSlider("Hitbox Size", "Adjust the hitbox size", 60, 10, function(size)
    _G.HeadSize = size
end)

hitboxSection:NewToggle("Enable Hitbox", "Toggle hitbox on/off", function(state)
    if state then
        connection = game:GetService('RunService').RenderStepped:Connect(function()
            for _, player in ipairs(game:GetService('Players'):GetPlayers()) do
                if player.Name ~= game.Players.LocalPlayer.Name then
                    local localPlayerTeam = game.Players.LocalPlayer.Team
                    local targetPlayerTeam = player.Team

                    if localPlayerTeam ~= targetPlayerTeam then
                        pcall(function()
                            player.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
                            player.Character.HumanoidRootPart.Transparency = 0.7
                            player.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
                            player.Character.HumanoidRootPart.Material = Enum.Material.Neon
                            player.Character.HumanoidRootPart.CanCollide = false
                        end)
                    end
                end
            end
        end)
    else
        if connection then
            connection:Disconnect()
            connection = nil
        end
        for _, player in ipairs(game:GetService('Players'):GetPlayers()) do
            if player.Name ~= game.Players.LocalPlayer.Name then
                pcall(function()
                    player.Character.HumanoidRootPart.Size = Vector3.new(2, 2, 1)
                    player.Character.HumanoidRootPart.Transparency = 0
                    player.Character.HumanoidRootPart.BrickColor = BrickColor.new("Medium stone grey")
                    player.Character.HumanoidRootPart.Material = Enum.Material.Plastic
                    player.Character.HumanoidRootPart.CanCollide = true
                end)
            end
        end
    end
end)

hitboxSection:NewButton("Loop Kill All", "Loop kill all players", function()
    local player = game.Players.LocalPlayer

    coroutine.wrap(function()
        while true do
            local pistol = player.Character and player.Character:FindFirstChild("Pistol")
            if not pistol then
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Error",
                    Text = "Please equip the pistol to loop kill",
                    Icon = "rbxassetid://1234567890"
                })
                return
            end

            for _, v in ipairs(game.Players:GetPlayers()) do
                if v.Name ~= player.Name then
                    local vCharacter = v.Character
                    if vCharacter then
                        local VCH = vCharacter:FindFirstChild("Humanoid")
                        if VCH then
                            local args = {
                                [1] = VCH,
                                [2] = 100,
                                [3] = {
                                    [1] = 195.16810607910156,
                                    [2] = CFrame.new(-52.45732879638672, 103.46327209472656, 361.6676330566406) * CFrame.Angles(0, 0, 0)
                                }
                            }

                            game:GetService("Players").LocalPlayer.Character.Pistol.RemoteEvent:FireServer(unpack(args))
                        end
                    end
                end
            end
            wait()
        end
    end)()
end)
hitboxSection:NewLabel("Made by: The boggle.cc Team")

local PlayerTab = Window:NewTab("Player")
local PlayerSection = PlayerTab:NewSection("walkspeed and stuff")

PlayerSection:NewSlider("Walkspeed", "Adjust your walkspeed", 500, 0, function(speed)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
end)

PlayerSection:NewButton("ESP", "ESP", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
end)

PlayerSection:NewLabel("Teleports")
PlayerSection:NewButton("TP To Axis Flag", "Teleports you to the Axis Base", function()
	game.Players.LocalPlayer.Character:PivotTo(CFrame.new(-0.799679399, 104.685089, -766.207947, -0.290184945, -0.00655162847, -0.956948161, -1.09838256e-05, 0.999976575, -0.00684288889, 0.956970572, -0.00197520014, -0.290178239)) 
end)

PlayerSection:NewButton("TP To Allies Flag", "Teleports you to the Axis Base", function()
    game.Players.LocalPlayer.Character:PivotTo(CFrame.new(-1.49442399, 104.670158, 766.675049, -0.999624133, 0.000178899776, 0.0274153203, -8.45821069e-06, 0.999976635, -0.00683345878, -0.0274159033, -0.00683112256, -0.999600708)) 
end)
PlayerSection:NewLabel("Made by: The boggle.cc Team")