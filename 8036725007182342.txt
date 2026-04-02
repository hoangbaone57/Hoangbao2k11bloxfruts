-- Merged: Simple Arsenal Helper + follow me Luigi4k85 Mobile Final (Banana UI) + Weapon Enhancements --
-- Features: Banana GUI, Highlights ESP, Box/Name/Distance ESP (Drawing fallback),
-- Aimbot, Silent Aim, NoRecoil (best-effort), WalkSpeed lock (Movement tab),
-- Rapid Fire (FireRate mod), Fixed Infinite Ammo (auto-refill), Spread Control
-- Discord: https://discord.gg/rr8jV4e5
-- NOTE: Use private servers / alt accounts. Risk of ban exists.

-- Try load Banana UI
local Library = loadstring(game:HttpGet("https://pastefy.app/Oiw0q6ZL/raw"))()

if not Library then 
    warn("Banana UI load failed. Your executor may not support the provided URL.")
    return 
end

-- Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInput = game:GetService("UserInputService")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Utility
local function clamp(v,a,b)
    if v < a then return a
    elseif v > b then return b
    else return v end
end

local function safeRequire(m)
    local ok2, res = pcall(function() return require(m) end)
    if ok2 then return res end
    return nil
end

-- ===== State & Settings =====
local State = {
    ESP = false,
    ESP_TeamCheck = false,
    ESP_Box = false,
    ESP_Name = false,
    ESP_Distance = false,
    
    Aimbot = false,
    AimTeamCheck = false,
    SilentAim = false,
    NoRecoil = false,
    
    WalkLock = false,
    
    WeaponEnhancementsEnabled = true,
    RapidFire = false,
    InfiniteAmmo = false,
    SpreadControl = false,
}

local Settings = {
    AimFOV = 200,
    AimDist = 1200,
    AimSmooth = 25,
    
    WalkSpeed = 16,
    WalkMin = 8,
    WalkMax = 200,
    
    RapidFireRate = 0.02, -- seconds
    SpreadValue = 0,
    AmmoValue = 30, -- refill amount (avoid 999)
}

-- worker guard helper
local workers = {}
local function spawnOnce(name, fn)
    if workers[name] then return end
    workers[name] = true
    task.spawn(function()
        fn()
        workers[name] = nil
    end)
end

-- Drawing availability
local HAS_DRAWING = pcall(function() return Drawing end)

-- ===== Highlights ESP =====
local highlights = {}

local function ensureHighlightForPlayer(p)
    if highlights[p] and highlights[p].Instance and highlights[p].Instance.Parent then return end
    if not p.Character then return end
    
    local hl = Instance.new("Highlight")
    hl.Name = "LuigiESP_Highlight_" .. p.Name
    hl.Adornee = p.Character
    hl.FillColor = Color3.fromRGB(255, 100, 100)
    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
    hl.FillTransparency = 0.6
    hl.Enabled = false
    
    local success
    pcall(function() hl.Parent = game.CoreGui success = true end)
    if not success then
        pcall(function() hl.Parent = workspace end)
    end
    
    highlights[p] = {Instance = hl}
end

local function removeHighlightForPlayer(p)
    local data = highlights[p]
    if data and data.Instance then
        pcall(function() data.Instance:Destroy() end)
    end
    highlights[p] = nil
end

-- When players join/leave
Players.PlayerAdded:Connect(function(p)
    -- Wait for the character to spawn, then set up ESP
    p.CharacterAdded:Connect(function(char)
        task.wait(1) -- give some time for character parts to load
        ensureHighlightForPlayer(p)
        updateHighlightsState()
    end)
    
    -- Also attempt to set up even if character already exists
    task.delay(0.2, function()
        ensureHighlightForPlayer(p)
    end)
end)

Players.PlayerRemoving:Connect(function(p)
    removeHighlightForPlayer(p)
end)

for _,p in ipairs(Players:GetPlayers()) do
    ensureHighlightForPlayer(p)
end

local function updateHighlightsState()
    for p,data in pairs(highlights) do
        if data and data.Instance then
            if p and p.Character then
                data.Instance.Adornee = p.Character
            end
            local ok = p and p.Character and (not State.ESP_TeamCheck or (p.Team ~= LocalPlayer.Team))
            data.Instance.Enabled = State.ESP and ok and p ~= LocalPlayer
        end
    end
end

