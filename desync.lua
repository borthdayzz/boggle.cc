local function hasRaknet()
    return (typeof(raknet) == "table")
        and (typeof(raknet.add_send_hook) == "function")
end

local warning = loadstring(game:HttpGet("https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/other/warning.lua"))()

local function showWarning(body)
    warning({
        title = "Unsupported executor",
        body = body,
        site = "https://weao.gg/",
        note = "This script requires Raknet support to function properly.",
        primary = "View executors",
        secondary = "Dismiss",
        invite = "weaoxyz",
        logoUrl = "https://ancestrychanged.com/images/weaologo.png",
        logoFile = "weaologo.png",
        yields = true,
        hideOtherUis = true,
    })
end

if hasRaknet() then
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/scripts/desync.lua", true))()
    end)

    if not success then
        showWarning("Failed to load script:\n" .. tostring(err))
    end
else
    showWarning("Raknet is not supported on your executor.\nEnable Raknet in your executor's settings and try again.")
end