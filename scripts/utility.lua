local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/mobilesupport.lua"))()
local Window = Library.CreateLib("Utility - boggle.cc", "DarkTheme")
local Main = Window:NewTab("Main")

-- stuff
local gamePlaceID = game.PlaceId
local plyr = game.Players.LocalPlayer
local chr = plyr.Character 

local MainSection = Main:NewSection("Main")

MainSection:NewButton("Copy game place ID", "", function()
    setclipboard(gamePlaceID)  
end)

MainSection:NewButton("Copy CFrame", "", function()
    setclipboard(("game.Players.LocalPlayer.Character:PivotTo(CFrame.new(%s))"):format(tostring(chr:GetPrimaryPartCFrame())))
end)