-- ===== Drawing-based Box / Name / Distance ESP =====
local drawingObjects = {}

local function createDrawingForPlayer(plr)
    if not HAS_DRAWING then return end
    if drawingObjects[plr] then return end
    
    local objs = {}
    objs.box = Drawing.new("Square")
    objs.box.Filled = false
    objs.box.Thickness = 2
    objs.box.Transparency = 1
    
    objs.name = Drawing.new("Text")
    objs.name.Size = 16
    objs.name.Center = true
    objs.name.Outline = true
    
    objs.dist = Drawing.new("Text")
    objs.dist.Size = 14
    objs.dist.Center = true
    objs.dist.Outline = true
    
    drawingObjects[plr] = objs
end

local function removeDrawingForPlayer(plr)
    local o = drawingObjects[plr]
    if not o then return end
    for _,v in pairs(o) do
        pcall(function() v:Remove() end)
    end
    drawingObjects[plr] = nil
end

-- Billboard fallback
local billboardMap = {}

local function ensureBillboardForPlayer(plr)
    if billboardMap[plr] and billboardMap[plr].Gui and billboardMap[plr].Gui.Parent then return end
    if not plr.Character then return end
    
    local head = plr.Character:FindFirstChild("Head")
    if not head then return end
    
    local bgui = Instance.new("BillboardGui")
    bgui.Name = "LuigiNameBillboard_"..plr.Name
    bgui.Size = UDim2.new(0, 120, 0, 40)
    bgui.AlwaysOnTop = true
    bgui.StudsOffset = Vector3.new(0, 2.5, 0)
    bgui.Parent = plr.Character
    
    local nameLabel = Instance.new("TextLabel", bgui)
    nameLabel.Size = UDim2.new(1,0,0,20)
    nameLabel.Position = UDim2.new(0,0,0,0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = plr.Name
    nameLabel.Font = Enum.Font.SourceSans
    nameLabel.TextSize = 14
    nameLabel.TextColor3 = Color3.new(1,1,1)
    
    local distLabel = Instance.new("TextLabel", bgui)
    distLabel.Size = UDim2.new(1,0,0,20)
    distLabel.Position = UDim2.new(0,0,0,20)
    distLabel.BackgroundTransparency = 1
    distLabel.Text = ""
    distLabel.Font = Enum.Font.SourceSans
    distLabel.TextSize = 12
    distLabel.TextColor3 = Color3.new(1,1,1)
    
    billboardMap[plr] = {Gui = bgui, Name = nameLabel, Dist = distLabel}
end

local function removeBillboardForPlayer(plr)
    local b = billboardMap[plr]
    if b and b.Gui then
        pcall(function() b.Gui:Destroy() end)
    end
    billboardMap[plr] = nil
end

-- Helper: world to viewport
local function worldToViewportPoint(pos)
    local p, onScreen = Camera:WorldToViewportPoint(pos)
    return Vector2.new(p.X, p.Y), onScreen, p.Z
end

-- Update ESP visuals
RunService.RenderStepped:Connect(function()
    pcall(updateHighlightsState)
    
    for _, plr in pairs(Players:GetPlayers()) do
        if plr == LocalPlayer then
            removeDrawingForPlayer(plr)
            removeBillboardForPlayer(plr)
        else
            local char = plr.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if char and hrp and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
                local okTeam = (not State.ESP_TeamCheck) or (plr.Team ~= LocalPlayer.Team)
                
                if State.ESP and okTeam then
                    if HAS_DRAWING and State.ESP_Box then
                        createDrawingForPlayer(plr)
                        local objs = drawingObjects[plr]
                        if objs then
                            local rootPos = hrp.Position
                            local topPos = rootPos + Vector3.new(0, 2, 0)
                            local bottomPos = rootPos - Vector3.new(0, 2, 0)
                            local vpTop, topOn = worldToViewportPoint(topPos)
                            local vpBottom, bottomOn = worldToViewportPoint(bottomPos)
                            
                            if topOn or bottomOn then
                                local height = math.abs(vpTop.Y - vpBottom.Y)
                                local width = math.clamp(height / 2.2, 20, 200)
                                local center = (vpTop + vpBottom) / 2
                                
                                objs.box.Visible = true
                                objs.box.Size = Vector2.new(width, height)
                                objs.box.Position = center - (objs.box.Size / 2)
                                
                                local color = Color3.new(1, 0, 0)
                                if LocalPlayer.Team and plr.Team and plr.Team == LocalPlayer.Team then
                                    color = Color3.new(0,1,0)
                                end
                                objs.box.Color = color
                                
                                if State.ESP_Name then
                                    objs.name.Visible = true
                                    objs.name.Text = plr.Name
                                    objs.name.Position = Vector2.new(center.X, center.Y - height/2 - 14)
                                    objs.name.Color = color
                                else
                                    objs.name.Visible = false
                                end
                                
                                if State.ESP_Distance then
                                    local dist = math.floor((LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (LocalPlayer.Character.HumanoidRootPart.Position - rootPos).Magnitude) or 0)
                                    objs.dist.Visible = true
                                    objs.dist.Text = tostring(dist) .. "m"
                                    objs.dist.Position = Vector2.new(center.X, center.Y + height/2 + 2)
                                    objs.dist.Color = color
                                else
                                    objs.dist.Visible = false
                                end
                            else
                                objs.box.Visible = false
                                objs.name.Visible = false
                                objs.dist.Visible = false
                            end
                        end
                    else
                        removeDrawingForPlayer(plr)
                    end
                    
                    if not HAS_DRAWING and (State.ESP_Name or State.ESP_Distance) then
                        ensureBillboardForPlayer(plr)
                        local b = billboardMap[plr]
                        if b and b.Name and b.Dist and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                            b.Name.Text = plr.Name
                            local dist = math.floor((LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (LocalPlayer.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude) or 0)
                            b.Dist.Text = (State.ESP_Distance and (tostring(dist).."m")) or ""
                        end
                    else
                        if billboardMap[plr] then
                            removeBillboardForPlayer(plr)
                        end
                    end
                else
                    removeDrawingForPlayer(plr)
                    removeBillboardForPlayer(plr)
                end
            else
                removeDrawingForPlayer(plr)
                removeBillboardForPlayer(plr)
            end
        end
    end
end)

-- Cleanup
Players.PlayerRemoving:Connect(function(plr)
    removeDrawingForPlayer(plr)
    removeBillboardForPlayer(plr)
    removeHighlightForPlayer(plr)
end)

LocalPlayer.CharacterRemoving:Connect(function()
    for k,_ in pairs(drawingObjects) do
        removeDrawingForPlayer(k)
    end
    for k,_ in pairs(billboardMap) do
        removeBillboardForPlayer(k)
    end
    for k,_ in pairs(highlights) do
        removeHighlightForPlayer(k)
    end
end)

-- ===== Aimbot =====
local function makeRayParams()
    local params = RaycastParams.new()
    params.FilterDescendantsInstances = {LocalPlayer.Character}
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.IgnoreWater = true
    return params
end

local SilentTarget = nil

local function findClosestEnemy()
    local closest = nil
    local shortest = Settings.AimFOV
    local params = makeRayParams()
    
    for _,plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
            if (not State.AimTeamCheck) or (not plr.Team) or (not LocalPlayer.Team) or (plr.Team ~= LocalPlayer.Team) then
                local head = plr.Character.Head
                local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                if onScreen then
                    local dist2D = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                    if dist2D < shortest then
                        local worldDist = (head.Position - Camera.CFrame.Position).Magnitude
                        if worldDist <= Settings.AimDist then
                            local ray = Workspace:Raycast(Camera.CFrame.Position, (head.Position - Camera.CFrame.Position).Unit * Settings.AimDist, params)
                            if ray and ray.Instance and ray.Instance:IsDescendantOf(plr.Character) then
                                shortest = dist2D
                                closest = plr
                            end
                        end
                    end
                end
            end
        end
    end
    return closest
end

spawnOnce("aim_loop", function()
    while true do
        if State.Aimbot then
            local target = findClosestEnemy()
            if target and target.Character and target.Character:FindFirstChild("Head") then
                local headPos = target.Character.Head.Position
                local desired = CFrame.new(Camera.CFrame.Position, headPos)
                local aimSpeed = clamp((Settings.AimSmooth/100), 0.01, 1)
                Camera.CFrame = Camera.CFrame:Lerp(desired, aimSpeed)
                if State.SilentAim then
                    SilentTarget = target
                else
                    SilentTarget = nil
                end
            else
                SilentTarget = nil
                task.wait(0.03)
            end
        else
            SilentTarget = nil
            task.wait(0.08)
        end
        task.wait()
    end
end)

-- ===== No Recoil (best-effort) =====
local function applyNoRecoilOnce()
    pcall(function()
        if type(getgc) ~= "function" then return end
        for _,v in ipairs(getgc(true) or {}) do
            if type(v) == "table" then
                if rawget(v, "Recoil") ~= nil then
                    pcall(function() v.Recoil = 0 end)
                end
                if rawget(v, "CameraShake") ~= nil then
                    pcall(function() v.CameraShake = 0 end)
                end
                if rawget(v, "spread") ~= nil then
                    pcall(function() v.spread = 0 end)
                end
            end
        end
    end)
end

spawnOnce("norecoil_loop", function()
    while true do
        if State.NoRecoil then
            applyNoRecoilOnce()
        end
        task.wait(1.2)
    end
end)

-- ===== WalkSpeed enforcement =====
RunService.RenderStepped:Connect(function()
    if State.WalkLock and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum and hum.WalkSpeed ~= Settings.WalkSpeed then
            pcall(function() hum.WalkSpeed = Settings.WalkSpeed end)
        end
    end
end)

-- ===== Weapon Enhancements Implementation =====
-- Rapid Fire: modifies FireRate/BFireRate values in ReplicatedStorage.Weapons (best-effort)
local function applyRapidFireOnce()
    pcall(function()
        local weaponsFolder = ReplicatedStorage:FindFirstChild("Weapons")
        if weaponsFolder then
            for _, v in pairs(weaponsFolder:GetDescendants()) do
                if v:IsA("NumberValue") or v:IsA("IntValue") then
                    local n = string.lower(v.Name)
                    if n == "firerate" or n == "bfirerate" then
                        v.Value = Settings.RapidFireRate
                    end
                end
            end
            for _, weapon in ipairs(weaponsFolder:GetChildren()) do
                for _, child in ipairs(weapon:GetChildren()) do
                    if child:IsA("ModuleScript") then
                        local ok2, wdata = pcall(require, child)
                        if ok2 and type(wdata) == "table" then
                            pcall(function() if rawget(wdata, "FireRate") ~= nil then wdata.FireRate = Settings.RapidFireRate end end)
                            pcall(function() if rawget(wdata, "BFireRate") ~= nil then wdata.BFireRate = Settings.RapidFireRate end end)
                        end
                    end
                end
            end
        end
        for _, v in ipairs(ReplicatedStorage:GetDescendants()) do
            if v:IsA("NumberValue") or v:IsA("IntValue") then
                local n = string.lower(v.Name)
                if n == "firerate" or n == "bfirerate" then
                    pcall(function() v.Value = Settings.RapidFireRate end)
                end
            end
        end
    end)
end

-- Old best-effort ammo setter (kept as fallback)
local function applyInfiniteAmmoOnce()
    pcall(function()
        local root = ReplicatedStorage
        local weaponsFolder = root:FindFirstChild("Weapons") or root:FindFirstChild("WeaponData") or root:FindFirstChild("WeaponConfigs")
        if weaponsFolder and weaponsFolder:GetChildren() then
            for _, weapon in ipairs(weaponsFolder:GetChildren()) do
                for _, child in ipairs(weapon:GetDescendants()) do
                    if child:IsA("NumberValue") or child:IsA("IntValue") then
                        local n = string.lower(child.Name)
                        if n == "ammo" or n == "storedammo" or n == "mag" or n == "reserve" then
                            pcall(function() child.Value = Settings.AmmoValue end)
                        end
                    end
                end
                for _, child in ipairs(weapon:GetChildren()) do
                    if child:IsA("ModuleScript") then
                        local ok2, wdata = pcall(function() return require(child) end)
                        if ok2 and type(wdata) == "table" then
                            pcall(function() if rawget(wdata, "Ammo") ~= nil then wdata.Ammo = Settings.AmmoValue end end)
                            pcall(function() if rawget(wdata, "StoredAmmo") ~= nil then wdata.StoredAmmo = Settings.AmmoValue end end)
                        end
                    end
                end
            end
        end
        for _, v in ipairs(root:GetDescendants()) do
            if v:IsA("NumberValue") or v:IsA("IntValue") then
                local n = string.lower(v.Name)
                if n == "ammo" or n == "storedammo" or n == "mag" then
                    pcall(function() v.Value = Settings.AmmoValue end)
                end
            end
        end
    end)
end

-- Spread Control
local function applySpreadControlOnce()
    pcall(function()
        for _,v in ipairs(getgc and getgc(true) or {}) do
            if type(v) == "table" then
                if rawget(v, "spread") ~= nil then
                    pcall(function() v.spread = Settings.SpreadValue end)
                end
                if rawget(v, "Spread") ~= nil then
                    pcall(function() v.Spread = Settings.SpreadValue end)
                end
            end
        end
        local rs = ReplicatedStorage
        local possible = { rs:FindFirstChild("Weapons"), rs:FindFirstChild("WeaponData"), rs }
        for _, folder in ipairs(possible) do
            if folder then
                for _, child in ipairs(folder:GetDescendants()) do
                    if child:IsA("ModuleScript") then
                        local ok2, module = pcall(function() return require(child) end)
                        if ok2 and type(module) == "table" then
                            if rawget(module, "Spread") ~= nil then
                                pcall(function() module.Spread = Settings.SpreadValue end)
                            end
                            if rawget(module, "spread") ~= nil then
                                pcall(function() module.spread = Settings.SpreadValue end)
                            end
                        end
                    end
                end
            end
        end
    end)
end

-- ===== Fixed Infinite Ammo: auto-refill (no 999 lock) =====
spawnOnce("infinite_refill_loop", function()
    while true do
        if State.WeaponEnhancementsEnabled and State.InfiniteAmmo then
            -- 1) Refill equipped tools' ammo values quickly
            local char = LocalPlayer.Character
            if char then
                for _, tool in ipairs(char:GetChildren()) do
                    if tool:IsA("Tool") then
                        for _, obj in ipairs(tool:GetDescendants()) do
                            if (obj:IsA("IntValue") or obj:IsA("NumberValue")) and (obj.Name:lower():match("ammo") or obj.Name:lower():match("mag") or obj.Name:lower():match("reserve") or obj.Name:lower():match("storedammo")) then
                                pcall(function()
                                    if obj.Value <= 0 then
                                        obj.Value = Settings.AmmoValue
                                    end
                                end)
                            end
                        end
                        local maybeAmmo = tool:FindFirstChild("Ammo") or tool:FindFirstChild("StoredAmmo") or tool:FindFirstChild("Mag")
                        if maybeAmmo and (maybeAmmo:IsA("IntValue") or maybeAmmo:IsA("NumberValue")) then
                            pcall(function()
                                if maybeAmmo.Value <= 0 then
                                    maybeAmmo.Value = Settings.AmmoValue
                                end
                            end)
                        end
                    end
                end
            end
            
            -- 2) Best-effort: set weapon data in ReplicatedStorage/module scripts
            pcall(function()
                local root = ReplicatedStorage
                local weaponsFolder = root:FindFirstChild("Weapons") or root:FindFirstChild("WeaponData") or root:FindFirstChild("WeaponConfigs")
                if weaponsFolder and weaponsFolder:GetChildren() then
                    for _, weapon in ipairs(weaponsFolder:GetChildren()) do
                        for _, child in ipairs(weapon:GetDescendants()) do
                            if (child:IsA("IntValue") or child:IsA("NumberValue")) and (child.Name:lower():match("ammo") or child.Name:lower():match("mag")) then
                                pcall(function()
                                    if child.Value <= 0 then
                                        child.Value = Settings.AmmoValue
                                    end
                                end)
                            end
                        end
                        for _, child in ipairs(weapon:GetChildren()) do
                            if child:IsA("ModuleScript") then
                                local ok2, wdata = pcall(function() return require(child) end)
                                if ok2 and type(wdata) == "table" then
                                    pcall(function() if rawget(wdata, "Ammo") ~= nil and wdata.Ammo <= 0 then wdata.Ammo = Settings.AmmoValue end end)
                                    pcall(function() if rawget(wdata, "StoredAmmo") ~= nil and wdata.StoredAmmo <= 0 then wdata.StoredAmmo = Settings.AmmoValue end end)
                                end
                            end
                        end
                    end
                end
            end)
            task.wait(0.1)
        else
            task.wait(0.6)
        end
    end
end)

