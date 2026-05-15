local function hasRaknet()
    return (typeof(raknet) == "table")
        and (typeof(raknet.add_send_hook) == "function")
end

local function showWarningUI(message)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "RaknetWarning"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 380, 0, 110)
    frame.Position = UDim2.new(0.5, -190, 0, 20)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local accent = Instance.new("Frame")
    accent.Size = UDim2.new(0, 4, 1, 0)
    accent.Position = UDim2.new(0, 0, 0, 0)
    accent.BackgroundColor3 = Color3.fromRGB(255, 180, 0)
    accent.BorderSizePixel = 0
    accent.Parent = frame

    local accentCorner = Instance.new("UICorner")
    accentCorner.CornerRadius = UDim.new(0, 8)
    accentCorner.Parent = accent

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -60, 0, 28)
    title.Position = UDim2.new(0, 16, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "⚠  Raknet Not Supported"
    title.TextColor3 = Color3.fromRGB(255, 180, 0)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Font = Enum.Font.GothamBold
    title.TextSize = 15
    title.Parent = frame

    local body = Instance.new("TextLabel")
    body.Size = UDim2.new(1, -24, 0, 46)
    body.Position = UDim2.new(0, 16, 0, 38)
    body.BackgroundTransparency = 1
    body.Text = message
    body.TextColor3 = Color3.fromRGB(200, 200, 200)
    body.TextXAlignment = Enum.TextXAlignment.Left
    body.TextWrapped = true
    body.Font = Enum.Font.Gotham
    body.TextSize = 13
    body.Parent = frame

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 28, 0, 28)
    closeBtn.Position = UDim2.new(1, -36, 0, 8)
    closeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    closeBtn.Text = "✕"
    closeBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 13
    closeBtn.BorderSizePixel = 0
    closeBtn.Parent = frame

    local closeBtnCorner = Instance.new("UICorner")
    closeBtnCorner.CornerRadius = UDim.new(0, 6)
    closeBtnCorner.Parent = closeBtn

    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    task.delay(6, function()
        if screenGui and screenGui.Parent then
            screenGui:Destroy()
        end
    end)

    screenGui.Parent = game:GetService("CoreGui")
end

if hasRaknet() then
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/borthdayzz/boggle.cc/refs/heads/main/scripts/desync.lua", true))()
    end)

    if not success then
        showWarningUI("Failed to load script:\n" .. tostring(err))
    end
else
    showWarningUI("Raknet is not supported on your executor.\nEnable Raknet in your executor's settings and try again.")
end