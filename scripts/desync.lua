if getgenv().PacketHookLoaded then return end
getgenv().PacketHookLoaded = true

local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer
local ti = TweenInfo.new(0.18, Enum.EasingStyle.Quad)

local C = {
    bg       = Color3.fromRGB(15, 15, 23),
    panel    = Color3.fromRGB(26, 26, 44),
    border   = Color3.fromRGB(42, 42, 61),
    dimText  = Color3.fromRGB(85, 85, 106),
    text     = Color3.fromRGB(200, 200, 224),
    offBtn   = Color3.fromRGB(26, 26, 44),
    offBtnBd = Color3.fromRGB(37, 37, 56),
    green    = Color3.fromRGB(61, 224, 138),
    greenDim = Color3.fromRGB(30, 94, 56),
    greenBg  = Color3.fromRGB(13, 43, 26),
    greenHdr = Color3.fromRGB(154, 232, 192),
    blue     = Color3.fromRGB(80, 160, 255),
    blueDim  = Color3.fromRGB(30, 60, 120),
    blueBg   = Color3.fromRGB(13, 25, 50),
    orange   = Color3.fromRGB(255, 160, 60),
    orangeDim= Color3.fromRGB(100, 60, 20),
    orangeBg = Color3.fromRGB(35, 20, 10),
}

local R6 = {
    { "Head",      Vector3.new(2, 1, 1),   CFrame.new(0,  1.5, 0) },
    { "Torso",     Vector3.new(2, 2, 1),   CFrame.new(0,  0,   0) },
    { "Left Arm",  Vector3.new(1, 2, 1),   CFrame.new(-1.5, 0, 0) },
    { "Right Arm", Vector3.new(1, 2, 1),   CFrame.new( 1.5, 0, 0) },
    { "Left Leg",  Vector3.new(1, 2, 1),   CFrame.new(-0.5,-2, 0) },
    { "Right Leg", Vector3.new(1, 2, 1),   CFrame.new( 0.5,-2, 0) },
}

local ghostFolder = Instance.new("Folder", workspace)
ghostFolder.Name = "_PHGhost"

local ghostParts = {}
local serverBoxes = {}

for _, data in ipairs(R6) do
    local p = Instance.new("Part", ghostFolder)
    p.Name = "Ghost_" .. data[1]
    p.Size = data[2]
    p.Anchored = true
    p.CanCollide = false
    p.CastShadow = false
    p.Transparency = 1
    p.Parent = ghostFolder
    table.insert(ghostParts, { part = p, offset = data[3] })

    local sb = Instance.new("SelectionBox", ghostFolder)
    sb.Color3 = C.orange
    sb.LineThickness = 0.04
    sb.SurfaceTransparency = 0.82
    sb.SurfaceColor3 = C.orange
    sb.Adornee = p
    sb.Visible = false
    table.insert(serverBoxes, sb)
end

local serverBill = Instance.new("BillboardGui", ghostFolder)
serverBill.Adornee = ghostParts[2].part
serverBill.Size = UDim2.new(0, 72, 0, 20)
serverBill.StudsOffset = Vector3.new(0, 3, 0)
serverBill.AlwaysOnTop = true
serverBill.Enabled = false

local serverBillLbl = Instance.new("TextLabel", serverBill)
serverBillLbl.Size = UDim2.new(1, 0, 1, 0)
serverBillLbl.BackgroundColor3 = Color3.fromRGB(50, 22, 5)
serverBillLbl.BackgroundTransparency = 0.25
serverBillLbl.Text = "SERVER"
serverBillLbl.TextColor3 = C.orange
serverBillLbl.Font = Enum.Font.GothamBold
serverBillLbl.TextSize = 11
Instance.new("UICorner", serverBillLbl).CornerRadius = UDim.new(0, 4)

local clientBoxes = {}
local clientBill = Instance.new("BillboardGui", workspace)
clientBill.Size = UDim2.new(0, 72, 0, 20)
clientBill.StudsOffset = Vector3.new(0, 3.5, 0)
clientBill.AlwaysOnTop = true
clientBill.Enabled = false