-- Toggle workers for continuous enforcement (legacy loop kept for other modifications)
spawnOnce("weapons_enforce_loop", function()
    while true do
        if State.WeaponEnhancementsEnabled then
            if State.RapidFire then
                applyRapidFireOnce()
            end
            if State.InfiniteAmmo then
                applyInfiniteAmmoOnce()
            end
            if State.SpreadControl then
                applySpreadControlOnce()
            end
        end
        task.wait(1.5)
    end
end)

-- ===== Banana UI =====
local Window = Library:CreateWindow({
    Title = "Night Slayer Hub",
    Subtitle = "- Arsenal",
    Image = "rbxassetid://137672958847663"
})

Library:Notify({
    Title = "Ui Library",
    Description = "The UI automatically hides once executed.\nPress the button at the bottom-left of the screen to show the GUI.",
    Duration = 3
})

-- Tabs
local TabAimbot = Window:AddTab("Aimbot")
local TabESP = Window:AddTab("ESP")
local TabMovement = Window:AddTab("Movement")
local TabWeapons = Window:AddTab("Weapons")
local TabJoin = Window:AddTab("Join Discord")

-- ===== Aimbot Tab =====
local AimbotGroup = TabAimbot:AddLeftGroupbox("Aimbot Settings")

AimbotGroup:AddToggle("AimbotToggle", {
    Title = "Aimbot",
    Default = State.Aimbot,
    Callback = function(Value)
        State.Aimbot = Value
    end
})

