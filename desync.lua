local function hasRaknet()
    return (typeof(raknet) == "table")
        and (typeof(raknet.add_send_hook) == "function")
        and (typeof(raknet.add_receive_hook) == "function")
end

if hasRaknet() then
    print("Raknet support detected")
    
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/scripts/desync.lua", true))()
    end)

    if not success then
        warn("Failed to load desync script:", err)
    end
else
    warn("Raknet not supported on this executor")
end