local clientBillLbl = Instance.new("TextLabel", clientBill)
clientBillLbl.Size = UDim2.new(1, 0, 1, 0)
clientBillLbl.BackgroundColor3 = Color3.fromRGB(5, 18, 45)
clientBillLbl.BackgroundTransparency = 0.25
clientBillLbl.Text = "CLIENT"
clientBillLbl.TextColor3 = C.blue
clientBillLbl.Font = Enum.Font.GothamBold
clientBillLbl.TextSize = 11
Instance.new("UICorner", clientBillLbl).CornerRadius = UDim.new(0, 4)

local function clearClientBoxes()
    for _, b in ipairs(clientBoxes) do b:Destroy() end
    clientBoxes = {}
end

local function attachClientESP(char)
    clearClientBoxes()
    local head = char:FindFirstChild("Head")
    if head then clientBill.Adornee = head end
    for _, partName in ipairs({"Head","Torso","Left Arm","Right Arm","Left Leg","Right Leg"}) do
        local part = char:FindFirstChild(partName)
        if part then
            local cb = Instance.new("SelectionBox", workspace)
            cb.Color3 = C.blue
            cb.LineThickness = 0.04
            cb.SurfaceTransparency = 0.85
            cb.SurfaceColor3 = C.blue
            cb.Adornee = part
            cb.Visible = false
            table.insert(clientBoxes, cb)
        end
    end
end

local function setESPVisible(v)
    for _, sb in ipairs(serverBoxes) do sb.Visible = v end
    for _, cb in ipairs(clientBoxes) do cb.Visible = v end
    serverBill.Enabled = v
    clientBill.Enabled = v
end

lp.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    attachClientESP(char)
end)
if lp.Character then attachClientESP(lp.Character) end

local frozenCFrame = nil

local function snapshotServerPos()
    local char = lp.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    frozenCFrame = hrp.CFrame
    for _, g in ipairs(ghostParts) do
        g.part.CFrame = frozenCFrame * g.offset
    end
end

local sg = Instance.new("ScreenGui", game:GetService("CoreGui"))
sg.ResetOnSpawn = false
sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 230, 0, 130)
main.Position = UDim2.new(0.5, -115, 0.5, -65)
main.BackgroundColor3 = C.bg
main.BorderSizePixel = 0
main.ClipsDescendants = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 14)
local mainStroke = Instance.new("UIStroke", main)
mainStroke.Color = C.border
mainStroke.Thickness = 1

local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 38)
header.BackgroundColor3 = C.bg
header.BorderSizePixel = 0

local iconBox = Instance.new("Frame", header)
iconBox.Size = UDim2.new(0, 24, 0, 24)
iconBox.Position = UDim2.new(0, 12, 0.5, -12)
iconBox.BackgroundColor3 = C.panel
iconBox.BorderSizePixel = 0
Instance.new("UICorner", iconBox).CornerRadius = UDim.new(0, 6)
local iconStroke = Instance.new("UIStroke", iconBox)
iconStroke.Color = C.border
iconStroke.Thickness = 1

local iconDot = Instance.new("Frame", iconBox)
iconDot.Size = UDim2.new(0, 8, 0, 8)
iconDot.Position = UDim2.new(0.5, -4, 0.5, -4)
iconDot.BackgroundColor3 = C.dimText
iconDot.BorderSizePixel = 0
Instance.new("UICorner", iconDot).CornerRadius = UDim.new(1, 0)

local titleLbl = Instance.new("TextLabel", header)
titleLbl.Size = UDim2.new(1, -90, 1, 0)
titleLbl.Position = UDim2.new(0, 44, 0, 0)
titleLbl.BackgroundTransparency = 1
titleLbl.Text = "Desync"
titleLbl.TextColor3 = C.text
titleLbl.Font = Enum.Font.GothamBold
titleLbl.TextSize = 12
titleLbl.TextXAlignment = Enum.TextXAlignment.Left