AimbotGroup:AddToggle("SilentAimToggle", {
    Title = "Silent Aim",
    Default = State.SilentAim,
    Callback = function(Value)
        State.SilentAim = Value
    end
})

AimbotGroup:AddToggle("AimTeamCheckToggle", {
    Title = "Team Check (don't aim teammates)",
    Default = State.AimTeamCheck,
    Callback = function(Value)
        State.AimTeamCheck = Value
    end
})

AimbotGroup:AddSlider({
    Title = "FOV",
    Min = 50,
    Max = 600,
    Default = Settings.AimFOV,
    Callback = function(Value)
        Settings.AimFOV = Value
    end
})

AimbotGroup:AddSlider({
    Title = "Distance",
    Min = 200,
    Max = 5000,
    Default = Settings.AimDist,
    Callback = function(Value)
        Settings.AimDist = Value
    end
})

AimbotGroup:AddSlider({
    Title = "Smoothness",
    Min = 1,
    Max = 100,
    Default = Settings.AimSmooth,
    Callback = function(Value)
        Settings.AimSmooth = Value
    end
})

AimbotGroup:AddToggle("NoRecoilToggle", {
    Title = "No Recoil (best-effort)",
    Default = State.NoRecoil,
    Callback = function(Value)
        State.NoRecoil = Value
    end
})

