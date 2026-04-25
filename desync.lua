local function identifyExecutor()
    if identifyexecutor then
        return identifyexecutor()
    else
        return "Unknown"
    end
end

local executors = {
    ["Volt"] = true,
    ["Madium"] = true,
    ["Potassium"] = true,
    ["Seliware"] = true,
    ["Synapse Z"] = true,
    ["MacSploit"] = true,
    ["Delta"] = true
}

local executor = identifyExecutor()

if executors[executor] then
    print("Raknet supported detected", executor)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/scripts/desync.lua", true))()
else
    warn("Unsupported or unknown executor:", executor)
end