local kbBox = Instance.new("Frame", header)
kbBox.Size = UDim2.new(0, 22, 0, 16)
kbBox.Position = UDim2.new(1, -34, 0.5, -8)
kbBox.BackgroundColor3 = C.panel
kbBox.BorderSizePixel = 0
Instance.new("UICorner", kbBox).CornerRadius = UDim.new(0, 4)
Instance.new("UIStroke", kbBox).Color = C.border
local kbLbl = Instance.new("TextLabel", kbBox)
kbLbl.Size = UDim2.new(1, 0, 1, 0)
kbLbl.BackgroundTransparency = 1
kbLbl.Text = "K"
kbLbl.TextColor3 = C.dimText
kbLbl.Font = Enum.Font.GothamBold
kbLbl.TextSize = 10

local hdivider = Instance.new("Frame", main)
hdivider.Size = UDim2.new(1, 0, 0, 1)
hdivider.Position = UDim2.new(0, 0, 0, 38)
hdivider.BackgroundColor3 = C.border
hdivider.BorderSizePixel = 0

local body = Instance.new("Frame", main)
body.Size = UDim2.new(1, -24, 0, 80)
body.Position = UDim2.new(0, 12, 0, 44)
body.BackgroundTransparency = 1

local statusRow = Instance.new("Frame", body)
statusRow.Size = UDim2.new(1, 0, 0, 20)
statusRow.BackgroundTransparency = 1

local statusKey = Instance.new("TextLabel", statusRow)
statusKey.Size = UDim2.new(0.5, 0, 1, 0)
statusKey.BackgroundTransparency = 1
statusKey.Text = "Status"
statusKey.TextColor3 = C.dimText
statusKey.Font = Enum.Font.Gotham
statusKey.TextSize = 11
statusKey.TextXAlignment = Enum.TextXAlignment.Left

local pillBg = Instance.new("Frame", statusRow)
pillBg.Size = UDim2.new(0, 68, 0, 18)
pillBg.Position = UDim2.new(1, -68, 0.5, -9)
pillBg.BackgroundColor3 = C.panel
pillBg.BorderSizePixel = 0
Instance.new("UICorner", pillBg).CornerRadius = UDim.new(1, 0)
local pillStroke = Instance.new("UIStroke", pillBg)
pillStroke.Color = C.border
pillStroke.Thickness = 1

local pillDot = Instance.new("Frame", pillBg)
pillDot.Size = UDim2.new(0, 5, 0, 5)
pillDot.Position = UDim2.new(0, 9, 0.5, -2.5)
pillDot.BackgroundColor3 = C.dimText
pillDot.BorderSizePixel = 0
Instance.new("UICorner", pillDot).CornerRadius = UDim.new(1, 0)

local pillText = Instance.new("TextLabel", pillBg)
pillText.Size = UDim2.new(1, -20, 1, 0)
pillText.Position = UDim2.new(0, 18, 0, 0)
pillText.BackgroundTransparency = 1
pillText.Text = "Inactive"
pillText.TextColor3 = C.dimText
pillText.Font = Enum.Font.GothamBold
pillText.TextSize = 10

local toggleBtn = Instance.new("TextButton", body)
toggleBtn.Size = UDim2.new(1, 0, 0, 30)
toggleBtn.Position = UDim2.new(0, 0, 0, 26)
toggleBtn.BackgroundColor3 = C.offBtn
toggleBtn.BorderSizePixel = 0
toggleBtn.Text = ""
toggleBtn.AutoButtonColor = false
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 8)
local btnStroke = Instance.new("UIStroke", toggleBtn)
btnStroke.Color = C.offBtnBd
btnStroke.Thickness = 1

local btnLabel = Instance.new("TextLabel", toggleBtn)
btnLabel.Size = UDim2.new(1, -30, 1, 0)
btnLabel.Position = UDim2.new(0, 12, 0, 0)
btnLabel.BackgroundTransparency = 1
btnLabel.Text = "Enable desync"
btnLabel.TextColor3 = C.dimText
btnLabel.Font = Enum.Font.GothamBold
btnLabel.TextSize = 12
btnLabel.TextXAlignment = Enum.TextXAlignment.Left