-- ===== ESP Tab =====
local ESPGroup = TabESP:AddLeftGroupbox("ESP Settings")

ESPGroup:AddToggle("ESPToggle", {
    Title = "Enable ESP (Highlights)",
    Default = State.ESP,
    Callback = function(Value)
        State.ESP = Value
        updateHighlightsState()
    end
})

ESPGroup:AddToggle("ESPTeamCheckToggle", {
    Title = "Team Check (hide teammates)",
    Default = State.ESP_TeamCheck,
    Callback = function(Value)
        State.ESP_TeamCheck = Value
        updateHighlightsState()
    end
})

ESPGroup:AddToggle("ESPBoxToggle", {
    Title = "Box ESP (Drawing)",
    Default = State.ESP_Box and HAS_DRAWING or false,
    Callback = function(Value)
        if not HAS_DRAWING and Value then
            Library:Notify({
                Title = "Drawing unavailable",
                Description = "Your executor may not support the Drawing API. Box ESP won't work.",
                Duration = 5
            })
        end
        State.ESP_Box = Value and HAS_DRAWING
    end
})

ESPGroup:AddToggle("ESPNameToggle", {
    Title = "Name ESP",
    Default = State.ESP_Name,
    Callback = function(Value)
        State.ESP_Name = Value
    end
})