local btnArrow = Instance.new("TextLabel", toggleBtn)
btnArrow.Size = UDim2.new(0, 20, 1, 0)
btnArrow.Position = UDim2.new(1, -24, 0, 0)
btnArrow.BackgroundTransparency = 1
btnArrow.Text = "›"
btnArrow.TextColor3 = C.dimText
btnArrow.Font = Enum.Font.GothamBold
btnArrow.TextSize = 16

local fdivider = Instance.new("Frame", body)
fdivider.Size = UDim2.new(1, 0, 0, 1)
fdivider.Position = UDim2.new(0, 0, 0, 62)
fdivider.BackgroundColor3 = C.border
fdivider.BorderSizePixel = 0

local pktLabel = Instance.new("TextLabel", body)
pktLabel.Size = UDim2.new(0.5, 0, 0, 14)
pktLabel.Position = UDim2.new(0, 0, 0, 67)
pktLabel.BackgroundTransparency = 1
pktLabel.Text = "Target packet"
pktLabel.TextColor3 = Color3.fromRGB(58, 58, 80)
pktLabel.Font = Enum.Font.Gotham
pktLabel.TextSize = 10
pktLabel.TextXAlignment = Enum.TextXAlignment.Left

local pktVal = Instance.new("TextLabel", body)
pktVal.Size = UDim2.new(0.5, 0, 0, 14)
pktVal.Position = UDim2.new(0.5, 0, 0, 67)
pktVal.BackgroundTransparency = 1
pktVal.Text = "0x1B"
pktVal.TextColor3 = Color3.fromRGB(68, 68, 106)
pktVal.Font = Enum.Font.GothamBold
pktVal.TextSize = 10
pktVal.TextXAlignment = Enum.TextXAlignment.Right

local charPanel = Instance.new("Frame", sg)
charPanel.Size = UDim2.new(0, 260, 0, 148)
charPanel.Position = UDim2.new(0.5, -130, 0.5, 80)
charPanel.BackgroundColor3 = C.bg
charPanel.BorderSizePixel = 0
charPanel.Visible = false
Instance.new("UICorner", charPanel).CornerRadius = UDim.new(0, 14)
local cpStroke = Instance.new("UIStroke", charPanel)
cpStroke.Color = C.border
cpStroke.Thickness = 1

local cpHeader = Instance.new("Frame", charPanel)
cpHeader.Size = UDim2.new(1, 0, 0, 32)
cpHeader.BackgroundColor3 = C.bg
cpHeader.BorderSizePixel = 0

local cpTitle = Instance.new("TextLabel", cpHeader)
cpTitle.Size = UDim2.new(1, -16, 1, 0)
cpTitle.Position = UDim2.new(0, 12, 0, 0)
cpTitle.BackgroundTransparency = 1
cpTitle.Text = "Character Delta"
cpTitle.TextColor3 = C.dimText
cpTitle.Font = Enum.Font.GothamBold
cpTitle.TextSize = 11
cpTitle.TextXAlignment = Enum.TextXAlignment.Left

local cpDivLine = Instance.new("Frame", charPanel)
cpDivLine.Size = UDim2.new(1, 0, 0, 1)
cpDivLine.Position = UDim2.new(0, 0, 0, 32)
cpDivLine.BackgroundColor3 = C.border
cpDivLine.BorderSizePixel = 0