ESPGroup:AddToggle("ESPDistanceToggle", {
    Title = "Distance ESP",
    Default = State.ESP_Distance,
    Callback = function(Value)
        State.ESP_Distance = Value
    end
})

-- ===== Movement Tab =====
local MovementGroup = TabMovement:AddLeftGroupbox("Movement Settings")

MovementGroup:AddToggle("WalkLockToggle", {
    Title = "Lock WalkSpeed",
    Default = State.WalkLock,
    Callback = function(Value)
        State.WalkLock = Value
    end
})

MovementGroup:AddSlider({
    Title = "WalkSpeed",
    Min = Settings.WalkMin,
    Max = Settings.WalkMax,
    Default = Settings.WalkSpeed,
    Callback = function(Value)
        Settings.WalkSpeed = Value
    end
})

-- ===== Weapons Tab =====
local WeaponsGroup = TabWeapons:AddLeftGroupbox("Weapon Enhancements")

WeaponsGroup:AddToggle("WeaponEnhancementsToggle", {
    Title = "Enable Weapon Enhancements",
    Default = State.WeaponEnhancementsEnabled,
    Callback = function(Value)
        State.WeaponEnhancementsEnabled = Value
    end
})

WeaponsGroup:AddToggle("RapidFireToggle", {
    Title = "Rapid Fire (Fast Fire Rate)",
    Default = State.RapidFire,
    Callback = function(Value)
        State.RapidFire = Value
        if Value then
            applyRapidFireOnce()
        end
    end
})