local function makeCard(parent, xPos, color, bgColor, borderColor, label)
    local card = Instance.new("Frame", parent)
    card.Size = UDim2.new(0, 112, 0, 96)
    card.Position = xPos
    card.BackgroundColor3 = bgColor
    card.BorderSizePixel = 0
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 10)
    local cs = Instance.new("UIStroke", card)
    cs.Color = borderColor
    cs.Thickness = 1

    local lbl = Instance.new("TextLabel", card)
    lbl.Size = UDim2.new(1, 0, 0, 18)
    lbl.Position = UDim2.new(0, 0, 0, 8)
    lbl.BackgroundTransparency = 1
    lbl.Text = label
    lbl.TextColor3 = color
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 10

    local rows = {}
    for i, axis in ipairs({"X","Y","Z"}) do
        local row = Instance.new("Frame", card)
        row.Size = UDim2.new(1, -16, 0, 16)
        row.Position = UDim2.new(0, 8, 0, 26 + (i-1)*22)
        row.BackgroundTransparency = 1

        local axLbl = Instance.new("TextLabel", row)
        axLbl.Size = UDim2.new(0, 12, 1, 0)
        axLbl.BackgroundTransparency = 1
        axLbl.Text = axis
        axLbl.TextColor3 = Color3.fromRGB(70, 70, 90)
        axLbl.Font = Enum.Font.GothamBold
        axLbl.TextSize = 10
        axLbl.TextXAlignment = Enum.TextXAlignment.Left

        local valLbl = Instance.new("TextLabel", row)
        valLbl.Size = UDim2.new(1, -16, 1, 0)
        valLbl.Position = UDim2.new(0, 16, 0, 0)
        valLbl.BackgroundTransparency = 1
        valLbl.Text = "0.0"
        valLbl.TextColor3 = color
        valLbl.Font = Enum.Font.GothamBold
        valLbl.TextSize = 11
        valLbl.TextXAlignment = Enum.TextXAlignment.Right

        rows[axis] = valLbl
    end
    return card, rows
end

local cpBody = Instance.new("Frame", charPanel)
cpBody.Size = UDim2.new(1, -24, 1, -40)
cpBody.Position = UDim2.new(0, 12, 0, 36)
cpBody.BackgroundTransparency = 1

local _, clientRows = makeCard(cpBody, UDim2.new(0,0,0,0), C.blue, C.blueBg, C.blueDim, "CLIENT")
local _, serverRows = makeCard(cpBody, UDim2.new(1,-112,0,0), C.orange, C.orangeBg, C.orangeDim, "SERVER")

local deltaLbl = Instance.new("TextLabel", cpBody)
deltaLbl.Size = UDim2.new(0, 24, 0, 96)
deltaLbl.Position = UDim2.new(0.5, -12, 0, 0)
deltaLbl.BackgroundTransparency = 1
deltaLbl.Text = "Δ"
deltaLbl.TextColor3 = Color3.fromRGB(50, 50, 68)
deltaLbl.Font = Enum.Font.GothamBold
deltaLbl.TextSize = 18
deltaLbl.TextYAlignment = Enum.TextYAlignment.Center

local function fmt(n) return string.format("%.1f", n) end

local function updateCharPanel()
    local char = lp.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    local cp = hrp.Position
    clientRows["X"].Text = fmt(cp.X)
    clientRows["Y"].Text = fmt(cp.Y)
    clientRows["Z"].Text = fmt(cp.Z)

    if frozenCFrame then
        local sp = frozenCFrame.Position
        serverRows["X"].Text = fmt(sp.X)
        serverRows["Y"].Text = fmt(sp.Y)
        serverRows["Z"].Text = fmt(sp.Z)
        local diff = (cp - sp).Magnitude
        cpStroke.Color = diff > 3 and C.orangeDim or C.border
    end
end

local enabled = false