WeaponsGroup:AddSlider({
    Title = "Fire Rate (delay in seconds)",
    Min = 0.01,
    Max = 0.5,
    Decimal = 2,
    Default = Settings.RapidFireRate,
    Callback = function(Value)
        Settings.RapidFireRate = Value
        if State.RapidFire then
            applyRapidFireOnce()
        end
    end
})

WeaponsGroup:AddToggle("InfiniteAmmoToggle", {
    Title = "Infinite Ammo (auto-refill)",
    Default = State.InfiniteAmmo,
    Callback = function(Value)
        State.InfiniteAmmo = Value
    end
})

WeaponsGroup:AddSlider({
    Title = "Ammo Value (refill amount)",
    Min = 5,
    Max = 999,
    Default = Settings.AmmoValue,
    Callback = function(Value)
        Settings.AmmoValue = Value
    end
})

WeaponsGroup:AddToggle("SpreadControlToggle", {
    Title = "Spread Control (advanced)",
    Default = State.SpreadControl,
    Callback = function(Value)
        State.SpreadControl = Value
    end
})

WeaponsGroup:AddSlider({
    Title = "Spread Value",
    Min = 0,
    Max = 50,
    Default = Settings.SpreadValue,
    Callback = function(Value)
        Settings.SpreadValue = Value
    end
})

WeaponsGroup:AddButton({
    Title = "Apply No Recoil Now",
    Callback = function()
        applyNoRecoilOnce()
        Library:Notify({
            Title = "No Recoil",
            Description = "Applied (best-effort).",
            Duration = 3
        })
    end
})

WeaponsGroup:AddButton({
    Title = "Run Infinite Ammo Now",
    Callback = function()
        applyInfiniteAmmoOnce()
        Library:Notify({
            Title = "Infinite Ammo",
            Description = "Attempted (best-effort).",
            Duration = 3
        })
    end
})

WeaponsGroup:AddButton({
    Title = "Apply Spread Control Now",
    Callback = function()
        applySpreadControlOnce()
        Library:Notify({
            Title = "Spread",
            Description = "Attempted (best-effort).",
            Duration = 3
        })
    end
})

WeaponsGroup:AddButton({
    Title = "Apply Rapid Fire Now",
    Callback = function()
        applyRapidFireOnce()
        Library:Notify({
            Title = "Rapid Fire",
            Description = "Applied (best-effort). Hold mouse to fire rapidly.",
            Duration = 3
        })
    end
})

-- ===== Misc Tab (Discord) =====
local MiscGroup = TabMisc:AddLeftGroupbox("Information")

MiscGroup:AddButton({
    Title = "Discord (copy invite)",
    Callback = function()
        local invite = "https://discord.gg/dtn68z4xp"
        local ok2, err = pcall(function()
            if setclipboard then
                setclipboard(invite)
            elseif setclipboardstring then
                setclipboardstring(invite)
            else
                error("No clipboard function available")
            end
        end)
        if ok2 then
            Library:Notify({
                Title = "Discord",
                Description = "Invite copied to clipboard.",
                Duration = 4
            })
        else
            print("Discord invite:", invite)
            Library:Notify({
                Title = "Discord",
                Description = "Couldn't copy to clipboard; invite printed to console.",
                Duration = 4
            })
        end
    end
})

-- Final startup
updateHighlightsState()
print("Night Slayer Hub | Arsenal + Weapon Enhancements loaded. Banana UI active. (Fixed Infinite Ammo auto-refill)")