local function updateUI()
    if enabled then
        snapshotServerPos()

        TweenService:Create(main, ti, {BackgroundColor3 = Color3.fromRGB(11,18,15)}):Play()
        TweenService:Create(mainStroke, ti, {Color = C.greenDim}):Play()
        TweenService:Create(header, ti, {BackgroundColor3 = Color3.fromRGB(11,18,15)}):Play()
        TweenService:Create(iconBox, ti, {BackgroundColor3 = C.greenBg}):Play()
        TweenService:Create(iconStroke, ti, {Color = C.greenDim}):Play()
        TweenService:Create(iconDot, ti, {BackgroundColor3 = C.green}):Play()
        TweenService:Create(titleLbl, ti, {TextColor3 = C.greenHdr}):Play()
        TweenService:Create(pillBg, ti, {BackgroundColor3 = C.greenBg}):Play()
        TweenService:Create(pillStroke, ti, {Color = C.greenDim}):Play()
        TweenService:Create(pillDot, ti, {BackgroundColor3 = C.green}):Play()
        TweenService:Create(pillText, ti, {TextColor3 = C.green}):Play()
        TweenService:Create(toggleBtn, ti, {BackgroundColor3 = C.greenBg}):Play()
        TweenService:Create(btnStroke, ti, {Color = C.greenDim}):Play()
        TweenService:Create(btnLabel, ti, {TextColor3 = C.green}):Play()
        TweenService:Create(btnArrow, ti, {TextColor3 = C.green}):Play()
        TweenService:Create(hdivider, ti, {BackgroundColor3 = C.greenDim}):Play()
        pillText.Text = "Active"
        btnLabel.Text = "Disable desync"
        charPanel.Visible = true
        setESPVisible(true)
    else
        frozenCFrame = nil

        TweenService:Create(main, ti, {BackgroundColor3 = C.bg}):Play()
        TweenService:Create(mainStroke, ti, {Color = C.border}):Play()
        TweenService:Create(header, ti, {BackgroundColor3 = C.bg}):Play()
        TweenService:Create(iconBox, ti, {BackgroundColor3 = C.panel}):Play()
        TweenService:Create(iconStroke, ti, {Color = C.border}):Play()
        TweenService:Create(iconDot, ti, {BackgroundColor3 = C.dimText}):Play()
        TweenService:Create(titleLbl, ti, {TextColor3 = C.text}):Play()
        TweenService:Create(pillBg, ti, {BackgroundColor3 = C.panel}):Play()
        TweenService:Create(pillStroke, ti, {Color = C.border}):Play()
        TweenService:Create(pillDot, ti, {BackgroundColor3 = C.dimText}):Play()
        TweenService:Create(pillText, ti, {TextColor3 = C.dimText}):Play()
        TweenService:Create(toggleBtn, ti, {BackgroundColor3 = C.offBtn}):Play()
        TweenService:Create(btnStroke, ti, {Color = C.offBtnBd}):Play()
        TweenService:Create(btnLabel, ti, {TextColor3 = C.dimText}):Play()
        TweenService:Create(btnArrow, ti, {TextColor3 = C.dimText}):Play()
        TweenService:Create(hdivider, ti, {BackgroundColor3 = C.border}):Play()
        pillText.Text = "Inactive"
        btnLabel.Text = "Enable desync"
        charPanel.Visible = false
        setESPVisible(false)
    end
end

toggleBtn.MouseEnter:Connect(function()
    if not enabled then TweenService:Create(toggleBtn, ti, {BackgroundColor3 = Color3.fromRGB(32,32,52)}):Play() end
end)
toggleBtn.MouseLeave:Connect(function()
    if not enabled then TweenService:Create(toggleBtn, ti, {BackgroundColor3 = C.offBtn}):Play() end
end)

toggleBtn.MouseButton1Click:Connect(function()
    enabled = not enabled
    updateUI()
end)

UIS.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.K then
        enabled = not enabled
        updateUI()
    end
end)

local dragging, dragStart, startPos = false, nil, nil
header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true; dragStart = input.Position; startPos = main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
header.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        charPanel.Position = UDim2.new(main.Position.X.Scale, main.Position.X.Offset - 15, main.Position.Y.Scale, main.Position.Y.Offset + 140)
    end
end)

RunService.Heartbeat:Connect(function()
    if not enabled then return end
    if charPanel.Visible then updateCharPanel() end
end)

-- ─── HOOK ───
raknet.add_send_hook(function(packet)
    if not enabled then return end
    if packet.PacketId ~= 0x1B then return end
    local data = packet.AsBuffer
    if data then
        buffer.writeu32(data, 1, 0xFFFFFFFF)
        packet:SetData(data)
    end
end)

updateUI()