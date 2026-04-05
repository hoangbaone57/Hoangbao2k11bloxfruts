-- ts file was generated at discord.gg/25ms


_G.FastAttack = true
if _G.FastAttack then
    local vu1 = (getgenv or (getrenv or getfenv))()
    local function vu6(pu2, pu3)
        local v4, v5 = pcall(function()
			-- upvalues: (ref) pu2, (ref) pu3
            return pu2:WaitForChild(pu3)
        end)
        if not (v4 and v5) then
            warn("noooooo: " .. pu3)
        end
        return v5
    end
    game:GetService("VirtualInputManager")
    game:GetService("CollectionService")
    local v7 = game:GetService("ReplicatedStorage")
    game:GetService("TeleportService")
    local v8 = game:GetService("RunService")
    local vu9 = game:GetService("Players").LocalPlayer
    if not vu9 then
        warn("Kh\195\180ng t\195\172m th\225\186\165y ng\198\176\225\187\157i ch\198\161i c\225\187\165c b\225\187\153.")
        return
    end
    local v10 = vu6(v7, "Remotes")
    if not v10 then
        return
    end
    vu6(v10, "Validator")
    vu6(v10, "CommF_")
    vu6(v10, "CommE")
    vu6(workspace, "ChestModels")
    local v11 = vu6(workspace, "_WorldOrigin")
    local vu12 = vu6(workspace, "Characters")
    local vu13 = vu6(workspace, "Enemies")
    vu6(workspace, "Map")
    vu6(v11, "EnemySpawns")
    vu6(v11, "Locations")
    local _ = v8.RenderStepped
    local _ = v8.Heartbeat
    local _ = v8.Stepped
    local vu14 = vu6(vu6(v7, "Modules"), "Net")
    local _ = sethiddenproperty
    if not setupvalue and debug then
        local _ = debug.setupvalue
    end
    if not getupvalue and debug then
        local _ = debug.getupvalue
    end
    local vu15 = {
        ["AutoClick"] = true,
        ["ClickDelay"] = 0
    };
    ({}).FastAttack = (function()
		-- upvalues: (ref) vu1, (ref) vu6, (ref) vu14, (ref) vu9, (ref) vu15, (ref) vu13, (ref) vu12
        if vu1.rz_FastAttack then
            return vu1.rz_FastAttack
        end
        local vu16 = {
            ["Distance"] = 100,
            ["attackMobs"] = true,
            ["attackPlayers"] = true,
            ["Equipped"] = nil
        }
        local vu17 = vu6(vu14, "RE/RegisterAttack")
        local vu18 = vu6(vu14, "RE/RegisterHit")
        local function vu21(p19)
            local v20 = p19 and p19:FindFirstChild("Humanoid")
            if v20 then
                v20 = p19.Humanoid.Health > 0
            end
            return v20
        end
        local function vu30(p22, p23)
			-- upvalues: (ref) vu21, (ref) vu9, (ref) vu16
            local v24, v25, v26 = p23:GetChildren()
            local v27 = nil
            while true do
                local v28
                v26, v28 = v24(v25, v26)
                if v26 == nil then
                    break
                end
                local v29 = v28:FindFirstChild("Head")
                if v29 and vu21(v28) and (vu9:DistanceFromCharacter(v29.Position) < vu16.Distance and v28 ~= vu9.Character) then
                    table.insert(p22, {
                        v28,
                        v29
                    })
                    v27 = v29
                end
            end
            return v27
        end
        function vu16.Attack(_, p31, p32)
			-- upvalues: (ref) vu17, (ref) vu15, (ref) vu18
            if p31 and # p32 ~= 0 then
                vu17:FireServer(vu15.ClickDelay or 0)
                vu18:FireServer(p31, p32)
            end
        end
        function vu16.AttackNearest(p33)
			-- upvalues: (ref) vu30, (ref) vu13, (ref) vu12, (ref) vu9
            local v34 = {}
            local v35 = vu30(v34, vu13)
            local v36 = vu30(v34, vu12)
            local v37 = vu9.Character
            if v37 then
                local vu38 = v37:FindFirstChildOfClass("Tool")
                if vu38 and vu38:FindFirstChild("LeftClickRemote") then
                    local v39, v40, v41 = ipairs(v34)
                    while true do
                        local v42
                        v41, v42 = v39(v40, v41)
                        if v41 == nil then
                            break
                        end
                        local vu43 = (v42[1].HumanoidRootPart.Position - v37:GetPivot().Position).Unit
                        pcall(function()
							-- upvalues: (ref) vu38, (ref) vu43
                            vu38.LeftClickRemote:FireServer(vu43, 1)
                        end)
                    end
                elseif # v34 <= 0 then
                    task.wait(0)
                else
                    p33:Attack(v35 or v36, v34)
                end
            end
        end
        function vu16.BladeHits(p44)
			-- upvalues: (ref) vu21, (ref) vu9
            local v45 = vu21(vu9.Character)
            if v45 then
                v45 = vu9.Character:FindFirstChildOfClass("Tool")
            end
            if v45 and v45.ToolTip ~= "Gun" then
                p44:AttackNearest()
            else
                task.wait(0)
            end
        end
        task.spawn(function()
			-- upvalues: (ref) vu15, (ref) vu16
            while task.wait(vu15.ClickDelay) do
                if vu15.AutoClick then
                    vu16:BladeHits()
                end
            end
        end)
        vu1.rz_FastAttack = vu16
        return vu16
    end)()
end
local v46 = next
local v47 = {
    game.ReplicatedStorage.Util,
    game.ReplicatedStorage.Common,
    game.ReplicatedStorage.Remotes,
    game.ReplicatedStorage.Assets,
    game.ReplicatedStorage.FX
}
local v48 = nil
local vu49 = nil
local vu50 = nil
while true do
    local v51
    v48, v51 = v46(v47, v48)
    if v48 == nil then
        break
    end
    local v52 = next
    local v53, v54 = v51:GetChildren()
    while true do
        local v55, v56 = v52(v53, v54)
        if v55 == nil then
            break
        end
        v54 = v55
        if v56:IsA("RemoteEvent") and v56:GetAttribute("Id") then
            vu50 = v56:GetAttribute("Id")
            vu49 = v56
        end
    end
    v51.ChildAdded:Connect(function(p57)
		-- upvalues: (ref) vu49, (ref) vu50
        if p57:IsA("RemoteEvent") and p57:GetAttribute("Id") then
            vu50 = p57:GetAttribute("Id")
            vu49 = p57
        end
    end)
end
task.spawn(function()
	-- upvalues: (ref) vu49, (ref) vu50
    while task.wait(0.05) do
        local v58 = game.Players.LocalPlayer.Character
        local v59
        if v58 then
            v59 = v58:FindFirstChild("HumanoidRootPart")
        else
            v59 = v58
        end
        local v60, v61, v62 = ipairs({
            workspace.Enemies,
            workspace.Characters
        })
        local vu63 = {}
        while true do
            local v64
            v62, v64 = v60(v61, v62)
            if v62 == nil then
                break
            end
            local v65, v66, v67 = ipairs(v64 and v64:GetChildren() or {})
            while true do
                local v68
                v67, v68 = v65(v66, v67)
                if v67 == nil then
                    break
                end
                local v69 = v68:FindFirstChild("HumanoidRootPart")
                local v70 = v68:FindFirstChild("Humanoid")
                if v68 ~= v58 and (v69 and (v70 and (v70.Health > 0 and (v69.Position - v59.Position).Magnitude <= 60))) then
                    local v71, v72, v73 = ipairs(v68:GetChildren())
                    while true do
                        local v74
                        v73, v74 = v71(v72, v73)
                        if v73 == nil then
                            break
                        end
                        if v74:IsA("BasePart") and (v69.Position - v59.Position).Magnitude <= 60 then
                            vu63[# vu63 + 1] = {
                                v68,
                                v74
                            }
                        end
                    end
                end
            end
        end
        local v75 = v58:FindFirstChildOfClass("Tool")
        if # vu63 > 0 and (v75 and (v75:GetAttribute("WeaponType") == "Melee" or v75:GetAttribute("WeaponType") == "Sword")) then
            pcall(function()
				-- upvalues: (ref) vu63, (ref) vu49, (ref) vu50
                require(game.ReplicatedStorage.Modules.Net):RemoteEvent("RegisterHit", true)
                game.ReplicatedStorage.Modules.Net["RE/RegisterAttack"]:FireServer()
                local v76 = vu63[1][1]:FindFirstChild("Head")
                if v76 then
                    game.ReplicatedStorage.Modules.Net["RE/RegisterHit"]:FireServer(v76, vu63, {}, tostring(game.Players.LocalPlayer.UserId):sub(2, 4) .. tostring(coroutine.running()):sub(11, 15))
                    cloneref(vu49):FireServer(string.gsub("RE/RegisterHit", ".", function(p77)
                        return string.char(bit32.bxor(string.byte(p77), math.floor(workspace:GetServerTimeNow() / 10 % 10) + 1))
                    end), bit32.bxor(vu50 + 909090, game.ReplicatedStorage.Modules.Net.seed:InvokeServer() * 2), v76, vu63)
                end
            end)
        end
    end
end)
shared.LoaderTitle = "By:hoangbao2k11"
shared.LoaderKeyFrames = {
    {
        1,
        10
    },
    {
        2,
        30
    },
    {
        3,
        60
    },
    {
        2,
        100
    }
}
local v78 = {
    ["LoaderData"] = {
        ["Name"] = shared.LoaderTitle or "A Loader",
        ["Colors"] = shared.LoaderColors or {
            ["Main"] = Color3.fromRGB(0, 0, 0),
            ["Topic"] = Color3.fromRGB(200, 200, 200),
            ["Title"] = Color3.fromRGB(255, 255, 255),
            ["LoaderBackground"] = Color3.fromRGB(40, 40, 40),
            ["LoaderSplash"] = Color3.fromRGB(3, 252, 3)
        }
    },
    ["Keyframes"] = shared.LoaderKeyFrames or {
        {
            1,
            10
        },
        {
            2,
            30
        },
        {
            3,
            60
        },
        {
            2,
            100
        }
    }
}
local vu79 = {
    "",
    "",
    "",
    ""
}
function TweenObject(p80, p81, p82)
    game.TweenService:Create(p80, TweenInfo.new(p81, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), p82):Play()
end
function CreateObject(p83, p84)
    local v85 = Instance.new(p83)
    local v86, v87, v88 = pairs(p84)
    local v89 = nil
    while true do
        local v90
        v88, v90 = v86(v87, v88)
        if v88 == nil then
            break
        end
        if v88 == "Parent" then
            v89 = v90
        else
            v85[v88] = v90
        end
    end
    v85.Parent = v89
    return v85
end
local function v94(p91, p92)
    local v93 = Instance.new("UICorner")
    v93.CornerRadius = UDim.new(0, p91)
    v93.Parent = p92
end
local v95 = CreateObject("ScreenGui", {
    ["Name"] = "Core",
    ["Parent"] = game.CoreGui
})
local v96 = CreateObject("Frame", {
    ["Name"] = "Main",
    ["Parent"] = v95,
    ["BackgroundColor3"] = v78.LoaderData.Colors.Main,
    ["BorderSizePixel"] = 0,
    ["ClipsDescendants"] = true,
    ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
    ["Size"] = UDim2.new(0, 0, 0, 0)
})
v94(12, v96)
v94(25, (CreateObject("ImageLabel", {
    ["Name"] = "UserImage",
    ["Parent"] = v96,
    ["BackgroundTransparency"] = 1,
    ["Image"] = "rbxassetid://124194333243835",
    ["Position"] = UDim2.new(0, 15, 0, 10),
    ["Size"] = UDim2.new(0, 50, 0, 50)
})))
CreateObject("TextLabel", {
    ["Name"] = "UserName",
    ["Parent"] = v96,
    ["BackgroundTransparency"] = 1,
    ["Text"] = "TikTok:Trongnguyen",
    ["Position"] = UDim2.new(0, 75, 0, 10),
    ["Size"] = UDim2.new(0, 200, 0, 50),
    ["Font"] = Enum.Font.GothamBold,
    ["TextColor3"] = v78.LoaderData.Colors.Title,
    ["TextSize"] = 14,
    ["TextXAlignment"] = Enum.TextXAlignment.Left
})
local v97 = CreateObject("TextLabel", {
    ["Name"] = "Top",
    ["TextTransparency"] = 1,
    ["Parent"] = v96,
    ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
    ["BackgroundTransparency"] = 1,
    ["Position"] = UDim2.new(0, 30, 0, 70),
    ["Size"] = UDim2.new(0, 301, 0, 20),
    ["Font"] = Enum.Font.Gotham,
    ["Text"] = "Loader",
    ["TextColor3"] = v78.LoaderData.Colors.Topic,
    ["TextSize"] = 10,
    ["TextXAlignment"] = Enum.TextXAlignment.Left
})
local v98 = CreateObject("TextLabel", {
    ["Name"] = "Title",
    ["Parent"] = v96,
    ["TextTransparency"] = 1,
    ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
    ["BackgroundTransparency"] = 1,
    ["Position"] = UDim2.new(0, 30, 0, 90),
    ["Size"] = UDim2.new(0, 301, 0, 46),
    ["Font"] = Enum.Font.Gotham,
    ["RichText"] = true,
    ["Text"] = "<b>" .. v78.LoaderData.Name .. "</b>",
    ["TextColor3"] = v78.LoaderData.Colors.Title,
    ["TextSize"] = 14,
    ["TextXAlignment"] = Enum.TextXAlignment.Left
})
local v99 = CreateObject("Frame", {
    ["Name"] = "BG",
    ["Parent"] = v96,
    ["AnchorPoint"] = Vector2.new(0.5, 0),
    ["BackgroundTransparency"] = 1,
    ["BackgroundColor3"] = v78.LoaderData.Colors.LoaderBackground,
    ["BorderSizePixel"] = 0,
    ["Position"] = UDim2.new(0.5, 0, 0, 70),
    ["Size"] = UDim2.new(0.8500000238418579, 0, 0, 24)
})
v94(8, v99)
local vu100 = CreateObject("Frame", {
    ["Name"] = "Progress",
    ["Parent"] = v99,
    ["BackgroundColor3"] = v78.LoaderData.Colors.LoaderSplash,
    ["BackgroundTransparency"] = 1,
    ["BorderSizePixel"] = 0,
    ["Size"] = UDim2.new(0, 0, 0, 24)
})
v94(8, vu100)
local vu101 = CreateObject("TextLabel", {
    ["Name"] = "StepLabel",
    ["Parent"] = v96,
    ["BackgroundTransparency"] = 1,
    ["Position"] = UDim2.new(0.5, 0, 1, - 25),
    ["Size"] = UDim2.new(1, - 20, 0, 20),
    ["Font"] = Enum.Font.Gotham,
    ["Text"] = "",
    ["TextColor3"] = v78.LoaderData.Colors.Topic,
    ["TextSize"] = 14,
    ["TextXAlignment"] = Enum.TextXAlignment.Center,
    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
})
function UpdateStepText(p102)
	-- upvalues: (ref) vu101, (ref) vu79
    vu101.Text = vu79[p102] or ""
end
function UpdatePercentage(p103, p104)
	-- upvalues: (ref) vu100
    TweenObject(vu100, 0.5, {
        ["Size"] = UDim2.new(p103 / 100, 0, 0, 24)
    })
    UpdateStepText(p104)
end
TweenObject(v96, 0.25, {
    ["Size"] = UDim2.new(0, 346, 0, 121)
})
wait()
TweenObject(v97, 0.5, {
    ["TextTransparency"] = 0
})
TweenObject(v98, 0.5, {
    ["TextTransparency"] = 0
})
TweenObject(v99, 0.5, {
    ["BackgroundTransparency"] = 0
})
TweenObject(vu100, 0.5, {
    ["BackgroundTransparency"] = 0
})
local v105, v106, v107 = pairs(v78.Keyframes)
local v108 = vu100
while true do
    local v109
    v107, v109 = v105(v106, v107)
    if v107 == nil then
        break
    end
    wait(v109[1])
    UpdatePercentage(v109[2], v107)
end
UpdatePercentage(100, 4)
TweenObject(v97, 0.5, {
    ["TextTransparency"] = 1
})
TweenObject(v98, 0.5, {
    ["TextTransparency"] = 1
})
TweenObject(v99, 0.5, {
    ["BackgroundTransparency"] = 1
})
TweenObject(v108, 0.5, {
    ["BackgroundTransparency"] = 1
})
wait(0.5)
TweenObject(v96, 0.25, {
    ["Size"] = UDim2.new(0, 0, 0, 0)
})
wait(0.25)
v95:Destroy()
local vu110 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local v111 = vu110:CreateWindow({
    ["Title"] = "Maru Hub",
    ["SubTitle"] = "By TrongNguyen",
    ["TabWidth"] = 160,
    ["Theme"] = "Amethyst",
    ["Acrylic"] = false,
    ["Size"] = UDim2.fromOffset(500, 320),
    ["MinimizeKey"] = Enum.KeyCode.End
})
local v112 = {
    ["Home"] = v111:AddTab({
        ["Title"] = "Info Hub"
    }),
    ["Main"] = v111:AddTab({
        ["Title"] = "General"
    }),
    ["Sea"] = v111:AddTab({
        ["Title"] = "Event"
    }),
    ["ITM"] = v111:AddTab({
        ["Title"] = "Items"
    }),
    ["Setting"] = v111:AddTab({
        ["Title"] = "Setting"
    }),
    ["Status"] = v111:AddTab({
        ["Title"] = "M\195\161y Ch\225\187\167"
    }),
    ["Stats"] = v111:AddTab({
        ["Title"] = "Ch\225\187\137 S\225\187\145"
    }),
    ["Player"] = v111:AddTab({
        ["Title"] = "Ng\198\176\225\187\157i Ch\198\161i"
    }),
    ["Teleport"] = v111:AddTab({
        ["Title"] = "D\225\187\139ch Chuy\225\187\131n"
    }),
    ["Visual"] = v111:AddTab({
        ["Title"] = "Fake"
    }),
    ["Fruit"] = v111:AddTab({
        ["Title"] = "Fruit"
    }),
    ["Raid"] = v111:AddTab({
        ["Title"] = "Raid"
    }),
    ["Race"] = v111:AddTab({
        ["Title"] = "Race"
    }),
    ["Shop"] = v111:AddTab({
        ["Title"] = "Shop"
    }),
    ["Misc"] = v111:AddTab({
        ["Title"] = "Kh\195\161c"
    })
}
local v113 = vu110.Options
local v114 = game.PlaceId
if v114 == 2753915549 then
    Sea1 = true
elseif v114 == 4442272183 then
    Sea2 = true
elseif v114 == 7449423635 then
    Sea3 = true
else
    game:Shutdown()
end
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait()
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
Sea1 = false
Sea2 = false
Sea3 = false
local v115 = game.PlaceId
if v115 == 2753915549 then
    Sea1 = true
elseif v115 == 4442272183 then
    Sea2 = true
elseif v115 == 7449423635 then
    Sea3 = true
end
function CheckLevel()
    local v116 = game:GetService("Players").LocalPlayer.Data.Level.Value
    if Sea1 then
        if v116 == 1 or (v116 <= 9 or SelectMonster == "Bandit") then
            Ms = "Bandit"
            NameQuest = "BanditQuest1"
            QuestLv = 1
            NameMon = "Bandit"
            CFrameQ = CFrame.new(1060.9383544922, 16.455066680908, 1547.7841796875)
            CFrameMon = CFrame.new(1038.5533447266, 41.296249389648, 1576.5098876953)
        elseif v116 == 10 or (v116 <= 14 or SelectMonster == "Monkey") then
            Ms = "Monkey"
            NameQuest = "JungleQuest"
            QuestLv = 1
            NameMon = "Monkey"
            CFrameQ = CFrame.new(- 1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(- 1448.1446533203, 50.851993560791, 63.60718536377)
        elseif v116 == 15 or (v116 <= 29 or SelectMonster == "Gorilla") then
            Ms = "Gorilla"
            NameQuest = "JungleQuest"
            QuestLv = 2
            NameMon = "Gorilla"
            CFrameQ = CFrame.new(- 1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameMon = CFrame.new(- 1142.6488037109, 40.462348937988, - 515.39227294922)
        elseif v116 == 30 or (v116 <= 39 or SelectMonster == "Pirate") then
            Ms = "Pirate"
            NameQuest = "BuggyQuest1"
            QuestLv = 1
            NameMon = "Pirate"
            CFrameQ = CFrame.new(- 1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(- 1201.0881347656, 40.628940582275, 3857.5966796875)
        elseif v116 == 40 or (v116 <= 59 or SelectMonster == "Brute") then
            Ms = "Brute"
            NameQuest = "BuggyQuest1"
            QuestLv = 2
            NameMon = "Brute"
            CFrameQ = CFrame.new(- 1140.1761474609, 4.752049446106, 3827.4057617188)
            CFrameMon = CFrame.new(- 1387.5324707031, 24.592035293579, 4100.9575195313)
        elseif v116 == 60 or (v116 <= 74 or SelectMonster == "Desert Bandit") then
            Ms = "Desert Bandit"
            NameQuest = "DesertQuest"
            QuestLv = 1
            NameMon = "Desert Bandit"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(984.99896240234, 16.109552383423, 4417.91015625)
        elseif v116 == 75 or (v116 <= 89 or SelectMonster == "Desert Officer") then
            Ms = "Desert Officer"
            NameQuest = "DesertQuest"
            QuestLv = 2
            NameMon = "Desert Officer"
            CFrameQ = CFrame.new(896.51721191406, 6.4384617805481, 4390.1494140625)
            CFrameMon = CFrame.new(1547.1510009766, 14.452038764954, 4381.8002929688)
        elseif v116 == 90 or (v116 <= 99 or SelectMonster == "Snow Bandit") then
            Ms = "Snow Bandit"
            NameQuest = "SnowQuest"
            QuestLv = 1
            NameMon = "Snow Bandit"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, - 1298.3576660156)
            CFrameMon = CFrame.new(1356.3028564453, 105.76865386963, - 1328.2418212891)
        elseif v116 == 100 or (v116 <= 119 or SelectMonster == "Snowman") then
            Ms = "Snowman"
            NameQuest = "SnowQuest"
            QuestLv = 2
            NameMon = "Snowman"
            CFrameQ = CFrame.new(1386.8073730469, 87.272789001465, - 1298.3576660156)
            CFrameMon = CFrame.new(1218.7956542969, 138.01184082031, - 1488.0262451172)
        elseif v116 == 120 or (v116 <= 149 or SelectMonster == "Chief Petty Officer") then
            Ms = "Chief Petty Officer"
            NameQuest = "MarineQuest2"
            QuestLv = 1
            NameMon = "Chief Petty Officer"
            CFrameQ = CFrame.new(- 5035.49609375, 28.677835464478, 4324.1840820313)
            CFrameMon = CFrame.new(- 4931.1552734375, 65.793113708496, 4121.8393554688)
        elseif v116 == 150 or (v116 <= 174 or SelectMonster == "Sky Bandit") then
            Ms = "Sky Bandit"
            NameQuest = "SkyQuest"
            QuestLv = 1
            NameMon = "Sky Bandit"
            CFrameQ = CFrame.new(- 4842.1372070313, 717.69543457031, - 2623.0483398438)
            CFrameMon = CFrame.new(- 4955.6411132813, 365.46365356445, - 2908.1865234375)
        elseif v116 == 175 or (v116 <= 189 or SelectMonster == "Dark Master") then
            Ms = "Dark Master"
            NameQuest = "SkyQuest"
            QuestLv = 2
            NameMon = "Dark Master"
            CFrameQ = CFrame.new(- 4842.1372070313, 717.69543457031, - 2623.0483398438)
            CFrameMon = CFrame.new(- 5148.1650390625, 439.04571533203, - 2332.9611816406)
        elseif v116 == 190 or (v116 <= 209 or SelectMonster == "Prisoner") then
            Ms = "Prisoner"
            NameQuest = "PrisonerQuest"
            QuestLv = 1
            NameMon = "Prisoner"
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, - 0.999846935, 0, 0.0175017118)
            CFrameMon = CFrame.new(4937.31885, 0.332031399, 649.574524, 0.694649816, 0, - 0.719348073, 0, 1, 0, 0.719348073, 0, 0.694649816)
        elseif v116 == 210 or (v116 <= 249 or SelectMonster == "Dangerous Prisoner") then
            Ms = "Dangerous Prisoner"
            NameQuest = "PrisonerQuest"
            QuestLv = 2
            NameMon = "Dangerous Prisoner"
            CFrameQ = CFrame.new(5310.60547, 0.350014925, 474.946594, 0.0175017118, 0, 0.999846935, 0, 1, 0, - 0.999846935, 0, 0.0175017118)
            CFrameMon = CFrame.new(5099.6626, 0.351562679, 1055.7583, 0.898906827, 0, - 0.438139856, 0, 1, 0, 0.438139856, 0, 0.898906827)
        elseif v116 == 250 or (v116 <= 274 or SelectMonster == "Toga Warrior") then
            Ms = "Toga Warrior"
            NameQuest = "ColosseumQuest"
            QuestLv = 1
            NameMon = "Toga Warrior"
            CFrameQ = CFrame.new(- 1577.7890625, 7.4151420593262, - 2984.4838867188)
            CFrameMon = CFrame.new(- 1872.5166015625, 49.080215454102, - 2913.810546875)
        elseif v116 == 275 or (v116 <= 299 or SelectMonster == "Gladiator") then
            Ms = "Gladiator"
            NameQuest = "ColosseumQuest"
            QuestLv = 2
            NameMon = "Gladiator"
            CFrameQ = CFrame.new(- 1577.7890625, 7.4151420593262, - 2984.4838867188)
            CFrameMon = CFrame.new(- 1521.3740234375, 81.203170776367, - 3066.3139648438)
        elseif v116 == 300 or (v116 <= 324 or SelectMonster == "Military Soldier") then
            Ms = "Military Soldier"
            NameQuest = "MagmaQuest"
            QuestLv = 1
            NameMon = "Military Soldier"
            CFrameQ = CFrame.new(- 5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(- 5369.0004882813, 61.24352645874, 8556.4921875)
        elseif v116 == 325 or (v116 <= 374 or SelectMonster == "Military Spy") then
            Ms = "Military Spy"
            NameQuest = "MagmaQuest"
            QuestLv = 2
            NameMon = "Military Spy"
            CFrameQ = CFrame.new(- 5316.1157226563, 12.262831687927, 8517.00390625)
            CFrameMon = CFrame.new(- 5787.00293, 75.8262634, 8651.69922, 0.838590562, 0, - 0.544762194, 0, 1, 0, 0.544762194, 0, 0.838590562)
        elseif v116 == 375 or (v116 <= 399 or SelectMonster == "Fishman Warrior") then
            Ms = "Fishman Warrior"
            NameQuest = "FishmanQuest"
            QuestLv = 1
            NameMon = "Fishman Warrior"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(60844.10546875, 98.462875366211, 1298.3985595703)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif v116 == 400 or (v116 <= 449 or SelectMonster == "Fishman Commando") then
            Ms = "Fishman Commando"
            NameQuest = "FishmanQuest"
            QuestLv = 2
            NameMon = "Fishman Commando"
            CFrameQ = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            CFrameMon = CFrame.new(61738.3984375, 64.207321166992, 1433.8375244141)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        elseif v116 == 10 or (v116 <= 474 or SelectMonster == "God\'s Guard") then
            Ms = "God\'s Guard"
            NameQuest = "SkyExp1Quest"
            QuestLv = 1
            NameMon = "God\'s Guard"
            CFrameQ = CFrame.new(- 4721.8603515625, 845.30297851563, - 1953.8489990234)
            CFrameMon = CFrame.new(- 4628.0498046875, 866.92877197266, - 1931.2352294922)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.82275, 872.54248, - 1667.55688))
            end
        elseif v116 == 475 or (v116 <= 524 or SelectMonster == "Shanda") then
            Ms = "Shanda"
            NameQuest = "SkyExp1Quest"
            QuestLv = 2
            NameMon = "Shanda"
            CFrameQ = CFrame.new(- 7863.1596679688, 5545.5190429688, - 378.42266845703)
            CFrameMon = CFrame.new(- 7685.1474609375, 5601.0751953125, - 441.38876342773)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.6176757813, 5547.1416015625, - 380.29119873047))
            end
        elseif v116 == 525 or (v116 <= 549 or SelectMonster == "Royal Squad") then
            Ms = "Royal Squad"
            NameQuest = "SkyExp2Quest"
            QuestLv = 1
            NameMon = "Royal Squad"
            CFrameQ = CFrame.new(- 7903.3828125, 5635.9897460938, - 1410.923828125)
            CFrameMon = CFrame.new(- 7654.2514648438, 5637.1079101563, - 1407.7550048828)
        elseif v116 == 550 or (v116 <= 624 or SelectMonster == "Royal Soldier") then
            Ms = "Royal Soldier"
            NameQuest = "SkyExp2Quest"
            QuestLv = 2
            NameMon = "Royal Soldier"
            CFrameQ = CFrame.new(- 7903.3828125, 5635.9897460938, - 1410.923828125)
            CFrameMon = CFrame.new(- 7760.4106445313, 5679.9077148438, - 1884.8112792969)
        elseif v116 == 625 or (v116 <= 649 or SelectMonster == "Galley Pirate") then
            Ms = "Galley Pirate"
            NameQuest = "FountainQuest"
            QuestLv = 1
            NameMon = "Galley Pirate"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5557.1684570313, 152.32717895508, 3998.7758789063)
        elseif v116 >= 650 or SelectMonster == "Galley Captain" then
            Ms = "Galley Captain"
            NameQuest = "FountainQuest"
            QuestLv = 2
            NameMon = "Galley Captain"
            CFrameQ = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            CFrameMon = CFrame.new(5677.6772460938, 92.786109924316, 4966.6323242188)
        end
    end
    if Sea2 then
        if v116 == 700 or (v116 <= 724 or SelectMonster == "Raider") then
            Ms = "Raider"
            NameQuest = "Area1Quest"
            QuestLv = 1
            NameMon = "Raider"
            CFrameQ = CFrame.new(- 427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(68.874565124512, 93.635643005371, 2429.6752929688)
        elseif v116 == 725 or (v116 <= 774 or SelectMonster == "Mercenary") then
            Ms = "Mercenary"
            NameQuest = "Area1Quest"
            QuestLv = 2
            NameMon = "Mercenary"
            CFrameQ = CFrame.new(- 427.72567749023, 72.99634552002, 1835.9426269531)
            CFrameMon = CFrame.new(- 864.85009765625, 122.47104644775, 1453.1505126953)
        elseif v116 == 775 or (v116 <= 799 or SelectMonster == "Swan Pirate") then
            Ms = "Swan Pirate"
            NameQuest = "Area2Quest"
            QuestLv = 1
            NameMon = "Swan Pirate"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(1065.3669433594, 137.64012145996, 1324.3798828125)
        elseif v116 == 800 or (v116 <= 874 or SelectMonster == "Factory Staff") then
            Ms = "Factory Staff"
            NameQuest = "Area2Quest"
            QuestLv = 2
            NameMon = "Factory Staff"
            CFrameQ = CFrame.new(635.61151123047, 73.096351623535, 917.81298828125)
            CFrameMon = CFrame.new(533.22045898438, 128.46876525879, 355.62615966797)
        elseif v116 == 875 or (v116 <= 899 or SelectMonster == "Marine Lieutenan") then
            Ms = "Marine Lieutenant"
            NameQuest = "MarineQuest3"
            QuestLv = 1
            NameMon = "Marine Lieutenant"
            CFrameQ = CFrame.new(- 2440.9934082031, 73.04190826416, - 3217.7082519531)
            CFrameMon = CFrame.new(- 2489.2622070313, 84.613594055176, - 3151.8830566406)
        elseif v116 == 900 or (v116 <= 949 or SelectMonster == "Marine Captain") then
            Ms = "Marine Captain"
            NameQuest = "MarineQuest3"
            QuestLv = 2
            NameMon = "Marine Captain"
            CFrameQ = CFrame.new(- 2440.9934082031, 73.04190826416, - 3217.7082519531)
            CFrameMon = CFrame.new(- 2335.2026367188, 79.786659240723, - 3245.8674316406)
        elseif v116 == 950 or (v116 <= 974 or SelectMonster == "Zombie") then
            Ms = "Zombie"
            NameQuest = "ZombieQuest"
            QuestLv = 1
            NameMon = "Zombie"
            CFrameQ = CFrame.new(- 5494.3413085938, 48.505931854248, - 794.59094238281)
            CFrameMon = CFrame.new(- 5536.4970703125, 101.08577728271, - 835.59075927734)
        elseif v116 == 975 or (v116 <= 999 or SelectMonster == "Vampire") then
            Ms = "Vampire"
            NameQuest = "ZombieQuest"
            QuestLv = 2
            NameMon = "Vampire"
            CFrameQ = CFrame.new(- 5494.3413085938, 48.505931854248, - 794.59094238281)
            CFrameMon = CFrame.new(- 5806.1098632813, 16.722528457642, - 1164.4384765625)
        elseif v116 == 1000 or (v116 <= 1049 or SelectMonster == "Snow Trooper") then
            Ms = "Snow Trooper"
            NameQuest = "SnowMountainQuest"
            QuestLv = 1
            NameMon = "Snow Trooper"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, - 5370.5546875)
            CFrameMon = CFrame.new(535.21051025391, 432.74209594727, - 5484.9165039063)
        elseif v116 == 1050 or (v116 <= 1099 or SelectMonster == "Winter Warrior") then
            Ms = "Winter Warrior"
            NameQuest = "SnowMountainQuest"
            QuestLv = 2
            NameMon = "Winter Warrior"
            CFrameQ = CFrame.new(607.05963134766, 401.44781494141, - 5370.5546875)
            CFrameMon = CFrame.new(1234.4449462891, 456.95419311523, - 5174.130859375)
        elseif v116 == 1100 or (v116 <= 1124 or SelectMonster == "Lab Subordinate") then
            Ms = "Lab Subordinate"
            NameQuest = "IceSideQuest"
            QuestLv = 1
            NameMon = "Lab Subordinate"
            CFrameQ = CFrame.new(- 6061.841796875, 15.926671981812, - 4902.0385742188)
            CFrameMon = CFrame.new(- 5720.5576171875, 63.309471130371, - 4784.6103515625)
        elseif v116 == 1125 or (v116 <= 1174 or SelectMonster == "Horned Warrior") then
            Ms = "Horned Warrior"
            NameQuest = "IceSideQuest"
            QuestLv = 2
            NameMon = "Horned Warrior"
            CFrameQ = CFrame.new(- 6061.841796875, 15.926671981812, - 4902.0385742188)
            CFrameMon = CFrame.new(- 6292.751953125, 91.181983947754, - 5502.6499023438)
        elseif v116 == 1175 or (v116 <= 1199 or SelectMonster == "Magma Ninja") then
            Ms = "Magma Ninja"
            NameQuest = "FireSideQuest"
            QuestLv = 1
            NameMon = "Magma Ninja"
            CFrameQ = CFrame.new(- 5429.0473632813, 15.977565765381, - 5297.9614257813)
            CFrameMon = CFrame.new(- 5461.8388671875, 130.36347961426, - 5836.4702148438)
        elseif v116 == 1200 or (v116 <= 1249 or SelectMonster == "Lava Pirate") then
            Ms = "Lava Pirate"
            NameQuest = "FireSideQuest"
            QuestLv = 2
            NameMon = "Lava Pirate"
            CFrameQ = CFrame.new(- 5429.0473632813, 15.977565765381, - 5297.9614257813)
            CFrameMon = CFrame.new(- 5251.1889648438, 55.164535522461, - 4774.4096679688)
        elseif v116 == 1250 or (v116 <= 1274 or SelectMonster == "Ship Deckhand") then
            Ms = "Ship Deckhand"
            NameQuest = "ShipQuest1"
            QuestLv = 1
            NameMon = "Ship Deckhand"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(921.12365722656, 125.9839553833, 33088.328125)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif v116 == 1275 or (v116 <= 1299 or SelectMonster == "Ship Engineer") then
            Ms = "Ship Engineer"
            NameQuest = "ShipQuest1"
            QuestLv = 2
            NameMon = "Ship Engineer"
            CFrameQ = CFrame.new(1040.2927246094, 125.08293151855, 32911.0390625)
            CFrameMon = CFrame.new(886.28179931641, 40.47790145874, 32800.83203125)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif v116 == 1300 or (v116 <= 1324 or SelectMonster == "Ship Steward") then
            Ms = "Ship Steward"
            NameQuest = "ShipQuest2"
            QuestLv = 1
            NameMon = "Ship Steward"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(943.85504150391, 129.58183288574, 33444.3671875)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif v116 == 1325 or (v116 <= 1349 or SelectMonster == "Ship Officer") then
            Ms = "Ship Officer"
            NameQuest = "ShipQuest2"
            QuestLv = 2
            NameMon = "Ship Officer"
            CFrameQ = CFrame.new(971.42065429688, 125.08293151855, 33245.54296875)
            CFrameMon = CFrame.new(955.38458251953, 181.08335876465, 33331.890625)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
            end
        elseif v116 == 1350 or (v116 <= 1374 or SelectMonster == "Arctic Warrior") then
            Ms = "Arctic Warrior"
            NameQuest = "FrostQuest"
            QuestLv = 1
            NameMon = "Arctic Warrior"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, - 6484.6005859375)
            CFrameMon = CFrame.new(5935.4541015625, 77.26016998291, - 6472.7568359375)
            if _G.AutoLevel and (CFrameMon.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 6508.5581054688, 89.034996032715, - 132.83953857422))
            end
        elseif v116 == 1375 or (v116 <= 1424 or SelectMonster == "Snow Lurker") then
            Ms = "Snow Lurker"
            NameQuest = "FrostQuest"
            QuestLv = 2
            NameMon = "Snow Lurker"
            CFrameQ = CFrame.new(5668.1372070313, 28.202531814575, - 6484.6005859375)
            CFrameMon = CFrame.new(5628.482421875, 57.574996948242, - 6618.3481445313)
        elseif v116 == 1425 or (v116 <= 1449 or SelectMonster == "Sea Soldier") then
            Ms = "Sea Soldier"
            NameQuest = "ForgottenQuest"
            QuestLv = 1
            NameMon = "Sea Soldier"
            CFrameQ = CFrame.new(- 3054.5827636719, 236.87213134766, - 10147.790039063)
            CFrameMon = CFrame.new(- 3185.0153808594, 58.789089202881, - 9663.6064453125)
        elseif v116 >= 1450 or SelectMonster == "Water Fighter" then
            Ms = "Water Fighter"
            NameQuest = "ForgottenQuest"
            QuestLv = 2
            NameMon = "Water Fighter"
            CFrameQ = CFrame.new(- 3054.5827636719, 236.87213134766, - 10147.790039063)
            CFrameMon = CFrame.new(- 3262.9301757813, 298.69036865234, - 10552.529296875)
        end
    end
    if Sea3 then
        if v116 == 1500 or (v116 <= 1524 or SelectMonster == "Pirate Millionaire") then
            Ms = "Pirate Millionaire"
            NameQuest = "PiratePortQuest"
            QuestLv = 1
            NameMon = "Pirate Millionaire"
            CFrameQ = CFrame.new(- 450.1046447753906, 107.68145751953125, 5950.72607421875)
            CFrameMon = CFrame.new(- 193.99227905273438, 56.12502670288086, 5755.7880859375)
        elseif v116 == 1525 or (v116 <= 1574 or SelectMonster == "Pistol Billionaire") then
            Ms = "Pistol Billionaire"
            NameQuest = "PiratePortQuest"
            QuestLv = 2
            NameMon = "Pistol Billionaire"
            CFrameQ = CFrame.new(- 450.1046447753906, 107.68145751953125, 5950.72607421875)
            CFrameMon = CFrame.new(- 188.14462280273438, 84.49613189697266, 6337.0419921875)
        elseif v116 == 1575 or (v116 <= 1599 or SelectMonster == "Dragon Crew Warrior") then
            Ms = "Dragon Crew Warrior"
            NameQuest = "DragonCrewQuest"
            QuestLv = 1
            NameMon = "Dragon Crew Warrior"
            CFrameQ = CFrame.new(6735.11083984375, 126.99046325683594, - 711.0979614257812)
            CFrameMon = CFrame.new(6615.2333984375, 50.847679138183594, - 978.93408203125)
        elseif v116 == 1600 or (v116 <= 1624 or SelectMonster == "Dragon Crew Archer") then
            Ms = "Dragon Crew Archer"
            NameQuest = "DragonCrewQuest"
            QuestLv = 2
            NameMon = "Dragon Crew Archer"
            CFrameQ = CFrame.new(6735.11083984375, 126.99046325683594, - 711.0979614257812)
            CFrameMon = CFrame.new(6818.58935546875, 483.718994140625, 512.726806640625)
        elseif v116 == 1625 or (v116 <= 1649 or SelectMonster == "Hydra Enforcer") then
            Ms = "Hydra Enforcer"
            NameQuest = "VenomCrewQuest"
            QuestLv = 1
            NameMon = "Hydra Enforcer"
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(4547.115234375, 1001.60205078125, 334.1954650878906)
        elseif v116 == 1650 or (v116 <= 1699 or SelectMonster == "Venomous Assailant") then
            Ms = "Venomous Assailant"
            NameQuest = "VenomCrewQuest"
            QuestLv = 2
            NameMon = "Venomous Assailant"
            CFrameQ = CFrame.new(5446.8793945313, 601.62945556641, 749.45672607422)
            CFrameMon = CFrame.new(4637.88525390625, 1077.85595703125, 882.4183959960938)
        elseif v116 == 1700 or (v116 <= 1724 or SelectMonster == "Marine Commodore") then
            Ms = "Marine Commodore"
            NameQuest = "MarineTreeIsland"
            QuestLv = 1
            NameMon = "Marine Commodore"
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, - 6740.0551757813)
            CFrameMon = CFrame.new(2198.0063476563, 128.71075439453, - 7109.5043945313)
        elseif v116 == 1725 or (v116 <= 1774 or SelectMonster == "Marine Rear Admiral") then
            Ms = "Marine Rear Admiral"
            NameQuest = "MarineTreeIsland"
            QuestLv = 2
            NameMon = "Marine Rear Admiral"
            CFrameQ = CFrame.new(2179.98828125, 28.731239318848, - 6740.0551757813)
            CFrameMon = CFrame.new(3294.3142089844, 385.41125488281, - 7048.6342773438)
        elseif v116 == 1775 or (v116 <= 1799 or SelectMonster == "Fishman Raider") then
            Ms = "Fishman Raider"
            NameQuest = "DeepForestIsland3"
            QuestLv = 1
            NameMon = "Fishman Raider"
            CFrameQ = CFrame.new(- 10582.759765625, 331.78845214844, - 8757.666015625)
            CFrameMon = CFrame.new(- 10553.268554688, 521.38439941406, - 8176.9458007813)
        elseif v116 == 1800 or (v116 <= 1824 or SelectMonster == "Fishman Captain") then
            Ms = "Fishman Captain"
            NameQuest = "DeepForestIsland3"
            QuestLv = 2
            NameMon = "Fishman Captain"
            CFrameQ = CFrame.new(- 10583.099609375, 331.78845214844, - 8759.4638671875)
            CFrameMon = CFrame.new(- 10789.401367188, 427.18637084961, - 9131.4423828125)
        elseif v116 == 1825 or (v116 <= 1849 or SelectMonster == "Forest Pirate") then
            Ms = "Forest Pirate"
            NameQuest = "DeepForestIsland"
            QuestLv = 1
            NameMon = "Forest Pirate"
            CFrameQ = CFrame.new(- 13232.662109375, 332.40396118164, - 7626.4819335938)
            CFrameMon = CFrame.new(- 13489.397460938, 400.30349731445, - 7770.251953125)
        elseif v116 == 1850 or (v116 <= 1899 or SelectMonster == "Mythological Pirate") then
            Ms = "Mythological Pirate"
            NameQuest = "DeepForestIsland"
            QuestLv = 2
            NameMon = "Mythological Pirate"
            CFrameQ = CFrame.new(- 13232.662109375, 332.40396118164, - 7626.4819335938)
            CFrameMon = CFrame.new(- 13508.616210938, 582.46228027344, - 6985.3037109375)
        elseif v116 == 1900 or (v116 <= 1924 or SelectMonster == "Jungle Pirate") then
            Ms = "Jungle Pirate"
            NameQuest = "DeepForestIsland2"
            QuestLv = 1
            NameMon = "Jungle Pirate"
            CFrameQ = CFrame.new(- 12682.096679688, 390.88653564453, - 9902.1240234375)
            CFrameMon = CFrame.new(- 12267.103515625, 459.75262451172, - 10277.200195313)
        elseif v116 == 1925 or (v116 <= 1974 or SelectMonster == "Musketeer Pirate") then
            Ms = "Musketeer Pirate"
            NameQuest = "DeepForestIsland2"
            QuestLv = 2
            NameMon = "Musketeer Pirate"
            CFrameQ = CFrame.new(- 12682.096679688, 390.88653564453, - 9902.1240234375)
            CFrameMon = CFrame.new(- 13291.5078125, 520.47338867188, - 9904.638671875)
        elseif v116 == 1975 or (v116 <= 1999 or SelectMonster == "Reborn Skeleton") then
            Ms = "Reborn Skeleton"
            NameQuest = "HauntedQuest1"
            QuestLv = 1
            NameMon = "Reborn Skeleton"
            CFrameQ = CFrame.new(- 9480.80762, 142.130661, 5566.37305, - 0.00655503059, 4.5295423e-8, - 0.999978542, 2.0492047e-8, 1, 4.5162068e-8, 0.999978542, - 2.0195568e-8, - 0.00655503059)
            CFrameMon = CFrame.new(- 8761.77148, 183.431747, 6168.33301, 0.978073597, - 0.000013950732, - 0.208259016, - 1.0807393e-6, 1, - 0.00007206303, 0.208259016, 0.00007070804, 0.978073597)
        elseif v116 == 2000 or (v116 <= 2024 or SelectMonster == "Living Zombie") then
            Ms = "Living Zombie"
            NameQuest = "HauntedQuest1"
            QuestLv = 2
            NameMon = "Living Zombie"
            CFrameQ = CFrame.new(- 9480.80762, 142.130661, 5566.37305, - 0.00655503059, 4.5295423e-8, - 0.999978542, 2.0492047e-8, 1, 4.5162068e-8, 0.999978542, - 2.0195568e-8, - 0.00655503059)
            CFrameMon = CFrame.new(- 10103.7529, 238.565979, 6179.75977, 0.999474227, 2.7754714e-8, 0.0324240364, - 2.5800633e-8, 1, - 6.068485e-8, - 0.0324240364, 5.981639e-8, 0.999474227)
        elseif v116 == 2025 or (v116 <= 2049 or SelectMonster == "Demonic Soul") then
            Ms = "Demonic Soul"
            NameQuest = "HauntedQuest2"
            QuestLv = 1
            NameMon = "Demonic Soul"
            CFrameQ = CFrame.new(- 9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(- 9712.03125, 204.69589233398, 6193.322265625)
        elseif v116 == 2050 or (v116 <= 2074 or SelectMonster == "Posessed Mummy") then
            Ms = "Posessed Mummy"
            NameQuest = "HauntedQuest2"
            QuestLv = 2
            NameMon = "Posessed Mummy"
            CFrameQ = CFrame.new(- 9516.9931640625, 178.00651550293, 6078.4653320313)
            CFrameMon = CFrame.new(- 9545.7763671875, 69.619895935059, 6339.5615234375)
        elseif v116 == 2075 or (v116 <= 2099 or SelectMonster == "Peanut Scout") then
            Ms = "Peanut Scout"
            NameQuest = "NutsIslandQuest"
            QuestLv = 1
            NameMon = "Peanut Scout"
            CFrameQ = CFrame.new(- 2105.53198, 37.2495995, - 10195.5088, - 0.766061664, 0, - 0.642767608, 0, 1, 0, 0.642767608, 0, - 0.766061664)
            CFrameMon = CFrame.new(- 2150.587890625, 122.49767303467, - 10358.994140625)
        elseif v116 == 2100 or (v116 <= 2124 or SelectMonster == "Peanut President") then
            Ms = "Peanut President"
            NameQuest = "NutsIslandQuest"
            QuestLv = 2
            NameMon = "Peanut President"
            CFrameQ = CFrame.new(- 2105.53198, 37.2495995, - 10195.5088, - 0.766061664, 0, - 0.642767608, 0, 1, 0, 0.642767608, 0, - 0.766061664)
            CFrameMon = CFrame.new(- 2150.587890625, 122.49767303467, - 10358.994140625)
        elseif v116 == 2125 or (v116 <= 2149 or SelectMonster == "Ice Cream Chef") then
            Ms = "Ice Cream Chef"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 1
            NameMon = "Ice Cream Chef"
            CFrameQ = CFrame.new(- 819.376709, 64.9259796, - 10967.2832, - 0.766061664, 0, 0.642767608, 0, 1, 0, - 0.642767608, 0, - 0.766061664)
            CFrameMon = CFrame.new(- 789.941528, 209.382889, - 11009.9805, - 0.0703101531, "-0", - 0.997525156, "-0", 1.00000012, "-0", 0.997525275, 0, - 0.0703101456)
        elseif v116 == 2150 or (v116 <= 2199 or SelectMonster == "Ice Cream Commander") then
            Ms = "Ice Cream Commander"
            NameQuest = "IceCreamIslandQuest"
            QuestLv = 2
            NameMon = "Ice Cream Commander"
            CFrameQ = CFrame.new(- 819.376709, 64.9259796, - 10967.2832, - 0.766061664, 0, 0.642767608, 0, 1, 0, - 0.642767608, 0, - 0.766061664)
            CFrameMon = CFrame.new(- 789.941528, 209.382889, - 11009.9805, - 0.0703101531, "-0", - 0.997525156, "-0", 1.00000012, "-0", 0.997525275, 0, - 0.0703101456)
        elseif v116 == 2200 or (v116 <= 2224 or SelectMonster == "Cookie Crafter") then
            Ms = "Cookie Crafter"
            NameQuest = "CakeQuest1"
            QuestLv = 1
            NameMon = "Cookie Crafter"
            CFrameQ = CFrame.new(- 2022.29858, 36.9275894, - 12030.9766, - 0.961273909, 0, - 0.275594592, 0, 1, 0, 0.275594592, 0, - 0.961273909)
            CFrameMon = CFrame.new(- 2321.71216, 36.699482, - 12216.7871, - 0.780074954, 0, 0.625686109, 0, 1, 0, - 0.625686109, 0, - 0.780074954)
        elseif v116 == 2225 or (v116 <= 2249 or SelectMonster == "Cake Guard") then
            Ms = "Cake Guard"
            NameQuest = "CakeQuest1"
            QuestLv = 2
            NameMon = "Cake Guard"
            CFrameQ = CFrame.new(- 2022.29858, 36.9275894, - 12030.9766, - 0.961273909, 0, - 0.275594592, 0, 1, 0, 0.275594592, 0, - 0.961273909)
            CFrameMon = CFrame.new(- 1418.11011, 36.6718941, - 12255.7324, 0.0677844882, 0, 0.997700036, 0, 1, 0, - 0.997700036, 0, 0.0677844882)
        elseif v116 == 2250 or (v116 <= 2274 or SelectMonster == "Baking Staff") then
            Ms = "Baking Staff"
            NameQuest = "CakeQuest2"
            QuestLv = 1
            NameMon = "Baking Staff"
            CFrameQ = CFrame.new(- 1928.31763, 37.7296638, - 12840.626, 0.951068401, "-0", - 0.308980465, 0, 1, "-0", 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(- 1980.43848, 36.6716766, - 12983.8418, - 0.254443765, 0, - 0.967087567, 0, 1, 0, 0.967087567, 0, - 0.254443765)
        elseif v116 == 2275 or (v116 <= 2299 or SelectMonster == "Head Baker") then
            Ms = "Head Baker"
            NameQuest = "CakeQuest2"
            QuestLv = 2
            NameMon = "Head Baker"
            CFrameQ = CFrame.new(- 1928.31763, 37.7296638, - 12840.626, 0.951068401, "-0", - 0.308980465, 0, 1, "-0", 0.308980465, 0, 0.951068401)
            CFrameMon = CFrame.new(- 2251.5791, 52.2714615, - 13033.3965, - 0.991971016, 0, - 0.126466095, 0, 1, 0, 0.126466095, 0, - 0.991971016)
        elseif v116 == 2300 or (v116 <= 2324 or SelectMonster == "Cocoa Warrior") then
            Ms = "Cocoa Warrior"
            NameQuest = "ChocQuest1"
            QuestLv = 1
            NameMon = "Cocoa Warrior"
            CFrameQ = CFrame.new(231.75, 23.9003029, - 12200.292, - 1, 0, 0, 0, 1, 0, 0, 0, - 1)
            CFrameMon = CFrame.new(167.978516, 26.2254658, - 12238.874, - 0.939700961, 0, 0.341998369, 0, 1, 0, - 0.341998369, 0, - 0.939700961)
        elseif v116 == 2325 or (v116 <= 2349 or SelectMonster == "Chocolate Bar Battler") then
            Ms = "Chocolate Bar Battler"
            NameQuest = "ChocQuest1"
            QuestLv = 2
            NameMon = "Chocolate Bar Battler"
            CFrameQ = CFrame.new(231.75, 23.9003029, - 12200.292, - 1, 0, 0, 0, 1, 0, 0, 0, - 1)
            CFrameMon = CFrame.new(701.312073, 25.5824986, - 12708.2148, - 0.342042685, 0, - 0.939684391, 0, 1, 0, 0.939684391, 0, - 0.342042685)
        elseif v116 == 2350 or (v116 <= 2374 or SelectMonster == "Sweet Thief") then
            Ms = "Sweet Thief"
            NameQuest = "ChocQuest2"
            QuestLv = 1
            NameMon = "Sweet Thief"
            CFrameQ = CFrame.new(151.198242, 23.8907146, - 12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, - 0.906319618, 0, 0.422592998)
            CFrameMon = CFrame.new(- 140.258301, 25.5824986, - 12652.3115, 0.173624337, "-0", - 0.984811902, 0, 1, "-0", 0.984811902, 0, 0.173624337)
        elseif v116 == 2375 or (v116 <= 2400 or SelectMonster == "Candy Rebel") then
            Ms = "Candy Rebel"
            NameQuest = "ChocQuest2"
            QuestLv = 2
            NameMon = "Candy Rebel"
            CFrameQ = CFrame.new(151.198242, 23.8907146, - 12774.6172, 0.422592998, 0, 0.906319618, 0, 1, 0, - 0.906319618, 0, 0.422592998)
            CFrameMon = CFrame.new(47.9231453, 25.5824986, - 13029.2402, - 0.819156051, 0, - 0.573571265, 0, 1, 0, 0.573571265, 0, - 0.819156051)
        elseif v116 == 2400 or (v116 <= 2424 or SelectMonster == "Candy Pirate") then
            Ms = "Candy Pirate"
            NameQuest = "CandyQuest1"
            QuestLv = 1
            NameMon = "Candy Pirate"
            CFrameQ = CFrame.new(- 1149.328, 13.5759039, - 14445.6143, - 0.156446099, 0, - 0.987686574, 0, 1, 0, 0.987686574, 0, - 0.156446099)
            CFrameMon = CFrame.new(- 1437.56348, 17.1481285, - 14385.6934, 0.173624337, "-0", - 0.984811902, 0, 1, "-0", 0.984811902, 0, 0.173624337)
        elseif v116 == 2425 or (v116 <= 2449 or SelectMonster == "Snow Demon") then
            Ms = "Snow Demon"
            NameQuest = "CandyQuest1"
            QuestLv = 2
            NameMon = "Snow Demon"
            CFrameQ = CFrame.new(- 1149.328, 13.5759039, - 14445.6143, - 0.156446099, 0, - 0.987686574, 0, 1, 0, 0.987686574, 0, - 0.156446099)
            CFrameMon = CFrame.new(- 916.222656, 17.1481285, - 14638.8125, 0.866007268, 0, 0.500031412, 0, 1, 0, - 0.500031412, 0, 0.866007268)
        elseif v116 == 2450 or (v116 <= 2474 or SelectMonster == "Isle Outlaw") then
            Ms = "Isle Outlaw"
            NameQuest = "TikiQuest1"
            QuestLv = 1
            NameMon = "Isle Outlaw"
            CFrameQ = CFrame.new(- 16549.890625, 55.68635559082031, - 179.91360473632812)
            CFrameMon = CFrame.new(- 16162.8193359375, 11.6863374710083, - 96.45481872558594)
        elseif v116 == 2475 or (v116 <= 2499 or SelectMonster == "Island Boy") then
            Ms = "Island Boy"
            NameQuest = "TikiQuest1"
            QuestLv = 2
            NameMon = "Island Boy"
            CFrameQ = CFrame.new(- 16549.890625, 55.68635559082031, - 179.91360473632812)
            CFrameMon = CFrame.new(- 16357.3125, 20.632822036743164, 1005.64892578125)
        elseif v116 == 2500 or (v116 <= 2524 or SelectMonster == "Sun-kissed Warrior") then
            Ms = "Sun-kissed Warrior"
            NameQuest = "TikiQuest2"
            QuestLv = 1
            NameMon = "Sun-kissed Warrior"
            CFrameQ = CFrame.new(- 16541.021484375, 54.77081298828125, 1051.461181640625)
            CFrameMon = CFrame.new(- 16357.3125, 20.632822036743164, 1005.64892578125)
        elseif v116 == 2525 or (v116 <= 2549 or SelectMonster == "Isle Champion") then
            Ms = "Isle Champion"
            NameQuest = "TikiQuest2"
            QuestLv = 2
            NameMon = "Isle Champion"
            CFrameQ = CFrame.new(- 16541.021484375, 54.77081298828125, 1051.461181640625)
            CFrameMon = CFrame.new(- 16848.94140625, 21.68633460998535, 1041.4490966796875)
        elseif v116 == 2550 or (v116 <= 2574 or SelectMonster == "Serpent Hunter") then
            Ms = "Serpent Hunter"
            NameQuest = "TikiQuest3"
            QuestLv = 1
            NameMon = "Serpent Hunter"
            CFrameQ = CFrame.new(- 16665.19140625, 104.59640502929688, 1579.6943359375)
            CFrameMon = CFrame.new(- 16621.4140625, 121.40631103515625, 1290.6881103515625)
        elseif v116 == 2575 or (v116 <= 2599 or (SelectMonster == "Skull Slayer" or v116 == 2600)) then
            Ms = "Skull Slayer"
            NameQuest = "TikiQuest3"
            QuestLv = 2
            NameMon = "Skull Slayer"
            CFrameQ = CFrame.new(- 16665.19140625, 104.59640502929688, 1579.6943359375)
            CFrameMon = CFrame.new(- 16811.5703125, 84.625244140625, 1542.235107421875)
        end
    end
end
if Sea1 then
    tableMon = {
        "Bandit",
        "Monkey",
        "Gorilla",
        "Pirate",
        "Brute",
        "Desert Bandit",
        "Desert Officer",
        "Snow Bandit",
        "Snowman",
        "Chief Petty Officer",
        "Sky Bandit",
        "Dark Master",
        "Prisoner",
        "Dangerous Prisoner",
        "Toga Warrior",
        "Gladiator",
        "Military Soldier",
        "Military Spy",
        "Fishman Warrior",
        "Fishman Commando",
        "God\'s Guard",
        "Shanda",
        "Royal Squad",
        "Royal Soldier",
        "Galley Pirate",
        "Galley Captain"
    }
elseif Sea2 then
    tableMon = {
        "Raider",
        "Mercenary",
        "Swan Pirate",
        "Factory Staff",
        "Marine Lieutenant",
        "Marine Captain",
        "Zombie",
        "Vampire",
        "Snow Trooper",
        "Winter Warrior",
        "Lab Subordinate",
        "Horned Warrior",
        "Magma Ninja",
        "Lava Pirate",
        "Ship Deckhand",
        "Ship Engineer",
        "Ship Steward",
        "Ship Officer",
        "Arctic Warrior",
        "Snow Lurker",
        "Sea Soldier",
        "Water Fighter"
    }
elseif Sea3 then
    tableMon = {
        "Pirate Millionaire",
        "Dragon Crew Warrior",
        "Dragon Crew Archer",
        "Hydra Enforcer",
        "Venomous Assailant",
        "Marine Commodore",
        "Marine Rear Admiral",
        "Fishman Raider",
        "Fishman Captain",
        "Forest Pirate",
        "Mythological Pirate",
        "Jungle Pirate",
        "Musketeer Pirate",
        "Reborn Skeleton",
        "Living Zombie",
        "Demonic Soul",
        "Posessed Mummy",
        "Peanut Scout",
        "Peanut President",
        "Ice Cream Chef",
        "Ice Cream Commander",
        "Cookie Crafter",
        "Cake Guard",
        "Baking Staff",
        "Head Baker",
        "Cocoa Warrior",
        "Chocolate Bar Battler",
        "Sweet Thief",
        "Candy Rebel",
        "Candy Pirate",
        "Snow Demon",
        "Isle Outlaw",
        "Island Boy",
        "Sun-kissed Warrior",
        "Isle Champion",
        "Serpent Hunter",
        "Skull Slayer"
    }
end
if Sea1 then
    AreaList = {
        "Jungle",
        "Buggy",
        "Desert",
        "Snow",
        "Marine",
        "Sky",
        "Prison",
        "Colosseum",
        "Magma",
        "Fishman",
        "Sky Island",
        "Fountain"
    }
elseif Sea2 then
    AreaList = {
        "Area 1",
        "Area 2",
        "Zombie",
        "Marine",
        "Snow Mountain",
        "Ice fire",
        "Ship",
        "Frost",
        "Forgotten"
    }
elseif Sea3 then
    AreaList = {
        "Pirate Port",
        "Amazon",
        "Marine Tree",
        "Deep Forest",
        "Haunted Castle",
        "Nut Island",
        "Ice Cream Island",
        "Cake Island",
        "Choco Island",
        "Candy Island",
        "Tiki Outpost"
    }
end
function CheckBossQuest()
    if Sea1 then
        if SelectBoss ~= "The Gorilla King" then
            if SelectBoss ~= "Bobby" then
                if SelectBoss ~= "The Saw" then
                    if SelectBoss ~= "Yeti" then
                        if SelectBoss ~= "Mob Leader" then
                            if SelectBoss ~= "Vice Admiral" then
                                if SelectBoss ~= "Saber Expert" then
                                    if SelectBoss ~= "Warden" then
                                        if SelectBoss ~= "Chief Warden" then
                                            if SelectBoss ~= "Swan" then
                                                if SelectBoss ~= "Magma Admiral" then
                                                    if SelectBoss ~= "Fishman Lord" then
                                                        if SelectBoss ~= "Wysper" then
                                                            if SelectBoss ~= "Thunder God" then
                                                                if SelectBoss ~= "Cyborg" then
                                                                    if SelectBoss ~= "Ice Admiral" then
                                                                        if SelectBoss == "Greybeard" then
                                                                            BossMon = "Greybeard"
                                                                            NameBoss = "Greybeard"
                                                                            CFrameBoss = CFrame.new(- 5081.3452148438, 85.221641540527, 4257.3588867188)
                                                                        end
                                                                    else
                                                                        BossMon = "Ice Admiral"
                                                                        NameBoss = "Ice Admiral"
                                                                        CFrameBoss = CFrame.new(1266.08948, 26.1757946, - 1399.57678, - 0.573599219, 0, - 0.81913656, 0, 1, 0, 0.81913656, 0, - 0.573599219)
                                                                    end
                                                                else
                                                                    BossMon = "Cyborg"
                                                                    NameBoss = "Cyborg"
                                                                    NameQuestBoss = "FountainQuest"
                                                                    QuestLvBoss = 3
                                                                    RewardBoss = "Reward:\n$20,000\n7,500,000 Exp."
                                                                    CFrameQBoss = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
                                                                    CFrameBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
                                                                end
                                                            else
                                                                BossMon = "Thunder God"
                                                                NameBoss = "Thunder God"
                                                                NameQuestBoss = "SkyExp2Quest"
                                                                QuestLvBoss = 3
                                                                RewardBoss = "Reward:\n$20,000\n5,800,000 Exp."
                                                                CFrameQBoss = CFrame.new(- 7903.3828125, 5635.9897460938, - 1410.923828125)
                                                                CFrameBoss = CFrame.new(- 7994.984375, 5761.025390625, - 2088.6479492188)
                                                            end
                                                        else
                                                            BossMon = "Wysper"
                                                            NameBoss = "Wysper"
                                                            NameQuestBoss = "SkyExp1Quest"
                                                            QuestLvBoss = 3
                                                            RewardBoss = "Reward:\n$15,000\n4,800,000 Exp."
                                                            CFrameQBoss = CFrame.new(- 7861.947265625, 5545.517578125, - 379.85974121094)
                                                            CFrameBoss = CFrame.new(- 7866.1333007813, 5576.4311523438, - 546.74816894531)
                                                        end
                                                    else
                                                        BossMon = "Fishman Lord"
                                                        NameBoss = "Fishman Lord"
                                                        NameQuestBoss = "FishmanQuest"
                                                        QuestLvBoss = 3
                                                        RewardBoss = "Reward:\n$15,000\n4,000,000 Exp."
                                                        CFrameQBoss = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
                                                        CFrameBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
                                                    end
                                                else
                                                    BossMon = "Magma Admiral"
                                                    NameBoss = "Magma Admiral"
                                                    NameQuestBoss = "MagmaQuest"
                                                    QuestLvBoss = 3
                                                    RewardBoss = "Reward:\n$15,000\n2,800,000 Exp."
                                                    CFrameQBoss = CFrame.new(- 5314.6220703125, 12.262420654297, 8517.279296875)
                                                    CFrameBoss = CFrame.new(- 5765.8969726563, 82.92064666748, 8718.3046875)
                                                end
                                            else
                                                BossMon = "Swan"
                                                NameBoss = "Swan"
                                                NameQuestBoss = "ImpelQuest"
                                                QuestLvBoss = 3
                                                RewardBoss = "Reward:\n$15,000\n1,600,000 Exp."
                                                CFrameBoss = CFrame.new(5325.09619, 7.03906584, 719.570679, - 0.309060812, 0, 0.951042235, 0, 1, 0, - 0.951042235, 0, - 0.309060812)
                                                CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, - 0.731384635, 0, 0.681965172, 0, 1, 0, - 0.681965172, 0, - 0.731384635)
                                            end
                                        else
                                            BossMon = "Chief Warden"
                                            NameBoss = "Chief Warden"
                                            NameQuestBoss = "ImpelQuest"
                                            QuestLvBoss = 2
                                            RewardBoss = "Reward:\n$10,000\n1,000,000 Exp."
                                            CFrameBoss = CFrame.new(5206.92578, 0.997753382, 814.976746, 0.342041343, - 0.00062915677, 0.939684749, 0.00191645394, 0.999998152, - 0.000028042234, - 0.939682961, 0.00181045406, 0.342041939)
                                            CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, - 0.731384635, 0, 0.681965172, 0, 1, 0, - 0.681965172, 0, - 0.731384635)
                                        end
                                    else
                                        BossMon = "Warden"
                                        NameBoss = "Warden"
                                        NameQuestBoss = "ImpelQuest"
                                        QuestLvBoss = 1
                                        RewardBoss = "Reward:\n$6,000\n850,000 Exp."
                                        CFrameBoss = CFrame.new(5278.04932, 2.15167475, 944.101929, 0.220546961, - 4.499464e-6, 0.975376427, - 0.000019541258, 1, 9.031621e-6, - 0.975376427, - 0.000021051976, 0.220546961)
                                        CFrameQBoss = CFrame.new(5191.86133, 2.84020686, 686.438721, - 0.731384635, 0, 0.681965172, 0, 1, 0, - 0.681965172, 0, - 0.731384635)
                                    end
                                else
                                    NameBoss = "Saber Expert"
                                    BossMon = "Saber Expert"
                                    CFrameBoss = CFrame.new(- 1458.89502, 29.8870335, - 50.633564)
                                end
                            else
                                BossMon = "Vice Admiral"
                                NameBoss = "Vice Admiral"
                                NameQuestBoss = "MarineQuest2"
                                QuestLvBoss = 2
                                RewardBoss = "Reward:\n$10,000\n180,000 Exp."
                                CFrameQBoss = CFrame.new(- 5036.2465820313, 28.677835464478, 4324.56640625)
                                CFrameBoss = CFrame.new(- 5006.5454101563, 88.032081604004, 4353.162109375)
                            end
                        else
                            BossMon = "Mob Leader"
                            NameBoss = "Mob Leader"
                            CFrameBoss = CFrame.new(- 2844.7307128906, 7.4180502891541, 5356.6723632813)
                        end
                    else
                        BossMon = "Yeti"
                        NameBoss = "Yeti"
                        NameQuestBoss = "SnowQuest"
                        QuestLvBoss = 3
                        RewardBoss = "Reward:\n$10,000\n180,000 Exp."
                        CFrameQBoss = CFrame.new(1386.8073730469, 87.272789001465, - 1298.3576660156)
                        CFrameBoss = CFrame.new(1218.7956542969, 138.01184082031, - 1488.0262451172)
                    end
                else
                    BossMon = "The Saw"
                    NameBoss = "The Saw"
                    CFrameBoss = CFrame.new(- 784.89715576172, 72.427383422852, 1603.5822753906)
                end
            else
                BossMon = "Bobby"
                NameBoss = "Bobby"
                NameQuestBoss = "BuggyQuest1"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$8,000\n35,000 Exp."
                CFrameQBoss = CFrame.new(- 1140.1761474609, 4.752049446106, 3827.4057617188)
                CFrameBoss = CFrame.new(- 1087.3760986328, 46.949409484863, 4040.1462402344)
            end
        else
            BossMon = "The Gorilla King"
            NameBoss = "The Gorrila King"
            NameQuestBoss = "JungleQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$2,000\n7,000 Exp."
            CFrameQBoss = CFrame.new(- 1601.6553955078, 36.85213470459, 153.38809204102)
            CFrameBoss = CFrame.new(- 1088.75977, 8.13463783, - 488.559906, - 0.707134247, 0, 0.707079291, 0, 1, 0, - 0.707079291, 0, - 0.707134247)
        end
    end
    if Sea2 then
        if SelectBoss ~= "Diamond" then
            if SelectBoss ~= "Jeremy" then
                if SelectBoss ~= "Fajita" then
                    if SelectBoss ~= "Don Swan" then
                        if SelectBoss ~= "Smoke Admiral" then
                            if SelectBoss ~= "Awakened Ice Admiral" then
                                if SelectBoss ~= "Tide Keeper" then
                                    if SelectBoss ~= "Darkbeard" then
                                        if SelectBoss ~= "Cursed Captain" then
                                            if SelectBoss == "Order" then
                                                BossMon = "Order"
                                                NameBoss = "Order"
                                                CFrameBoss = CFrame.new(- 6217.2021484375, 28.047645568848, - 5053.1357421875)
                                            end
                                        else
                                            BossMon = "Cursed Captain"
                                            NameBoss = "Cursed Captain"
                                            CFrameBoss = CFrame.new(916.928589, 181.092773, 33422)
                                        end
                                    else
                                        BossMon = "Darkbeard"
                                        NameBoss = "Darkbeard"
                                        CFrameMon = CFrame.new(3677.08203125, 62.751937866211, - 3144.8332519531)
                                    end
                                else
                                    BossMon = "Tide Keeper"
                                    NameBoss = "Tide Keeper"
                                    NameQuestBoss = "ForgottenQuest"
                                    QuestLvBoss = 3
                                    RewardBoss = "Reward:\n$12,500\n38,000,000 Exp."
                                    CFrameQBoss = CFrame.new(- 3053.9814453125, 237.18954467773, - 10145.0390625)
                                    CFrameBoss = CFrame.new(- 3795.6423339844, 105.88877105713, - 11421.307617188)
                                end
                            else
                                BossMon = "Awakened Ice Admiral"
                                NameBoss = "Awakened Ice Admiral"
                                NameQuestBoss = "FrostQuest"
                                QuestLvBoss = 3
                                RewardBoss = "Reward:\n$20,000\n36,000,000 Exp."
                                CFrameQBoss = CFrame.new(5668.9780273438, 28.519989013672, - 6483.3520507813)
                                CFrameBoss = CFrame.new(6403.5439453125, 340.29766845703, - 6894.5595703125)
                            end
                        else
                            BossMon = "Smoke Admiral"
                            NameBoss = "Smoke Admiral"
                            NameQuestBoss = "IceSideQuest"
                            QuestLvBoss = 3
                            RewardBoss = "Reward:\n$20,000\n25,000,000 Exp."
                            CFrameQBoss = CFrame.new(- 5429.0473632813, 15.977565765381, - 5297.9614257813)
                            CFrameBoss = CFrame.new(- 5275.1987304688, 20.757257461548, - 5260.6669921875)
                        end
                    else
                        BossMon = "Don Swan"
                        NameBoss = "Don Swan"
                        CFrameBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
                    end
                else
                    BossMon = "Fajita"
                    NameBoss = "Fajita"
                    NameQuestBoss = "MarineQuest3"
                    QuestLvBoss = 3
                    RewardBoss = "Reward:\n$25,000\n15,000,000 Exp."
                    CFrameQBoss = CFrame.new(- 2441.986328125, 73.359344482422, - 3217.5324707031)
                    CFrameBoss = CFrame.new(- 2172.7399902344, 103.32216644287, - 4015.025390625)
                end
            else
                BossMon = "Jeremy"
                NameBoss = "Jeremy"
                NameQuestBoss = "Area2Quest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$25,000\n11,500,000 Exp."
                CFrameQBoss = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
                CFrameBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
            end
        else
            BossMon = "Diamond"
            NameBoss = "Diamond"
            NameQuestBoss = "Area1Quest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n9,000,000 Exp."
            CFrameQBoss = CFrame.new(- 427.5666809082, 73.313781738281, 1835.4208984375)
            CFrameBoss = CFrame.new(- 1576.7166748047, 198.59265136719, 13.724286079407)
        end
    end
    if Sea3 then
        if SelectBoss ~= "Stone" then
            if SelectBoss ~= "Hydra Leader" then
                if SelectBoss ~= "Kilo Admiral" then
                    if SelectBoss ~= "Captain Elephant" then
                        if SelectBoss ~= "Beautiful Pirate" then
                            if SelectBoss ~= "Cake Queen" then
                                if SelectBoss ~= "Longma" then
                                    if SelectBoss ~= "Soul Reaper" then
                                        if SelectBoss == "rip_indra True Form" then
                                            BossMon = "rip_indra True Form"
                                            NameBoss = "rip_indra True Form"
                                            CFrameBoss = CFrame.new(- 5415.3920898438, 505.74133300781, - 2814.0166015625)
                                        end
                                    else
                                        BossMon = "Soul Reaper"
                                        NameBoss = "Soul Reaper"
                                        CFrameBoss = CFrame.new(- 9524.7890625, 315.80429077148, 6655.7192382813)
                                    end
                                else
                                    BossMon = "Longma"
                                    NameBoss = "Longma"
                                    CFrameBoss = CFrame.new(- 10238.875976563, 389.7912902832, - 9549.7939453125)
                                end
                            else
                                BossMon = "Cake Queen"
                                NameBoss = "Cake Queen"
                                NameQuestBoss = "IceCreamIslandQuest"
                                QuestLvBoss = 3
                                RewardBoss = "Reward:\n$30,000\n112,500,000 Exp."
                                CFrameQBoss = CFrame.new(- 819.376709, 64.9259796, - 10967.2832, - 0.766061664, 0, 0.642767608, 0, 1, 0, - 0.642767608, 0, - 0.766061664)
                                CFrameBoss = CFrame.new(- 678.648804, 381.353943, - 11114.2012, - 0.908641815, 0.00149294338, 0.41757378, 0.00837114919, 0.999857843, 0.0146408929, - 0.417492568, 0.0167988986, - 0.90852499)
                            end
                        else
                            BossMon = "Beautiful Pirate"
                            NameBoss = "Beautiful Pirate"
                            NameQuestBoss = "DeepForestIsland2"
                            QuestLvBoss = 3
                            RewardBoss = "Reward:\n$50,000\n70,000,000 Exp."
                            CFrameQBoss = CFrame.new(- 12682.096679688, 390.88653564453, - 9902.1240234375)
                            CFrameBoss = CFrame.new(5283.609375, 22.56223487854, - 110.78285217285)
                        end
                    else
                        BossMon = "Captain Elephant"
                        NameBoss = "Captain Elephant"
                        NameQuestBoss = "DeepForestIsland"
                        QuestLvBoss = 3
                        RewardBoss = "Reward:\n$40,000\n67,000,000 Exp."
                        CFrameQBoss = CFrame.new(- 13232.682617188, 332.40396118164, - 7626.01171875)
                        CFrameBoss = CFrame.new(- 13376.7578125, 433.28689575195, - 8071.392578125)
                    end
                else
                    BossMon = "Kilo Admiral"
                    NameBoss = "Kilo Admiral"
                    NameQuestBoss = "MarineTreeIsland"
                    QuestLvBoss = 3
                    RewardBoss = "Reward:\n$35,000\n56,000,000 Exp."
                    CFrameQBoss = CFrame.new(2179.3010253906, 28.731239318848, - 6739.9741210938)
                    CFrameBoss = CFrame.new(2764.2233886719, 432.46154785156, - 7144.4580078125)
                end
            else
                BossMon = "Hydra Leader"
                NameBoss = "Hydra Leader"
                NameQuestBoss = "VenomCrewQuest"
                QuestLvBoss = 3
                RewardBoss = "Reward:\n$30,000\n52,000,000 Exp."
                CFrameQBoss = CFrame.new(5445.9541015625, 601.62945556641, 751.43792724609)
                CFrameBoss = CFrame.new(5543.86328125, 668.97399902344, 199.0341796875)
            end
        else
            BossMon = "Stone"
            NameBoss = "Stone"
            NameQuestBoss = "PiratePortQuest"
            QuestLvBoss = 3
            RewardBoss = "Reward:\n$25,000\n40,000,000 Exp."
            CFrameQBoss = CFrame.new(- 289.76705932617, 43.819011688232, 5579.9384765625)
            CFrameBoss = CFrame.new(- 1027.6512451172, 92.404174804688, 6578.8530273438)
        end
    end
end
function MaterialMon()
    if SelectMaterial ~= "Radioactive Material" then
        if SelectMaterial ~= "Mystic Droplet" then
            if SelectMaterial ~= "Magma Ore" then
                if SelectMaterial ~= "Angel Wings" then
                    if SelectMaterial ~= "Leather" then
                        if SelectMaterial ~= "Scrap Metal" then
                            if SelectMaterial ~= "Fish Tail" then
                                if SelectMaterial ~= "Demonic Wisp" then
                                    if SelectMaterial ~= "Vampire Fang" then
                                        if SelectMaterial ~= "Conjured Cocoa" then
                                            if SelectMaterial ~= "Dragon Scale" then
                                                if SelectMaterial ~= "Gunpowder" then
                                                    if SelectMaterial ~= "Hydra Enforcer" then
                                                        if SelectMaterial ~= "Venomous Assailant" then
                                                            if SelectMaterial == "Mini Tusk" then
                                                                MMon = "Mythological Pirate"
                                                                MPos = CFrame.new()
                                                                SP = "Default"
                                                            end
                                                        else
                                                            MMon = "Venomous Assailant"
                                                            MPos = CFrame.new(4879.92041015625, 1089.46142578125, 1104.00830078125)
                                                            SP = "Default"
                                                        end
                                                    else
                                                        MMon = "Hydra Enforcer"
                                                        MPos = CFrame.new(4581.517578125, 1001.55908203125, 704.9378662109375)
                                                        SP = "Default"
                                                    end
                                                else
                                                    MMon = "Pistol Billionaire"
                                                    MPos = CFrame.new(- 469, 74, 5904)
                                                    SP = "Default"
                                                end
                                            else
                                                MMon = "Dragon Crew Archer"
                                                MPos = CFrame.new(6827.91455078125, 609.4127197265625, 252.3538055419922)
                                                SP = "Default"
                                            end
                                        else
                                            MMon = "Chocolate Bar Battler"
                                            MPos = CFrame.new(620.6344604492188, 78.93644714355469, - 12581.369140625)
                                            SP = "Default"
                                        end
                                    else
                                        MMon = "Vampire"
                                        MPos = CFrame.new(- 6033, 7, - 1317)
                                        SP = "Default"
                                    end
                                else
                                    MMon = "Demonic Soul"
                                    MPos = CFrame.new(- 9507, 172, 6158)
                                    SP = "Default"
                                end
                            elseif Sea3 then
                                MMon = "Fishman Raider"
                                MPos = CFrame.new(- 10993, 332, - 8940)
                                SP = "Default"
                            elseif Sea1 then
                                MMon = "Fishman Warrior"
                                MPos = CFrame.new(61123, 19, 1569)
                                SP = "Default"
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875)).Magnitude >= 17000 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 5.342342376708984, 1819.7841796875))
                                end
                            end
                        elseif Sea1 then
                            MMon = "Brute"
                            MPos = CFrame.new(- 1145, 15, 4350)
                            SP = "Default"
                        elseif Sea2 then
                            MMon = "Swan Pirate"
                            MPos = CFrame.new(878, 122, 1235)
                            SP = "Default"
                        elseif Sea3 then
                            MMon = "Jungle Pirate"
                            MPos = CFrame.new(- 12107, 332, - 10549)
                            SP = "Default"
                        end
                    elseif Sea1 then
                        MMon = "Brute"
                        MPos = CFrame.new(- 1145, 15, 4350)
                        SP = "Default"
                    elseif Sea2 then
                        MMon = "Marine Captain"
                        MPos = CFrame.new(- 2010.5059814453125, 73.00115966796875, - 3326.620849609375)
                        SP = "Default"
                    elseif Sea3 then
                        MMon = "Jungle Pirate"
                        MPos = CFrame.new(- 11975.78515625, 331.7734069824219, - 10620.0302734375)
                        SP = "Default"
                    end
                else
                    MMon = "God\'s Guard"
                    MPos = CFrame.new(- 4698, 845, - 1912)
                    SP = "Default"
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 7859.09814, 5544.19043, - 381.476196)).Magnitude >= 5000 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7859.09814, 5544.19043, - 381.476196))
                    end
                end
            elseif Sea1 then
                MMon = "Military Spy"
                MPos = CFrame.new(- 5815, 84, 8820)
                SP = "Default"
            elseif Sea2 then
                MMon = "Magma Ninja"
                MPos = CFrame.new(- 5428, 78, - 5959)
                SP = "Default"
            end
        else
            MMon = "Water Fighter"
            MPos = CFrame.new(- 3385, 239, - 10542)
            SP = "Default"
        end
    else
        MMon = "Factory Staff"
        MPos = CFrame.new(295, 73, - 56)
        SP = "Default"
    end
end
function UpdateIslandESP()
    local v117, v118, v119 = pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren())
    while true do
        local vu120
        v119, vu120 = v117(v118, v119)
        if v119 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu120
            if IslandESP then
                if vu120.Name ~= "Sea" then
                    if vu120:FindFirstChild("NameEsp") then
                        vu120.NameEsp.TextLabel.Text = vu120.Name .. "   \n" .. round((game:GetService("Players").LocalPlayer.Character.Head.Position - vu120.Position).Magnitude / 3) .. " Distance"
                    else
                        local v121 = Instance.new("BillboardGui", vu120)
                        v121.Name = "NameEsp"
                        v121.ExtentsOffset = Vector3.new(0, 1, 0)
                        v121.Size = UDim2.new(1, 200, 1, 30)
                        v121.Adornee = vu120
                        v121.AlwaysOnTop = true
                        local v122 = Instance.new("TextLabel", v121)
                        v122.Font = "GothamBold"
                        v122.FontSize = "Size14"
                        v122.TextWrapped = true
                        v122.Size = UDim2.new(1, 0, 1, 0)
                        v122.TextYAlignment = "Top"
                        v122.BackgroundTransparency = 1
                        v122.TextStrokeTransparency = 0.5
                        v122.TextColor3 = Color3.fromRGB(8, 0, 0)
                    end
                end
            elseif vu120:FindFirstChild("NameEsp") then
                vu120:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
function isnil(p123)
    return p123 == nil
end
local function vu125(p124)
    return math.floor(tonumber(p124) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
	-- upvalues: (ref) vu125
    local v126, v127, v128 = pairs(game:GetService("Players"):GetChildren())
    while true do
        local vu129
        v128, vu129 = v126(v127, v128)
        if v128 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu129, (ref) vu125
            if not isnil(vu129.Character) then
                if ESPPlayer then
                    if isnil(vu129.Character.Head) or vu129.Character.Head:FindFirstChild("NameEsp" .. Number) then
                        vu129.Character.Head["NameEsp" .. Number].TextLabel.Text = vu129.Name .. " | " .. vu125((game:GetService("Players").LocalPlayer.Character.Head.Position - vu129.Character.Head.Position).Magnitude / 3) .. " Distance\nHealth : " .. vu125(vu129.Character.Humanoid.Health * 100 / vu129.Character.Humanoid.MaxHealth) .. "%"
                    else
                        local v130 = Instance.new("BillboardGui", vu129.Character.Head)
                        v130.Name = "NameEsp" .. Number
                        v130.ExtentsOffset = Vector3.new(0, 1, 0)
                        v130.Size = UDim2.new(1, 200, 1, 30)
                        v130.Adornee = vu129.Character.Head
                        v130.AlwaysOnTop = true
                        local v131 = Instance.new("TextLabel", v130)
                        v131.Font = Enum.Font.GothamSemibold
                        v131.FontSize = "Size10"
                        v131.TextWrapped = true
                        v131.Text = vu129.Name .. " \n" .. vu125((game:GetService("Players").LocalPlayer.Character.Head.Position - vu129.Character.Head.Position).Magnitude / 3) .. " Distance"
                        v131.Size = UDim2.new(1, 0, 1, 0)
                        v131.TextYAlignment = "Top"
                        v131.BackgroundTransparency = 1
                        v131.TextStrokeTransparency = 0.5
                        if vu129.Team ~= game.Players.LocalPlayer.Team then
                            v131.TextColor3 = Color3.new(255, 0, 0)
                        else
                            v131.TextColor3 = Color3.new(0, 0, 254)
                        end
                    end
                elseif vu129.Character.Head:FindFirstChild("NameEsp" .. Number) then
                    vu129.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateChestChams()
	-- upvalues: (ref) vu125
    local v132, v133, v134 = pairs(game.Workspace:GetChildren())
    while true do
        local vu135
        v134, vu135 = v132(v133, v134)
        if v134 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu135, (ref) vu125
            if string.find(vu135.Name, "Chest") then
                if ChestESP then
                    if string.find(vu135.Name, "Chest") then
                        if vu135:FindFirstChild("NameEsp" .. Number) then
                            vu135["NameEsp" .. Number].TextLabel.Text = vu135.Name .. "   \n" .. vu125((game:GetService("Players").LocalPlayer.Character.Head.Position - vu135.Position).Magnitude / 3) .. " Distance"
                        else
                            local v136 = Instance.new("BillboardGui", vu135)
                            v136.Name = "NameEsp" .. Number
                            v136.ExtentsOffset = Vector3.new(0, 1, 0)
                            v136.Size = UDim2.new(1, 200, 1, 30)
                            v136.Adornee = vu135
                            v136.AlwaysOnTop = true
                            local v137 = Instance.new("TextLabel", v136)
                            v137.Font = Enum.Font.GothamSemibold
                            v137.FontSize = "Size14"
                            v137.TextWrapped = true
                            v137.Size = UDim2.new(1, 0, 1, 0)
                            v137.TextYAlignment = "Top"
                            v137.BackgroundTransparency = 1
                            v137.TextStrokeTransparency = 0.5
                            if vu135.Name == "Chest1" then
                                v137.TextColor3 = Color3.fromRGB(109, 109, 109)
                                v137.Text = "Chest 1" .. " \n" .. vu125((game:GetService("Players").LocalPlayer.Character.Head.Position - vu135.Position).Magnitude / 3) .. " Distance"
                            end
                            if vu135.Name == "Chest2" then
                                v137.TextColor3 = Color3.fromRGB(173, 158, 21)
                                v137.Text = "Chest 2" .. " \n" .. vu125((game:GetService("Players").LocalPlayer.Character.Head.Position - vu135.Position).Magnitude / 3) .. " Distance"
                            end
                            if vu135.Name == "Chest3" then
                                v137.TextColor3 = Color3.fromRGB(85, 255, 255)
                                v137.Text = "Chest 3" .. " \n" .. vu125((game:GetService("Players").LocalPlayer.Character.Head.Position - vu135.Position).Magnitude / 3) .. " Distance"
                            end
                        end
                    end
                elseif vu135:FindFirstChild("NameEsp" .. Number) then
                    vu135:FindFirstChild("NameEsp" .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateDevilChams()
	-- upvalues: (ref) vu125
    local v138, v139, v140 = pairs(game.Workspace:GetChildren())
    while true do
        local vu141
        v140, vu141 = v138(v139, v140)
        if v140 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu141, (ref) vu125
            if DevilFruitESP then
                if string.find(vu141.Name, "Fruit") then
                    if vu141.Handle:FindFirstChild("NameEsp" .. Number) then
                        vu141.Handle["NameEsp" .. Number].TextLabel.Text = vu141.Name .. "   \n" .. vu125((game:GetService("Players").LocalPlayer.Character.Head.Position - vu141.Handle.Position).Magnitude / 3) .. " Distance"
                    else
                        local v142 = Instance.new("BillboardGui", vu141.Handle)
                        v142.Name = "NameEsp" .. Number
                        v142.ExtentsOffset = Vector3.new(0, 1, 0)
                        v142.Size = UDim2.new(1, 200, 1, 30)
                        v142.Adornee = vu141.Handle
                        v142.AlwaysOnTop = true
                        local v143 = Instance.new("TextLabel", v142)
                        v143.Font = Enum.Font.GothamSemibold
                        v143.FontSize = "Size14"
                        v143.TextWrapped = true
                        v143.Size = UDim2.new(1, 0, 1, 0)
                        v143.TextYAlignment = "Top"
                        v143.BackgroundTransparency = 1
                        v143.TextStrokeTransparency = 0.5
                        v143.TextColor3 = Color3.fromRGB(255, 255, 255)
                        v143.Text = vu141.Name .. " \n" .. vu125((game:GetService("Players").LocalPlayer.Character.Head.Position - vu141.Handle.Position).Magnitude / 3) .. " Distance"
                    end
                end
            elseif vu141.Handle:FindFirstChild("NameEsp" .. Number) then
                vu141.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end)
    end
end
function UpdateFlowerChams()
	-- upvalues: (ref) vu125
    local v144, v145, v146 = pairs(game.Workspace:GetChildren())
    while true do
        local vu147
        v146, vu147 = v144(v145, v146)
        if v146 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu147, (ref) vu125
            if vu147.Name == "Flower2" or vu147.Name == "Flower1" then
                if FlowerESP then
                    if vu147:FindFirstChild("NameEsp" .. Number) then
                        vu147["NameEsp" .. Number].TextLabel.Text = vu147.Name .. "   \n" .. vu125((game:GetService("Players").LocalPlayer.Character.Head.Position - vu147.Position).Magnitude / 3) .. " Distance"
                    else
                        local v148 = Instance.new("BillboardGui", vu147)
                        v148.Name = "NameEsp" .. Number
                        v148.ExtentsOffset = Vector3.new(0, 1, 0)
                        v148.Size = UDim2.new(1, 200, 1, 30)
                        v148.Adornee = vu147
                        v148.AlwaysOnTop = true
                        local v149 = Instance.new("TextLabel", v148)
                        v149.Font = Enum.Font.GothamSemibold
                        v149.FontSize = "Size14"
                        v149.TextWrapped = true
                        v149.Size = UDim2.new(1, 0, 1, 0)
                        v149.TextYAlignment = "Top"
                        v149.BackgroundTransparency = 1
                        v149.TextStrokeTransparency = 0.5
                        v149.TextColor3 = Color3.fromRGB(255, 0, 0)
                        if vu147.Name == "Flower1" then
                            v149.Text = "Blue Flower" .. " \n" .. vu125((game:GetService("Players").LocalPlayer.Character.Head.Position - vu147.Position).Magnitude / 3) .. " Distance"
                            v149.TextColor3 = Color3.fromRGB(0, 0, 255)
                        end
                        if vu147.Name == "Flower2" then
                            v149.Text = "Red Flower" .. " \n" .. vu125((game:GetService("Players").LocalPlayer.Character.Head.Position - vu147.Position).Magnitude / 3) .. " Distance"
                            v149.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    end
                elseif vu147:FindFirstChild("NameEsp" .. Number) then
                    vu147:FindFirstChild("NameEsp" .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateRealFruitChams()
	-- upvalues: (ref) vu125
    local v150, v151, v152 = pairs(game.Workspace.AppleSpawner:GetChildren())
    while true do
        local v153
        v152, v153 = v150(v151, v152)
        if v152 == nil then
            break
        end
        if v153:IsA("Tool") then
            if RealFruitESP then
                if v153.Handle:FindFirstChild("NameEsp" .. Number) then
                    v153.Handle["NameEsp" .. Number].TextLabel.Text = v153.Name .. " " .. vu125((game:GetService("Players").LocalPlayer.Character.Head.Position - v153.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    local v154 = Instance.new("BillboardGui", v153.Handle)
                    v154.Name = "NameEsp" .. Number
                    v154.ExtentsOffset = Vector3.new(0, 1, 0)
                    v154.Size = UDim2.new(1, 200, 1, 30)
                    v154.Adornee = v153.Handle
                    v154.AlwaysOnTop = true
                    local v155 = Instance.new("TextLabel", v154)
                    v155.Font = Enum.Font.GothamSemibold
                    v155.FontSize = "Size14"
                    v155.TextWrapped = true
                    v155.Size = UDim2.new(1, 0, 1, 0)
                    v155.TextYAlignment = "Top"
                    v155.BackgroundTransparency = 1
                    v155.TextStrokeTransparency = 0.5
                    v155.TextColor3 = Color3.fromRGB(255, 0, 0)
                    v155.Text = v153.Name .. " \n" .. vu125((game:GetService("Players").LocalPlayer.Character.Head.Position - v153.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v153.Handle:FindFirstChild("NameEsp" .. Number) then
                v153.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
    local v156, v157, v158 = pairs(game.Workspace.PineappleSpawner:GetChildren())
    while true do
        local v159
        v158, v159 = v156(v157, v158)
        if v158 == nil then
            break
        end
        if v159:IsA("Tool") then
            if RealFruitESP then
                if v159.Handle:FindFirstChild("NameEsp" .. Number) then
                    v159.Handle["NameEsp" .. Number].TextLabel.Text = v159.Name .. " " .. vu125((game:GetService("Players").LocalPlayer.Character.Head.Position - v159.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    local v160 = Instance.new("BillboardGui", v159.Handle)
                    v160.Name = "NameEsp" .. Number
                    v160.ExtentsOffset = Vector3.new(0, 1, 0)
                    v160.Size = UDim2.new(1, 200, 1, 30)
                    v160.Adornee = v159.Handle
                    v160.AlwaysOnTop = true
                    local v161 = Instance.new("TextLabel", v160)
                    v161.Font = Enum.Font.GothamSemibold
                    v161.FontSize = "Size14"
                    v161.TextWrapped = true
                    v161.Size = UDim2.new(1, 0, 1, 0)
                    v161.TextYAlignment = "Top"
                    v161.BackgroundTransparency = 1
                    v161.TextStrokeTransparency = 0.5
                    v161.TextColor3 = Color3.fromRGB(255, 174, 0)
                    v161.Text = v159.Name .. " \n" .. vu125((game:GetService("Players").LocalPlayer.Character.Head.Position - v159.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v159.Handle:FindFirstChild("NameEsp" .. Number) then
                v159.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
    local v162, v163, v164 = pairs(game.Workspace.BananaSpawner:GetChildren())
    while true do
        local v165
        v164, v165 = v162(v163, v164)
        if v164 == nil then
            break
        end
        if v165:IsA("Tool") then
            if RealFruitESP then
                if v165.Handle:FindFirstChild("NameEsp" .. Number) then
                    v165.Handle["NameEsp" .. Number].TextLabel.Text = v165.Name .. " " .. vu125((game:GetService("Players").LocalPlayer.Character.Head.Position - v165.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    local v166 = Instance.new("BillboardGui", v165.Handle)
                    v166.Name = "NameEsp" .. Number
                    v166.ExtentsOffset = Vector3.new(0, 1, 0)
                    v166.Size = UDim2.new(1, 200, 1, 30)
                    v166.Adornee = v165.Handle
                    v166.AlwaysOnTop = true
                    local v167 = Instance.new("TextLabel", v166)
                    v167.Font = Enum.Font.GothamSemibold
                    v167.FontSize = "Size14"
                    v167.TextWrapped = true
                    v167.Size = UDim2.new(1, 0, 1, 0)
                    v167.TextYAlignment = "Top"
                    v167.BackgroundTransparency = 1
                    v167.TextStrokeTransparency = 0.5
                    v167.TextColor3 = Color3.fromRGB(251, 255, 0)
                    v167.Text = v165.Name .. " \n" .. vu125((game:GetService("Players").LocalPlayer.Character.Head.Position - v165.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v165.Handle:FindFirstChild("NameEsp" .. Number) then
                v165.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
end
function UpdateIslandESP()
	-- upvalues: (ref) vu125
    local v168, v169, v170 = pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren())
    while true do
        local vu171
        v170, vu171 = v168(v169, v170)
        if v170 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu171, (ref) vu125
            if IslandESP then
                if vu171.Name ~= "Sea" then
                    if vu171:FindFirstChild("NameEsp") then
                        vu171.NameEsp.TextLabel.Text = vu171.Name .. "   \n" .. vu125((game:GetService("Players").LocalPlayer.Character.Head.Position - vu171.Position).Magnitude / 3) .. " Distance"
                    else
                        local v172 = Instance.new("BillboardGui", vu171)
                        v172.Name = "NameEsp"
                        v172.ExtentsOffset = Vector3.new(0, 1, 0)
                        v172.Size = UDim2.new(1, 200, 1, 30)
                        v172.Adornee = vu171
                        v172.AlwaysOnTop = true
                        local v173 = Instance.new("TextLabel", v172)
                        v173.Font = "GothamBold"
                        v173.FontSize = "Size14"
                        v173.TextWrapped = true
                        v173.Size = UDim2.new(1, 0, 1, 0)
                        v173.TextYAlignment = "Top"
                        v173.BackgroundTransparency = 1
                        v173.TextStrokeTransparency = 0.5
                        v173.TextColor3 = Color3.fromRGB(7, 236, 240)
                    end
                end
            elseif vu171:FindFirstChild("NameEsp") then
                vu171:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
function isnil(p174)
    return p174 == nil
end
local function vu176(p175)
    return math.floor(tonumber(p175) + 0.5)
end
Number = math.random(1, 1000000)
function UpdatePlayerChams()
	-- upvalues: (ref) vu176
    local v177, v178, v179 = pairs(game:GetService("Players"):GetChildren())
    while true do
        local vu180
        v179, vu180 = v177(v178, v179)
        if v179 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu180, (ref) vu176
            if not isnil(vu180.Character) then
                if ESPPlayer then
                    if isnil(vu180.Character.Head) or vu180.Character.Head:FindFirstChild("NameEsp" .. Number) then
                        vu180.Character.Head["NameEsp" .. Number].TextLabel.Text = vu180.Name .. " | " .. vu176((game:GetService("Players").LocalPlayer.Character.Head.Position - vu180.Character.Head.Position).Magnitude / 3) .. " Distance\nHealth : " .. vu176(vu180.Character.Humanoid.Health * 100 / vu180.Character.Humanoid.MaxHealth) .. "%"
                    else
                        local v181 = Instance.new("BillboardGui", vu180.Character.Head)
                        v181.Name = "NameEsp" .. Number
                        v181.ExtentsOffset = Vector3.new(0, 1, 0)
                        v181.Size = UDim2.new(1, 200, 1, 30)
                        v181.Adornee = vu180.Character.Head
                        v181.AlwaysOnTop = true
                        local v182 = Instance.new("TextLabel", v181)
                        v182.Font = Enum.Font.GothamSemibold
                        v182.FontSize = "Size14"
                        v182.TextWrapped = true
                        v182.Text = vu180.Name .. " \n" .. vu176((game:GetService("Players").LocalPlayer.Character.Head.Position - vu180.Character.Head.Position).Magnitude / 3) .. " Distance"
                        v182.Size = UDim2.new(1, 0, 1, 0)
                        v182.TextYAlignment = "Top"
                        v182.BackgroundTransparency = 1
                        v182.TextStrokeTransparency = 0.5
                        if vu180.Team ~= game.Players.LocalPlayer.Team then
                            v182.TextColor3 = Color3.new(255, 0, 0)
                        else
                            v182.TextColor3 = Color3.new(0, 255, 0)
                        end
                    end
                elseif vu180.Character.Head:FindFirstChild("NameEsp" .. Number) then
                    vu180.Character.Head:FindFirstChild("NameEsp" .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateChestChams()
	-- upvalues: (ref) vu176
    local v183, v184, v185 = pairs(game.Workspace:GetChildren())
    while true do
        local vu186
        v185, vu186 = v183(v184, v185)
        if v185 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu186, (ref) vu176
            if string.find(vu186.Name, "Chest") then
                if ChestESP then
                    if string.find(vu186.Name, "Chest") then
                        if vu186:FindFirstChild("NameEsp" .. Number) then
                            vu186["NameEsp" .. Number].TextLabel.Text = vu186.Name .. "   \n" .. vu176((game:GetService("Players").LocalPlayer.Character.Head.Position - vu186.Position).Magnitude / 3) .. " Distance"
                        else
                            local v187 = Instance.new("BillboardGui", vu186)
                            v187.Name = "NameEsp" .. Number
                            v187.ExtentsOffset = Vector3.new(0, 1, 0)
                            v187.Size = UDim2.new(1, 200, 1, 30)
                            v187.Adornee = vu186
                            v187.AlwaysOnTop = true
                            local v188 = Instance.new("TextLabel", v187)
                            v188.Font = Enum.Font.GothamSemibold
                            v188.FontSize = "Size14"
                            v188.TextWrapped = true
                            v188.Size = UDim2.new(1, 0, 1, 0)
                            v188.TextYAlignment = "Top"
                            v188.BackgroundTransparency = 1
                            v188.TextStrokeTransparency = 0.5
                            if vu186.Name == "Chest1" then
                                v188.TextColor3 = Color3.fromRGB(109, 109, 109)
                                v188.Text = "Chest 1" .. " \n" .. vu176((game:GetService("Players").LocalPlayer.Character.Head.Position - vu186.Position).Magnitude / 3) .. " Distance"
                            end
                            if vu186.Name == "Chest2" then
                                v188.TextColor3 = Color3.fromRGB(173, 158, 21)
                                v188.Text = "Chest 2" .. " \n" .. vu176((game:GetService("Players").LocalPlayer.Character.Head.Position - vu186.Position).Magnitude / 3) .. " Distance"
                            end
                            if vu186.Name == "Chest3" then
                                v188.TextColor3 = Color3.fromRGB(85, 255, 255)
                                v188.Text = "Chest 3" .. " \n" .. vu176((game:GetService("Players").LocalPlayer.Character.Head.Position - vu186.Position).Magnitude / 3) .. " Distance"
                            end
                        end
                    end
                elseif vu186:FindFirstChild("NameEsp" .. Number) then
                    vu186:FindFirstChild("NameEsp" .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateDevilChams()
	-- upvalues: (ref) vu176
    local v189, v190, v191 = pairs(game.Workspace:GetChildren())
    while true do
        local vu192
        v191, vu192 = v189(v190, v191)
        if v191 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu192, (ref) vu176
            if DevilFruitESP then
                if string.find(vu192.Name, "Fruit") then
                    if vu192.Handle:FindFirstChild("NameEsp" .. Number) then
                        vu192.Handle["NameEsp" .. Number].TextLabel.Text = vu192.Name .. "   \n" .. vu176((game:GetService("Players").LocalPlayer.Character.Head.Position - vu192.Handle.Position).Magnitude / 3) .. " Distance"
                    else
                        local v193 = Instance.new("BillboardGui", vu192.Handle)
                        v193.Name = "NameEsp" .. Number
                        v193.ExtentsOffset = Vector3.new(0, 1, 0)
                        v193.Size = UDim2.new(1, 200, 1, 30)
                        v193.Adornee = vu192.Handle
                        v193.AlwaysOnTop = true
                        local v194 = Instance.new("TextLabel", v193)
                        v194.Font = Enum.Font.GothamSemibold
                        v194.FontSize = "Size14"
                        v194.TextWrapped = true
                        v194.Size = UDim2.new(1, 0, 1, 0)
                        v194.TextYAlignment = "Top"
                        v194.BackgroundTransparency = 1
                        v194.TextStrokeTransparency = 0.5
                        v194.TextColor3 = Color3.fromRGB(255, 255, 255)
                        v194.Text = vu192.Name .. " \n" .. vu176((game:GetService("Players").LocalPlayer.Character.Head.Position - vu192.Handle.Position).Magnitude / 3) .. " Distance"
                    end
                end
            elseif vu192.Handle:FindFirstChild("NameEsp" .. Number) then
                vu192.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end)
    end
end
function UpdateFlowerChams()
	-- upvalues: (ref) vu176
    local v195, v196, v197 = pairs(game.Workspace:GetChildren())
    while true do
        local vu198
        v197, vu198 = v195(v196, v197)
        if v197 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu198, (ref) vu176
            if vu198.Name == "Flower2" or vu198.Name == "Flower1" then
                if FlowerESP then
                    if vu198:FindFirstChild("NameEsp" .. Number) then
                        vu198["NameEsp" .. Number].TextLabel.Text = vu198.Name .. "   \n" .. vu176((game:GetService("Players").LocalPlayer.Character.Head.Position - vu198.Position).Magnitude / 3) .. " Distance"
                    else
                        local v199 = Instance.new("BillboardGui", vu198)
                        v199.Name = "NameEsp" .. Number
                        v199.ExtentsOffset = Vector3.new(0, 1, 0)
                        v199.Size = UDim2.new(1, 200, 1, 30)
                        v199.Adornee = vu198
                        v199.AlwaysOnTop = true
                        local v200 = Instance.new("TextLabel", v199)
                        v200.Font = Enum.Font.GothamSemibold
                        v200.FontSize = "Size14"
                        v200.TextWrapped = true
                        v200.Size = UDim2.new(1, 0, 1, 0)
                        v200.TextYAlignment = "Top"
                        v200.BackgroundTransparency = 1
                        v200.TextStrokeTransparency = 0.5
                        v200.TextColor3 = Color3.fromRGB(255, 0, 0)
                        if vu198.Name == "Flower1" then
                            v200.Text = "Blue Flower" .. " \n" .. vu176((game:GetService("Players").LocalPlayer.Character.Head.Position - vu198.Position).Magnitude / 3) .. " Distance"
                            v200.TextColor3 = Color3.fromRGB(0, 0, 255)
                        end
                        if vu198.Name == "Flower2" then
                            v200.Text = "Red Flower" .. " \n" .. vu176((game:GetService("Players").LocalPlayer.Character.Head.Position - vu198.Position).Magnitude / 3) .. " Distance"
                            v200.TextColor3 = Color3.fromRGB(255, 0, 0)
                        end
                    end
                elseif vu198:FindFirstChild("NameEsp" .. Number) then
                    vu198:FindFirstChild("NameEsp" .. Number):Destroy()
                end
            end
        end)
    end
end
function UpdateRealFruitChams()
	-- upvalues: (ref) vu176
    local v201, v202, v203 = pairs(game.Workspace.AppleSpawner:GetChildren())
    while true do
        local v204
        v203, v204 = v201(v202, v203)
        if v203 == nil then
            break
        end
        if v204:IsA("Tool") then
            if RealFruitESP then
                if v204.Handle:FindFirstChild("NameEsp" .. Number) then
                    v204.Handle["NameEsp" .. Number].TextLabel.Text = v204.Name .. " " .. vu176((game:GetService("Players").LocalPlayer.Character.Head.Position - v204.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    local v205 = Instance.new("BillboardGui", v204.Handle)
                    v205.Name = "NameEsp" .. Number
                    v205.ExtentsOffset = Vector3.new(0, 1, 0)
                    v205.Size = UDim2.new(1, 200, 1, 30)
                    v205.Adornee = v204.Handle
                    v205.AlwaysOnTop = true
                    local v206 = Instance.new("TextLabel", v205)
                    v206.Font = Enum.Font.GothamSemibold
                    v206.FontSize = "Size14"
                    v206.TextWrapped = true
                    v206.Size = UDim2.new(1, 0, 1, 0)
                    v206.TextYAlignment = "Top"
                    v206.BackgroundTransparency = 1
                    v206.TextStrokeTransparency = 0.5
                    v206.TextColor3 = Color3.fromRGB(255, 0, 0)
                    v206.Text = v204.Name .. " \n" .. vu176((game:GetService("Players").LocalPlayer.Character.Head.Position - v204.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v204.Handle:FindFirstChild("NameEsp" .. Number) then
                v204.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
    local v207, v208, v209 = pairs(game.Workspace.PineappleSpawner:GetChildren())
    while true do
        local v210
        v209, v210 = v207(v208, v209)
        if v209 == nil then
            break
        end
        if v210:IsA("Tool") then
            if RealFruitESP then
                if v210.Handle:FindFirstChild("NameEsp" .. Number) then
                    v210.Handle["NameEsp" .. Number].TextLabel.Text = v210.Name .. " " .. vu176((game:GetService("Players").LocalPlayer.Character.Head.Position - v210.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    local v211 = Instance.new("BillboardGui", v210.Handle)
                    v211.Name = "NameEsp" .. Number
                    v211.ExtentsOffset = Vector3.new(0, 1, 0)
                    v211.Size = UDim2.new(1, 200, 1, 30)
                    v211.Adornee = v210.Handle
                    v211.AlwaysOnTop = true
                    local v212 = Instance.new("TextLabel", v211)
                    v212.Font = Enum.Font.GothamSemibold
                    v212.FontSize = "Size14"
                    v212.TextWrapped = true
                    v212.Size = UDim2.new(1, 0, 1, 0)
                    v212.TextYAlignment = "Top"
                    v212.BackgroundTransparency = 1
                    v212.TextStrokeTransparency = 0.5
                    v212.TextColor3 = Color3.fromRGB(255, 174, 0)
                    v212.Text = v210.Name .. " \n" .. vu176((game:GetService("Players").LocalPlayer.Character.Head.Position - v210.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v210.Handle:FindFirstChild("NameEsp" .. Number) then
                v210.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
    local v213, v214, v215 = pairs(game.Workspace.BananaSpawner:GetChildren())
    while true do
        local v216
        v215, v216 = v213(v214, v215)
        if v215 == nil then
            break
        end
        if v216:IsA("Tool") then
            if RealFruitESP then
                if v216.Handle:FindFirstChild("NameEsp" .. Number) then
                    v216.Handle["NameEsp" .. Number].TextLabel.Text = v216.Name .. " " .. vu176((game:GetService("Players").LocalPlayer.Character.Head.Position - v216.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    local v217 = Instance.new("BillboardGui", v216.Handle)
                    v217.Name = "NameEsp" .. Number
                    v217.ExtentsOffset = Vector3.new(0, 1, 0)
                    v217.Size = UDim2.new(1, 200, 1, 30)
                    v217.Adornee = v216.Handle
                    v217.AlwaysOnTop = true
                    local v218 = Instance.new("TextLabel", v217)
                    v218.Font = Enum.Font.GothamSemibold
                    v218.FontSize = "Size14"
                    v218.TextWrapped = true
                    v218.Size = UDim2.new(1, 0, 1, 0)
                    v218.TextYAlignment = "Top"
                    v218.BackgroundTransparency = 1
                    v218.TextStrokeTransparency = 0.5
                    v218.TextColor3 = Color3.fromRGB(251, 255, 0)
                    v218.Text = v216.Name .. " \n" .. vu176((game:GetService("Players").LocalPlayer.Character.Head.Position - v216.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v216.Handle:FindFirstChild("NameEsp" .. Number) then
                v216.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
end
spawn(function()
    while wait() do
        pcall(function()
            if MobESP then
                local v219, v220, v221 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                while true do
                    local v222
                    v221, v222 = v219(v220, v221)
                    if v221 == nil then
                        break
                    end
                    if v222:FindFirstChild("HumanoidRootPart") then
                        if not v222:FindFirstChild("MobEap") then
                            local v223 = Instance.new("BillboardGui")
                            local v224 = Instance.new("TextLabel")
                            v223.Parent = v222
                            v223.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            v223.Active = true
                            v223.Name = "MobEap"
                            v223.AlwaysOnTop = true
                            v223.LightInfluence = 1
                            v223.Size = UDim2.new(0, 200, 0, 50)
                            v223.StudsOffset = Vector3.new(0, 2.5, 0)
                            v224.Parent = v223
                            v224.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            v224.BackgroundTransparency = 1
                            v224.Size = UDim2.new(0, 200, 0, 50)
                            v224.Font = Enum.Font.GothamBold
                            v224.TextColor3 = Color3.fromRGB(7, 236, 240)
                            v224.Text.Size = 35
                        end
                        local v225 = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v222.HumanoidRootPart.Position).Magnitude)
                        v222.MobEap.TextLabel.Text = v222.Name .. "-" .. v225 .. " Distance"
                    end
                end
            else
                local v226, v227, v228 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                while true do
                    local v229
                    v228, v229 = v226(v227, v228)
                    if v228 == nil then
                        break
                    end
                    if v229:FindFirstChild("MobEap") then
                        v229.MobEap:Destroy()
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if SeaESP then
                local v230, v231, v232 = pairs(game:GetService("Workspace").SeaBeasts:GetChildren())
                while true do
                    local v233
                    v232, v233 = v230(v231, v232)
                    if v232 == nil then
                        break
                    end
                    if v233:FindFirstChild("HumanoidRootPart") then
                        if not v233:FindFirstChild("Seaesps") then
                            local v234 = Instance.new("BillboardGui")
                            local v235 = Instance.new("TextLabel")
                            v234.Parent = v233
                            v234.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            v234.Active = true
                            v234.Name = "Seaesps"
                            v234.AlwaysOnTop = true
                            v234.LightInfluence = 1
                            v234.Size = UDim2.new(0, 200, 0, 50)
                            v234.StudsOffset = Vector3.new(0, 2.5, 0)
                            v235.Parent = v234
                            v235.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            v235.BackgroundTransparency = 1
                            v235.Size = UDim2.new(0, 200, 0, 50)
                            v235.Font = Enum.Font.GothamBold
                            v235.TextColor3 = Color3.fromRGB(7, 236, 240)
                            v235.Text.Size = 35
                        end
                        local v236 = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v233.HumanoidRootPart.Position).Magnitude)
                        v233.Seaesps.TextLabel.Text = v233.Name .. "-" .. v236 .. " Distance"
                    end
                end
            else
                local v237, v238, v239 = pairs(game:GetService("Workspace").SeaBeasts:GetChildren())
                while true do
                    local v240
                    v239, v240 = v237(v238, v239)
                    if v239 == nil then
                        break
                    end
                    if v240:FindFirstChild("Seaesps") then
                        v240.Seaesps:Destroy()
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if NpcESP then
                local v241, v242, v243 = pairs(game:GetService("Workspace").NPCs:GetChildren())
                while true do
                    local v244
                    v243, v244 = v241(v242, v243)
                    if v243 == nil then
                        break
                    end
                    if v244:FindFirstChild("HumanoidRootPart") then
                        if not v244:FindFirstChild("NpcEspes") then
                            local v245 = Instance.new("BillboardGui")
                            local v246 = Instance.new("TextLabel")
                            v245.Parent = v244
                            v245.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                            v245.Active = true
                            v245.Name = "NpcEspes"
                            v245.AlwaysOnTop = true
                            v245.LightInfluence = 1
                            v245.Size = UDim2.new(0, 200, 0, 50)
                            v245.StudsOffset = Vector3.new(0, 2.5, 0)
                            v246.Parent = v245
                            v246.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                            v246.BackgroundTransparency = 1
                            v246.Size = UDim2.new(0, 200, 0, 50)
                            v246.Font = Enum.Font.GothamBold
                            v246.TextColor3 = Color3.fromRGB(7, 236, 240)
                            v246.Text.Size = 35
                        end
                        local v247 = math.floor((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v244.HumanoidRootPart.Position).Magnitude)
                        v244.NpcEspes.TextLabel.Text = v244.Name .. "-" .. v247 .. " Distance"
                    end
                end
            else
                local v248, v249, v250 = pairs(game:GetService("Workspace").NPCs:GetChildren())
                while true do
                    local v251
                    v250, v251 = v248(v249, v250)
                    if v250 == nil then
                        break
                    end
                    if v251:FindFirstChild("NpcEspes") then
                        v251.NpcEspes:Destroy()
                    end
                end
            end
        end)
    end
end)
function isnil(p252)
    return p252 == nil
end
local function vu254(p253)
    return math.floor(tonumber(p253) + 0.5)
end
Number = math.random(1, 1000000)
function UpdateIslandMirageESP()
	-- upvalues: (ref) vu254
    local v255, v256, v257 = pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren())
    while true do
        local vu258
        v257, vu258 = v255(v256, v257)
        if v257 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu258, (ref) vu254
            if MirageIslandESP then
                if vu258.Name == "Mirage Island" then
                    if vu258:FindFirstChild("NameEsp") then
                        vu258.NameEsp.TextLabel.Text = vu258.Name .. "   \n" .. vu254((game:GetService("Players").LocalPlayer.Character.Head.Position - vu258.Position).Magnitude / 3) .. " M"
                    else
                        local v259 = Instance.new("BillboardGui", vu258)
                        v259.Name = "NameEsp"
                        v259.ExtentsOffset = Vector3.new(0, 1, 0)
                        v259.Size = UDim2.new(1, 200, 1, 30)
                        v259.Adornee = vu258
                        v259.AlwaysOnTop = true
                        local v260 = Instance.new("TextLabel", v259)
                        v260.Font = "Code"
                        v260.FontSize = "Size14"
                        v260.TextWrapped = true
                        v260.Size = UDim2.new(1, 0, 1, 0)
                        v260.TextYAlignment = "Top"
                        v260.BackgroundTransparency = 1
                        v260.TextStrokeTransparency = 0.5
                        v260.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif vu258:FindFirstChild("NameEsp") then
                vu258:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
function UpdateAuraESP()
	-- upvalues: (ref) vu254
    local v261, v262, v263 = pairs(game:GetService("Workspace").NPCs:GetChildren())
    while true do
        local vu264
        v263, vu264 = v261(v262, v263)
        if v263 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu264, (ref) vu254
            if AuraESP then
                if vu264.Name == "Master of Enhancement" then
                    if vu264:FindFirstChild("NameEsp") then
                        vu264.NameEsp.TextLabel.Text = vu264.Name .. "   \n" .. vu254((game:GetService("Players").LocalPlayer.Character.Head.Position - vu264.Position).Magnitude / 3) .. " M"
                    else
                        local v265 = Instance.new("BillboardGui", vu264)
                        v265.Name = "NameEsp"
                        v265.ExtentsOffset = Vector3.new(0, 1, 0)
                        v265.Size = UDim2.new(1, 200, 1, 30)
                        v265.Adornee = vu264
                        v265.AlwaysOnTop = true
                        local v266 = Instance.new("TextLabel", v265)
                        v266.Font = "Code"
                        v266.FontSize = "Size14"
                        v266.TextWrapped = true
                        v266.Size = UDim2.new(1, 0, 1, 0)
                        v266.TextYAlignment = "Top"
                        v266.BackgroundTransparency = 1
                        v266.TextStrokeTransparency = 0.5
                        v266.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif vu264:FindFirstChild("NameEsp") then
                vu264:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
function UpdateLSDESP()
	-- upvalues: (ref) vu254
    local v267, v268, v269 = pairs(game:GetService("Workspace").NPCs:GetChildren())
    while true do
        local vu270
        v269, vu270 = v267(v268, v269)
        if v269 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu270, (ref) vu254
            if LADESP then
                if vu270.Name == "Legendary Sword Dealer" then
                    if vu270:FindFirstChild("NameEsp") then
                        vu270.NameEsp.TextLabel.Text = vu270.Name .. "   \n" .. vu254((game:GetService("Players").LocalPlayer.Character.Head.Position - vu270.Position).Magnitude / 3) .. " M"
                    else
                        local v271 = Instance.new("BillboardGui", vu270)
                        v271.Name = "NameEsp"
                        v271.ExtentsOffset = Vector3.new(0, 1, 0)
                        v271.Size = UDim2.new(1, 200, 1, 30)
                        v271.Adornee = vu270
                        v271.AlwaysOnTop = true
                        local v272 = Instance.new("TextLabel", v271)
                        v272.Font = "Code"
                        v272.FontSize = "Size14"
                        v272.TextWrapped = true
                        v272.Size = UDim2.new(1, 0, 1, 0)
                        v272.TextYAlignment = "Top"
                        v272.BackgroundTransparency = 1
                        v272.TextStrokeTransparency = 0.5
                        v272.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif vu270:FindFirstChild("NameEsp") then
                vu270:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
function UpdateGeaESP()
	-- upvalues: (ref) vu254
    local v273, v274, v275 = pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren())
    while true do
        local vu276
        v275, vu276 = v273(v274, v275)
        if v275 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu276, (ref) vu254
            if GearESP then
                if vu276.Name == "MeshPart" then
                    if vu276:FindFirstChild("NameEsp") then
                        vu276.NameEsp.TextLabel.Text = vu276.Name .. "   \n" .. vu254((game:GetService("Players").LocalPlayer.Character.Head.Position - vu276.Position).Magnitude / 3) .. " M"
                    else
                        local v277 = Instance.new("BillboardGui", vu276)
                        v277.Name = "NameEsp"
                        v277.ExtentsOffset = Vector3.new(0, 1, 0)
                        v277.Size = UDim2.new(1, 200, 1, 30)
                        v277.Adornee = vu276
                        v277.AlwaysOnTop = true
                        local v278 = Instance.new("TextLabel", v277)
                        v278.Font = "Code"
                        v278.FontSize = "Size14"
                        v278.TextWrapped = true
                        v278.Size = UDim2.new(1, 0, 1, 0)
                        v278.TextYAlignment = "Top"
                        v278.BackgroundTransparency = 1
                        v278.TextStrokeTransparency = 0.5
                        v278.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif vu276:FindFirstChild("NameEsp") then
                vu276:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
function Tween2(p279)
    local v280 = (p279.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local _ = 350 <= v280
    local v281 = 350
    local v282 = TweenInfo.new(v280 / v281, Enum.EasingStyle.Linear)
    local v283 = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, v282, {
        ["CFrame"] = p279
    })
    v283:Play()
    if _G.CancelTween2 then
        v283:Cancel()
    end
    _G.Clip2 = true
    wait(v280 / v281)
    _G.Clip2 = false
end
function BTPZ(p284)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p284
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p284
end
TweenSpeed = 350
function Tween(p285)
    local v286 = (p285.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local v287 = TweenSpeed
    if v286 >= 350 then
        v287 = TweenSpeed
    end
    local v288 = TweenInfo.new(v286 / v287, Enum.EasingStyle.Linear)
    local v289 = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, v288, {
        ["CFrame"] = p285
    })
    v289:Play()
    if _G.StopTween then
        v289:Cancel()
    end
end
function CancelTween(p290)
    if not p290 then
        _G.StopTween = true
        wait()
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
        _G.StopTween = false
    end
end
function EquipTool(p291)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(p291) then
        local v292 = game.Players.LocalPlayer.Backpack:FindFirstChild(p291)
        wait()
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v292)
    end
end
spawn(function()
    local v293 = getrawmetatable(game)
    local vu294 = v293.__namecall
    setreadonly(v293, false)
    v293.__namecall = newcclosure(function(...)
		-- upvalues: (ref) vu294
        local v295 = getnamecallmethod()
        local v296 = {
            ...
        }
        if tostring(v295) ~= "FireServer" or (tostring(v296[1]) ~= "RemoteEvent" or (tostring(v296[2]) == "true" or (tostring(v296[2]) == "false" or not _G.UseSkill))) then
            return vu294(...)
        end
        if type(v296[2]) ~= "vector" then
            v296[2] = CFrame.new(PositionSkillMasteryDevilFruit)
        else
            v296[2] = PositionSkillMasteryDevilFruit
        end
        return vu294(unpack(v296))
    end)
end)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.AutoEvoRace or (_G.CastleRaid or (_G.CollectAzure or (_G.TweenToKitsune or (_G.GhostShip or (_G.Ship or (_G.Auto_Holy_Torch or (_G.TeleportPly or (_G.Auto_Sea3 or (_G.Auto_Sea2 or (_G.Tweenfruit or (_G.AutoFishCrew or (_G.Auto_Saber or (_G.AutoShark or (_G.Auto_Warden or (_G.Auto_RainbowHaki or (AutoFarmRace or (_G.AutoQuestRace or (Auto_Law or (AutoTushita or (_G.AutoHolyTorch or (_G.AutoTerrorshark or (_G.farmpiranya or (_G.Auto_MusketeerHat or (_G.Auto_ObservationV2 or (_G.AutoNear or (_G.Auto_PoleV1 or (_G.Auto_Buddy or (_G.Ectoplasm or (AutoEvoRace or (AutoBartilo or (_G.Auto_Canvander or (_G.AutoLevel or (_G.Auto_DualKatana or (Auto_Quest_Yama_3 or (Auto_Quest_Yama_2 or (Auto_Quest_Yama_1 or (Auto_Quest_Tushita_1 or (Auto_Quest_Tushita_2 or (Auto_Quest_Tushita_3 or (_G.Clip2 or (_G.Auto_Regoku or (_G.AutoBone or (_G.AutoBoneNoQuest or (_G.AutoBoss or (AutoFarmMasDevilFruit or (AutoHallowSycthe or (AutoTushita or (_G.CakePrince or (_G.Auto_SkullGuitar or (_G.AutoFarmSwan or (_G.DoughKing or (_G.AutoEliteor or (AutoNextIsland or (Musketeer or (_G.AutoMaterial or (AutoFarmRaceQuest or (_G.Factory or (_G.Auto_Saw or (_G.AutoFrozenDimension or (_G.AutoKillTrial or (_G.AutoUpgrade or _G.TweenToFrozenDimension))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) then
                if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                    local v297 = Instance.new("BodyVelocity")
                    v297.Name = "BodyClip"
                    v297.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                    v297.MaxForce = Vector3.new(100000, 100000, 100000)
                    v297.Velocity = Vector3.new(0, 0, 0)
                end
            else
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
            end
        end)
    end
end)
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.AutoEvoRace or (_G.Auto_RainbowHaki or (_G.Auto_SkullGuitar or (_G.CastleRaid or (_G.CollectAzure or (_G.TweenToKitsune or (_G.Auto_Sea3 or (_G.Auto_Sea2 or (_G.GhostShip or (_G.Ship or (_G.Auto_Holy_Torch or (_G.TeleportPly or (_G.Tweenfruit or (_G.Auto_Saber or (_G.Auto_PoleV1 or (_G.Auto_MusketeerHat or (_G.AutoFishCrew or (_G.AutoShark or (AutoFarmRace or (_G.AutoQuestRace or (_G.Auto_Warden or (Auto_Law or (_G.Auto_DualKatana or (Auto_Quest_Tushita_1 or (Auto_Quest_Tushita_2 or (Auto_Quest_Tushita_3 or (AutoTushita or (_G.AutoHolyTorch or (_G.Auto_Buddy or (_G.AutoTerrorshark or (_G.farmpiranya or (Auto_Quest_Yama_3 or (_G.Auto_ObservationV2 or (Auto_Quest_Yama_2 or (Auto_Quest_Yama_1 or (_G.AutoNear or (_G.Ectoplasm or (AutoEvoRace or (_G.AutoKillTrial or (AutoBartilo or (_G.Auto_Regoku or (_G.AutoLevel or (_G.Clip2 or (_G.AutoBone or (_G.Auto_Canvander or (_G.AutoBoneNoQuest or (_G.AutoBoss or (_G.Auto_Saw or (AutoFarmMasDevilFruit or (AutoHallowSycthe or (AutoTushita or (_G.CakePrince or (_G.DoughKing or (_G.AutoFarmSwan or (_G.AutoEliteor or (AutoNextIsland or (Musketeer or (_G.AutoMaterial or (_G.Factory or (_G.AutoFrozenDimension or (AutoFarmRaceQuest or (_G.AutoUpgrade or _G.TweenToFrozenDimension))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) then
                local v298, v299, v300 = pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants())
                while true do
                    local v301
                    v300, v301 = v298(v299, v300)
                    if v300 == nil then
                        break
                    end
                    if v301:IsA("BasePart") then
                        v301.CanCollide = false
                    end
                end
            end
        end)
    end)
end)
task.spawn(function()
    if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
        game.Players.LocalPlayer.Character.Stun.Changed:connect(function()
            pcall(function()
                if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
                    game.Players.LocalPlayer.Character.Stun.Value = 0
                end
            end)
        end)
    end
end)
function CheckMaterial(p302)
    local v303, v304, v305 = pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory"))
    while true do
        local v306
        v305, v306 = v303(v304, v305)
        if v305 == nil then
            break
        end
        if type(v306) == "table" and (v306.Type == "Material" and v306.Name == p302) then
            return v306.Count
        end
    end
    return 0
end
function GetWeaponInventory(p307)
    local v308, v309, v310 = pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventory"))
    while true do
        local v311
        v310, v311 = v308(v309, v310)
        if v310 == nil then
            break
        end
        if type(v311) == "table" and (v311.Type == "Sword" and v311.Name == p307) then
            return true
        end
    end
    return false
end
local vu312 = game.Players.LocalPlayer
function FindEnemiesInRange(p313, p314)
	-- upvalues: (ref) vu312
    local v315 = (vu312.Character or vu312.CharacterAdded:Wait()):GetPivot().Position
    local v316, v317, v318 = ipairs(p314)
    local v319 = nil
    while true do
        local v320
        v318, v320 = v316(v317, v318)
        if v318 == nil then
            break
        end
        if not v320:GetAttribute("IsBoat") and (v320:FindFirstChildOfClass("Humanoid") and v320.Humanoid.Health > 0) then
            local v321 = v320:FindFirstChild("Head")
            if v321 and ((v315 - v321.Position).Magnitude <= 60 and v320 ~= vu312.Character) then
                table.insert(p313, {
                    v320,
                    v321
                })
                v319 = v321
            end
        end
    end
    local v322, v323, v324 = ipairs(game.Players:GetPlayers())
    while true do
        local v325
        v324, v325 = v322(v323, v324)
        if v324 == nil then
            break
        end
        if v325.Character and v325 ~= vu312 then
            local v326 = v325.Character:FindFirstChild("Head")
            if v326 and (v315 - v326.Position).Magnitude <= 60 then
                table.insert(p313, {
                    v325.Character,
                    v326
                })
                v319 = v326
            end
        end
    end
    return v319
end
function GetEquippedTool()
	-- upvalues: (ref) vu312
    local v327 = vu312.Character
    if not v327 then
        return nil
    end
    local v328, v329, v330 = ipairs(v327:GetChildren())
    while true do
        local v331
        v330, v331 = v328(v329, v330)
        if v330 == nil then
            break
        end
        if v331:IsA("Tool") then
            return v331
        end
    end
    return nil
end
function AttackNoCoolDown()
    local vu332 = {}
    local v333 = game:GetService("Workspace").Enemies:GetChildren()
    local vu334 = FindEnemiesInRange(vu332, v333)
    if vu334 then
        if GetEquippedTool() then
            pcall(function()
				-- upvalues: (ref) vu332, (ref) vu334
                local v335 = game:GetService("ReplicatedStorage")
                local v336 = v335:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
                local v337 = v335:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")
                if # vu332 <= 0 then
                    task.wait(1e-9)
                else
                    v336:FireServer(1e-9)
                    v337:FireServer(vu334, vu332)
                end
            end)
        end
    else
        return
    end
end
Type = 1
spawn(function()
    while wait() do
        if Type ~= 1 then
            if Type ~= 2 then
                if Type ~= 3 then
                    if Type ~= 4 then
                        if Type == 5 then
                            Pos = CFrame.new(0, 40, - 40)
                        end
                    else
                        Pos = CFrame.new(0, 40, 40)
                    end
                else
                    Pos = CFrame.new(40, 40, 0)
                end
            else
                Pos = CFrame.new(- 40, 40, 0)
            end
        else
            Pos = CFrame.new(0, 40, 0)
        end
    end
end)
spawn(function()
    while wait() do
        Type = 1
        wait(0.2)
        Type = 2
        wait(0.2)
        Type = 3
        wait(0.2)
        Type = 4
        wait(0.2)
        Type = 5
        wait(0.2)
    end
end)
function AutoHaki()
    if not game:GetService("Players").LocalPlayer.Character:FindFirstChild("HasBuso") then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buso")
    end
end
function to(p338)
    repeat
        wait(_G.Fast_Delay)
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(15)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p338
        task.wait()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = p338
    until (p338.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000
end
function to(pu339)
    pcall(function()
		-- upvalues: (ref) pu339
        if (pu339.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude >= 2000 and (not Auto_Raid and game.Players.LocalPlayer.Character.Humanoid.Health > 0) then
            if NameMon ~= "FishmanQuest" then
                if Mon ~= "God\'s Guard" then
                    if NameMon ~= "SkyExp1Quest" then
                        if NameMon ~= "ShipQuest1" then
                            if NameMon ~= "ShipQuest2" then
                                if NameMon ~= "FrostQuest" then
                                    repeat
                                        wait(_G.Fast_Delay)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pu339
                                        wait(0.05)
                                        game.Players.LocalPlayer.Character.Head:Destroy()
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pu339
                                    until (pu339.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2500 and game.Players.LocalPlayer.Character.Humanoid.Health > 0
                                    wait()
                                else
                                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                                    wait()
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 6508.5581054688, 89.034996032715, - 132.83953857422))
                                end
                            else
                                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                                wait()
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                            end
                        else
                            Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                            wait()
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                        end
                    else
                        Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                        wait()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.6176757813, 5547.1416015625, - 380.29119873047))
                    end
                else
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                    wait()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.82275, 872.54248, - 1667.55688))
                end
            else
                Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
                wait()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
            end
        end
    end)
end
local v340 = Instance.new("ScreenGui")
local vu341 = Instance.new("ImageButton")
local v342 = Instance.new("UICorner")
local vu343 = Instance.new("ParticleEmitter")
local vu344 = game:GetService("TweenService")
v340.Parent = game.CoreGui
v340.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
vu341.Parent = v340
vu341.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
vu341.BorderSizePixel = 0
vu341.Position = UDim2.new(0.020833336999999993, 0, 0.10528908129999999, 0)
vu341.Size = UDim2.new(0, 50, 0, 50)
vu341.Draggable = true
vu341.Image = "http://www.roblox.com/asset/?id=124194333243835"
v342.Parent = vu341
v342.CornerRadius = UDim.new(0, 12)
vu343.Parent = vu341
vu343.LightEmission = 1
vu343.Size = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.1),
    NumberSequenceKeypoint.new(1, 0)
})
vu343.Lifetime = NumberRange.new(0.5, 1)
vu343.Rate = 0
vu343.Speed = NumberRange.new(5, 10)
vu343.Color = ColorSequence.new(Color3.fromRGB(255, 85, 255), Color3.fromRGB(85, 255, 255))
local v345 = vu344
local vu346 = vu344.Create(v345, vu341, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    ["Rotation"] = 360
})
vu341.MouseButton1Down:Connect(function()
	-- upvalues: (ref) vu343, (ref) vu346, (ref) vu341, (ref) vu344
    vu343.Rate = 100
    task.delay(1, function()
		-- upvalues: (ref) vu343
        vu343.Rate = 0
    end)
    vu346:Play()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
    vu346.Completed:Connect(function()
		-- upvalues: (ref) vu341
        vu341.Rotation = 0
    end)
    local v347 = vu344:Create(vu341, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
        ["Size"] = UDim2.new(0, 60, 0, 60)
    })
    v347:Play()
    v347.Completed:Connect(function()
		-- upvalues: (ref) vu344, (ref) vu341
        vu344:Create(vu341, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
            ["Size"] = UDim2.new(0, 50, 0, 50)
        }):Play()
    end)
end)
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Death") then
    game:GetService("ReplicatedStorage").Effect.Container.Death:Destroy()
end
if game:GetService("ReplicatedStorage").Effect.Container:FindFirstChild("Respawn") then
    game:GetService("ReplicatedStorage").Effect.Container.Respawn:Destroy()
end
v112.Home:AddButton({
    ["Title"] = "Discord",
    ["Description"] = "Giao L\198\176u",
    ["Callback"] = function()
        setclipboard("https://discord.gg/VMdUW5DqHn")
    end
})
_G.FastAttackStrix_Mode = "Super Fast Attack"
spawn(function()
    while wait() do
        if _G.FastAttackStrix_Mode then
            pcall(function()
                if _G.FastAttackStrix_Mode == "Super Fast Attack" then
                    _G.Fast_Delay = 1e-9
                end
            end)
        end
    end
end)
local v348 = v112.Main:AddDropdown("DropdownSelectWeapon", {
    ["Title"] = "V\197\169 Kh\195\173",
    ["Description"] = "",
    ["Values"] = {
        "Melee",
        "Sword",
        "Blox Fruits"
    },
    ["Multi"] = false,
    ["Default"] = 1
})
v348:SetValue("Melee")
v348:OnChanged(function(p349)
    ChooseWeapon = p349
end)
task.spawn(function()
    while wait() do
        pcall(function()
            if ChooseWeapon ~= "Melee" then
                if ChooseWeapon ~= "Sword" then
                    if ChooseWeapon == "Blox Fruit" then
                        local v350, v351, v352 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                        while true do
                            local v353
                            v352, v353 = v350(v351, v352)
                            if v352 == nil then
                                break
                            end
                            if v353.ToolTip == "Blox Fruit" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v353.Name)) then
                                SelectWeapon = v353.Name
                            end
                        end
                    end
                else
                    local v354, v355, v356 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                    while true do
                        local v357
                        v356, v357 = v354(v355, v356)
                        if v356 == nil then
                            break
                        end
                        if v357.ToolTip == "Sword" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v357.Name)) then
                            SelectWeapon = v357.Name
                        end
                    end
                end
            else
                local v358, v359, v360 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                while true do
                    local v361
                    v360, v361 = v358(v359, v360)
                    if v360 == nil then
                        break
                    end
                    if v361.ToolTip == "Melee" and game.Players.LocalPlayer.Backpack:FindFirstChild(tostring(v361.Name)) then
                        SelectWeapon = v361.Name
                    end
                end
            end
        end)
    end
end)
v112.Main:AddToggle("ToggleLevel", {
    ["Title"] = "C\195\160y C\225\186\165p",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p362)
    _G.AutoLevel = p362
    if p362 == false then
        wait()
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
    end
end)
v113.ToggleLevel:SetValue(false)
spawn(function()
    while task.wait() do
        if _G.AutoLevel then
            pcall(function()
                CheckLevel()
                if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        local v363, v364, v365 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v366
                            v365, v366 = v363(v364, v365)
                            if v365 == nil then
                                break
                            end
                            if v366:FindFirstChild("Humanoid") and (v366:FindFirstChild("HumanoidRootPart") and (v366.Humanoid.Health > 0 and v366.Name == Ms)) then
                                repeat
                                    wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    bringmob = true
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    Tween(v366.HumanoidRootPart.CFrame * Pos)
                                    v366.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v366.HumanoidRootPart.Transparency = 1
                                    v366.Humanoid.JumpPower = 0
                                    v366.Humanoid.WalkSpeed = 0
                                    v366.HumanoidRootPart.CanCollide = false
                                    FarmPos = v366.HumanoidRootPart.CFrame
                                    MonFarm = v366.Name
                                until not _G.AutoLevel or (not v366.Parent or v366.Humanoid.Health <= 0) or (not game:GetService("Workspace").Enemies:FindFirstChild(v366.Name) or game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false)
                                bringmob = false
                            end
                        end
                        local v367, v368, v369 = pairs(game:GetService("Workspace")._WorldOrigin.EnemySpawns:GetChildren())
                        while true do
                            local v370
                            v369, v370 = v367(v368, v369)
                            if v369 == nil then
                                break
                            end
                            if string.find(v370.Name, NameMon) and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v370.Position).Magnitude >= 10 then
                                Tween(v370.HumanoidRootPart.CFrame * Pos)
                            end
                        end
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    Tween(CFrameQ)
                    if (CFrameQ.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, QuestLv)
                    end
                end
            end)
        end
    end
end)
v112.Main:AddToggle("ToggleMobAura", {
    ["Title"] = "\196\144\225\186\165m Qu\195\161i G\225\186\167n",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p371)
    _G.AutoNear = p371
    if p371 == false then
        wait()
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
    end
end)
v113.ToggleMobAura:SetValue(false)
spawn(function()
    while wait() do
        if _G.AutoNear then
            pcall(function()
                local v372, v373, v374 = pairs(game.Workspace.Enemies:GetChildren())
                while true do
                    local v375
                    v374, v375 = v372(v373, v374)
                    if v374 == nil then
                        break
                    end
                    if v375:FindFirstChild("Humanoid") and (v375:FindFirstChild("HumanoidRootPart") and (v375.Humanoid.Health > 0 and (v375.Name and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v375:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000))) then
                        repeat
                            wait(_G.Fast_Delay)
                            AttackNoCoolDown()
                            bringmob = true
                            AutoHaki()
                            EquipTool(SelectWeapon)
                            Tween(v375.HumanoidRootPart.CFrame * Pos)
                            v375.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v375.HumanoidRootPart.Transparency = 1
                            v375.Humanoid.JumpPower = 0
                            v375.Humanoid.WalkSpeed = 0
                            v375.HumanoidRootPart.CanCollide = false
                            FarmPos = v375.HumanoidRootPart.CFrame
                            MonFarm = v375.Name
                        until not _G.AutoNear or (not v375.Parent or v375.Humanoid.Health <= 0) or not game.Workspace.Enemies:FindFirstChild(v375.Name)
                        bringmob = false
                    end
                end
            end)
        end
    end
end)
v112.Main:AddToggle("ToggleCastleRaid", {
    ["Title"] = "\196\144\225\186\165m H\225\186\163i T\225\186\183c",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p376)
    _G.CastleRaid = p376
end)
v113.ToggleCastleRaid:SetValue(false)
spawn(function()
    while wait() do
        if _G.CastleRaid then
            pcall(function()
                local v377 = CFrame.new(- 5496.17432, 313.768921, - 2841.53027, 0.924894512, 7.37058e-9, 0.380223751, 3.588102e-8, 1, - 1.06665446e-7, - 0.380223751, 1.1229711e-7, 0.924894512)
                if (CFrame.new(- 5539.3115234375, 313.800537109375, - 2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
                    Tween(v377)
                else
                    local v378, v379, v380 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local v381
                        v380, v381 = v378(v379, v380)
                        if v380 == nil then
                            break
                        end
                        if _G.CastleRaid and (v381:FindFirstChild("HumanoidRootPart") and (v381:FindFirstChild("Humanoid") and (v381.Humanoid.Health > 0 and (v381.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000))) then
                            repeat
                                wait(_G.Fast_Delay)
                                AttackNoCoolDown()
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                v381.HumanoidRootPart.CanCollide = false
                                v381.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                Tween(v381.HumanoidRootPart.CFrame * Pos)
                            until v381.Humanoid.Health <= 0 or not (v381.Parent and _G.CastleRaid)
                        end
                    end
                end
            end)
        end
    end
end)
v112.Main:AddToggle("ToggleHakiFortress", {
    ["Title"] = "B\225\186\173t Haki M\195\160u Ph\195\161o \196\144\195\160i",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p382)
    _G.EnableHakiFortress = p382
end)
v113.ToggleHakiFortress:SetValue(false)
local function vu386(p383, p384)
    local v385 = {
        {
            ["StorageName"] = p383,
            ["Type"] = "AuraSkin",
            ["Context"] = "Equip"
        }
    }
    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/FruitCustomizerRF"):InvokeServer(unpack(v385))
    Tween2(p384)
end
local function vu390(p387, p388)
    local v389 = game.Players.LocalPlayer.Character
    if v389 and v389:FindFirstChild("HumanoidRootPart") then
        return (v389.HumanoidRootPart.Position - p387).Magnitude < p388
    else
        return false
    end
end
spawn(function()
	-- upvalues: (ref) vu386, (ref) vu390
    while true do
        if _G.EnableHakiFortress then
            vu386("Snow White", Vector3.new(- 4971.71826171875, 335.9582214355469, - 3720.0595703125))
            while not vu390(Vector3.new(- 4971.71826171875, 335.9582214355469, - 3720.0595703125), 1) do
                wait(0.1)
            end
            wait(0.5)
            vu386("Pure Red", Vector3.new(- 5414.92041015625, 314.2582092285156, - 2212.20166015625))
            while not vu390(Vector3.new(- 5414.92041015625, 314.2582092285156, - 2212.20166015625), 1) do
                wait(0.1)
            end
            wait(0.5)
            vu386("Winter Sky", Vector3.new(- 5420.26318359375, 1089.3582763671875, - 2666.8193359375))
            while not vu390(Vector3.new(- 5420.26318359375, 1089.3582763671875, - 2666.8193359375), 1) do
                wait(0.1)
            end
            wait(0.5)
            _G.EnableHakiFortress = false
        end
        wait(0.5)
    end
end)
v112.Main:AddToggle("ToggleCollectChest", {
    ["Title"] = "L\225\187\165m R\198\176\198\161ng",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p391)
    _G.AutoCollectChest = p391
end)
spawn(function()
    while wait() do
        if _G.AutoCollectChest then
            local v392 = game:GetService("Players").LocalPlayer
            local v393 = (v392.Character or v392.CharacterAdded:Wait()):GetPivot().Position
            local v394 = game:GetService("CollectionService"):GetTagged("_ChestTagged")
            local v395 = math.huge
            local v396 = nil
            for v397 = 1, # v394 do
                local v398 = v394[v397]
                local v399 = (v398:GetPivot().Position - v393).Magnitude
                if not v398:GetAttribute("IsDisabled") then
                    if v399 < v395 then
                        v396 = v398
                        v395 = v399
                    end
                end
            end
            if v396 then
                local v400 = v396:GetPivot().Position
                local v401 = CFrame.new(v400)
                Tween2(v401)
            end
        end
    end
end)
v112.Main:AddSection("Th\195\180ng Th\225\186\161o")
local v402 = v112.Main:AddDropdown("DropdownMastery", {
    ["Title"] = "C\195\160y Th\195\180ng Th\225\186\161o",
    ["Description"] = "",
    ["Values"] = {
        "Near Mobs"
    },
    ["Multi"] = false,
    ["Default"] = 1
})
v402:SetValue(TypeMastery)
v402:OnChanged(function(p403)
    TypeMastery = p403
end)
v112.Main:AddToggle("ToggleMasteryFruit", {
    ["Title"] = "C\195\160y Tr\195\161i",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p404)
    AutoFarmMasDevilFruit = p404
end)
v113.ToggleMasteryFruit:SetValue(false)
local v406 = v112.Main:AddSlider("SliderHealt", {
    ["Title"] = "M\195\161u Qu\195\161i",
    ["Description"] = "",
    ["Default"] = 20,
    ["Min"] = 0,
    ["Max"] = 100,
    ["Rounding"] = 1,
    ["Callback"] = function(p405)
        KillPercent = p405
    end
})
v406:OnChanged(function(p407)
    KillPercent = p407
end)
v406:SetValue(20)
spawn(function()
    while task.wait() do
        if _G.UseSkill then
            pcall(function()
				-- block 48
                if not _G.UseSkill then
					-- ::l3::
                    return
                end
                local v408, v409, v410 = pairs(game:GetService("Workspace").Enemies:GetChildren())
				-- ::l4::
                local v411
                v410, v411 = v408(v409, v410)
                if v410 == nil then
					-- goto l3
                end
                if v411.Name ~= MonFarm or (not v411:FindFirstChild("Humanoid") or (not v411:FindFirstChild("HumanoidRootPart") or v411.Humanoid.Health > v411.Humanoid.MaxHealth * KillPercent / 100)) then
					-- goto l4
                end
				-- ::l13::
                game:GetService("RunService").Heartbeat:wait()
                EquipTool(game.Players.LocalPlayer.Data.DevilFruit.Value)
                Tween(v411.HumanoidRootPart.CFrame * Pos)
                PositionSkillMasteryDevilFruit = v411.HumanoidRootPart.Position
                if game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value) then
                    game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).MousePos.Value = PositionSkillMasteryDevilFruit
                    local v412 = game:GetService("Players").LocalPlayer.Character:FindFirstChild(game.Players.LocalPlayer.Data.DevilFruit.Value).Level.Value
                    if SkillZ and 1 <= v412 then
                        game:service("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
                        wait()
                        game:service("VirtualInputManager"):SendKeyEvent(false, "Z", false, game)
                    end
                    if SkillX and 2 <= v412 then
                        game:service("VirtualInputManager"):SendKeyEvent(true, "X", false, game)
                        wait()
                        game:service("VirtualInputManager"):SendKeyEvent(false, "X", false, game)
                    end
                    if SkillC and 3 <= v412 then
                        game:service("VirtualInputManager"):SendKeyEvent(true, "C", false, game)
                        wait()
                        game:service("VirtualInputManager"):SendKeyEvent(false, "C", false, game)
                    end
                    if SkillV and 4 <= v412 then
                        game:service("VirtualInputManager"):SendKeyEvent(true, "V", false, game)
                        wait()
                        game:service("VirtualInputManager"):SendKeyEvent(false, "V", false, game)
                    end
                    if SkillF and 5 <= v412 then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "F", false, game)
                        wait()
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "F", false, game)
                    end
                end
                if AutoFarmMasDevilFruit and (_G.UseSkill and v411.Humanoid.Health ~= 0) then
					-- goto l13
                else
					-- goto l3
                end
				-- ::l3::
				-- ::l2::
				-- goto l4
            end)
        end
    end
end)
spawn(function()
    while task.wait(0.1) do
        if AutoFarmMasDevilFruit and TypeMastery == "Near Mobs" then
            pcall(function()
                local v413, v414, v415 = pairs(game.Workspace.Enemies:GetChildren())
                while true do
                    local v416
                    v415, v416 = v413(v414, v415)
                    if v415 == nil then
                        return
                    end
                    if v416.Name and (v416:FindFirstChild("Humanoid") and (v416:FindFirstChild("HumanoidRootPart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v416:FindFirstChild("HumanoidRootPart").Position).Magnitude <= 5000)) then
                        repeat
                            if true then
                                wait(_G.Fast_Delay)
                                if v416.Humanoid.Health > v416.Humanoid.MaxHealth * KillPercent / 100 then
                                    _G.UseSkill = false
                                    AutoHaki()
                                    bringmob = true
                                    EquipTool(SelectWeapon)
                                    Tween(v416.HumanoidRootPart.CFrame * Pos)
                                    v416.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v416.HumanoidRootPart.Transparency = 1
                                    v416.Humanoid.JumpPower = 0
                                    v416.Humanoid.WalkSpeed = 0
                                    v416.HumanoidRootPart.CanCollide = false
                                    FarmPos = v416.HumanoidRootPart.CFrame
                                    MonFarm = v416.Name
                                    AttackNoCoolDown()
                                else
                                    _G.UseSkill = true
                                end
                            end
                        until not AutoFarmMasDevilFruit or (not MasteryType == "Near Mobs" or (not v416.Parent or v416.Humanoid.Health == 0))
                        bringmob = false
                        _G.UseSkill = false
                    end
                end
            end)
        end
    end
end)
if Sea3 then
    v112.Main:AddSection("X\198\176\198\161ng")
    local vu417 = v112.Main:AddParagraph({
        ["Title"] = "X\198\176\198\161ng Tr\225\186\161ng Th\195\161i",
        ["Content"] = ""
    })
    spawn(function()
		-- upvalues: (ref) vu417
        pcall(function()
			-- upvalues: (ref) vu417
            while wait() do
                local v418 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Check")
                vu417:SetDesc("M\195\160y C\195\179: " .. tostring(v418) .. " X\198\176\198\161ng")
            end
        end)
    end)
    v112.Main:AddToggle("ToggleBone", {
        ["Title"] = "C\195\160y X\198\176\198\161ng",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p419)
        _G.AutoBone = p419
        if p419 == false then
            wait()
            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            wait()
        end
    end)
    v113.ToggleBone:SetValue(false)
    local vu420 = CFrame.new(- 9515.75, 174.8521728515625, 6079.40625)
    spawn(function()
		-- upvalues: (ref) vu420
        while wait() do
            if _G.AutoBone then
                pcall(function()
					-- upvalues: (ref) vu420
                    local v421 = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(v421, "Demonic Soul") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                    end
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= false then
                        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true and (game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or (game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or (game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy")))) then
                            local v422, v423, v424 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v425
                                v424, v425 = v422(v423, v424)
                                if v424 == nil then
                                    break
                                end
                                if v425:FindFirstChild("HumanoidRootPart") and (v425:FindFirstChild("Humanoid") and (v425.Humanoid.Health > 0 and (v425.Name == "Reborn Skeleton" or (v425.Name == "Living Zombie" or (v425.Name == "Demonic Soul" or v425.Name == "Posessed Mummy"))))) then
                                    if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Demonic Soul") then
                                        repeat
                                            wait(_G.Fast_Delay)
                                            AttackNoCoolDown()
                                            AutoHaki()
                                            bringmob = true
                                            EquipTool(SelectWeapon)
                                            Tween(v425.HumanoidRootPart.CFrame * Pos)
                                            v425.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                            v425.HumanoidRootPart.Transparency = 1
                                            v425.Humanoid.JumpPower = 0
                                            v425.Humanoid.WalkSpeed = 0
                                            v425.HumanoidRootPart.CanCollide = false
                                            FarmPos = v425.HumanoidRootPart.CFrame
                                            MonFarm = v425.Name
                                        until not _G.AutoBone or (v425.Humanoid.Health <= 0 or not v425.Parent) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                    else
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                                        bringmob = false
                                    end
                                end
                            end
                        end
                    else
                        Tween(vu420)
                        if (vu420.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest2", 1)
                        end
                    end
                end)
            end
        end
    end)
    local vu426 = CFrame.new(- 9515.75, 174.8521728515625, 6079.40625)
    spawn(function()
		-- upvalues: (ref) vu426
        while wait() do
            if _G.AutoBoneNoQuest then
                pcall(function()
					-- upvalues: (ref) vu426
                    Tween(vu426)
                    local _ = (vu426.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 3
                    if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or (game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or (game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy"))) then
                        local v427, v428, v429 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v430
                            v429, v430 = v427(v428, v429)
                            if v429 == nil then
                                break
                            end
                            if v430:FindFirstChild("HumanoidRootPart") and (v430:FindFirstChild("Humanoid") and (v430.Humanoid.Health > 0 and (v430.Name == "Reborn Skeleton" or (v430.Name == "Living Zombie" or (v430.Name == "Demonic Soul" or v430.Name == "Posessed Mummy"))))) then
                                repeat
                                    wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    bringmob = true
                                    EquipTool(SelectWeapon)
                                    Tween(v430.HumanoidRootPart.CFrame * Pos)
                                    v430.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v430.HumanoidRootPart.Transparency = 1
                                    v430.Humanoid.JumpPower = 0
                                    v430.Humanoid.WalkSpeed = 0
                                    v430.HumanoidRootPart.CanCollide = false
                                    FarmPos = v430.HumanoidRootPart.CFrame
                                    MonFarm = v430.Name
                                until not _G.AutoBoneNoQuest or (v430.Humanoid.Health <= 0 or not v430.Parent)
                            end
                        end
                    end
                end)
            end
        end
    end)
    v112.Main:AddButton({
        ["Title"] = "C\225\186\167u Nguy\225\187\135n",
        ["Description"] = "",
        ["Callback"] = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                "gravestoneEvent",
                1
            }))
        end
    })
    v112.Main:AddButton({
        ["Title"] = "Th\225\187\173 V\225\186\173n May",
        ["Description"] = "",
        ["Callback"] = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                "gravestoneEvent",
                2
            }))
        end
    })
    v112.Main:AddToggle("ToggleRandomBone", {
        ["Title"] = "Random X\198\176\198\161ng",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p431)
        _G.AutoRandomBone = p431
    end)
    v113.ToggleRandomBone:SetValue(false)
    spawn(function()
        while wait() do
            if _G.AutoRandomBone then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "Bones",
                    "Buy",
                    1,
                    1
                }))
            end
        end
    end)
end
if Sea3 then
    v112.Main:AddSection("T\198\176 L\225\187\135nh B\195\161nh")
    local vu432 = v112.Main:AddParagraph({
        ["Title"] = "Tr\225\186\161ng Th\195\161i N\195\179 Ra",
        ["Content"] = ""
    })
    spawn(function()
		-- upvalues: (ref) vu432
        while wait() do
            pcall(function()
				-- upvalues: (ref) vu432
                if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) ~= 88 then
                    if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) ~= 87 then
                        if string.len(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")) ~= 86 then
                            vu432:SetDesc("T\198\176 L\225\187\135nh B\195\161nh : \226\156\133\239\184\143")
                        else
                            vu432:SetDesc("C\195\178n: " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 39) .. " ")
                        end
                    else
                        vu432:SetDesc("C\195\178n: " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 40) .. "")
                    end
                else
                    vu432:SetDesc("C\195\178n: " .. string.sub(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner"), 39, 41) .. "")
                end
            end)
        end
    end)
    local v433 = v112.Main:AddToggle("ToggleCake", {
        ["Title"] = "C\195\160y T\198\176 L\225\187\135nh B\195\161nh",
        ["Description"] = "",
        ["Default"] = false
    })
    local vu434 = true
    v433:OnChanged(function(p435)
		-- upvalues: (ref) vu434
        _G.CakePrince = p435
        if p435 then
            if vu434 then
                vu434 = false
                local v436 = CFrame.new(- 2003.932861328125, 380.4824523925781, - 12561.0185546875)
                Tween(v436)
            end
        else
            vu434 = true
            wait()
            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            wait()
        end
    end)
    v113.ToggleCake:SetValue(false)
    spawn(function()
        while wait() do
            if _G.CakePrince then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                        local v437, v438, v439 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v440
                            v439, v440 = v437(v438, v439)
                            if v439 == nil then
                                break
                            end
                            if v440.Name == "Cake Prince" and (v440:FindFirstChild("Humanoid") and (v440:FindFirstChild("HumanoidRootPart") and v440.Humanoid.Health > 0)) then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v440.HumanoidRootPart.CanCollide = false
                                    v440.Humanoid.WalkSpeed = 0
                                    v440.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v440.HumanoidRootPart.CFrame * Pos)
                                    AttackNoCoolDown()
                                until not _G.CakePrince or (not v440.Parent or v440.Humanoid.Health <= 0)
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    elseif game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 1 and (game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or (game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or (game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker")))) then
                        local v441, v442, v443 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v444
                            v443, v444 = v441(v442, v443)
                            if v443 == nil then
                                break
                            end
                            if (v444.Name == "Cookie Crafter" or (v444.Name == "Cake Guard" or (v444.Name == "Baking Staff" or v444.Name == "Head Baker"))) and (v444:FindFirstChild("Humanoid") and (v444:FindFirstChild("HumanoidRootPart") and v444.Humanoid.Health > 0)) then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AutoHaki()
                                    bringmob = true
                                    EquipTool(SelectWeapon)
                                    v444.HumanoidRootPart.CanCollide = false
                                    v444.Humanoid.WalkSpeed = 0
                                    v444.Head.CanCollide = false
                                    v444.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    FarmPos = v444.HumanoidRootPart.CFrame
                                    MonFarm = v444.Name
                                    Tween(v444.HumanoidRootPart.CFrame * Pos)
                                    AttackNoCoolDown()
                                until not _G.CakePrince or (not v444.Parent or v444.Humanoid.Health <= 0) or (game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or (game:GetService("ReplicatedStorage"):FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince [Lv. 2300] [Raid Boss]")))
                                bringmob = false
                            end
                        end
                    end
                end)
            end
        end
    end)
    v112.Main:AddToggle("ToggleDoughKing", {
        ["Title"] = "\196\144\225\186\165m Vua B\225\187\153t",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p445)
        _G.DoughKing = p445
        if p445 == false then
            wait()
            Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
            wait()
        end
    end)
    v113.ToggleDoughKing:SetValue(false)
    spawn(function()
        while wait() do
            if _G.DoughKing then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                        local v446, v447, v448 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v449
                            v448, v449 = v446(v447, v448)
                            if v448 == nil then
                                break
                            end
                            if v449.Name == "Dough King" and (v449:FindFirstChild("Humanoid") and (v449:FindFirstChild("HumanoidRootPart") and v449.Humanoid.Health > 0)) then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v449.HumanoidRootPart.CanCollide = false
                                    v449.Humanoid.WalkSpeed = 0
                                    v449.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v449.HumanoidRootPart.CFrame * Pos)
                                    AttackNoCoolDown()
                                until not _G.DoughKing or (not v449.Parent or v449.Humanoid.Health <= 0)
                            end
                        end
                    end
                end)
            end
        end
    end)
    v112.Main:AddToggle("ToggleSpawnCake", {
        ["Title"] = "Tri\225\187\135u H\225\187\147i T\198\176 L\225\187\135nh B\195\161nh",
        ["Description"] = "",
        ["Default"] = true
    }):OnChanged(function(p450)
        _G.SpawnCakePrince = p450
    end)
    v113.ToggleSpawnCake:SetValue(true)
end
spawn(function()
    while wait() do
        if _G.SpawnCakePrince then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                "CakePrinceSpawner",
                true
            }))
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                "CakePrinceSpawner"
            }))
        end
    end
end)
if Sea2 then
    v112.Main:AddSection("Ectoplasm Farm")
    v112.Main:AddToggle("ToggleVatChatKiDi", {
        ["Title"] = "Auto Farm Ectoplasm",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p451)
        _G.Ectoplasm = p451
    end)
    v113.ToggleVatChatKiDi:SetValue(false)
    spawn(function()
        while wait() do
            pcall(function()
                if _G.Ectoplasm then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Ship Deckhand") or (game:GetService("Workspace").Enemies:FindFirstChild("Ship Engineer") or (game:GetService("Workspace").Enemies:FindFirstChild("Ship Steward") or game:GetService("Workspace").Enemies:FindFirstChild("Ship Officer"))) then
                        local v452, v453, v454 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v455
                            v454, v455 = v452(v453, v454)
                            if v454 == nil then
                                break
                            end
                            if (v455.Name == "Ship Steward" or (v455.Name == "Ship Engineer" or (v455.Name == "Ship Deckhand" or v455.Name == "Ship Officer" and v455:FindFirstChild("Humanoid")))) and v455.Humanoid.Health > 0 then
                                repeat
                                    wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    bringmob = true
                                    EquipTool(SelectWeapon)
                                    Tween(v455.HumanoidRootPart.CFrame * Pos)
                                    v455.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v455.HumanoidRootPart.Transparency = 1
                                    v455.Humanoid.JumpPower = 0
                                    v455.Humanoid.WalkSpeed = 0
                                    v455.HumanoidRootPart.CanCollide = false
                                    FarmPos = v455.HumanoidRootPart.CFrame
                                    MonFarm = v455.Name
                                until _G.Ectoplasm == false or (not v455.Parent or v455.Humanoid.Health == 0) or not game:GetService("Workspace").Enemies:FindFirstChild(v455.Name)
                                bringmob = false
                            end
                        end
                    else
                        if (Vector3.new(904.4072265625, 181.05767822266, 33341.38671875) - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 20000 then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                        end
                        Tween(CFrame.new(904.4072265625, 181.05767822266, 33341.38671875))
                    end
                end
            end)
        end
    end)
end
v112.Main:AddSection("Tr\195\185m")
if Sea1 then
    tableBoss = {
        "The Gorilla King",
        "Bobby",
        "Yeti",
        "Mob Leader",
        "Vice Admiral",
        "Warden",
        "Chief Warden",
        "Swan",
        "Magma Admiral",
        "Fishman Lord",
        "Wysper",
        "Thunder God",
        "Cyborg",
        "Saber Expert"
    }
elseif Sea2 then
    tableBoss = {
        "Diamond",
        "Jeremy",
        "Fajita",
        "Don Swan",
        "Smoke Admiral",
        "Cursed Captain",
        "Darkbeard",
        "Order",
        "Awakened Ice Admiral",
        "Tide Keeper"
    }
elseif Sea3 then
    tableBoss = {
        "Stone",
        "Hydra Leader",
        "Kilo Admiral",
        "Captain Elephant",
        "Beautiful Pirate",
        "rip_indra True Form",
        "Longma",
        "Soul Reaper",
        "Cake Queen"
    }
end
local v456 = v112.Main:AddDropdown("DropdownBoss", {
    ["Title"] = "Ch\225\187\141n Tr\195\185m",
    ["Description"] = "",
    ["Values"] = tableBoss,
    ["Multi"] = false,
    ["Default"] = 1
})
v456:SetValue(_G.SelectBoss)
v456:OnChanged(function(p457)
    _G.SelectBoss = p457
end)
v112.Main:AddToggle("ToggleAutoFarmBoss", {
    ["Title"] = "\196\144\225\186\165m Tr\195\185m",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p458)
    _G.AutoBoss = p458
end)
v113.ToggleAutoFarmBoss:SetValue(false)
spawn(function()
    while wait() do
        if _G.AutoBoss then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild(_G.SelectBoss) then
                    local v459, v460, v461 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local v462
                        v461, v462 = v459(v460, v461)
                        if v461 == nil then
                            break
                        end
                        if v462.Name == _G.SelectBoss and (v462:FindFirstChild("Humanoid") and (v462:FindFirstChild("HumanoidRootPart") and v462.Humanoid.Health > 0)) then
                            repeat
                                wait(_G.Fast_Delay)
                                AttackNoCoolDown()
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                v462.HumanoidRootPart.CanCollide = false
                                v462.Humanoid.WalkSpeed = 0
                                v462.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                Tween(v462.HumanoidRootPart.CFrame * Pos)
                                sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            until not _G.AutoBoss or (not v462.Parent or v462.Humanoid.Health <= 0)
                        end
                    end
                elseif game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss) then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild(_G.SelectBoss).HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                end
            end)
        end
    end
end)
v112.Main:AddSection("Nguy\195\170n Li\225\187\135u")
if Sea1 then
    MaterialList = {
        "Scrap Metal",
        "Leather",
        "Angel Wings",
        "Magma Ore",
        "Fish Tail"
    }
elseif Sea2 then
    MaterialList = {
        "Scrap Metal",
        "Leather",
        "Radioactive Material",
        "Mystic Droplet",
        "Magma Ore",
        "Vampire Fang"
    }
elseif Sea3 then
    MaterialList = {
        "Scrap Metal",
        "Leather",
        "Demonic Wisp",
        "Conjured Cocoa",
        "Dragon Scale",
        "Gunpowder",
        "Fish Tail",
        "Mini Tusk",
        "Hydra Enforcer",
        "Venomous Assailant"
    }
end
local v463 = v112.Main:AddDropdown("DropdownMaterial", {
    ["Title"] = "Ch\225\187\141n Nguy\195\170n Li\225\187\135u",
    ["Description"] = "",
    ["Values"] = MaterialList,
    ["Multi"] = false,
    ["Default"] = 1
})
v463:SetValue(SelectMaterial)
v463:OnChanged(function(p464)
    SelectMaterial = p464
end)
v112.Main:AddToggle("ToggleMaterial", {
    ["Title"] = "C\195\160y Nguy\195\170n Li\225\187\135u",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p465)
    _G.AutoMaterial = p465
    if p465 == false then
        wait()
        Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
    end
end)
v113.ToggleMaterial:SetValue(false)
spawn(function()
    while task.wait() do
        if _G.AutoMaterial then
            pcall(function()
                MaterialMon(SelectMaterial)
                Tween(MPos)
                if game:GetService("Workspace").Enemies:FindFirstChild(MMon) then
                    local v466, v467, v468 = pairs(game.Workspace.Enemies:GetChildren())
                    while true do
                        local v469
                        v468, v469 = v466(v467, v468)
                        if v468 == nil then
                            break
                        end
                        if v469:FindFirstChild("Humanoid") and (v469:FindFirstChild("HumanoidRootPart") and (v469.Humanoid.Health > 0 and v469.Name == MMon)) then
                            repeat
                                wait(_G.Fast_Delay)
                                AttackNoCoolDown()
                                AutoHaki()
                                bringmob = true
                                EquipTool(SelectWeapon)
                                Tween(v469.HumanoidRootPart.CFrame * Pos)
                                v469.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                v469.HumanoidRootPart.Transparency = 1
                                v469.Humanoid.JumpPower = 0
                                v469.Humanoid.WalkSpeed = 0
                                v469.HumanoidRootPart.CanCollide = false
                                FarmPos = v469.HumanoidRootPart.CFrame
                                MonFarm = v469.Name
                            until not _G.AutoMaterial or (not v469.Parent or v469.Humanoid.Health <= 0)
                            bringmob = false
                        end
                    end
                else
                    local v470, v471, v472 = pairs(game:GetService("Workspace")._WorldOrigin.EnemySpawns:GetChildren())
                    while true do
                        local v473
                        v472, v473 = v470(v471, v472)
                        if v472 == nil then
                            break
                        end
                        if string.find(v473.Name, Mon) and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v473.Position).Magnitude >= 10 then
                            Tween(v473.HumanoidRootPart.CFrame * Pos)
                        end
                    end
                end
            end)
        end
    end
end)
if Sea3 then
    v112.Sea:AddSection("\196\144\225\186\163o C\195\161o")
    local vu474 = v112.Sea:AddParagraph({
        ["Title"] = "Tr\225\186\161ng Th\195\161i \196\144\225\186\163o C\195\161o",
        ["Content"] = ""
    })
    function UpdateKitsune()
		-- upvalues: (ref) vu474
        if game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland") then
            vu474:SetDesc("\196\144\225\186\163o C\195\161o : \226\156\133\239\184\143")
        else
            vu474:SetDesc("\196\144\225\186\163o C\195\161o : \226\157\140\239\184\143")
        end
    end
    spawn(function()
        pcall(function()
            while wait() do
                UpdateKitsune()
            end
        end)
    end)
    v112.Sea:AddToggle("ToggleEspKitsune", {
        ["Title"] = "\196\144\225\187\139nh V\225\187\139 \196\144\225\186\163o C\195\161o",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p475)
        KitsuneIslandEsp = p475
        while KitsuneIslandEsp do
            wait()
            UpdateIslandKisuneESP()
        end
    end)
    v113.ToggleEspKitsune:SetValue(false)
    function UpdateIslandKisuneESP()
		-- upvalues: (ref) vu254
        local v476, v477, v478 = pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren())
        while true do
            local vu479
            v478, vu479 = v476(v477, v478)
            if v478 == nil then
                break
            end
            pcall(function()
				-- upvalues: (ref) vu479, (ref) vu254
                if KitsuneIslandEsp then
                    if vu479.Name == "Kitsune Island" then
                        if vu479:FindFirstChild("NameEsp") then
                            vu479.NameEsp.TextLabel.Text = vu479.Name .. "   \n" .. vu254((game:GetService("Players").LocalPlayer.Character.Head.Position - vu479.Position).Magnitude / 3) .. " M"
                        else
                            local v480 = Instance.new("BillboardGui", vu479)
                            v480.Name = "NameEsp"
                            v480.ExtentsOffset = Vector3.new(0, 1, 0)
                            v480.Size = UDim2.new(1, 200, 1, 30)
                            v480.Adornee = vu479
                            v480.AlwaysOnTop = true
                            local v481 = Instance.new("TextLabel", v480)
                            v481.Font = "Code"
                            v481.FontSize = "Size14"
                            v481.TextWrapped = true
                            v481.Size = UDim2.new(1, 0, 1, 0)
                            v481.TextYAlignment = "Top"
                            v481.BackgroundTransparency = 1
                            v481.TextStrokeTransparency = 0.5
                            v481.TextColor3 = Color3.fromRGB(80, 245, 245)
                        end
                    end
                elseif vu479:FindFirstChild("NameEsp") then
                    vu479:FindFirstChild("NameEsp"):Destroy()
                end
            end)
        end
    end
    v112.Sea:AddToggle("ToggleTPKitsune", {
        ["Title"] = "Bay V\195\180 \196\144\225\186\163o C\195\161o",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p482)
        _G.TweenToKitsune = p482
    end)
    v113.ToggleTPKitsune:SetValue(false)
    spawn(function()
        local v483 = nil
        while not v483 do
            v483 = game:GetService("Workspace").Map:FindFirstChild("KitsuneIsland")
            wait()
        end
        while wait() do
            if _G.TweenToKitsune then
                local v484 = v483:FindFirstChild("ShrineActive")
                if v484 then
                    local v485, v486, v487 = pairs(v484:GetDescendants())
                    while true do
                        local v488
                        v487, v488 = v485(v486, v487)
                        if v487 == nil then
                            break
                        end
                        if v488:IsA("BasePart") and v488.Name:find("NeonShrinePart") then
                            Tween(v488.CFrame)
                        end
                    end
                end
            end
        end
    end)
    v112.Sea:AddToggle("ToggleCollectAzure", {
        ["Title"] = "L\225\187\165m Linh H\225\187\147n Xanh",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p489)
        _G.CollectAzure = p489
    end)
    v113.ToggleCollectAzure:SetValue(false)
    spawn(function()
        while wait() do
            if _G.CollectAzure then
                pcall(function()
                    if game:GetService("Workspace"):FindFirstChild("AttachedAzureEmber") then
                        Tween(game:GetService("Workspace"):WaitForChild("EmberTemplate"):FindFirstChild("Part").CFrame)
                    end
                end)
            end
        end
    end)
end
v112.Sea:AddButton({
    ["Title"] = "\196\144\225\187\149i Linh H\225\187\147n Xanh",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RF/KitsuneStatuePray"):InvokeServer()
    end
})
if Sea3 then
    v112.Sea:AddSection("Bi\225\187\131n")
    local vu490 = game:GetService("Players")
    local vu491 = game:GetService("RunService")
    local vu492 = game:GetService("VirtualInputManager")
    local vu493 = game:GetService("Workspace")
    local vu494 = 350
    v112.Sea:AddSlider("SliderSpeedBoat", {
        ["Title"] = "T\225\187\145c \196\144\225\187\153 Thuy\225\187\129n",
        ["Description"] = "",
        ["Default"] = vu494,
        ["Min"] = 0,
        ["Max"] = 350,
        ["Rounding"] = 1,
        ["Callback"] = function(p495)
			-- upvalues: (ref) vu494
            vu494 = p495
        end
    }):SetValue(vu494)
    local v496 = v112.Sea:AddToggle("AutoFindPrehistoric", {
        ["Title"] = "T\195\172m \196\144\225\186\163o Dung Nham",
        ["Description"] = "",
        ["Default"] = false
    })
    v113.AutoFindPrehistoric:SetValue(false)
    v496:OnChanged(function(p497)
        _G.AutoFindPrehistoric = p497
    end)
    local vu498 = {}
    local vu499 = false
    local vu500 = false
    vu491.RenderStepped:Connect(function()
		-- upvalues: (ref) vu500, (ref) vu490, (ref) vu499, (ref) vu498, (ref) vu493, (ref) vu494, (ref) vu492, (ref) vu110
        if _G.AutoFindPrehistoric then
            local v501 = vu490.LocalPlayer.Character
            if v501 and v501:FindFirstChild("Humanoid") then
                local function v506()
					-- upvalues: (ref) vu499, (ref) vu498
                    if vu499 then
                        return
                    end
                    vu499 = true
                    local v502, v503, v504 = pairs(vu498)
                    while true do
                        local v505
                        v504, v505 = v502(v503, v504)
                        if v504 == nil then
                            break
                        end
                        if v505 and (v505.Parent and (v505.Name == "VehicleSeat" and not v505.Occupant)) then
                            Tween2(v505.CFrame)
                            break
                        end
                    end
                    vu499 = false
                end
                local v507 = v501.Humanoid
                local v508, v509, v510 = pairs(vu493.Boats:GetChildren())
                local v511 = false
                local v512 = nil
                while true do
                    local v513
                    v510, v513 = v508(v509, v510)
                    if v510 == nil then
                        break
                    end
                    local v514 = v513:FindFirstChild("VehicleSeat")
                    if v514 and v514.Occupant == v507 then
                        vu498[v513.Name] = v514
                        v512 = v514
                        v511 = true
                    elseif v514 and v514.Occupant == nil then
                        v506()
                    end
                end
                if v511 then
                    v512.MaxSpeed = vu494
                    v512.CFrame = CFrame.new(Vector3.new(v512.Position.X, v512.Position.Y, v512.Position.Z)) * v512.CFrame.Rotation
                    vu492:SendKeyEvent(true, "W", false, game)
                    local v515, v516, v517 = pairs(vu493.Boats:GetDescendants())
                    while true do
                        local v518
                        v517, v518 = v515(v516, v517)
                        if v517 == nil then
                            break
                        end
                        if v518:IsA("BasePart") then
                            v518.CanCollide = false
                        end
                    end
                    local v519, v520, v521 = pairs(v501:GetDescendants())
                    while true do
                        local v522
                        v521, v522 = v519(v520, v521)
                        if v521 == nil then
                            break
                        end
                        if v522:IsA("BasePart") then
                            v522.CanCollide = false
                        end
                    end
                    local v523, v524, v525 = ipairs({
                        "ShipwreckIsland",
                        "SandIsland",
                        "TreeIsland",
                        "TinyIsland",
                        "MysticIsland",
                        "KitsuneIsland",
                        "FrozenDimension"
                    })
                    while true do
                        local v526
                        v525, v526 = v523(v524, v525)
                        if v525 == nil then
                            break
                        end
                        local v527 = vu493.Map:FindFirstChild(v526)
                        if v527 and v527:IsA("Model") then
                            v527:Destroy()
                        end
                    end
                    if vu493.Map:FindFirstChild("PrehistoricIsland") then
                        vu492:SendKeyEvent(false, "W", false, game)
                        _G.AutoFindPrehistoric = false
                        if not vu500 then
                            vu110:Notify({
                                ["Title"] = "Maru Hub",
                                ["Content"] = "\196\144\225\186\163o Dung Nham T\195\172m Th\225\186\165y",
                                ["Duration"] = 10
                            })
                            vu500 = true
                        end
                    end
                else
                    return
                end
            else
                return
            end
        else
            vu500 = false
            return
        end
    end)
    local v528 = v112.Sea:AddToggle("AutoFindMirage", {
        ["Title"] = "T\195\172m \196\144\225\186\163o B\195\173 \225\186\168n",
        ["Description"] = "",
        ["Default"] = false
    })
    v113.AutoFindMirage:SetValue(false)
    v528:OnChanged(function(p529)
        _G.AutoFindMirage = p529
    end)
    local vu530 = {}
    local vu531 = false
    local vu532 = false
    vu491.RenderStepped:Connect(function()
		-- upvalues: (ref) vu532, (ref) vu490, (ref) vu531, (ref) vu530, (ref) vu493, (ref) vu494, (ref) vu492, (ref) vu110
        if _G.AutoFindMirage then
            local v533 = vu490.LocalPlayer.Character
            if v533 and v533:FindFirstChild("Humanoid") then
                local function v538()
					-- upvalues: (ref) vu531, (ref) vu530
                    if vu531 then
                        return
                    end
                    vu531 = true
                    local v534, v535, v536 = pairs(vu530)
                    while true do
                        local v537
                        v536, v537 = v534(v535, v536)
                        if v536 == nil then
                            break
                        end
                        if v537 and (v537.Parent and (v537.Name == "VehicleSeat" and not v537.Occupant)) then
                            Tween2(v537.CFrame)
                            break
                        end
                    end
                    vu531 = false
                end
                local v539 = v533.Humanoid
                local v540, v541, v542 = pairs(vu493.Boats:GetChildren())
                local v543 = false
                local v544 = nil
                while true do
                    local v545
                    v542, v545 = v540(v541, v542)
                    if v542 == nil then
                        break
                    end
                    local v546 = v545:FindFirstChild("VehicleSeat")
                    if v546 and v546.Occupant == v539 then
                        vu530[v545.Name] = v546
                        v544 = v546
                        v543 = true
                    elseif v546 and v546.Occupant == nil then
                        v538()
                    end
                end
                if v543 then
                    v544.MaxSpeed = vu494
                    v544.CFrame = CFrame.new(Vector3.new(v544.Position.X, v544.Position.Y, v544.Position.Z)) * v544.CFrame.Rotation
                    vu492:SendKeyEvent(true, "W", false, game)
                    local v547, v548, v549 = pairs(vu493.Boats:GetDescendants())
                    while true do
                        local v550
                        v549, v550 = v547(v548, v549)
                        if v549 == nil then
                            break
                        end
                        if v550:IsA("BasePart") then
                            v550.CanCollide = false
                        end
                    end
                    local v551, v552, v553 = pairs(v533:GetDescendants())
                    while true do
                        local v554
                        v553, v554 = v551(v552, v553)
                        if v553 == nil then
                            break
                        end
                        if v554:IsA("BasePart") then
                            v554.CanCollide = false
                        end
                    end
                    local v555, v556, v557 = ipairs({
                        "ShipwreckIsland",
                        "SandIsland",
                        "TreeIsland",
                        "TinyIsland",
                        "PrehistoricIsland",
                        "KitsuneIsland",
                        "FrozenDimension"
                    })
                    while true do
                        local v558
                        v557, v558 = v555(v556, v557)
                        if v557 == nil then
                            break
                        end
                        local v559 = vu493.Map:FindFirstChild(v558)
                        if v559 and v559:IsA("Model") then
                            v559:Destroy()
                        end
                    end
                    if vu493.Map:FindFirstChild("MysticIsland") then
                        vu492:SendKeyEvent(false, "W", false, game)
                        _G.AutoFindMirage = false
                        if not vu532 then
                            vu110:Notify({
                                ["Title"] = "Maru Hub",
                                ["Content"] = "\196\144\225\186\163o B\195\173 \225\186\168n T\195\172m Th\225\186\165y",
                                ["Duration"] = 10
                            })
                            vu532 = true
                        end
                    end
                else
                    return
                end
            else
                return
            end
        else
            vu532 = false
            return
        end
    end)
    local v560 = v112.Sea:AddToggle("AutoFindFrozen", {
        ["Title"] = "T\195\172m \196\144\225\186\163o Leviathan",
        ["Description"] = "C\225\186\167n 5 Ng\198\176\225\187\157i Kh\195\180ng Idk",
        ["Default"] = false
    })
    v113.AutoFindFrozen:SetValue(false)
    v560:OnChanged(function(p561)
        _G.AutoFindFrozen = p561
    end)
    local vu562 = {}
    local vu563 = false
    local vu564 = false
    vu491.RenderStepped:Connect(function()
		-- upvalues: (ref) vu564, (ref) vu490, (ref) vu563, (ref) vu562, (ref) vu493, (ref) vu494, (ref) vu492, (ref) vu110
        if _G.AutoFindFrozen then
            local v565 = vu490.LocalPlayer.Character
            if v565 and v565:FindFirstChild("Humanoid") then
                local function v570()
					-- upvalues: (ref) vu563, (ref) vu562
                    if vu563 then
                        return
                    end
                    vu563 = true
                    local v566, v567, v568 = pairs(vu562)
                    while true do
                        local v569
                        v568, v569 = v566(v567, v568)
                        if v568 == nil then
                            break
                        end
                        if v569 and (v569.Parent and (v569.Name == "VehicleSeat" and not v569.Occupant)) then
                            Tween2(v569.CFrame)
                            break
                        end
                    end
                    vu563 = false
                end
                local v571 = v565.Humanoid
                local v572, v573, v574 = pairs(vu493.Boats:GetChildren())
                local v575 = false
                local v576 = nil
                while true do
                    local v577
                    v574, v577 = v572(v573, v574)
                    if v574 == nil then
                        break
                    end
                    local v578 = v577:FindFirstChild("VehicleSeat")
                    if v578 and v578.Occupant == v571 then
                        vu562[v577.Name] = v578
                        v576 = v578
                        v575 = true
                    elseif v578 and v578.Occupant == nil then
                        v570()
                    end
                end
                if v575 then
                    v576.MaxSpeed = vu494
                    v576.CFrame = CFrame.new(Vector3.new(v576.Position.X, v576.Position.Y, v576.Position.Z)) * v576.CFrame.Rotation
                    vu492:SendKeyEvent(true, "W", false, game)
                    local v579, v580, v581 = pairs(vu493.Boats:GetDescendants())
                    while true do
                        local v582
                        v581, v582 = v579(v580, v581)
                        if v581 == nil then
                            break
                        end
                        if v582:IsA("BasePart") then
                            v582.CanCollide = false
                        end
                    end
                    local v583, v584, v585 = pairs(v565:GetDescendants())
                    while true do
                        local v586
                        v585, v586 = v583(v584, v585)
                        if v585 == nil then
                            break
                        end
                        if v586:IsA("BasePart") then
                            v586.CanCollide = false
                        end
                    end
                    local v587, v588, v589 = ipairs({
                        "ShipwreckIsland",
                        "SandIsland",
                        "TreeIsland",
                        "TinyIsland",
                        "MysticIsland",
                        "KitsuneIsland",
                        "PrehistoricIsland"
                    })
                    while true do
                        local v590
                        v589, v590 = v587(v588, v589)
                        if v589 == nil then
                            break
                        end
                        local v591 = vu493.Map:FindFirstChild(v590)
                        if v591 and v591:IsA("Model") then
                            v591:Destroy()
                        end
                    end
                    if vu493.Map:FindFirstChild("FrozenDimension") then
                        vu492:SendKeyEvent(false, "W", false, game)
                        _G.AutoFindFrozen = false
                        if not vu564 then
                            vu110:Notify({
                                ["Title"] = "Maru Hub",
                                ["Content"] = "\196\144\225\186\163o Leviathan T\195\172m Th\225\186\165y",
                                ["Duration"] = 10
                            })
                            vu564 = true
                        end
                    end
                else
                    return
                end
            else
                return
            end
        else
            vu564 = false
            return
        end
    end)
    v112.Sea:AddToggle("AutoComeTiki", {
        ["Title"] = "L\195\161i Thuy\225\187\129n V\225\187\129 \196\144\225\186\163o Tiki",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p592)
        _G.AutoComeTiki = p592
    end)
    vu491.RenderStepped:Connect(function()
		-- upvalues: (ref) vu490, (ref) vu493, (ref) vu494, (ref) vu491, (ref) vu492
        if not _G.AutoComeTiki then
            return
        end
        local v593 = vu490.LocalPlayer.Character
        if not (v593 and v593:FindFirstChild("Humanoid")) then
            return
        end
        local v594 = v593.Humanoid
        local v595, v596, v597 = pairs(vu493.Boats:GetChildren())
        local v598 = nil
        while true do
            local v599
            v597, v599 = v595(v596, v597)
            if v597 == nil then
                v600 = v598
                break
            end
            local v600 = v599:FindFirstChild("VehicleSeat")
            if v600 and v600.Occupant == v594 then
                break
            end
        end
        if v600 then
            v600.MaxSpeed = vu494
            local v601 = CFrame.new(- 16217.7568359375, 9.126761436462402, 446.06536865234375)
            local v602 = v600.Position
            local v603 = v601.Position
            local v604 = (v603 - v602).unit * v600.MaxSpeed * vu491.RenderStepped:Wait()
            v600.CFrame = v600.CFrame + v604
            CFrame.new(v602, v603)
            v600.CFrame = CFrame.new(v600.Position, v603)
            if (v600.Position - v603).magnitude < 120 then
                _G.AutoComeTiki = false
                vu492:SendKeyEvent(false, "W", false, game)
            end
        end
    end)
    v112.Sea:AddToggle("AutoComeHydra", {
        ["Title"] = "L\195\161i Thuy\225\187\129n V\225\187\129 \196\144\225\186\163o Hydra",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p605)
        _G.AutoComeHydra = p605
    end)
    vu491.RenderStepped:Connect(function()
		-- upvalues: (ref) vu490, (ref) vu493, (ref) vu494, (ref) vu491, (ref) vu492
        if not _G.AutoComeHydra then
            return
        end
        local v606 = vu490.LocalPlayer.Character
        if not (v606 and v606:FindFirstChild("Humanoid")) then
            return
        end
        local v607 = v606.Humanoid
        local v608, v609, v610 = pairs(vu493.Boats:GetChildren())
        local v611 = nil
        while true do
            local v612
            v610, v612 = v608(v609, v610)
            if v610 == nil then
                v613 = v611
                break
            end
            local v613 = v612:FindFirstChild("VehicleSeat")
            if v613 and v613.Occupant == v607 then
                break
            end
        end
        if v613 then
            v613.MaxSpeed = vu494
            local v614 = CFrame.new(5193.9375, - 0.04690289497375488, 1631.578369140625)
            local v615 = v613.Position
            local v616 = v614.Position
            local v617 = (v616 - v615).unit * v613.MaxSpeed * vu491.RenderStepped:Wait()
            v613.CFrame = v613.CFrame + v617
            CFrame.new(v615, v616)
            v613.CFrame = CFrame.new(v613.Position, v616)
            if (v613.Position - v616).magnitude < 120 then
                _G.AutoComeHydra = false
                vu492:SendKeyEvent(false, "W", false, game)
            end
        end
    end)
    v112.Sea:AddButton({
        ["Title"] = "Bay \196\144\225\186\191n Khu V\225\187\177c S\196\131n",
        ["Description"] = "",
        ["Callback"] = function()
            Tween2(CFrame.new(- 16917.154296875, 7.757596015930176, 511.8203125))
        end
    })
    local vu618 = {}
    local v619 = v112.Sea:AddDropdown("DropdownBoat", {
        ["Title"] = "Ch\225\187\141n Thuy\225\187\129n",
        ["Description"] = "",
        ["Values"] = {
            "Beast Hunter",
            "Sleigh",
            "Miracle",
            "The Sentinel",
            "Guardian",
            "Lantern",
            "Dinghy",
            "PirateSloop",
            "PirateBrigade",
            "PirateGrandBrigade",
            "MarineGrandBrigade",
            "MarineBrigade",
            "MarineSloop"
        },
        ["Multi"] = false,
        ["Default"] = 1
    })
    v619:SetValue(selectedBoat)
    v619:OnChanged(function(p620)
        selectedBoat = p620
    end)
    local function vu627(pu621)
		-- upvalues: (ref) vu493, (ref) vu618
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            "BuyBoat",
            pu621
        }))
        task.delay(2, function()
			-- upvalues: (ref) vu493, (ref) pu621, (ref) vu618
            local v622, v623, v624 = pairs(vu493.Boats:GetChildren())
            while true do
                local v625
                v624, v625 = v622(v623, v624)
                if v624 == nil then
                    break
                end
                if v625:IsA("Model") and v625.Name == pu621 then
                    local v626 = v625:FindFirstChild("VehicleSeat")
                    if v626 and not v626.Occupant then
                        vu618[pu621] = v626
                    end
                end
            end
        end)
    end
    local function vu632()
		-- upvalues: (ref) vu618
        local v628, v629, v630 = pairs(vu618)
        while true do
            local v631
            v630, v631 = v628(v629, v630)
            if v630 == nil then
                break
            end
            if v631 and (v631.Parent and (v631.Name == "VehicleSeat" and not v631.Occupant)) then
                Tween2(v631.CFrame)
            end
        end
    end
    game:GetService("RunService").RenderStepped:Connect(function()
		-- upvalues: (ref) vu618
        local v633, v634, v635 = pairs(vu618)
        while true do
            local v636
            v635, v636 = v633(v634, v635)
            if v635 == nil then
                break
            end
            if v636 and (v636.Parent and (v636.Name == "VehicleSeat" and not v636.Occupant)) then
                vu618[v635] = v636
            end
        end
    end)
    v112.Sea:AddButton({
        ["Title"] = "Mua Thuy\225\187\129n",
        ["Description"] = "",
        ["Callback"] = function()
			-- upvalues: (ref) vu627
            vu627(selectedBoat)
        end
    })
    v112.Sea:AddButton({
        ["Title"] = "Bay \196\144\225\186\191n Thuy\225\187\129n",
        ["Description"] = "Duy Nh\225\186\165t Thuy\225\187\129n B\225\186\161n Mua \225\187\158 Ch\225\187\151 Ch\225\187\141n",
        ["Callback"] = function()
			-- upvalues: (ref) vu632
            vu632()
        end
    })
    v112.Sea:AddToggle("ToggleTerrorshark", {
        ["Title"] = "\196\144\225\186\165m C\195\161 M\225\186\173p",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p637)
        _G.AutoTerrorshark = p637
    end)
    v113.ToggleTerrorshark:SetValue(false)
    spawn(function()
        while wait() do
            if _G.AutoTerrorshark then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Terrorshark") then
                        local v638, v639, v640 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v641
                            v640, v641 = v638(v639, v640)
                            if v640 == nil then
                                break
                            end
                            if v641.Name == "Terrorshark" and (v641:FindFirstChild("Humanoid") and (v641:FindFirstChild("HumanoidRootPart") and v641.Humanoid.Health > 0)) then
                                repeat
                                    wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v641.HumanoidRootPart.CanCollide = false
                                    v641.Humanoid.WalkSpeed = 0
                                    v641.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v641.HumanoidRootPart.CFrame * Pos)
                                until not _G.AutoTerrorshark or (not v641.Parent or v641.Humanoid.Health <= 0)
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end)
            end
        end
    end)
    v112.Sea:AddToggle("TogglePiranha", {
        ["Title"] = "\196\144\225\186\165m Piranha",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p642)
        _G.farmpiranya = p642
    end)
    v113.TogglePiranha:SetValue(false)
    spawn(function()
        while wait() do
            if _G.farmpiranya then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Piranha") then
                        local v643, v644, v645 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v646
                            v645, v646 = v643(v644, v645)
                            if v645 == nil then
                                break
                            end
                            if v646.Name == "Piranha" and (v646:FindFirstChild("Humanoid") and (v646:FindFirstChild("HumanoidRootPart") and v646.Humanoid.Health > 0)) then
                                repeat
                                    wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v646.HumanoidRootPart.CanCollide = false
                                    v646.Humanoid.WalkSpeed = 0
                                    v646.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v646.HumanoidRootPart.CFrame * Pos)
                                until not _G.farmpiranya or (not v646.Parent or v646.Humanoid.Health <= 0)
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Piranha") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Piranha").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end)
            end
        end
    end)
    v112.Sea:AddToggle("ToggleShark", {
        ["Title"] = "\196\144\225\186\165m C\195\161 Con",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p647)
        _G.AutoShark = p647
    end)
    v113.ToggleShark:SetValue(false)
    spawn(function()
        while wait() do
            if _G.AutoShark then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Shark") then
                        local v648, v649, v650 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v651
                            v650, v651 = v648(v649, v650)
                            if v650 == nil then
                                break
                            end
                            if v651.Name == "Shark" and (v651:FindFirstChild("Humanoid") and (v651:FindFirstChild("HumanoidRootPart") and v651.Humanoid.Health > 0)) then
                                repeat
                                    wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v651.HumanoidRootPart.CanCollide = false
                                    v651.Humanoid.WalkSpeed = 0
                                    v651.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v651.HumanoidRootPart.CFrame * Pos)
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                until not _G.AutoShark or (not v651.Parent or v651.Humanoid.Health <= 0)
                            end
                        end
                    else
                        Tween(game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark") then
                            Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Terrorshark").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        end
                    end
                end)
            end
        end
    end)
    v112.Sea:AddToggle("ToggleFishCrew", {
        ["Title"] = "\196\144\225\186\165m T\195\160u C\195\161",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p652)
        _G.AutoFishCrew = p652
    end)
    v113.ToggleFishCrew:SetValue(false)
    spawn(function()
        while wait() do
            if _G.AutoFishCrew then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Fish Crew Member") then
                        local v653, v654, v655 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v656
                            v655, v656 = v653(v654, v655)
                            if v655 == nil then
                                break
                            end
                            if v656.Name == "Fish Crew Member" and (v656:FindFirstChild("Humanoid") and (v656:FindFirstChild("HumanoidRootPart") and v656.Humanoid.Health > 0)) then
                                repeat
                                    wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v656.HumanoidRootPart.CanCollide = false
                                    v656.Humanoid.WalkSpeed = 0
                                    v656.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v656.HumanoidRootPart.CFrame * Pos)
                                    game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                until not _G.AutoFishCrew or (not v656.Parent or v656.Humanoid.Health <= 0)
                            end
                        end
                    else
                        Tween(game:GetService("Workspace").Boats.PirateGrandBrigade.VehicleSeat.CFrame * CFrame.new(0, 1, 0))
                        if game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member") then
                            Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Fish Crew Member").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        end
                    end
                end)
            end
        end
    end)
    v112.Sea:AddToggle("ToggleShip", {
        ["Title"] = "\196\144\225\186\165m T\195\160u",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p657)
        _G.Ship = p657
    end)
    v113.ToggleShip:SetValue(false)
    function CheckPirateBoat()
        local v658 = next
        local v659, v660 = game:GetService("Workspace").Enemies:GetChildren()
        local v661 = {
            "PirateGrandBrigade",
            "PirateBrigade"
        }
        while true do
            local v662
            v660, v662 = v658(v659, v660)
            if v660 == nil then
                break
            end
            if table.find(v661, v662.Name) and (v662:FindFirstChild("Health") and v662.Health.Value > 0) then
                return v662
            end
        end
    end
    spawn(function()
        while wait() do
            if _G.Ship then
                pcall(function()
                    if CheckPirateBoat() then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
                        wait(0.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
                        local v663 = CheckPirateBoat()
                        repeat
                            wait()
                            spawn(Tween(v663.Engine.CFrame * CFrame.new(0, - 20, 0)), 1)
                            AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, - 5, 0)
                            Skillaimbot = true
                            AutoSkill = false
                        until not v663 or (not v663.Parent or (v663.Health.Value <= 0 or not CheckPirateBoat()))
                        Skillaimbot = true
                        AutoSkill = false
                    end
                end)
            end
        end
    end)
    v112.Sea:AddToggle("ToggleGhostShip", {
        ["Title"] = "\196\144\225\186\165m T\195\160u Ma",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p664)
        _G.GhostShip = p664
    end)
    v113.ToggleGhostShip:SetValue(false)
    function CheckPirateBoat()
        local v665 = next
        local v666, v667 = game:GetService("Workspace").Enemies:GetChildren()
        local v668 = {
            "FishBoat"
        }
        while true do
            local v669
            v667, v669 = v665(v666, v667)
            if v667 == nil then
                break
            end
            if table.find(v668, v669.Name) and (v669:FindFirstChild("Health") and v669.Health.Value > 0) then
                return v669
            end
        end
    end
    spawn(function()
        while wait() do
            pcall(function()
                if _G.bjirFishBoat and CheckPirateBoat() then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 32, false, game)
                    wait()
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 32, false, game)
                    local v670 = CheckPirateBoat()
                    repeat
                        wait()
                        spawn(Tween(v670.Engine.CFrame * CFrame.new(0, - 20, 0), 1))
                        AutoSkill = true
                        Skillaimbot = true
                        AimBotSkillPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, - 5, 0)
                    until v670.Parent or (v670.Health.Value <= 0 or not CheckPirateBoat())
                    AutoSkill = false
                    Skillaimbot = false
                end
            end)
        end
    end)
    spawn(function()
        while wait() do
            if _G.bjirFishBoat then
                pcall(function()
                    if CheckPirateBoat() then
                        AutoHaki()
                        game:GetService("VirtualUser"):CaptureController()
                        game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                        local v671, v672, v673 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                        while true do
                            local v674
                            v673, v674 = v671(v672, v673)
                            if v673 == nil then
                                break
                            end
                            if v674:IsA("Tool") and v674.ToolTip == "Melee" then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v674)
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "C", false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        local v675, v676, v677 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                        while true do
                            local v678
                            v677, v678 = v675(v676, v677)
                            if v677 == nil then
                                break
                            end
                            if v678:IsA("Tool") and v678.ToolTip == "Blox Fruit" then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v678)
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "V", false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "V", false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait()
                        local v679, v680, v681 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                        while true do
                            local v682
                            v681, v682 = v679(v680, v681)
                            if v681 == nil then
                                break
                            end
                            if v682:IsA("Tool") and v682.ToolTip == "Sword" then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v682)
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait()
                        local v683, v684, v685 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                        while true do
                            local v686
                            v685, v686 = v683(v684, v685)
                            if v685 == nil then
                                break
                            end
                            if v686:IsA("Tool") and v686.ToolTip == "Gun" then
                                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v686)
                            end
                        end
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        wait(0.2)
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                    end
                end)
            end
        end
    end)
    v112.Main:AddSection("Elite")
    local vu687 = v112.Main:AddParagraph({
        ["Title"] = "Tr\225\186\161ng Th\195\161i Elite",
        ["Content"] = ""
    })
    spawn(function()
		-- upvalues: (ref) vu687
        while wait() do
            pcall(function()
				-- upvalues: (ref) vu687
                if game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") or (game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") or (game:GetService("ReplicatedStorage"):FindFirstChild("Urban") or (game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or (game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban"))))) then
                    vu687:SetDesc("Elite Boss: \226\156\133\239\184\143 | Killed:  " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
                else
                    vu687:SetDesc("Elite Boss: \226\157\140\239\184\143 | Killed: " .. game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress"))
                end
            end)
        end
    end)
    v112.Main:AddToggle("ToggleElite", {
        ["Title"] = "\196\144\225\186\165m Elite",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p688)
        _G.AutoElite = p688
    end)
    v113.ToggleElite:SetValue(false)
    spawn(function()
        while task.wait() do
            if _G.AutoElite then
                pcall(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible ~= true then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Diablo") or (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Deandre") or string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Urban")) then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Diablo") or (game:GetService("Workspace").Enemies:FindFirstChild("Deandre") or game:GetService("Workspace").Enemies:FindFirstChild("Urban")) then
                            local v689, v690, v691 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v692
                                v691, v692 = v689(v690, v691)
                                if v691 == nil then
                                    break
                                end
                                if v692:FindFirstChild("Humanoid") and (v692:FindFirstChild("HumanoidRootPart") and (v692.Humanoid.Health > 0 and (v692.Name == "Diablo" or (v692.Name == "Deandre" or v692.Name == "Urban")))) then
                                    repeat
                                        wait(_G.Fast_Delay)
                                        AttackNoCoolDown()
                                        EquipTool(SelectWeapon)
                                        AutoHaki()
                                        Tween2(v692.HumanoidRootPart.CFrame * Pos)
                                        v692.Humanoid.WalkSpeed = 0
                                        v692.HumanoidRootPart.CanCollide = false
                                        v692.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    until _G.AutoElite == false or (v692.Humanoid.Health <= 0 or not v692.Parent)
                                end
                            end
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Diablo") then
                            Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Diablo").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Deandre") then
                            Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Deandre").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        elseif game:GetService("ReplicatedStorage"):FindFirstChild("Urban") then
                            Tween2(game:GetService("ReplicatedStorage"):FindFirstChild("Urban").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                        end
                    end
                end)
            end
        end
    end)
end
if Sea3 then
    v112.Sea:AddSection("\196\144\225\186\163o B\195\173 \225\186\168n")
    local vu693 = v112.Sea:AddParagraph({
        ["Title"] = "Tr\225\186\161ng Th\195\161i",
        ["Content"] = ""
    })
    task.spawn(function()
        while task.wait() do
            pcall(function()
                local v694 = game:GetService("Lighting").Sky.MoonTextureId
                if v694 == "http://www.roblox.com/asset/?id=9709149431" then
                    FullMoonStatus = "100%"
                elseif v694 == "http://www.roblox.com/asset/?id=9709149052" then
                    FullMoonStatus = "75%"
                elseif v694 == "http://www.roblox.com/asset/?id=9709143733" then
                    FullMoonStatus = "50%"
                elseif v694 == "http://www.roblox.com/asset/?id=9709150401" then
                    FullMoonStatus = "25%"
                elseif v694 == "http://www.roblox.com/asset/?id=9709149680" then
                    FullMoonStatus = "15%"
                else
                    FullMoonStatus = "0%"
                end
            end)
        end
    end)
    task.spawn(function()
        while task.wait() do
            pcall(function()
                if game.Workspace.Map:FindFirstChild("MysticIsland") then
                    MirageStatus = "\226\156\133\239\184\143"
                else
                    MirageStatus = "\226\157\140\239\184\143"
                end
            end)
        end
    end)
    spawn(function()
		-- upvalues: (ref) vu693
        pcall(function()
			-- upvalues: (ref) vu693
            while wait() do
                vu693:SetDesc("\196\144\225\186\163o B\195\173 \225\186\168n: " .. MirageStatus .. " | Tr\196\131ng Tr\195\178n: " .. FullMoonStatus)
            end
        end)
    end)
    v112.Sea:AddButton({
        ["Title"] = "Bay \196\144\225\186\191n Ch\225\187\151 Cao",
        ["Description"] = "",
        ["Callback"] = function()
            TweenToHighestPoint()
        end
    })
    function TweenToHighestPoint()
        local v695 = getHighestPoint()
        if v695 then
            Tween2(v695.CFrame * CFrame.new(0, 211.88, 0))
        end
    end
    function getHighestPoint()
        if not game.Workspace.Map:FindFirstChild("MysticIsland") then
            return nil
        end
        local v696, v697, v698 = pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants())
        while true do
            local v699
            v698, v699 = v696(v697, v698)
            if v698 == nil then
                break
            end
            if v699:IsA("MeshPart") and v699.MeshId == "rbxassetid://83190276951914" then
                return v699
            end
        end
    end
end
v112.Sea:AddToggle("ToggleTpAdvanced", {
    ["Title"] = "Bay \196\144\225\186\191n Advanced Fruit Dealer",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p700)
    _G.AutoTpAdvanced = p700
end)
spawn(function()
    while wait() do
        if _G.AutoTpAdvanced then
            local v701 = game.ReplicatedStorage.NPCs:FindFirstChild("Advanced Fruit Dealer")
            if v701 and v701:IsA("Model") then
                local v702 = v701.PrimaryPart
                if v702 then
                    v702 = v701.PrimaryPart.Position
                end
                if v702 then
                    Tween2(CFrame.new(v702))
                end
            end
        end
    end
end)
v112.Sea:AddToggle("ToggleTweenGear", {
    ["Title"] = "Bay \196\144\225\186\191n B\195\161nh R\196\131ng",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p703)
    _G.TweenToGear = p703
end)
v113.ToggleTweenGear:SetValue(false)
spawn(function()
    pcall(function()
        while wait() do
            if _G.TweenToGear and game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                local v704, v705, v706 = pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren())
                while true do
                    local v707
                    v706, v707 = v704(v705, v706)
                    if v706 == nil then
                        break
                    end
                    if v707:IsA("MeshPart") and v707.Material == Enum.Material.Neon then
                        Tween2(v707.CFrame)
                    end
                end
            end
        end
    end)
end)
v112.Sea:AddToggle("Togglelockmoon", {
    ["Title"] = "Nh\195\172n Tr\196\131ng V\195\160 D\195\185ng T\225\187\153c",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p708)
    _G.AutoLockMoon = p708
end)
v113.Togglelockmoon:SetValue(false)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoLockMoon then
                local v709 = game.Lighting:GetMoonDirection()
                local v710 = game.Workspace.CurrentCamera.CFrame.p + v709 * 100
                game.Workspace.CurrentCamera.CFrame = CFrame.lookAt(game.Workspace.CurrentCamera.CFrame.p, v710)
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoLockMoon then
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
            end
        end)
    end
end)
v112.ITM:AddToggle("ToggleAutoSaber", {
    ["Title"] = "Saber",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p711)
    _G.Auto_Saber = p711
end)
v113.ToggleAutoSaber:SetValue(false)
spawn(function()
    while task.wait() do
        if _G.Auto_Saber and game.Players.LocalPlayer.Data.Level.Value >= 200 then
            pcall(function()
                if game:GetService("Workspace").Map.Jungle.Final.Part.Transparency ~= 0 then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Saber Expert") or game:GetService("ReplicatedStorage"):FindFirstChild("Saber Expert") then
                        local v712, v713, v714 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v715
                            v714, v715 = v712(v713, v714)
                            if v714 == nil then
                                break
                            end
                            if v715:FindFirstChild("Humanoid") and (v715:FindFirstChild("HumanoidRootPart") and (v715.Humanoid.Health > 0 and v715.Name == "Saber Expert")) then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    EquipTool(SelectWeapon)
                                    Tween(v715.HumanoidRootPart.CFrame * Pos)
                                    v715.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v715.HumanoidRootPart.Transparency = 1
                                    v715.Humanoid.JumpPower = 0
                                    v715.Humanoid.WalkSpeed = 0
                                    v715.HumanoidRootPart.CanCollide = false
                                    bringmob = true
                                    FarmPos = v715.HumanoidRootPart.CFrame
                                    MonFarm = v715.Name
                                    AttackNoCoolDown()
                                until v715.Humanoid.Health <= 0 or not _G.Auto_Saber
                                bringmob = true
                                if v715.Humanoid.Health <= 0 then
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "PlaceRelic")
                                end
                            end
                        end
                    end
                elseif game:GetService("Workspace").Map.Jungle.QuestPlates.Door.Transparency ~= 0 then
                    if game:GetService("Workspace").Map.Desert.Burn.Part.Transparency ~= 0 then
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan") == 0 then
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") ~= nil then
                                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") ~= 0 then
                                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon") == 1 then
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                                        wait(0.5)
                                        EquipTool("Relic")
                                        wait(0.5)
                                        Tween(CFrame.new(- 1404.91504, 29.9773273, 3.80598116, 0.876514494, 5.6690688e-9, 0.481375456, 2.53852e-8, 1, - 5.799956e-8, - 0.481375456, 6.3057264e-8, 0.876514494))
                                    end
                                elseif game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader") or game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                                    Tween(CFrame.new(- 2967.59521, - 4.91089821, 5328.70703, 0.342208564, - 0.0227849055, 0.939347804, 0.0251603816, 0.999569714, 0.0150796166, - 0.939287126, 0.0184739735, 0.342634559))
                                    local v716, v717, v718 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                                    while true do
                                        local v719
                                        v718, v719 = v716(v717, v718)
                                        if v718 == nil then
                                            break
                                        end
                                        if v719.Name == "Mob Leader" then
                                            if game:GetService("Workspace").Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") and (v719:FindFirstChild("Humanoid") and (v719:FindFirstChild("HumanoidRootPart") and v719.Humanoid.Health > 0)) then
                                                repeat
                                                    task.wait(_G.Fast_Delay)
                                                    AutoHaki()
                                                    EquipTool(SelectWeapon)
                                                    v719.HumanoidRootPart.CanCollide = false
                                                    v719.Humanoid.WalkSpeed = 0
                                                    v719.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                    Tween(v719.HumanoidRootPart.CFrame * Pos)
                                                    AttackNoCoolDown()
                                                until v719.Humanoid.Health <= 0 or not _G.Auto_Saber
                                            end
                                            if game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader") then
                                                Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Mob Leader").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                            end
                                        end
                                    end
                                end
                            else
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "RichSon")
                            end
                        else
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "GetCup")
                            wait(0.5)
                            EquipTool("Cup")
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "FillCup", game:GetService("Players").LocalPlayer.Character.Cup)
                            wait(0)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress", "SickMan")
                        end
                    elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Torch") then
                        EquipTool("Torch")
                        Tween(CFrame.new(1114.61475, 5.04679728, 4350.22803, - 0.648466587, - 1.2879909e-9, 0.761243105, - 5.706529e-10, 1, 1.2058454e-9, - 0.761243105, 3.4754488e-10, - 0.648466587))
                    else
                        Tween(CFrame.new(- 1610.00757, 11.5049858, 164.001587, 0.984807551, - 0.167722285, - 0.0449818149, 0.17364943, 0.951244235, 0.254912198, 0.00003423728, - 0.258850515, 0.965917408))
                    end
                elseif (CFrame.new(- 1612.55884, 36.9774132, 148.719543, 0.37091279, 3.071715e-9, - 0.928667724, 3.970995e-8, 1, 1.9167935e-8, 0.928667724, - 4.398698e-8, 0.37091279).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 100 then
                    Tween(CFrame.new(- 1612.55884, 36.9774132, 148.719543, 0.37091279, 3.071715e-9, - 0.928667724, 3.970995e-8, 1, 1.9167935e-8, 0.928667724, - 4.398698e-8, 0.37091279))
                else
                    Tween(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
                    wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate1.Button.CFrame
                    wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate2.Button.CFrame
                    wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate3.Button.CFrame
                    wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate4.Button.CFrame
                    wait(1)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Jungle.QuestPlates.Plate5.Button.CFrame
                    wait(1)
                end
            end)
        end
    end
end)
v112.ITM:AddToggle("ToggleAutoPoleV1", {
    ["Title"] = "Pole V1",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p720)
    _G.Auto_PoleV1 = p720
end)
v113.ToggleAutoPoleV1:SetValue(false)
local vu721 = CFrame.new(- 7748.0185546875, 5606.80615234375, - 2305.898681640625)
spawn(function()
	-- upvalues: (ref) vu721
    while wait() do
        if _G.Auto_PoleV1 then
            pcall(function()
				-- upvalues: (ref) vu721
                if game:GetService("Workspace").Enemies:FindFirstChild("Thunder God") then
                    local v722, v723, v724 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local v725
                        v724, v725 = v722(v723, v724)
                        if v724 == nil then
                            break
                        end
                        if v725.Name == "Thunder God" and (v725:FindFirstChild("Humanoid") and (v725:FindFirstChild("HumanoidRootPart") and v725.Humanoid.Health > 0)) then
                            repeat
                                task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                v725.HumanoidRootPart.CanCollide = false
                                v725.Humanoid.WalkSpeed = 0
                                v725.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                Tween(v725.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.Auto_PoleV1 or (not v725.Parent or v725.Humanoid.Health <= 0)
                        end
                    end
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - vu721.Position).Magnitude < 1500 then
                    Tween(vu721)
                end
                Tween(CFrame.new(- 7748.0185546875, 5606.80615234375, - 2305.898681640625))
                if game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)
v112.ITM:AddToggle("ToggleAutoSaw", {
    ["Title"] = "C\198\176a C\195\161 M\225\186\173p",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p726)
    _G.Auto_Saw = p726
end)
v113.ToggleAutoSaw:SetValue(false)
local vu727 = CFrame.new(- 690.33081054688, 15.09425163269, 1582.2380371094)
spawn(function()
	-- upvalues: (ref) vu727
    while wait() do
        if _G.Auto_Saw then
            pcall(function()
				-- upvalues: (ref) vu727
                if game:GetService("Workspace").Enemies:FindFirstChild("The Saw") then
                    local v728, v729, v730 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local v731
                        v730, v731 = v728(v729, v730)
                        if v730 == nil then
                            break
                        end
                        if v731.Name == "The Saw" and (v731:FindFirstChild("Humanoid") and (v731:FindFirstChild("HumanoidRootPart") and v731.Humanoid.Health > 0)) then
                            repeat
                                task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                v731.HumanoidRootPart.CanCollide = false
                                v731.Humanoid.WalkSpeed = 0
                                v731.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                Tween(v731.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.Auto_Saw or (not v731.Parent or v731.Humanoid.Health <= 0)
                        end
                    end
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - vu727.Position).Magnitude < 1500 then
                    Tween(vu727)
                end
                Tween(CFrame.new(- 690.33081054688, 15.09425163269, 1582.2380371094))
                if game:GetService("ReplicatedStorage"):FindFirstChild("The Saw") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("The Saw").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)
v112.ITM:AddToggle("ToggleAutoWarden", {
    ["Title"] = "Ki\225\186\191m Qu\225\186\163n Ng\225\187\165c",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p732)
    _G.Auto_Warden = p732
end)
v113.ToggleAutoWarden:SetValue(false)
local vu733 = CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562)
spawn(function()
	-- upvalues: (ref) vu733
    while wait() do
        if _G.Auto_Warden then
            pcall(function()
				-- upvalues: (ref) vu733
                if game:GetService("Workspace").Enemies:FindFirstChild("Chief Warden") then
                    local v734, v735, v736 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local v737
                        v736, v737 = v734(v735, v736)
                        if v736 == nil then
                            break
                        end
                        if v737.Name == "Chief Warden" and (v737:FindFirstChild("Humanoid") and (v737:FindFirstChild("HumanoidRootPart") and v737.Humanoid.Health > 0)) then
                            repeat
                                task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                v737.HumanoidRootPart.CanCollide = false
                                v737.Humanoid.WalkSpeed = 0
                                v737.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                Tween(v737.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.Auto_Warden or (not v737.Parent or v737.Humanoid.Health <= 0)
                        end
                    end
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - vu733.Position).Magnitude < 1500 then
                    Tween(vu733)
                end
                Tween(CFrame.new(5186.14697265625, 24.86684226989746, 832.1885375976562))
                if game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Chief Warden").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)
if Sea3 then
    v112.ITM:AddToggle("ToggleHallow", {
        ["Title"] = "L\198\176\225\187\161i H\195\161i",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p738)
        AutoHallowSycthe = p738
    end)
    v113.ToggleHallow:SetValue(false)
    spawn(function()
        while wait() do
            if AutoHallowSycthe then
                pcall(function()
                    if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                        local v739, v740, v741 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v742
                            v741, v742 = v739(v740, v741)
                            if v741 == nil then
                                break
                            end
                            if string.find(v742.Name, "Soul Reaper") then
                                repeat
                                    wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v742.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    Tween(v742.HumanoidRootPart.CFrame * Pos)
                                    v742.HumanoidRootPart.Transparency = 1
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until v742.Humanoid.Health <= 0 or AutoHallowSycthe == false
                            end
                        end
                    elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hallow Essence") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hallow Essence") then
                        repeat
                            Tween(CFrame.new(- 8932.322265625, 146.83154296875, 6062.55078125))
                            wait()
                        until (CFrame.new(- 8932.322265625, 146.83154296875, 6062.55078125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 8
                        wait()
                        EquipTool("Hallow Essence")
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Soul Reaper").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                    end
                end)
            end
        end
    end)
    spawn(function()
        while wait() do
            if AutoHallowSycthe then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "Bones",
                    "Buy",
                    1,
                    1
                }))
            end
        end
    end)
    v112.ITM:AddToggle("ToggleYama", {
        ["Title"] = "Yama",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p743)
        _G.AutoYama = p743
    end)
    v113.ToggleYama:SetValue(false)
    spawn(function()
        while wait() do
            if _G.AutoYama and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter", "Progress") >= 30 then
                repeat
                    wait()
                    fireclickdetector(game:GetService("Workspace").Map.Waterfall.SealedKatana.Handle.ClickDetector)
                until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Yama") or not _G.AutoYama
            end
        end
    end)
    v112.ITM:AddToggle("ToggleTushita", {
        ["Title"] = "Tushita",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p744)
        AutoTushita = p744
    end)
    v113.ToggleTushita:SetValue(false)
    spawn(function()
		-- ::l0::
        while true do
            repeat
                if not wait() then
                    return
                end
            until AutoTushita
            if game:GetService("Workspace").Enemies:FindFirstChild("Longma") then
                break
            end
            Tween(CFrame.new(- 10238.875976563, 389.7912902832, - 9549.7939453125))
        end
        local v745, v746, v747 = pairs(game:GetService("Workspace").Enemies:GetChildren())
		-- ::l9::
        local v748
        v747, v748 = v745(v746, v747)
        if v747 ~= nil then
			-- goto l10
        end
		-- goto l0
		-- ::l10::
        if v748.Name == ("Longma" or v748.Name == "Longma") and (v748.Humanoid.Health > 0 and (v748:IsA("Model") and (v748:FindFirstChild("Humanoid") and v748:FindFirstChild("HumanoidRootPart")))) then
			-- goto l5
        else
			-- goto l9
        end
		-- ::l5::
		-- ::l26::
        wait(_G.Fast_Delay)
        AttackNoCoolDown()
        AutoHaki()
        if not game.Players.LocalPlayer.Character:FindFirstChild(SelectWeapon) then
            wait()
            EquipTool(SelectWeapon)
        end
        FarmPos = v748.HumanoidRootPart.CFrame
        v748.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
        v748.Humanoid.JumpPower = 0
        v748.Humanoid.WalkSpeed = 0
        v748.HumanoidRootPart.CanCollide = false
        v748.Humanoid:ChangeState(11)
        Tween(v748.HumanoidRootPart.CFrame * Pos)
        if AutoTushita and (v748.Parent and v748.Humanoid.Health > 0) then
			-- goto l26
        else
			-- goto l9
        end
    end)
    v112.ITM:AddToggle("ToggleHoly", {
        ["Title"] = "\196\144\225\187\145t \196\144u\225\187\145c",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p749)
        _G.Auto_Holy_Torch = p749
    end)
    v113.ToggleHoly:SetValue(false)
    spawn(function()
        while wait() do
            if _G.Auto_Holy_Torch then
                pcall(function()
                    wait()
                    repeat
                        Tween(CFrame.new(- 10752, 417, - 9366))
                        wait()
                    until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 10752, 417, - 9366)).Magnitude <= 10
                    wait()
                    repeat
                        Tween(CFrame.new(- 11672, 334, - 9474))
                        wait()
                    until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 11672, 334, - 9474)).Magnitude <= 10
                    wait()
                    repeat
                        Tween(CFrame.new(- 12132, 521, - 10655))
                        wait()
                    until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 12132, 521, - 10655)).Magnitude <= 10
                    wait()
                    repeat
                        Tween(CFrame.new(- 13336, 486, - 6985))
                        wait()
                    until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 13336, 486, - 6985)).Magnitude <= 10
                    wait()
                    repeat
                        Tween(CFrame.new(- 13489, 332, - 7925))
                        wait()
                    until not _G.Auto_Holy_Torch or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 13489, 332, - 7925)).Magnitude <= 10
                end)
            end
        end
    end)
end
v112.ITM:AddToggle("ToggleAutoCanvander", {
    ["Title"] = "Canvander",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p750)
    _G.Auto_Canvander = p750
end)
v113.ToggleAutoCanvander:SetValue(false)
local vu751 = CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875)
spawn(function()
	-- upvalues: (ref) vu751
    while wait() do
        if _G.Auto_Canvander then
            pcall(function()
				-- upvalues: (ref) vu751
                if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                    local v752, v753, v754 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local v755
                        v754, v755 = v752(v753, v754)
                        if v754 == nil then
                            break
                        end
                        if v755.Name == "Beautiful Pirate" and (v755:FindFirstChild("Humanoid") and (v755:FindFirstChild("HumanoidRootPart") and v755.Humanoid.Health > 0)) then
                            repeat
                                task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                v755.HumanoidRootPart.CanCollide = false
                                v755.Humanoid.WalkSpeed = 0
                                v755.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                Tween(v755.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.Auto_Canvander or (not v755.Parent or v755.Humanoid.Health <= 0)
                        end
                    end
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - vu751.Position).Magnitude < 1500 then
                    Tween(vu751)
                end
                Tween(CFrame.new(5311.07421875, 426.0243835449219, 165.12762451171875))
                if game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Beautiful Pirate").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)
v112.ITM:AddToggle("ToggleAutoMusketeerHat", {
    ["Title"] = "M\197\169 L\195\173nh Ng\225\187\177 L\195\162m",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p756)
    _G.Auto_MusketeerHat = p756
end)
v113.ToggleAutoMusketeerHat:SetValue(false)
spawn(function()
    pcall(function()
        while wait(0.1) do
            if _G.Auto_MusketeerHat then
                if game:GetService("Players").LocalPlayer.Data.Level.Value < 1800 or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBandits ~= false then
                    if game:GetService("Players").LocalPlayer.Data.Level.Value < 1800 or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress").KilledBoss ~= false then
                        if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1800 and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") == 2 then
                            Tween(CFrame.new(- 12512.138671875, 340.39279174805, - 9872.8203125))
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                            local v757, v758, v759 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local vu760
                                v759, vu760 = v757(v758, v759)
                                if v759 == nil then
                                    break
                                end
                                if vu760.Name == "Captain Elephant" then
                                    OldCFrameElephant = vu760.HumanoidRootPart.CFrame
                                    repeat
                                        task.wait(_G.Fast_Delay)
                                        pcall(function()
											-- upvalues: (ref) vu760
                                            EquipTool(SelectWeapon)
                                            AutoHaki()
                                            vu760.HumanoidRootPart.CanCollide = false
                                            vu760.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                            Tween(vu760.HumanoidRootPart.CFrame * Pos)
                                            vu760.HumanoidRootPart.CanCollide = false
                                            vu760.HumanoidRootPart.CFrame = OldCFrameElephant
                                            AttackNoCoolDown()
                                        end)
                                    until _G.Auto_MusketeerHat == false or (vu760.Humanoid.Health <= 0 or not vu760.Parent) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                end
                            end
                        else
                            Tween(CFrame.new(- 13374.889648438, 421.27752685547, - 8225.208984375))
                        end
                    else
                        Tween(CFrame.new(- 12443.8671875, 332.40396118164, - 7675.4892578125))
                        if (CFrame.new(- 12443.8671875, 332.40396118164, - 7675.4892578125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                        end
                    end
                elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Forest Pirate") and (string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true) then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Forest Pirate") then
                        local v761, v762, v763 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local vu764
                            v763, vu764 = v761(v762, v763)
                            if v763 == nil then
                                break
                            end
                            if vu764.Name == "Forest Pirate" then
                                repeat
                                    task.wait(_G.Fast_Delay)
                                    pcall(function()
										-- upvalues: (ref) vu764
                                        EquipTool(SelectWeapon)
                                        AutoHaki()
                                        vu764.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        Tween(vu764.HumanoidRootPart.CFrame * Pos)
                                        vu764.HumanoidRootPart.CanCollide = false
                                        AttackNoCoolDown()
                                        PosMon = vu764.HumanoidRootPart.CFrame
                                        MonFarm = vu764.Name
                                        bringmob = true
                                    end)
                                until _G.Auto_MusketeerHat == false or (not vu764.Parent or vu764.Humanoid.Health <= 0) or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false
                                bringmob = false
                            end
                        end
                    else
                        bringmob = false
                        Tween(CFrame.new(- 13206.452148438, 425.89199829102, - 7964.5537109375))
                    end
                else
                    Tween(CFrame.new(- 12443.8671875, 332.40396118164, - 7675.4892578125))
                    if (Vector3.new(- 12443.8671875, 332.40396118164, - 7675.4892578125) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                        wait(1.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "CitizenQuest", 1)
                    end
                end
            end
        end
    end)
end)
v112.ITM:AddToggle("ToggleAutoObservationV2", {
    ["Title"] = "Haki Quan S\195\161t V2",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p765)
    _G.Auto_ObservationV2 = p765
end)
v113.ToggleAutoObservationV2:SetValue(false)
spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_ObservationV2 then
                if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen") ~= 3 then
                    _G.Auto_MusketeerHat = true
                else
                    _G.Auto_MusketeerHat = false
                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Banana") and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Apple") and game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pineapple")) then
                        repeat
                            Tween(CFrame.new(- 12444.78515625, 332.40396118164, - 7673.1806640625))
                            wait()
                        until not _G.Auto_ObservationV2 or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 12444.78515625, 332.40396118164, - 7673.1806640625)).Magnitude <= 10
                        wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CitizenQuestProgress", "Citizen")
                    elseif game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Fruit Bowl") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fruit Bowl") then
                        repeat
                            Tween(CFrame.new(- 10920.125, 624.20275878906, - 10266.995117188))
                            wait()
                        until not _G.Auto_ObservationV2 or (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(- 10920.125, 624.20275878906, - 10266.995117188)).Magnitude <= 10
                        wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Start")
                        wait(1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk2", "Buy")
                    else
                        local v766, v767, v768 = pairs(game:GetService("Workspace"):GetDescendants())
                        while true do
                            local v769
                            v768, v769 = v766(v767, v768)
                            if v768 == nil then
                                break
                            end
                            if v769.Name == "Apple" or (v769.Name == "Banana" or v769.Name == "Pineapple") then
                                v769.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 1, 10)
                                wait()
                                firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, v769.Handle, 0)
                                wait()
                            end
                        end
                    end
                end
            end
        end)
    end
end)
v112.ITM:AddToggle("ToggleAutoRainbowHaki", {
    ["Title"] = "Haki 7 M\195\160u",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p770)
    _G.Auto_RainbowHaki = p770
end)
v113.ToggleAutoRainbowHaki:SetValue(false)
spawn(function()
    pcall(function()
        while wait(0.1) do
            if _G.Auto_RainbowHaki then
                if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
                    if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Stone") then
                            local v771, v772, v773 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v774
                                v773, v774 = v771(v772, v773)
                                if v773 == nil then
                                    break
                                end
                                if v774.Name == "Stone" then
                                    OldCFrameRainbow = v774.HumanoidRootPart.CFrame
                                    repeat
                                        task.wait(_G.Fast_Delay)
                                        EquipTool(SelectWeapon)
                                        Tween(v774.HumanoidRootPart.CFrame * Pos)
                                        v774.HumanoidRootPart.CanCollide = false
                                        v774.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        v774.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        AttackNoCoolDown()
                                    until not _G.Auto_RainbowHaki or (v774.Humanoid.Health <= 0 or not v774.Parent) or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                end
                            end
                        else
                            Tween(CFrame.new(- 1086.11621, 38.8425903, 6768.71436))
                        end
                    elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Hydra Leader") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Hydra Leader") then
                            local v775, v776, v777 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v778
                                v777, v778 = v775(v776, v777)
                                if v777 == nil then
                                    break
                                end
                                if v778.Name == "Hydra Leader" then
                                    OldCFrameRainbow = v778.HumanoidRootPart.CFrame
                                    repeat
                                        task.wait(_G.Fast_Delay)
                                        EquipTool(SelectWeapon)
                                        Tween(v778.HumanoidRootPart.CFrame * Pos)
                                        v778.HumanoidRootPart.CanCollide = false
                                        v778.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        v778.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        AttackNoCoolDown()
                                    until not _G.Auto_RainbowHaki or (v778.Humanoid.Health <= 0 or not v778.Parent) or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                end
                            end
                        else
                            Tween(CFrame.new(5713.98877, 601.922974, 202.751251))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Kilo Admiral") then
                            local v779, v780, v781 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v782
                                v781, v782 = v779(v780, v781)
                                if v781 == nil then
                                    break
                                end
                                if v782.Name == "Kilo Admiral" then
                                    OldCFrameRainbow = v782.HumanoidRootPart.CFrame
                                    repeat
                                        task.wait(_G.Fast_Delay)
                                        EquipTool(SelectWeapon)
                                        Tween(v782.HumanoidRootPart.CFrame * Pos)
                                        v782.HumanoidRootPart.CanCollide = false
                                        v782.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        v782.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        AttackNoCoolDown()
                                    until not _G.Auto_RainbowHaki or (v782.Humanoid.Health <= 0 or not v782.Parent) or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                end
                            end
                        else
                            Tween(CFrame.new(2877.61743, 423.558685, - 7207.31006))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Captain Elephant") then
                            local v783, v784, v785 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v786
                                v785, v786 = v783(v784, v785)
                                if v785 == nil then
                                    break
                                end
                                if v786.Name == "Captain Elephant" then
                                    OldCFrameRainbow = v786.HumanoidRootPart.CFrame
                                    repeat
                                        task.wait(_G.Fast_Delay)
                                        EquipTool(SelectWeapon)
                                        Tween(v786.HumanoidRootPart.CFrame * Pos)
                                        v786.HumanoidRootPart.CanCollide = false
                                        v786.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        v786.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        AttackNoCoolDown()
                                    until not _G.Auto_RainbowHaki or (v786.Humanoid.Health <= 0 or not v786.Parent) or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                end
                            end
                        else
                            Tween(CFrame.new(- 13485.0283, 331.709259, - 8012.4873))
                        end
                    elseif string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Beautiful Pirate") then
                            local v787, v788, v789 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v790
                                v789, v790 = v787(v788, v789)
                                if v789 == nil then
                                    break
                                end
                                if v790.Name == "Beautiful Pirate" then
                                    OldCFrameRainbow = v790.HumanoidRootPart.CFrame
                                    repeat
                                        task.wait(_G.Fast_Delay)
                                        EquipTool(SelectWeapon)
                                        Tween(v790.HumanoidRootPart.CFrame * Pos)
                                        v790.HumanoidRootPart.CanCollide = false
                                        v790.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        v790.HumanoidRootPart.CFrame = OldCFrameRainbow
                                        AttackNoCoolDown()
                                    until not _G.Auto_RainbowHaki or (v790.Humanoid.Health <= 0 or not v790.Parent) or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                                end
                            end
                        else
                            Tween(CFrame.new(5312.3598632813, 20.141201019287, - 10.158538818359))
                        end
                    else
                        Tween(CFrame.new(- 11892.0703125, 930.57672119141, - 8760.1591796875))
                        if (Vector3.new(- 11892.0703125, 930.57672119141, - 8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                        end
                    end
                else
                    Tween(CFrame.new(- 11892.0703125, 930.57672119141, - 8760.1591796875))
                    if (Vector3.new(- 11892.0703125, 930.57672119141, - 8760.1591796875) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 30 then
                        wait(1.5)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("HornedMan", "Bet")
                    end
                end
            end
        end
    end)
end)
v112.ITM:AddToggle("ToggleAutoSkullGuitar", {
    ["Title"] = "Skull Guitar",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p791)
    _G.Auto_SkullGuitar = p791
end)
v113.ToggleAutoSkullGuitar:SetValue(false)
spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_SkullGuitar and GetWeaponInventory("Skull Guitar") == false then
                if (CFrame.new(- 9681.458984375, 6.139880657196045, 6341.3720703125).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 5000 then
                    Tween(CFrame.new(- 9681.458984375, 6.139880657196045, 6341.3720703125))
                elseif game:GetService("Workspace").NPCs:FindFirstChild("Skeleton Machine") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("soulGuitarBuy", true)
                elseif game:GetService("Workspace").Map["Haunted Castle"].Candle1.Transparency ~= 0 then
                    if string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2), "Error") then
                        Tween(CFrame.new(- 8653.2060546875, 140.98487854003906, 6160.033203125))
                    elseif string.find(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2), "Nothing") then
                        Tween("Wait Full Moon")
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("gravestoneEvent", 2, true)
                    end
                elseif game:GetService("Workspace").Map["Haunted Castle"].Placard1.Left.Part.Transparency ~= 0 then
                    if game:GetService("Workspace").Map["Haunted Castle"].Tablet.Segment1:FindFirstChild("ClickDetector") then
                        if game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part1:FindFirstChild("ClickDetector") then
                            Quest4 = true
                            repeat
                                wait()
                                Tween(CFrame.new(- 9553.5986328125, 65.62338256835938, 6041.58837890625))
                            until (CFrame.new(- 9553.5986328125, 65.62338256835938, 6041.58837890625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Auto_SkullGuitar
                            wait(1)
                            Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.CFrame)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part3.ClickDetector)
                            wait(1)
                            Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.CFrame)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part4.ClickDetector)
                            wait(1)
                            Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.CFrame)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part6.ClickDetector)
                            wait(1)
                            Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.CFrame)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part8.ClickDetector)
                            wait(1)
                            Tween(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.CFrame)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                            wait(1)
                            fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model.Part10.ClickDetector)
                        else
                            Quest3 = true
                        end
                    else
                        if game:GetService("Workspace").NPCs:FindFirstChild("Ghost") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                                "GuitarPuzzleProgress",
                                "Ghost"
                            }))
                        end
                        if game.Workspace.Enemies:FindFirstChild("Living Zombie") then
                            local v792, v793, v794 = pairs(game.Workspace.Enemies:GetChildren())
                            while true do
                                local v795
                                v794, v795 = v792(v793, v794)
                                if v794 == nil then
                                    break
                                end
                                if v795:FindFirstChild("HumanoidRootPart") and (v795:FindFirstChild("Humanoid") and (v795.Humanoid.Health > 0 and v795.Name == "Living Zombie")) then
                                    EquipTool(SelectWeapon)
                                    v795.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                    v795.HumanoidRootPart.Transparency = 1
                                    v795.Humanoid.JumpPower = 0
                                    v795.Humanoid.WalkSpeed = 0
                                    v795.HumanoidRootPart.CanCollide = false
                                    v795.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0)
                                    Tween(CFrame.new(- 10160.787109375, 138.6616973876953, 5955.03076171875))
                                    game:GetService("VirtualUser"):CaptureController()
                                    game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 672))
                                end
                            end
                        else
                            Tween(CFrame.new(- 10160.787109375, 138.6616973876953, 5955.03076171875))
                        end
                    end
                else
                    Quest2 = true
                    repeat
                        wait()
                        Tween(CFrame.new(- 8762.69140625, 176.84783935546875, 6171.3076171875))
                    until (CFrame.new(- 8762.69140625, 176.84783935546875, 6171.3076171875).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or not _G.Auto_SkullGuitar
                    wait(1)
                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard7.Left.ClickDetector)
                    wait(1)
                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard6.Left.ClickDetector)
                    wait(1)
                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard5.Left.ClickDetector)
                    wait(1)
                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard4.Right.ClickDetector)
                    wait(1)
                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard3.Left.ClickDetector)
                    wait(1)
                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard2.Right.ClickDetector)
                    wait(1)
                    fireclickdetector(game:GetService("Workspace").Map["Haunted Castle"].Placard1.Right.ClickDetector)
                    wait(1)
                end
            end
        end)
    end
end)
v112.ITM:AddToggle("ToggleAutoBuddy", {
    ["Title"] = "Ki\225\186\191m Buddy",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p796)
    _G.Auto_Buddy = p796
end)
v113.ToggleAutoBuddy:SetValue(false)
local vu797 = CFrame.new(- 731.2034301757812, 381.5658874511719, - 11198.4951171875)
spawn(function()
	-- upvalues: (ref) vu797
    while wait() do
        if _G.Auto_Buddy then
            pcall(function()
				-- upvalues: (ref) vu797
                if game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                    local v798, v799, v800 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local v801
                        v800, v801 = v798(v799, v800)
                        if v800 == nil then
                            break
                        end
                        if v801.Name == "Cake Queen" and (v801:FindFirstChild("Humanoid") and (v801:FindFirstChild("HumanoidRootPart") and v801.Humanoid.Health > 0)) then
                            repeat
                                task.wait(_G.Fast_Delay)
                                AutoHaki()
                                EquipTool(SelectWeapon)
                                v801.HumanoidRootPart.CanCollide = false
                                v801.Humanoid.WalkSpeed = 0
                                v801.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                Tween(v801.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                            until not _G.Auto_Buddy or (not v801.Parent or v801.Humanoid.Health <= 0)
                        end
                    end
                elseif (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - vu797.Position).Magnitude < 1500 then
                    Tween(vu797)
                end
                Tween(CFrame.new(- 731.2034301757812, 381.5658874511719, - 11198.4951171875))
                if game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen") then
                    Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Cake Queen").HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                end
            end)
        end
    end
end)
v112.ITM:AddToggle("ToggleAutoDualKatana", {
    ["Title"] = "Song Ki\225\186\191m",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p802)
    _G.Auto_DualKatana = p802
end)
v113.ToggleAutoDualKatana:SetValue(false)
spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_DualKatana then
                if game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or (game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") or (game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama"))) then
                    if game.Players.LocalPlayer.Character:FindFirstChild("Tushita") or game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Tushita") then
                            EquipTool("Tushita")
                        end
                    elseif (game.Players.LocalPlayer.Character:FindFirstChild("Yama") or game.Players.LocalPlayer.Backpack:FindFirstChild("Yama")) and game.Players.LocalPlayer.Backpack:FindFirstChild("Yama") then
                        EquipTool("Yama")
                    end
                else
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadItem", "Tushita")
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_DualKatana then
                if GetMaterial("Alucard Fragment") ~= 0 then
                    if GetMaterial("Alucard Fragment") ~= 1 then
                        if GetMaterial("Alucard Fragment") ~= 2 then
                            if GetMaterial("Alucard Fragment") ~= 3 then
                                if GetMaterial("Alucard Fragment") ~= 4 then
                                    if GetMaterial("Alucard Fragment") ~= 5 then
                                        if GetMaterial("Alucard Fragment") == 6 then
                                            if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") or game:GetService("Workspace").ReplicatedStorage:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") then
                                                Auto_Quest_Yama_1 = false
                                                Auto_Quest_Yama_2 = false
                                                Auto_Quest_Yama_3 = false
                                                Auto_Quest_Tushita_1 = false
                                                Auto_Quest_Tushita_2 = false
                                                Auto_Quest_Tushita_3 = false
                                                if game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton Boss [Lv. 2025] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") then
                                                    local v803, v804, v805 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                                                    while true do
                                                        local v806
                                                        v805, v806 = v803(v804, v805)
                                                        if v805 == nil then
                                                            break
                                                        end
                                                        if (v806.Name == "Cursed Skeleton Boss" or v806.Name == "Cursed Skeleton") and v806.Humanoid.Health > 0 then
                                                            EquipTool(Sword)
                                                            Tween(v806.HumanoidRootPart.CFrame * pos)
                                                            v806.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                                            v806.HumanoidRootPart.Transparency = 1
                                                            v806.Humanoid.JumpPower = 0
                                                            v806.Humanoid.WalkSpeed = 0
                                                            v806.HumanoidRootPart.CanCollide = false
                                                            bringmob = true
                                                            FarmPos = v806.HumanoidRootPart.CFrame
                                                            MonFarm = v806.Name
                                                            AttackNoCoolDown()
                                                        end
                                                    end
                                                end
                                            elseif (CFrame.new(- 12361.7060546875, 603.3547973632812, - 6550.5341796875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 100 then
                                                Tween(CFrame.new(- 12361.7060546875, 603.3547973632812, - 6550.5341796875))
                                            else
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
                                                wait(1)
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
                                                wait(1)
                                                Tween(CFrame.new(- 12361.7060546875, 603.3547973632812, - 6550.5341796875))
                                                wait(1.5)
                                                game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                                                wait(1.5)
                                                Tween(CFrame.new(- 12253.5419921875, 598.8999633789062, - 6546.8388671875))
                                            end
                                        end
                                    else
                                        Auto_Quest_Yama_1 = false
                                        Auto_Quest_Yama_2 = false
                                        Auto_Quest_Yama_3 = false
                                        Auto_Quest_Tushita_1 = false
                                        Auto_Quest_Tushita_2 = false
                                        Auto_Quest_Tushita_3 = true
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
                                    end
                                else
                                    Auto_Quest_Yama_1 = false
                                    Auto_Quest_Yama_2 = false
                                    Auto_Quest_Yama_3 = false
                                    Auto_Quest_Tushita_1 = false
                                    Auto_Quest_Tushita_2 = true
                                    Auto_Quest_Tushita_3 = false
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
                                end
                            else
                                Auto_Quest_Yama_1 = false
                                Auto_Quest_Yama_2 = false
                                Auto_Quest_Yama_3 = false
                                Auto_Quest_Tushita_1 = true
                                Auto_Quest_Tushita_2 = false
                                Auto_Quest_Tushita_3 = false
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Good")
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Good")
                            end
                        else
                            Auto_Quest_Yama_1 = false
                            Auto_Quest_Yama_2 = false
                            Auto_Quest_Yama_3 = true
                            Auto_Quest_Tushita_1 = false
                            Auto_Quest_Tushita_2 = false
                            Auto_Quest_Tushita_3 = false
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                        end
                    else
                        Auto_Quest_Yama_1 = false
                        Auto_Quest_Yama_2 = true
                        Auto_Quest_Yama_3 = false
                        Auto_Quest_Tushita_1 = false
                        Auto_Quest_Tushita_2 = false
                        Auto_Quest_Tushita_3 = false
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                    end
                else
                    Auto_Quest_Yama_1 = true
                    Auto_Quest_Yama_2 = false
                    Auto_Quest_Yama_3 = false
                    Auto_Quest_Tushita_1 = false
                    Auto_Quest_Tushita_2 = false
                    Auto_Quest_Tushita_3 = false
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "Progress", "Evil")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Yama_1 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Mythological Pirate") then
                    local v807, v808, v809 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local v810
                        v809, v810 = v807(v808, v809)
                        if v809 == nil then
                            break
                        end
                        if v810.Name == "Mythological Pirate" then
                            repeat
                                wait()
                                Tween(v810.HumanoidRootPart.CFrame * CFrame.new(0, 0, - 2))
                            until _G.Auto_DualKatana == false or Auto_Quest_Yama_1 == false
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CDKQuest", "StartTrial", "Evil")
                        end
                    end
                else
                    Tween(CFrame.new(- 13451.46484375, 543.712890625, - 6961.0029296875))
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            if Auto_Quest_Yama_2 then
                local v811, v812, v813 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                while true do
                    local v814
                    v813, v814 = v811(v812, v813)
                    if v813 == nil then
                        break
                    end
                    if v814:FindFirstChild("HazeESP") then
                        v814.HazeESP.Size = UDim2.new(50, 50, 50, 50)
                        v814.HazeESP.MaxDistance = "inf"
                    end
                end
                local v815, v816, v817 = pairs(game:GetService("ReplicatedStorage"):GetChildren())
                while true do
                    local v818
                    v817, v818 = v815(v816, v817)
                    if v817 == nil then
                        break
                    end
                    if v818:FindFirstChild("HazeESP") then
                        v818.HazeESP.Size = UDim2.new(50, 50, 50, 50)
                        v818.HazeESP.MaxDistance = "inf"
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        pcall(function()
            local v819, v820, v821 = pairs(game:GetService("Workspace").Enemies:GetChildren())
            while true do
                local v822
                v821, v822 = v819(v820, v821)
                if v821 == nil then
                    break
                end
                if Auto_Quest_Yama_2 and (v822:FindFirstChild("HazeESP") and (v822.HumanoidRootPart.Position - FarmPossEsp.Position).magnitude <= 300) then
                    v822.HumanoidRootPart.CFrame = FarmPossEsp
                    v822.HumanoidRootPart.CanCollide = false
                    v822.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                    if not v822.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                        local v823 = Instance.new("BodyVelocity", v822.HumanoidRootPart)
                        v823.MaxForce = Vector3.new(1, 1, 1) * math.huge
                        v823.Velocity = Vector3.new(0, 0, 0)
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Yama_2 then
            pcall(function()
                local v824, v825, v826 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                while true do
                    while true do
                        local v827
                        v826, v827 = v824(v825, v826)
                        if v826 == nil then
                            return
                        end
                        if v827:FindFirstChild("HazeESP") then
                            break
                        end
                        local v828, v829, v830 = pairs(game:GetService("ReplicatedStorage"):GetChildren())
                        while true do
                            local v831
                            v830, v831 = v828(v829, v830)
                            if v830 == nil then
                                break
                            end
                            if v831:FindFirstChild("HazeESP") then
                                if (v831.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
                                    Tween(v831.HumanoidRootPart.CFrame * CFrame.new(2, 20, 2))
                                else
                                    Tween(v831.HumanoidRootPart.CFrameMon * CFrame.new(2, 20, 2))
                                end
                            end
                        end
                    end
                    if true then
                        wait()
                        if (v827.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then
                            EquipTool(Sword)
                            Tween(v827.HumanoidRootPart.CFrame * Pos)
                            v827.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v827.HumanoidRootPart.Transparency = 1
                            v827.Humanoid.JumpPower = 0
                            v827.Humanoid.WalkSpeed = 0
                            v827.HumanoidRootPart.CanCollide = false
                            FarmPos = v827.HumanoidRootPart.CFrame
                            MonFarm = v827.Name
                            AttackNoCoolDown()
                            if v827.Humanoid.Health <= 0 and v827.Humanoid:FindFirstChild("Animator") then
                                v827.Humanoid.Animator:Destroy()
                            end
                        else
                            Tween(v827.HumanoidRootPart.CFrame * Pos)
                        end
                    end
                    if _G.Auto_DualKatana ~= false and (Auto_Quest_Yama_2 ~= false and (v827.Parent and (v827.Humanoid.Health > 0 and v827:FindFirstChild("HazeESP")))) then
                        break
                    end
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Yama_3 then
            pcall(function()
				-- block 66
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Hallow Essence") then
                    Tween(game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.CFrame)
					-- goto l4
                end
                if not game:GetService("Workspace").Map:FindFirstChild("HellDimension") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") or game.ReplicatedStorage:FindFirstChild("Soul Reaper [Lv. 2100] [Raid Boss]") then
                        if game:GetService("Workspace").Enemies:FindFirstChild("Soul Reaper") then
                            local v832, v833, v834 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v835
                                v834, v835 = v832(v833, v834)
                                if v834 == nil then
                                    break
                                end
                                if v835.Name == "Soul Reaper" and v835.Humanoid.Health > 0 then
                                    repeat
                                        wait()
                                        Tween(v835.HumanoidRootPart.CFrame * Pos)
                                    until _G.Auto_DualKatana == false or Auto_Quest_Yama_3 == false or game:GetService("Workspace").Map:FindFirstChild("HellDimension")
                                end
                            end
                        else
                            Tween(CFrame.new(- 9570.033203125, 315.9346923828125, 6726.89306640625))
                        end
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones", "Buy", 1, 1)
                    end
					-- ::l4::
                    return
                end
				-- goto l6
				-- ::l9::
                wait()
                if not (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Hell\'s Messenger [Lv. 2200] [Boss]"))) then
                    wait(5)
                    Tween(game:GetService("Workspace").Map.HellDimension.Torch1.CFrame)
                    wait(1.5)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    wait(1.5)
                    Tweem(game:GetService("Workspace").Map.HellDimension.Torch2.CFrame)
                    wait(1.5)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    wait(1.5)
                    Tween(game:GetService("Workspace").Map.HellDimension.Torch3.CFrame)
                    wait(1.5)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    wait(1.5)
                    Tween(game:GetService("Workspace").Map.HellDimension.Exit.CFrame)
					-- goto l37
                end
                local v836, v837, v838 = pairs(game:GetService("Workspace").Enemies:GetChildren())
				-- goto l15
				-- ::l10::
				-- goto l9
				-- ::l15::
                local v839
                v838, v839 = v836(v837, v838)
                if v838 == nil then
					-- goto l37
                end
                if v839.Name ~= "Cursed Skeleton" and (v839.Name ~= "Cursed Skeleton" and v839.Name ~= "Hell\'s Messenger") or v839.Humanoid.Health <= 0 then
					-- goto l15
                end
				-- ::l24::
                wait()
                EquipTool(Sword)
                Tween(v839.HumanoidRootPart.CFrame * Pos)
                v839.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                v839.HumanoidRootPart.Transparency = 1
                v839.Humanoid.JumpPower = 0
                v839.Humanoid.WalkSpeed = 0
                v839.HumanoidRootPart.CanCollide = false
                FarmPos = v839.HumanoidRootPart.CFrame
                MonFarm = v839.Name
                AttackNoCoolDown()
                if v839.Humanoid.Health <= 0 and v839.Humanoid:FindFirstChild("Animator") then
                    v839.Humanoid.Animator:Destroy()
                end
                if v839.Humanoid.Health <= 0 or (not v839.Parent or Auto_Quest_Yama_3 == false) then
					-- goto l15
                else
					-- goto l24
                end
				-- ::l37::
                if _G.Auto_DualKatana == false or (Auto_Quest_Yama_3 == false or GetMaterial("Alucard Fragment") == 3) then
					-- goto l4
                end
				-- ::l6::
                if true then
					-- goto l10
                else
					-- goto l37
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Tushita_1 then
            Tween(CFrame.new(- 9546.990234375, 21.139892578125, 4686.1142578125))
            wait(5)
            Tween(CFrame.new(- 6120.0576171875, 16.455780029296875, - 2250.697265625))
            wait(5)
            Tween(CFrame.new(- 9533.2392578125, 7.254445552825928, - 8372.69921875))
        end
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Tushita_2 then
            pcall(function()
				-- block 30
                if (CFrame.new(- 5539.3115234375, 313.800537109375, - 2972.372314453125).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 500 then
                    Tween(CFrame.new(- 5545.1240234375, 313.800537109375, - 2976.616455078125))
					-- ::l28::
                    return
                end
                local v840, v841, v842 = pairs(game:GetService("Workspace").Enemies:GetChildren())
				-- goto l4
				-- ::l2::
				-- goto l15
				-- ::l15::
                wait()
                EquipTool(Sword)
                Tween(v843.HumanoidRootPart.CFrame * Pos)
                v843.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                v843.HumanoidRootPart.Transparency = 1
                v843.Humanoid.JumpPower = 0
                v843.Humanoid.WalkSpeed = 0
                v843.HumanoidRootPart.CanCollide = false
                FarmPos = v843.HumanoidRootPart.CFrame
                MonFarm = v843.Name
                AttackNoCoolDown()
                if v843.Humanoid.Health <= 0 and v843.Humanoid:FindFirstChild("Animator") then
                    v843.Humanoid.Animator:Destroy()
                end
                if v843.Humanoid.Health > 0 and (v843.Parent and Auto_Quest_Tushita_2 ~= false) then
					-- goto l15
                end
				-- ::l4::
                local v843
                v842, v843 = v840(v841, v842)
                if v842 == nil then
					-- goto l28
                end
                if Auto_Quest_Tushita_2 and (v843:FindFirstChild("HumanoidRootPart") and (v843:FindFirstChild("Humanoid") and (v843.Humanoid.Health > 0 and (v843.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 2000))) then
					-- goto l2
                else
					-- goto l4
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do
        if Auto_Quest_Tushita_3 then
            pcall(function()
				-- block 66
                if not (game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") or game.ReplicatedStorage:FindFirstChild("Cake Queen [Lv. 2175] [Boss]")) then
					-- goto l5
                end
                if not game:GetService("Workspace").Enemies:FindFirstChild("Cake Queen") then
                    Tween(CFrame.new(- 709.3132934570312, 381.6005859375, - 11011.396484375))
					-- goto l27
                end
                local v844, v845, v846 = pairs(game:GetService("Workspace").Enemies:GetChildren())
				-- ::l9::
                local v847
                v846, v847 = v844(v845, v846)
                if v846 == nil then
					-- goto l27
                end
                if v847.Name ~= "Cake Queen" or v847.Humanoid.Health <= 0 then
					-- goto l9
                end
                while true do
                    wait()
                    EquipTool(Sword)
                    Tween(v847.HumanoidRootPart.CFrame * Pos)
                    v847.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                    v847.HumanoidRootPart.Transparency = 1
                    v847.Humanoid.JumpPower = 0
                    v847.Humanoid.WalkSpeed = 0
                    v847.HumanoidRootPart.CanCollide = false
                    FarmPos = v847.HumanoidRootPart.CFrame
                    MonFarm = v847.Name
                    AttackNoCoolDown()
                    if v847.Humanoid.Health <= 0 and v847.Humanoid:FindFirstChild("Animator") then
                        v847.Humanoid.Animator:Destroy()
                    end
                    if _G.Auto_DualKatana == false or Auto_Quest_Tushita_3 == false or game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
						-- goto l9
                    end
                end
				-- ::l9::
				-- ::l14::
				-- ::l37::
                local v848, v849 = v850(v851, v848)
                if v848 == nil then
					-- goto l59
                end
                if v849.Name ~= "Cursed Skeleton" and (v849.Name ~= "Cursed Skeleton" and v849.Name ~= "Heaven\'s Guardian") or v849.Humanoid.Health <= 0 then
					-- goto l37
                end
				-- ::l46::
                wait()
                EquipTool(Sword)
                Tween(v849.HumanoidRootPart.CFrame * Pos)
                v849.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                v849.HumanoidRootPart.Transparency = 1
                v849.Humanoid.JumpPower = 0
                v849.Humanoid.WalkSpeed = 0
                v849.HumanoidRootPart.CanCollide = false
                FarmPos = v849.HumanoidRootPart.CFrame
                MonFarm = v849.Name
                AttackNoCoolDown()
                if v849.Humanoid.Health <= 0 and v849.Humanoid:FindFirstChild("Animator") then
                    v849.Humanoid.Animator:Destroy()
                end
                if v849.Humanoid.Health <= 0 or (not v849.Parent or Auto_Quest_Tushita_3 == false) then
					-- goto l9
                else
					-- goto l46
                end
				-- ::l59::
                if not _G.Auto_DualKatana or (not Auto_Quest_Tushita_3 or GetMaterial("Alucard Fragment") == 6) then
					-- goto l27
                end
				-- ::l29::
                if true then
					-- goto l41
                else
					-- goto l59
                end
				-- ::l41::
                wait()
                if not (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200]") or (game:GetService("Workspace").Enemies:FindFirstChild("Cursed Skeleton [Lv. 2200] [Boss]") or game:GetService("Workspace").Enemies:FindFirstChild("Heaven\'s Guardian [Lv. 2200] [Boss]"))) then
                    wait(5)
                    Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch1.CFrame)
                    wait(1.5)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    wait(1.5)
                    Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch2.CFrame)
                    wait(1.5)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    wait(1.5)
                    Tween(game:GetService("Workspace").Map.HeavenlyDimension.Torch3.CFrame)
                    wait(1.5)
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    wait(1.5)
                    Tween(game:GetService("Workspace").Map.HeavenlyDimension.Exit.CFrame)
					-- goto l59
                end
                local v850, v851
                v850, v851, v848 = pairs(game:GetService("Workspace").Enemies:GetChildren())
				-- goto l37
				-- ::l5::
                if not game:GetService("Workspace").Map:FindFirstChild("HeavenlyDimension") then
					-- ::l27::
                    return
                end
				-- goto l29
            end)
        end
    end
end)
if Sea2 then
    v112.ITM:AddToggle("ToggleFactory", {
        ["Title"] = "\196\144\225\186\165m Nh\195\160 M\195\161y",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p852)
        _G.Factory = p852
    end)
    v113.ToggleFactory:SetValue(false)
    spawn(function()
		-- ::l0::
        while true do
            repeat
                if not wait() then
                    return
                end
            until _G.Factory
            if game.Workspace.Enemies:FindFirstChild("Core") then
                break
            end
            if game.ReplicatedStorage:FindFirstChild("Core") then
                repeat
                    Tween(CFrame.new(448.46756, 199.356781, - 441.389252))
                    wait()
                until not _G.Factory or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, - 441.389252)).Magnitude <= 10
            end
        end
        local v853, v854, v855 = pairs(game.Workspace.Enemies:GetChildren())
		-- goto l9
		-- ::l7::
		-- goto l14
		-- ::l10::
        if v856.Name == "Core" and v856.Humanoid.Health > 0 then
			-- goto l19
        end
		-- ::l9::
        local v856
        v855, v856 = v853(v854, v855)
        if v855 ~= nil then
			-- goto l10
        end
		-- goto l0
		-- ::l14::
        wait(_G.Fast_Delay)
        AttackNoCoolDown()
        repeat
            Tween(CFrame.new(448.46756, 199.356781, - 441.389252))
            wait()
        until not _G.Factory or (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(448.46756, 199.356781, - 441.389252)).Magnitude <= 10
        EquipTool(SelectWeapon)
        AutoHaki()
        Tween(v856.HumanoidRootPart.CFrame * Pos)
        v856.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
        v856.HumanoidRootPart.Transparency = 1
        v856.Humanoid.JumpPower = 0
        v856.Humanoid.WalkSpeed = 0
        v856.HumanoidRootPart.CanCollide = false
        FarmPos = v856.HumanoidRootPart.CFrame
        MonFarm = v856.Name
        if v856.Parent and (v856.Humanoid.Health > 0 and _G.Factory ~= false) then
			-- goto l14
        end
		-- goto l9
		-- ::l19::
		-- goto l7
    end)
end
v112.ITM:AddToggle("ToggleAutoFarmSwan", {
    ["Title"] = "\196\144\225\186\165m Swan",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p857)
    _G.Auto_FarmSwan = p857
end)
v113.ToggleAutoFarmSwan:SetValue(false)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoFarmSwan then
                if game:GetService("Workspace").Enemies:FindFirstChild("Don Swan") then
                    local v858, v859, v860 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local vu861
                        v860, vu861 = v858(v859, v860)
                        if v860 == nil then
                            break
                        end
                        if vu861.Name == "Don Swan" and (vu861.Humanoid.Health > 0 and (vu861:IsA("Model") and (vu861:FindFirstChild("Humanoid") and vu861:FindFirstChild("HumanoidRootPart")))) then
                            repeat
                                task.wait()
                                pcall(function()
									-- upvalues: (ref) vu861
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    vu861.HumanoidRootPart.CanCollide = false
                                    vu861.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    Tween(vu861.HumanoidRootPart.CFrame * Pos)
                                    AttackNoCoolDown()
                                end)
                            until _G.AutoFarmSwan == false or vu861.Humanoid.Health <= 0
                        end
                    end
                else
                    task.wait()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2284.912109375, 15.537666320801, 905.48291015625))
                    if (CFrame.new(2284.912109375, 15.537666320801, 905.48291015625).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 4 and _G.AutoFarmSwan ~= false then
                        break
                    end
                end
            end
        end
    end)
end)
v112.ITM:AddToggle("ToggleAutoRengoku", {
    ["Title"] = "Rengoku",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p862)
    _G.Auto_Regoku = p862
end)
v113.ToggleAutoRengoku:SetValue(false)
spawn(function()
    pcall(function()
        while wait() do
            if _G.Auto_Regoku then
                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Hidden Key") then
                    EquipTool("Hidden Key")
                    Tween(CFrame.new(6571.1201171875, 299.23028564453, - 6967.841796875))
                elseif game:GetService("Workspace").Enemies:FindFirstChild("Snow Lurker") or game:GetService("Workspace").Enemies:FindFirstChild("Arctic Warrior") then
                    local v863, v864, v865 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                    while true do
                        local v866
                        v865, v866 = v863(v864, v865)
                        if v865 == nil then
                            break
                        end
                        if (v866.Name == "Snow Lurker" or v866.Name == "Arctic Warrior") and v866.Humanoid.Health > 0 then
                            repeat
                                task.wait(_G.Fast_Delay)
                                EquipTool(SelectWeapon)
                                AutoHaki()
                                v866.HumanoidRootPart.CanCollide = false
                                v866.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                FarmPos = v866.HumanoidRootPart.CFrame
                                MonFarm = v866.Name
                                Tween(v866.HumanoidRootPart.CFrame * Pos)
                                AttackNoCoolDown()
                                bringmob = true
                            until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hidden Key") or (_G.Auto_Regoku == false or (not v866.Parent or v866.Humanoid.Health <= 0))
                            bringmob = false
                        end
                    end
                else
                    bringmob = false
                    Tween(CFrame.new(5439.716796875, 84.420944213867, - 6715.1635742188))
                end
            end
        end
    end)
end)
if Sea2 or Sea3 then
    v112.ITM:AddToggle("ToggleHakiColor", {
        ["Title"] = "Mua M\195\160u Haki",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p867)
        _G.Auto_Buy_Enchancement = p867
    end)
    v113.ToggleHakiColor:SetValue(false)
    spawn(function()
        while wait() do
            if _G.Auto_Buy_Enchancement then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "ColorsDealer",
                    "2"
                }))
            end
        end
    end)
end
if Sea2 then
    v112.Main:AddToggle("ToggleSwordLengend", {
        ["Title"] = "Mua Ki\225\186\191m Huy\225\187\129n Tho\225\186\161i",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p868)
        _G.BuyLengendSword = p868
    end)
    v113.ToggleSwordLengend:SetValue(false)
    spawn(function()
        while wait() do
            pcall(function()
                if _G.BuyLengendSword or Triple_A then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                        "LegendarySwordDealer",
                        "2"
                    }))
                else
                    wait()
                end
            end)
        end
    end)
end
if Sea2 then
    v112.Main:AddToggle("ToggleEvoRace", {
        ["Title"] = "N\195\162ng T\225\187\153c V2",
        ["Description"] = "",
        ["Default"] = false
    }):OnChanged(function(p869)
        _G.AutoEvoRace = p869
    end)
    v113.ToggleEvoRace:SetValue(false)
    spawn(function()
        pcall(function()
            while wait(0.1) do
                if _G.AutoEvoRace and not game:GetService("Players").LocalPlayer.Data.Race:FindFirstChild("Evolved") then
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") ~= 0 then
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") ~= 1 then
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "3")
                            end
                        else
                            pcall(function()
                                if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 1") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 1") then
                                    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 2") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 2") then
                                        if not (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flower 3")) then
                                            if game:GetService("Workspace").Enemies:FindFirstChild("Zombie") then
                                                local v870, v871, v872 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                                                while true do
                                                    local v873
                                                    v872, v873 = v870(v871, v872)
                                                    if v872 == nil then
                                                        break
                                                    end
                                                    if v873.Name == "Zombie" then
                                                        repeat
                                                            task.wait(_G.Fast_Delay)
                                                            AutoHaki()
                                                            EquipTool(SelectWeapon)
                                                            Tween(v873.HumanoidRootPart.CFrame * Pos)
                                                            v873.HumanoidRootPart.CanCollide = false
                                                            v873.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                                            AttackNoCoolDown()
                                                            FarmPos = v873.HumanoidRootPart.CFrame
                                                            MonFarm = v873.Name
                                                            bringmob = true
                                                        until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flower 3") or (not v873.Parent or (v873.Humanoid.Health <= 0 or _G.AutoEvoRace == false))
                                                        bringmob = false
                                                    end
                                                end
                                            else
                                                Tween(CFrame.new(- 5685.9233398438, 48.480125427246, - 853.23724365234))
                                            end
                                        end
                                    else
                                        Tween(game:GetService("Workspace").Flower2.CFrame)
                                    end
                                else
                                    Tween(game:GetService("Workspace").Flower1.CFrame)
                                end
                            end)
                        end
                    else
                        Tween(CFrame.new(- 2779.83521, 72.9661407, - 3574.02002, - 0.730484903, 6.390141e-8, - 0.68292886, 3.5996322e-8, 1, 5.5066703e-8, 0.68292886, 1.5642467e-8, - 0.730484903))
                        if (Vector3.new(- 2779.83521, 72.9661407, - 3574.02002) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 4 then
                            wait(1.3)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist", "2")
                        end
                    end
                end
            end
        end)
    end)
end
v112.Setting:AddToggle("ToggleAutoT", {
    ["Title"] = "B\225\186\173t T\225\187\153c V3",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p874)
    _G.AutoT = p874
end)
v113.ToggleAutoT:SetValue(false)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoT then
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
            end
        end)
    end
end)
v112.Setting:AddToggle("ToggleAutoY", {
    ["Title"] = "B\225\186\173t T\225\187\153c V4",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p875)
    _G.AutoY = p875
end)
v113.ToggleAutoY:SetValue(false)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoY then
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
                wait()
                game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
            end
        end)
    end
end)
v112.Setting:AddToggle("ToggleAutoKen", {
    ["Title"] = "B\225\186\173t Haki Quan S\195\162t",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p876)
    _G.AutoKen = p876
    if p876 then
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
    else
        game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", false)
    end
end)
v113.ToggleAutoKen:SetValue(false)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoKen then
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("Ken", true)
            end
        end)
    end
end)
v112.Setting:AddToggle("ToggleSaveSpawn", {
    ["Title"] = "L\198\176u \196\144i\225\187\131m H\225\187\147i Sinh",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p877)
    _G.SaveSpawn = p877
    if p877 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            "SetSpawnPoint"
        }))
    end
end)
v113.ToggleSaveSpawn:SetValue(false)
spawn(function()
    while wait() do
        pcall(function()
            if _G.SaveSpawn then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "SetSpawnPoint"
                }))
            end
        end)
    end
end)
require(game.ReplicatedStorage.Util.CameraShaker):Stop()
v112.Setting:AddToggle("ToggleBringMob", {
    ["Title"] = "Gom Qu\195\161i",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p878)
    _G.BringMob = p878
end)
v113.ToggleBringMob:SetValue(true)
spawn(function()
    while wait() do
        pcall(function()
            local v879, v880, v881 = pairs(game:GetService("Workspace").Enemies:GetChildren())
            while true do
                local v882
                v881, v882 = v879(v880, v881)
                if v881 == nil then
                    break
                end
                if _G.BringMob and (bringmob and (v882.Name == MonFarm and (v882:FindFirstChild("Humanoid") and v882.Humanoid.Health > 0))) then
                    if v882.Name ~= "Factory Staff" then
                        if v882.Name == MonFarm and (v882.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 1000000000 then
                            v882.HumanoidRootPart.CFrame = FarmPos
                            v882.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            v882.HumanoidRootPart.Transparency = 1
                            v882.Humanoid.JumpPower = 0
                            v882.Humanoid.WalkSpeed = 0
                            if v882.Humanoid:FindFirstChild("Animator") then
                                v882.Humanoid.Animator:Destroy()
                            end
                            v882.HumanoidRootPart.CanCollide = false
                            v882.Head.CanCollide = false
                            v882.Humanoid:ChangeState(11)
                            v882.Humanoid:ChangeState(14)
                            sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                        end
                    elseif (v882.HumanoidRootPart.Position - FarmPos.Position).Magnitude <= 1000000000 then
                        v882.Head.CanCollide = false
                        v882.HumanoidRootPart.CanCollide = false
                        v882.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                        v882.HumanoidRootPart.CFrame = FarmPos
                        if v882.Humanoid:FindFirstChild("Animator") then
                            v882.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                    end
                end
            end
        end)
    end
end)
v112.Setting:AddToggle("ToggleRemoveNotify", {
    ["Title"] = "X\195\179a Th\195\180ng B\195\161o",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p883)
    RemoveNotify = p883
end)
v113.ToggleRemoveNotify:SetValue(false)
spawn(function()
    while wait() do
        if RemoveNotify then
            game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = false
        else
            game.Players.LocalPlayer.PlayerGui.Notifications.Enabled = true
        end
    end
end)
v112.Setting:AddToggle("ToggleWhite", {
    ["Title"] = "M\195\160n H\195\172nh Tr\225\186\175ng",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p884)
    _G.WhiteScreen = p884
    if _G.WhiteScreen ~= true then
        if _G.WhiteScreen == false then
            game:GetService("RunService"):Set3dRenderingEnabled(true)
        end
    else
        game:GetService("RunService"):Set3dRenderingEnabled(false)
    end
end)
v113.ToggleWhite:SetValue(false)
v112.Setting:AddSection("K\196\169 N\196\131ng Th\195\180ng Th\225\186\161o")
v112.Setting:AddToggle("ToggleZ", {
    ["Title"] = "K\196\169 N\196\131ng Z",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p885)
    SkillZ = p885
end)
v113.ToggleZ:SetValue(true)
v112.Setting:AddToggle("ToggleX", {
    ["Title"] = "K\196\169 N\196\131ng X",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p886)
    SkillX = p886
end)
v113.ToggleX:SetValue(true)
v112.Setting:AddToggle("ToggleC", {
    ["Title"] = "K\196\169 N\196\131ng C",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p887)
    SkillC = p887
end)
v113.ToggleC:SetValue(true)
v112.Setting:AddToggle("ToggleV", {
    ["Title"] = "K\196\169 N\196\131ng V",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p888)
    SkillV = p888
end)
v113.ToggleV:SetValue(true)
v112.Setting:AddToggle("ToggleF", {
    ["Title"] = "K\196\169 N\196\131ng F",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p889)
    SkillF = p889
end)
v113.ToggleF:SetValue(true)
v112.Status:AddParagraph({
    ["Title"] = "Th\195\180ng Tin",
    ["Content"] = "\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\n" .. "T\195\170n : " .. game.Players.LocalPlayer.DisplayName .. " (@" .. game.Players.LocalPlayer.Name .. ")\n" .. "C\225\186\165p : " .. game:GetService("Players").LocalPlayer.Data.Level.Value .. "\n" .. "Ti\225\187\129n : " .. game:GetService("Players").LocalPlayer.Data.Beli.Value .. "\n" .. "\196\144i\225\187\131m F : " .. game:GetService("Players").LocalPlayer.Data.Fragments.Value .. "\n" .. "Ti\225\187\129n Truy N\195\163 : " .. game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value .. "\n" .. "M\195\161u: " .. game.Players.LocalPlayer.Character.Humanoid.Health .. "/" .. game.Players.LocalPlayer.Character.Humanoid.MaxHealth .. "\n" .. "N\196\131ng L\198\176\225\187\163ng : " .. game.Players.LocalPlayer.Character.Energy.Value .. "/" .. game.Players.LocalPlayer.Character.Energy.MaxValue .. "\n" .. "T\225\187\153c : " .. game:GetService("Players").LocalPlayer.Data.Race.Value .. "\n" .. "Tr\195\161i : " .. game:GetService("Players").LocalPlayer.Data.DevilFruit.Value .. "\n\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129\226\148\129"
})
local vu890 = v112.Status:AddParagraph({
    ["Title"] = "Th\225\187\157i Gian",
    ["Content"] = ""
})
local function vu900()
	-- upvalues: (ref) vu890
    local v891 = os.date("*t")
    local v892 = v891.hour % 24
    local v893 = v892 < 12 and "AM" or "PM"
    local v894 = string.format("%02i:%02i:%02i %s", (v892 - 1) % 12 + 1, v891.min, v891.sec, v893)
    local v895 = string.format("%02d/%02d/%04d", v891.day, v891.month, v891.year)
    local vu896 = game:GetService("LocalizationService")
    local vu897 = game:GetService("Players").LocalPlayer
    local _ = vu897.Name
    local v898, v899 = pcall(function()
		-- upvalues: (ref) vu896, (ref) vu897
        return vu896:GetCountryRegionForPlayerAsync(vu897)
    end)
    vu890:SetDesc(v895 .. "-" .. v894 .. " [ " .. (not v898 and "Unknown" or v899) .. " ]")
end
spawn(function()
	-- upvalues: (ref) vu900
    while true do
        vu900()
        game:GetService("RunService").RenderStepped:Wait()
    end
end)
local vu901 = v112.Status:AddParagraph({
    ["Title"] = "Th\225\187\157i Gian M\195\161y Ch\225\187\167",
    ["Content"] = ""
})
local function vu906()
	-- upvalues: (ref) vu901
    local v902 = math.floor(workspace.DistributedGameTime + 0.5)
    local v903 = math.floor(v902 / 3600) % 24
    local v904 = math.floor(v902 / 60) % 60
    local v905 = v902 % 60
    vu901:SetDesc(string.format("%02d Ti\225\186\191ng-%02d Ph\195\186t-%02d Gi\195\162y", v903, v904, v905))
end
spawn(function()
	-- upvalues: (ref) vu906
    while task.wait() do
        pcall(vu906)
    end
end)
local vu907 = v112.Status:AddParagraph({
    ["Title"] = "\196\144\225\186\163o Leviathan",
    ["Content"] = ""
})
spawn(function()
	-- upvalues: (ref) vu907
    pcall(function()
		-- upvalues: (ref) vu907
        while wait() do
            if game:GetService("Workspace").Map:FindFirstChild("FrozenDimension") then
                vu907:SetDesc("\226\156\133")
            else
                vu907:SetDesc("\226\157\140")
            end
        end
    end)
end)
v112.Status:AddInput("Input", {
    ["Title"] = "Job ID",
    ["Default"] = "",
    ["Placeholder"] = "D\195\161n Job ID V\195\160o \196\144\195\162y",
    ["Numeric"] = false,
    ["Finished"] = false,
    ["Callback"] = function(p908)
        _G.Job = p908
    end
})
v112.Status:AddButton({
    ["Title"] = "B\225\186\175t \196\144\225\186\167u Tham Gia Job ID",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, _G.Job, game.Players.LocalPlayer)
    end
})
v112.Status:AddButton({
    ["Title"] = "Sao Ch\195\169p Job ID",
    ["Description"] = "",
    ["Callback"] = function()
        setclipboard(tostring(game.JobId))
    end
})
v112.Status:AddToggle("MyToggle", {
    ["Title"] = "Spam Tham Gia Job ID",
    ["Default"] = false
}):OnChanged(function(p909)
    _G.Join = p909
end)
spawn(function()
    while wait() do
        if _G.Join then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.placeId, _G.Job, game.Players.LocalPlayer)
        end
    end
end)
v112.Stats:AddToggle("ToggleMelee", {
    ["Title"] = "N\195\162ng \196\144\225\186\165m",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p910)
    _G.Auto_Stats_Melee = p910
end)
v113.ToggleMelee:SetValue(false)
v112.Stats:AddToggle("ToggleDe", {
    ["Title"] = "N\195\162ng M\195\161u",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p911)
    _G.Auto_Stats_Defense = p911
end)
v113.ToggleDe:SetValue(false)
v112.Stats:AddToggle("ToggleSword", {
    ["Title"] = "N\195\162ng Ki\225\186\191m",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p912)
    _G.Auto_Stats_Sword = p912
end)
v113.ToggleSword:SetValue(false)
v112.Stats:AddToggle("ToggleGun", {
    ["Title"] = "N\195\162ng S\195\186ng",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p913)
    _G.Auto_Stats_Gun = p913
end)
v113.ToggleGun:SetValue(false)
v112.Stats:AddToggle("ToggleFruit", {
    ["Title"] = "N\195\162ng Tr\195\161i",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p914)
    _G.Auto_Stats_Devil_Fruit = p914
end)
v113.ToggleFruit:SetValue(false)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Devil_Fruit then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                "AddPoint",
                "Demon Fruit",
                3
            }))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Gun then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                "AddPoint",
                "Gun",
                3
            }))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Sword then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                "AddPoint",
                "Sword",
                3
            }))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Defense then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                "AddPoint",
                "Defense",
                3
            }))
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Auto_Stats_Melee then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                "AddPoint",
                "Melee",
                3
            }))
        end
    end
end)
local v915, v916, v917 = pairs(game:GetService("Players"):GetChildren())
local vu918 = vu254
local vu919 = {}
while true do
    local v920
    v917, v920 = v915(v916, v917)
    if v917 == nil then
        break
    end
    table.insert(vu919, v920.Name)
end
local v921 = v112.Player:AddDropdown("SelectedPly", {
    ["Title"] = "Ch\225\187\141n Ng\198\176\225\187\157i Ch\198\161i",
    ["Description"] = "",
    ["Values"] = vu919,
    ["Multi"] = false,
    ["Default"] = 1
})
v921:SetValue(_G.SelectPly)
v921:OnChanged(function(p922)
    _G.SelectPly = p922
end)
v112.Player:AddButton({
    ["Title"] = "T\225\186\163i L\225\186\161i Ng\198\176\225\187\157i Ch\198\161i",
    ["Description"] = "",
    ["Callback"] = function()
		-- upvalues: (ref) vu919
        table.clear(vu919)
        local v923, v924, v925 = pairs(game:GetService("Players"):GetChildren())
        while true do
            local v926
            v925, v926 = v923(v924, v925)
            if v925 == nil then
                break
            end
            table.insert(vu919, v926.Name)
        end
    end
})
v112.Player:AddToggle("ToggleTeleport", {
    ["Title"] = "Bay \196\144\225\186\191n Ng\198\176\225\187\157i Ch\198\161i",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p927)
    _G.TeleportPly = p927
    if p927 == false then
        wait()
        AutoHaki()
        Tween2(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
        wait()
    end
end)
v113.ToggleTeleport:SetValue(false)
spawn(function()
    while wait() do
        if _G.TeleportPly then
            pcall(function()
                if game.Players:FindFirstChild(_G.SelectPly) then
                    Tween2(game.Players[_G.SelectPly].Character.HumanoidRootPart.CFrame)
                end
            end)
        end
    end
end)
v112.Player:AddSection("Kh\195\161c")
v112.Player:AddToggle("ToggleNoClip", {
    ["Title"] = "\196\144i Xuy\195\170n T\198\176\225\187\157ng",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p928)
    _G.LOf = p928
end)
v113.ToggleNoClip:SetValue(true)
spawn(function()
    pcall(function()
        game:GetService("RunService").Stepped:Connect(function()
            if _G.LOf then
                local v929, v930, v931 = pairs(game.Players.LocalPlayer.Character:GetDescendants())
                while true do
                    local v932
                    v931, v932 = v929(v930, v931)
                    if v931 == nil then
                        break
                    end
                    if v932:IsA("BasePart") then
                        v932.CanCollide = false
                    end
                end
            end
        end)
    end)
end)
v112.Player:AddToggle("ToggleWalkonWater", {
    ["Title"] = "\196\144i Tr\195\170n N\198\176\225\187\155c",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p933)
    _G.WalkonWater = p933
end)
v113.ToggleWalkonWater:SetValue(true)
spawn(function()
    while task.wait() do
        pcall(function()
            if _G.WalkonWater then
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 112, 1000)
            else
                game:GetService("Workspace").Map["WaterBase-Plane"].Size = Vector3.new(1000, 80, 1000)
            end
        end)
    end
end)
v112.Player:AddToggle("ToggleEnablePvp", {
    ["Title"] = "B\225\186\173t PVP",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p934)
    _G.EnabledPvP = p934
end)
v113.ToggleEnablePvp:SetValue(false)
spawn(function()
    pcall(function()
        while wait() do
            if _G.EnabledPvP and game:GetService("Players").LocalPlayer.PlayerGui.Main.PvpDisabled.Visible == true then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
            end
        end
    end)
end)
local vu935 = v112.Teleport:AddSection("Th\225\186\191 Gi\225\187\155i")
v112.Teleport:AddToggle("ToggleAutoSea2", {
    ["Title"] = "Nhi\225\187\135m V\225\187\165 Qua Bi\225\187\131n 2",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p936)
    _G.Auto_Sea2 = p936
end)
v113.ToggleAutoSea2:SetValue(false)
spawn(function()
    while wait() do
        if _G.Auto_Sea2 then
            pcall(function()
                if game:GetService("Players").LocalPlayer.Data.Level.Value >= 700 and World1 then
                    if game:GetService("Workspace").Map.Ice.Door.CanCollide == false and game:GetService("Workspace").Map.Ice.Door.Transparency == 1 then
                        local v937 = CFrame.new(4849.29883, 5.65138149, 719.611877)
                        repeat
                            Tween(v937)
                            wait()
                        until (v937.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.Auto_Sea2 == false
                        wait(1.1)
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Detective")
                        wait(0.5)
                        EquipTool("Key")
                        repeat
                            Tween(CFrame.new(1347.7124, 37.3751602, - 1325.6488))
                            wait()
                        until (Vector3.new(1347.7124, 37.3751602, - 1325.6488) - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 3 or _G.Auto_Sea2 == false
                        wait(0.5)
						-- goto l3
                    end
                    if game:GetService("Workspace").Map.Ice.Door.CanCollide ~= false or game:GetService("Workspace").Map.Ice.Door.Transparency ~= 1 then
						-- goto l3
                    end
                    if game:GetService("Workspace").Enemies:FindFirstChild("Ice Admiral") then
                        local v938, v939, v940 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v941
                            v940, v941 = v938(v939, v940)
                            if v940 == nil then
                                break
                            end
                            if v941.Name == "Ice Admiral" then
                                if not v941.Humanoid.Health > 0 then
									-- ::l34::
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                                elseif v941:FindFirstChild("Humanoid") and (v941:FindFirstChild("HumanoidRootPart") and v941.Humanoid.Health > 0) then
                                    OldCFrameSecond = v941.HumanoidRootPart.CFrame
                                    task.wait(_G.Fast_Delay)
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    v941.HumanoidRootPart.CanCollide = false
                                    v941.Humanoid.WalkSpeed = 0
                                    v941.Head.CanCollide = false
                                    v941.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                    v941.HumanoidRootPart.CFrame = OldCFrameSecond
                                    Tween(v941.HumanoidRootPart.CFrame * Pos)
                                    AttackNoCoolDown()
                                    sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                                    if _G.Auto_Sea2 and (v941.Parent and v941.Humanoid.Health > 0) then
										-- goto l34
                                    end
                                end
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral") then
                        Tween(game:GetService("ReplicatedStorage"):FindFirstChild("Ice Admiral").HumanoidRootPart.CFrame * CFrame.new(5, 10, 7))
                    end
                end
				-- ::l3::
            end)
        end
    end
end)
v112.Teleport:AddToggle("ToggleAutoSea3", {
    ["Title"] = "Nhi\225\187\135m V\225\187\165 Qua Bi\225\187\131n 3",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p942)
    _G.Auto_Sea3 = p942
end)
v113.ToggleAutoSea3:SetValue(false)
spawn(function()
    while wait() do
        if _G.AutoSea3 then
            pcall(function()
                if game:GetService("Players").LocalPlayer.Data.Level.Value >= 1500 and World2 then
                    _G.AutoLevel = false
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "General") == 0 then
                        Tween(CFrame.new(- 1926.3221435547, 12.819851875305, 1738.3092041016))
                        if (CFrame.new(- 1926.3221435547, 12.819851875305, 1738.3092041016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                            wait(1.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin")
                        end
                        wait(1.8)
                        if game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") then
                            local v943, v944, v945 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                            while true do
                                local v946
                                v945, v946 = v943(v944, v945)
                                if v945 == nil then
                                    break
                                end
                                if v946.Name == "rip_indra" then
                                    OldCFrameThird = v946.HumanoidRootPart.CFrame
                                    repeat
                                        task.wait(_G.Fast_Delay)
                                        AutoHaki()
                                        EquipTool(SelectWeapon)
                                        Tween(v946.HumanoidRootPart.CFrame * Pos)
                                        v946.HumanoidRootPart.CFrame = OldCFrameThird
                                        v946.HumanoidRootPart.Size = Vector3.new(50, 50, 50)
                                        v946.HumanoidRootPart.CanCollide = false
                                        v946.Humanoid.WalkSpeed = 0
                                        AttackNoCoolDown()
                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                                    until _G.AutoSea3 == false or (v946.Humanoid.Health <= 0 or not v946.Parent)
                                end
                            end
                        elseif not game:GetService("Workspace").Enemies:FindFirstChild("rip_indra") and (CFrame.new(- 26880.93359375, 22.848554611206, 473.18951416016).Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
                            Tween(CFrame.new(- 26880.93359375, 22.848554611206, 473.18951416016))
                        end
                    end
                end
            end)
        end
    end
end)
v112.Teleport:AddButton({
    ["Title"] = "Bi\225\186\191n 1",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
    end
})
v112.Teleport:AddButton({
    ["Title"] = "Bi\225\186\191n 2",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
})
v112.Teleport:AddButton({
    ["Title"] = "Bi\225\187\131n 3",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
    end
})
v112.Teleport:AddSection("\196\144\225\186\163o")
if Sea1 then
    IslandList = {
        "WindMill",
        "Marine",
        "Middle Town",
        "Jungle",
        "Pirate Village",
        "Desert",
        "Snow Island",
        "MarineFord",
        "Colosseum",
        "Sky Island 1",
        "Sky Island 2",
        "Sky Island 3",
        "Prison",
        "Magma Village",
        "Under Water Island",
        "Fountain City",
        "Shank Room",
        "Mob Island"
    }
elseif Sea2 then
    IslandList = {
        "The Cafe",
        "Frist Spot",
        "Dark Area",
        "Flamingo Mansion",
        "Flamingo Room",
        "Green Zone",
        "Factory",
        "Colossuim",
        "Zombie Island",
        "Two Snow Mountain",
        "Punk Hazard",
        "Cursed Ship",
        "Ice Castle",
        "Forgotten Island",
        "Ussop Island",
        "Mini Sky Island"
    }
elseif Sea3 then
    IslandList = {
        "Mansion",
        "Port Town",
        "Great Tree",
        "Castle On The Sea",
        "MiniSky",
        "Hydra Island",
        "Floating Turtle",
        "Haunted Castle",
        "Ice Cream Island",
        "Peanut Island",
        "Cake Island",
        "Cocoa Island",
        "Candy Island",
        "Tiki Outpost"
    }
end
local v947 = v112.Teleport:AddDropdown("DropdownIsland", {
    ["Title"] = "Ch\225\187\141n \196\144\225\186\163o",
    ["Description"] = "",
    ["Values"] = IslandList,
    ["Multi"] = false,
    ["Default"] = 1
})
v947:SetValue(_G.SelectIsland)
v947:OnChanged(function(p948)
    _G.SelectIsland = p948
end)
v112.Teleport:AddButton({
    ["Title"] = "Bay \196\144\225\186\191n \196\144\225\186\163o",
    ["Description"] = "",
    ["Callback"] = function()
        if _G.SelectIsland ~= "WindMill" then
            if _G.SelectIsland ~= "Marine" then
                if _G.SelectIsland ~= "Middle Town" then
                    if _G.SelectIsland ~= "Jungle" then
                        if _G.SelectIsland ~= "Pirate Village" then
                            if _G.SelectIsland ~= "Desert" then
                                if _G.SelectIsland ~= "Snow Island" then
                                    if _G.SelectIsland ~= "MarineFord" then
                                        if _G.SelectIsland ~= "Colosseum" then
                                            if _G.SelectIsland ~= "Sky Island 1" then
                                                if _G.SelectIsland ~= "Sky Island 2" then
                                                    if _G.SelectIsland ~= "Sky Island 3" then
                                                        if _G.SelectIsland ~= "Prison" then
                                                            if _G.SelectIsland ~= "Magma Village" then
                                                                if _G.SelectIsland ~= "Under Water Island" then
                                                                    if _G.SelectIsland ~= "Fountain City" then
                                                                        if _G.SelectIsland ~= "Shank Room" then
                                                                            if _G.SelectIsland ~= "Mob Island" then
                                                                                if _G.SelectIsland ~= "The Cafe" then
                                                                                    if _G.SelectIsland ~= "Frist Spot" then
                                                                                        if _G.SelectIsland ~= "Dark Area" then
                                                                                            if _G.SelectIsland ~= "Flamingo Mansion" then
                                                                                                if _G.SelectIsland ~= "Flamingo Room" then
                                                                                                    if _G.SelectIsland ~= "Green Zone" then
                                                                                                        if _G.SelectIsland ~= "Factory" then
                                                                                                            if _G.SelectIsland ~= "Colossuim" then
                                                                                                                if _G.SelectIsland ~= "Zombie Island" then
                                                                                                                    if _G.SelectIsland ~= "Two Snow Mountain" then
                                                                                                                        if _G.SelectIsland ~= "Punk Hazard" then
                                                                                                                            if _G.SelectIsland ~= "Cursed Ship" then
                                                                                                                                if _G.SelectIsland ~= "Ice Castle" then
                                                                                                                                    if _G.SelectIsland ~= "Forgotten Island" then
                                                                                                                                        if _G.SelectIsland ~= "Ussop Island" then
                                                                                                                                            if _G.SelectIsland ~= "Mini Sky Island" then
                                                                                                                                                if _G.SelectIsland ~= "Great Tree" then
                                                                                                                                                    if _G.SelectIsland ~= "Castle On The Sea" then
                                                                                                                                                        if _G.SelectIsland ~= "MiniSky" then
                                                                                                                                                            if _G.SelectIsland ~= "Port Town" then
                                                                                                                                                                if _G.SelectIsland ~= "Hydra Island" then
                                                                                                                                                                    if _G.SelectIsland ~= "Floating Turtle" then
                                                                                                                                                                        if _G.SelectIsland ~= "Mansion" then
                                                                                                                                                                            if _G.SelectIsland ~= "Castle On The Sea" then
                                                                                                                                                                                if _G.SelectIsland ~= "Haunted Castle" then
                                                                                                                                                                                    if _G.SelectIsland ~= "Ice Cream Island" then
                                                                                                                                                                                        if _G.SelectIsland ~= "Peanut Island" then
                                                                                                                                                                                            if _G.SelectIsland ~= "Cake Island" then
                                                                                                                                                                                                if _G.SelectIsland ~= "Cocoa Island" then
                                                                                                                                                                                                    if _G.SelectIsland ~= "Candy Island" then
                                                                                                                                                                                                        if _G.SelectIsland == "Tiki Outpost" then
                                                                                                                                                                                                            Tween2(CFrame.new(- 16542.447265625, 55.68632888793945, 1044.41650390625))
                                                                                                                                                                                                        end
                                                                                                                                                                                                    else
                                                                                                                                                                                                        Tween2(CFrame.new(- 1014.4241943359375, 149.11068725585938, - 14555.962890625))
                                                                                                                                                                                                    end
                                                                                                                                                                                                else
                                                                                                                                                                                                    Tween2(CFrame.new(87.94276428222656, 73.55451202392578, - 12319.46484375))
                                                                                                                                                                                                end
                                                                                                                                                                                            else
                                                                                                                                                                                                Tween2(CFrame.new(- 1884.7747802734375, 19.327526092529297, - 11666.8974609375))
                                                                                                                                                                                            end
                                                                                                                                                                                        else
                                                                                                                                                                                            Tween2(CFrame.new(- 2062.7475585938, 50.473892211914, - 10232.568359375))
                                                                                                                                                                                        end
                                                                                                                                                                                    else
                                                                                                                                                                                        Tween2(CFrame.new(- 902.56817626953, 79.93204498291, - 10988.84765625))
                                                                                                                                                                                    end
                                                                                                                                                                                else
                                                                                                                                                                                    Tween2(CFrame.new(- 9515.3720703125, 164.00624084473, 5786.0610351562))
                                                                                                                                                                                end
                                                                                                                                                                            else
                                                                                                                                                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375))
                                                                                                                                                                            end
                                                                                                                                                                        else
                                                                                                                                                                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 12468.5380859375, 375.0094299316406, - 7554.62548828125))
                                                                                                                                                                        end
                                                                                                                                                                    else
                                                                                                                                                                        Tween2(CFrame.new(- 13274.528320313, 531.82073974609, - 7579.22265625))
                                                                                                                                                                    end
                                                                                                                                                                else
                                                                                                                                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, - 334.9649963378906))
                                                                                                                                                                end
                                                                                                                                                            else
                                                                                                                                                                Tween2(CFrame.new(- 290.7376708984375, 6.729952812194824, 5343.5537109375))
                                                                                                                                                            end
                                                                                                                                                        else
                                                                                                                                                            Tween2(CFrame.new(- 260.65557861328, 49325.8046875, - 35253.5703125))
                                                                                                                                                        end
                                                                                                                                                    else
                                                                                                                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375))
                                                                                                                                                    end
                                                                                                                                                else
                                                                                                                                                    Tween2(CFrame.new(2681.2736816406, 1682.8092041016, - 7190.9853515625))
                                                                                                                                                end
                                                                                                                                            else
                                                                                                                                                Tween2(CFrame.new(- 288.74060058594, 49326.31640625, - 35248.59375))
                                                                                                                                            end
                                                                                                                                        else
                                                                                                                                            Tween2(CFrame.new(4816.8618164063, 8.4599885940552, 2863.8195800781))
                                                                                                                                        end
                                                                                                                                    else
                                                                                                                                        Tween2(CFrame.new(- 3032.7641601563, 317.89672851563, - 10075.373046875))
                                                                                                                                    end
                                                                                                                                else
                                                                                                                                    Tween2(CFrame.new(6148.4116210938, 294.38687133789, - 6741.1166992188))
                                                                                                                                end
                                                                                                                            else
                                                                                                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.40197753906, 125.05712890625, 32885.875))
                                                                                                                            end
                                                                                                                        else
                                                                                                                            Tween2(CFrame.new(- 6127.654296875, 15.951762199402, - 5040.2861328125))
                                                                                                                        end
                                                                                                                    else
                                                                                                                        Tween2(CFrame.new(753.14288330078, 408.23559570313, - 5274.6147460938))
                                                                                                                    end
                                                                                                                else
                                                                                                                    Tween2(CFrame.new(- 5622.033203125, 492.19604492188, - 781.78552246094))
                                                                                                                end
                                                                                                            else
                                                                                                                Tween2(CFrame.new(- 1503.6224365234, 219.7956237793, 1369.3101806641))
                                                                                                            end
                                                                                                        else
                                                                                                            Tween2(CFrame.new(424.12698364258, 211.16171264648, - 427.54049682617))
                                                                                                        end
                                                                                                    else
                                                                                                        Tween2(CFrame.new(- 2448.5300292969, 73.016105651855, - 3210.6306152344))
                                                                                                    end
                                                                                                else
                                                                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2284.912109375, 15.152034759521484, 905.48291015625))
                                                                                                end
                                                                                            else
                                                                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 281.93707275390625, 306.130615234375, 609.280029296875))
                                                                                            end
                                                                                        else
                                                                                            Tween2(CFrame.new(3780.0302734375, 22.652164459229, - 3498.5859375))
                                                                                        end
                                                                                    else
                                                                                        Tween2(CFrame.new(- 11.311455726624, 29.276733398438, 2771.5224609375))
                                                                                    end
                                                                                else
                                                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 281.93707275390625, 306.130615234375, 609.280029296875))
                                                                                    wait()
                                                                                    Tween2(CFrame.new(- 380.47927856445, 77.220390319824, 255.82550048828))
                                                                                end
                                                                            else
                                                                                Tween2(CFrame.new(- 2850.20068, 7.39224768, 5354.99268))
                                                                            end
                                                                        else
                                                                            Tween2(CFrame.new(- 1442.16553, 29.8788261, - 28.3547478))
                                                                        end
                                                                    else
                                                                        Tween2(CFrame.new(5127.1284179688, 59.501365661621, 4105.4458007813))
                                                                    end
                                                                else
                                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
                                                                end
                                                            else
                                                                Tween2(CFrame.new(- 5247.7163085938, 12.883934020996, 8504.96875))
                                                            end
                                                        else
                                                            Tween2(CFrame.new(4875.330078125, 5.6519818305969, 734.85021972656))
                                                        end
                                                    else
                                                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 7894.6176757813, 5547.1416015625, - 380.29119873047))
                                                    end
                                                else
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 4607.82275, 872.54248, - 1667.55688))
                                                end
                                            else
                                                Tween2(CFrame.new(- 4869.1025390625, 733.46051025391, - 2667.0180664063))
                                            end
                                        else
                                            Tween2(CFrame.new(- 1427.6203613281, 7.2881078720093, - 2792.7722167969))
                                        end
                                    else
                                        Tween2(CFrame.new(- 4914.8212890625, 50.963626861572, 4281.0278320313))
                                    end
                                else
                                    Tween2(CFrame.new(1347.8067626953, 104.66806030273, - 1319.7370605469))
                                end
                            else
                                Tween2(CFrame.new(944.15789794922, 20.919729232788, 4373.3002929688))
                            end
                        else
                            Tween2(CFrame.new(- 1181.3093261719, 4.7514905929565, 3803.5456542969))
                        end
                    else
                        Tween2(CFrame.new(- 1612.7957763672, 36.852081298828, 149.12843322754))
                    end
                else
                    Tween2(CFrame.new(- 690.33081054688, 15.09425163269, 1582.2380371094))
                end
            else
                Tween2(CFrame.new(- 2566.4296875, 6.8556680679321, 2045.2561035156))
            end
        else
            Tween2(CFrame.new(979.79895019531, 16.516613006592, 1429.0466308594))
        end
    end
})
v112.Teleport:AddButton({
    ["Title"] = "D\225\187\171ng Bay",
    ["Description"] = "",
    ["Callback"] = function()
        CancelTween()
    end
})
v112.Visual:AddButton({
    ["Title"] = "Gi\225\186\163",
    ["Description"] = "",
    ["Callback"] = function()
        local v949 = game:GetService("Players").LocalPlayer
        local v950 = require(game:GetService("ReplicatedStorage").Notification)
        local v951 = v949:WaitForChild("Data")
        local v952 = require(game.ReplicatedStorage:WaitForChild("EXPFunction"))
        local v953 = require(game:GetService("ReplicatedStorage").Effect.Container.LevelUp)
        local v954 = require(game:GetService("ReplicatedStorage").Util.Sound)
        local v955 = game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp_Proxy") or game:GetService("ReplicatedStorage").Util.Sound.Storage.Other:FindFirstChild("LevelUp")
        function v129(p956)
            repeat
                local v957
                p956, v957 = string.gsub(p956, "^(-?%d+)(%d%d%d)", "%1,%2")
            until v957 == 0
            return p956
        end
        v950.new("<Color=Yellow>QUEST COMPLETED!<Color=/>"):Display()
        v950.new("Earned<Color=Yellow>9,999,999,999,999 Exp.<Color=/>(+None)"):Display()
        v950.new("Earned<Color=Green>$9,999,999,999,999<Color=/>"):Display()
        v949.Data.Exp.Value = 999999999999
        v949.Data.Beli.Value = v949.Data.Beli.Value + 999999999999
        delay = 0
        count = 0
        while v949.Data.Exp.Value - v952(v951.Level.Value) > 0 do
            v949.Data.Exp.Value = v949.Data.Exp.Value - v952(v951.Level.Value)
            v949.Data.Level.Value = v949.Data.Level.Value + 1
            v949.Data.Points.Value = v949.Data.Points.Value + 3
            v953({
                v949
            })
            v954:Play(v955.Value)
            v950.new("<Color=Green>LEVEL UP!<Color=/>(" .. v949.Data.Level.Value .. ")"):Display()
            count = count + 1
            if count >= 5 then
                delay = tick()
                count = 0
                wait()
            end
        end
    end
})
v112.Visual:AddInput("Input_Level", {
    ["Title"] = "C\225\186\165p",
    ["Default"] = "",
    ["Placeholder"] = "Nh\225\186\173p",
    ["Numeric"] = false,
    ["Finished"] = false,
    ["Callback"] = function(p958)
        game:GetService("Players").LocalPlayer.Data.Level.Value = tonumber(p958)
    end
})
v112.Visual:AddInput("Input_EXP", {
    ["Title"] = "Kinh Nghi\225\187\135m",
    ["Default"] = "",
    ["Placeholder"] = "Nh\225\186\173p",
    ["Numeric"] = false,
    ["Finished"] = false,
    ["Callback"] = function(p959)
        game:GetService("Players").LocalPlayer.Data.Exp.Value = tonumber(p959)
    end
})
v112.Visual:AddInput("Input_Beli", {
    ["Title"] = "Ti\225\187\129n",
    ["Default"] = "",
    ["Placeholder"] = "Nh\225\186\173p",
    ["Numeric"] = false,
    ["Finished"] = false,
    ["Callback"] = function(p960)
        game:GetService("Players").LocalPlayer.Data.Beli.Value = tonumber(p960)
    end
})
v112.Visual:AddInput("Input_Fragments", {
    ["Title"] = "\196\144i\225\187\131m F",
    ["Default"] = "",
    ["Placeholder"] = "Nh\225\186\173p",
    ["Numeric"] = false,
    ["Finished"] = false,
    ["Callback"] = function(p961)
        game:GetService("Players").LocalPlayer.Data.Fragments.Value = tonumber(p961)
    end
})
local v962 = game.ReplicatedStorage:FindFirstChild("Remotes").CommF_:InvokeServer("GetFruits")
Table_DevilFruitSniper = {}
ShopDevilSell = {}
local v963 = next
local v964 = nil
while true do
    local v965
    v964, v965 = v963(v962, v964)
    if v964 == nil then
        break
    end
    table.insert(Table_DevilFruitSniper, v965.Name)
    if v965.OnSale then
        table.insert(ShopDevilSell, v965.Name)
    end
end
_G.SelectFruit = "Dragon-Dragon"
_G.PermanentFruit = "Dragon-Dragon"
_G.AutoBuyFruitSniper = false
_G.AutoSwitchPermanentFruit = false
local v966 = v112.Fruit:AddDropdown("DropdownFruit", {
    ["Title"] = "Ch\225\187\141n Tr\195\161i",
    ["Description"] = "",
    ["Values"] = Table_DevilFruitSniper,
    ["Multi"] = false,
    ["Default"] = 1
})
v966:SetValue(_G.SelectFruit)
v966:OnChanged(function(p967)
    _G.SelectFruit = p967
end)
v112.Fruit:AddToggle("ToggleFruit", {
    ["Title"] = "Mua Tr\195\161i Ch\225\187\141n",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p968)
    if p968 then
        _G.AutoBuyFruitSniper = true
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit", _G.SelectFruit, false)
        end)
        _G.AutoBuyFruitSniper = false
    end
end)
v113.ToggleFruit:SetValue(false)
local v969 = v112.Fruit:AddDropdown("DropdownPermanentFruit", {
    ["Title"] = "Ch\225\187\141n Tr\195\161i V\196\169nh Vi\225\187\133n",
    ["Description"] = "",
    ["Values"] = Table_DevilFruitSniper,
    ["Multi"] = false,
    ["Default"] = 1
})
v969:SetValue(_G.PermanentFruit)
v969:OnChanged(function(p970)
    _G.PermanentFruit = p970
end)
v112.Fruit:AddToggle("TogglePermanentFruit", {
    ["Title"] = "\196\144\225\187\149i Tr\195\161i V\196\169nh Vi\225\187\133n",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p971)
    if p971 then
        _G.AutoSwitchPermanentFruit = true
        pcall(function()
            local v972 = {
                "SwitchFruit",
                _G.PermanentFruit
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v972))
        end)
        _G.AutoSwitchPermanentFruit = false
    end
end)
v113.TogglePermanentFruit:SetValue(false)
v112.Fruit:AddToggle("ToggleStore", {
    ["Title"] = "L\198\176u Tr\195\161i",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p973)
    _G.AutoStoreFruit = p973
end)
v113.ToggleStore:SetValue(false)
spawn(function()
    while task.wait() do
        if _G.AutoStoreFruit then
            pcall(function()
                if _G.AutoStoreFruit then
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bomb Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Bomb-Bomb", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Bomb Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spike Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spike-Spike", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spike Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Chop Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Chop-Chop", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Chop Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spring Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spring-Spring", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spring Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rocket Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rocket-Rocket", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kilo Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Smoke Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Smoke-Smoke", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Smoke Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spin Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spin-Spin", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spin Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Flame Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Flame-Flame", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Flame Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Falcon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Falcon Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Falcon", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("alcon Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ice Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Ice-Ice", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ice Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Sand Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Sand-Sand", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sand Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dark Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dark-Dark", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Ghost Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Ghost-Ghost", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Revive Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Diamond Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Diamond-Diamond", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Diamond Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Light Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Light-Light", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Light Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Love Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Love-Love", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Love Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rubber Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rubber-Rubber", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rubber Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Barrier Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Barrier-Barrier", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Barrier Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Magma Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Magma-Magma", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Magma Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Portal Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Door-Door", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Portal Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Quake Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Quake-Quake", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Quake Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Buddha Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Buddha Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Buddha", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Buddha Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spider Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Spider-Spider", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spider Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Bird: Phoenix Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Phoenix Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Phoenix", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Phoenix Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Rumble Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Rumble-Rumble", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rumble Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Pain Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pain Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Pain-Pain", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Pain Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Gravity Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Gravity-Gravity", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Gravity Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dough Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dough-Dough", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dough Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Shadow Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Shadow-Shadow", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Shadow Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Venom Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Venom-Venom", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Venom Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Control Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Control-Control", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Control Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Spirit Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Soul-Soul", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spirit Fruit"))
                    end
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Dragon Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit") then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Dragon-Dragon", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dragon Fruit"))
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Leopard Fruit") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit") then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", "Leopard-Leopard", game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Leopard Fruit"))
                        end
                    end
                end
            end)
        end
        wait()
    end
end)
v112.Fruit:AddToggle("ToggleRandomFruit", {
    ["Title"] = "Random Tr\195\161i",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p974)
    _G.Random_Auto = p974
end)
v113.ToggleRandomFruit:SetValue(false)
spawn(function()
    pcall(function()
        while wait() do
            if _G.Random_Auto then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
            end
        end
    end)
end)
v112.Fruit:AddToggle("ToggleCollectTP", {
    ["Title"] = "Bay \196\144\225\186\191n Tr\195\161i",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p975)
    _G.CollectFruitTP = p975
end)
v113.ToggleCollectTP:SetValue(false)
spawn(function()
    while wait() do
        if _G.CollectFruitTP then
            local v976, v977, v978 = pairs(game.Workspace:GetChildren())
            while true do
                local v979
                v978, v979 = v976(v977, v978)
                if v978 == nil then
                    break
                end
                if string.find(v979.Name, "Fruit") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v979.Handle.CFrame
                end
            end
        end
    end
end)
v112.Fruit:AddToggle("ToggleCollect", {
    ["Title"] = "D\225\187\139ch Chuy\225\187\131n \196\144\225\186\191n Tr\195\161i",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p980)
    _G.Tweenfruit = p980
end)
v113.ToggleCollect:SetValue(false)
spawn(function()
    while wait() do
        if _G.Tweenfruit then
            local v981, v982, v983 = pairs(game.Workspace:GetChildren())
            while true do
                local v984
                v983, v984 = v981(v982, v983)
                if v983 == nil then
                    break
                end
                if string.find(v984.Name, "Fruit") then
                    Tween(v984.Handle.CFrame)
                end
            end
        end
    end
end)
v112.Fruit:AddSection("\196\144\225\187\139nh V\225\187\139")
v112.Fruit:AddToggle("ToggleEspPlayer", {
    ["Title"] = "Ng\198\176\225\187\157i Ch\198\161i",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p985)
    ESPPlayer = p985
    UpdatePlayerChams()
end)
v113.ToggleEspPlayer:SetValue(false)
v112.Fruit:AddToggle("ToggleEspFruit", {
    ["Title"] = "Tr\195\161i",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p986)
    DevilFruitESP = p986
    while DevilFruitESP do
        wait()
        UpdateDevilChams()
    end
end)
v113.ToggleEspFruit:SetValue(false)
v112.Fruit:AddToggle("ToggleEspIsland", {
    ["Title"] = "\196\144\225\186\163o",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p987)
    IslandESP = p987
    while IslandESP do
        wait()
        UpdateIslandESP()
    end
end)
v113.ToggleEspIsland:SetValue(false)
v112.Fruit:AddToggle("ToggleEspFlower", {
    ["Title"] = "Hoa",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p988)
    FlowerESP = p988
    UpdateFlowerChams()
end)
v113.ToggleEspFlower:SetValue(false)
spawn(function()
    while wait() do
        if FlowerESP then
            UpdateFlowerChams()
        end
        if DevilFruitESP then
            UpdateDevilChams()
        end
        if ChestESP then
            UpdateChestChams()
        end
        if ESPPlayer then
            UpdatePlayerChams()
        end
        if RealFruitESP then
            UpdateRealFruitChams()
        end
    end
end)
v112.Fruit:AddToggle("ToggleEspRealFruit", {
    ["Title"] = "Tr\195\161i D\225\187\169a Kh\225\187\155m T\195\161o",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p989)
    RealFruitEsp = p989
    while RealFruitEsp do
        wait()
        UpdateRealFruitEsp()
    end
end)
v113.ToggleEspRealFruit:SetValue(false)
function UpdateRealFruitEsp()
	-- upvalues: (ref) vu918
    local v990, v991, v992 = pairs(game.Workspace.AppleSpawner:GetChildren())
    while true do
        local v993
        v992, v993 = v990(v991, v992)
        if v992 == nil then
            break
        end
        if v993:IsA("Tool") then
            if RealFruitEsp then
                if v993.Handle:FindFirstChild("NameEsp" .. Number) then
                    v993.Handle["NameEsp" .. Number].TextLabel.Text = v993.Name .. " " .. vu918((game:GetService("Players").LocalPlayer.Character.Head.Position - v993.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    local v994 = Instance.new("BillboardGui", v993.Handle)
                    v994.Name = "NameEsp" .. Number
                    v994.ExtentsOffset = Vector3.new(0, 1, 0)
                    v994.Size = UDim2.new(1, 200, 1, 30)
                    v994.Adornee = v993.Handle
                    v994.AlwaysOnTop = true
                    local v995 = Instance.new("TextLabel", v994)
                    v995.Font = Enum.Font.GothamSemibold
                    v995.FontSize = "Size14"
                    v995.TextWrapped = true
                    v995.Size = UDim2.new(1, 0, 1, 0)
                    v995.TextYAlignment = "Top"
                    v995.BackgroundTransparency = 1
                    v995.TextStrokeTransparency = 0.5
                    v995.TextColor3 = Color3.fromRGB(255, 0, 0)
                    v995.Text = v993.Name .. " \n" .. vu918((game:GetService("Players").LocalPlayer.Character.Head.Position - v993.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v993.Handle:FindFirstChild("NameEsp" .. Number) then
                v993.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
    local v996, v997, v998 = pairs(game.Workspace.PineappleSpawner:GetChildren())
    while true do
        local v999
        v998, v999 = v996(v997, v998)
        if v998 == nil then
            break
        end
        if v999:IsA("Tool") then
            if RealFruitEsp then
                if v999.Handle:FindFirstChild("NameEsp" .. Number) then
                    v999.Handle["NameEsp" .. Number].TextLabel.Text = v999.Name .. " " .. vu918((game:GetService("Players").LocalPlayer.Character.Head.Position - v999.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    local v1000 = Instance.new("BillboardGui", v999.Handle)
                    v1000.Name = "NameEsp" .. Number
                    v1000.ExtentsOffset = Vector3.new(0, 1, 0)
                    v1000.Size = UDim2.new(1, 200, 1, 30)
                    v1000.Adornee = v999.Handle
                    v1000.AlwaysOnTop = true
                    local v1001 = Instance.new("TextLabel", v1000)
                    v1001.Font = Enum.Font.GothamSemibold
                    v1001.FontSize = "Size14"
                    v1001.TextWrapped = true
                    v1001.Size = UDim2.new(1, 0, 1, 0)
                    v1001.TextYAlignment = "Top"
                    v1001.BackgroundTransparency = 1
                    v1001.TextStrokeTransparency = 0.5
                    v1001.TextColor3 = Color3.fromRGB(255, 174, 0)
                    v1001.Text = v999.Name .. " \n" .. vu918((game:GetService("Players").LocalPlayer.Character.Head.Position - v999.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v999.Handle:FindFirstChild("NameEsp" .. Number) then
                v999.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
    local v1002, v1003, v1004 = pairs(game.Workspace.BananaSpawner:GetChildren())
    while true do
        local v1005
        v1004, v1005 = v1002(v1003, v1004)
        if v1004 == nil then
            break
        end
        if v1005:IsA("Tool") then
            if RealFruitEsp then
                if v1005.Handle:FindFirstChild("NameEsp" .. Number) then
                    v1005.Handle["NameEsp" .. Number].TextLabel.Text = v1005.Name .. " " .. vu918((game:GetService("Players").LocalPlayer.Character.Head.Position - v1005.Handle.Position).Magnitude / 3) .. " Distance"
                else
                    local v1006 = Instance.new("BillboardGui", v1005.Handle)
                    v1006.Name = "NameEsp" .. Number
                    v1006.ExtentsOffset = Vector3.new(0, 1, 0)
                    v1006.Size = UDim2.new(1, 200, 1, 30)
                    v1006.Adornee = v1005.Handle
                    v1006.AlwaysOnTop = true
                    local v1007 = Instance.new("TextLabel", v1006)
                    v1007.Font = Enum.Font.GothamSemibold
                    v1007.FontSize = "Size14"
                    v1007.TextWrapped = true
                    v1007.Size = UDim2.new(1, 0, 1, 0)
                    v1007.TextYAlignment = "Top"
                    v1007.BackgroundTransparency = 1
                    v1007.TextStrokeTransparency = 0.5
                    v1007.TextColor3 = Color3.fromRGB(251, 255, 0)
                    v1007.Text = v1005.Name .. " \n" .. vu918((game:GetService("Players").LocalPlayer.Character.Head.Position - v1005.Handle.Position).Magnitude / 3) .. " Distance"
                end
            elseif v1005.Handle:FindFirstChild("NameEsp" .. Number) then
                v1005.Handle:FindFirstChild("NameEsp" .. Number):Destroy()
            end
        end
    end
end
v112.Fruit:AddToggle("ToggleIslandMirageEsp", {
    ["Title"] = "\196\144\225\186\163o B\195\173 \225\186\168n",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1008)
    IslandMirageEsp = p1008
    while IslandMirageEsp do
        wait()
        UpdateIslandMirageEsp()
    end
end)
v113.ToggleIslandMirageEsp:SetValue(false)
function isnil(p1009)
    return p1009 == nil
end
local function vu1011(p1010)
    return math.floor(tonumber(p1010) + 0.5)
end
Number = math.random(1, 1000000)
function UpdateIslandMirageEsp()
	-- upvalues: (ref) vu1011
    local v1012, v1013, v1014 = pairs(game:GetService("Workspace")._WorldOrigin.Locations:GetChildren())
    while true do
        local vu1015
        v1014, vu1015 = v1012(v1013, v1014)
        if v1014 == nil then
            break
        end
        pcall(function()
			-- upvalues: (ref) vu1015, (ref) vu1011
            if MirageIslandESP then
                if vu1015.Name == "Mirage Island" then
                    if vu1015:FindFirstChild("NameEsp") then
                        vu1015.NameEsp.TextLabel.Text = vu1015.Name .. "   \n" .. vu1011((game:GetService("Players").LocalPlayer.Character.Head.Position - vu1015.Position).Magnitude / 3) .. " M"
                    else
                        local v1016 = Instance.new("BillboardGui", vu1015)
                        v1016.Name = "NameEsp"
                        v1016.ExtentsOffset = Vector3.new(0, 1, 0)
                        v1016.Size = UDim2.new(1, 200, 1, 30)
                        v1016.Adornee = vu1015
                        v1016.AlwaysOnTop = true
                        local v1017 = Instance.new("TextLabel", v1016)
                        v1017.Font = Enum.Font.Code
                        v1017.FontSize = Enum.FontSize.Size14
                        v1017.TextWrapped = true
                        v1017.Size = UDim2.new(1, 0, 1, 0)
                        v1017.TextYAlignment = Enum.TextYAlignment.Top
                        v1017.BackgroundTransparency = 1
                        v1017.TextStrokeTransparency = 0.5
                        v1017.TextColor3 = Color3.fromRGB(80, 245, 245)
                    end
                end
            elseif vu1015:FindFirstChild("NameEsp") then
                vu1015:FindFirstChild("NameEsp"):Destroy()
            end
        end)
    end
end
local v1018 = v112.Raid:AddDropdown("DropdownRaid", {
    ["Title"] = "Ch\225\187\141n Chip",
    ["Description"] = "",
    ["Values"] = {
        "Flame",
        "Ice",
        "Quake",
        "Light",
        "Dark",
        "Spider",
        "Rumble",
        "Magma",
        "Buddha",
        "Sand",
        "Phoenix",
        "Dough"
    },
    ["Multi"] = false,
    ["Default"] = 1
})
v1018:SetValue(SelectChip)
v1018:OnChanged(function(p1019)
    SelectChip = p1019
end)
v112.Raid:AddToggle("ToggleBuy", {
    ["Title"] = "Mua Chip",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1020)
    _G.Auto_Buy_Chips_Dungeon = p1020
end)
v113.ToggleBuy:SetValue(false)
spawn(function()
    while wait() do
        if _G.Auto_Buy_Chips_Dungeon then
            pcall(function()
                local v1021 = {
                    "RaidsNpc",
                    "Select",
                    SelectChip
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(v1021))
            end)
        end
    end
end)
v112.Raid:AddToggle("ToggleStart", {
    ["Title"] = "B\225\186\175t \196\144\225\186\167u Raid",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1022)
    _G.Auto_StartRaid = p1022
end)
v113.ToggleStart:SetValue(false)
spawn(function()
    while wait() do
        pcall(function()
            if _G.Auto_StartRaid and (game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false and (not game:GetService("Workspace")._WorldOrigin.Locations:FindFirstChild("Island 1") and (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Special Microchip") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("Special Microchip")))) then
                if Sea2 then
                    Tween2(CFrame.new(- 6438.73535, 250.645355, - 4501.50684))
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                        "SetSpawnPoint"
                    }))
                    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
                elseif Sea3 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375))
                    Tween2(CFrame.new(- 5017.40869, 314.844055, - 2823.0127, - 0.925743818, 4.482175e-8, - 0.378151238, 4.5550315e-9, 1, 1.0737756e-7, 0.378151238, 9.768162e-8, - 0.925743818))
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                        "SetSpawnPoint"
                    }))
                    fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
                end
            end
        end)
    end
end)
v112.Raid:AddToggle("ToggleNextIsland", {
    ["Title"] = "\196\144\225\186\165m Qu\195\161i Raid+Bay \196\144\225\186\191n \196\144\225\186\163o",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1023)
    AutoNextIsland = p1023
    if not p1023 then
        _G.AutoNear = false
    end
end)
v113.ToggleNextIsland:SetValue(false)
spawn(function()
    local vu1024 = {}
    while task.wait() do
        if AutoNextIsland then
            pcall(function()
				-- upvalues: (ref) vu1024
                local v1025 = game.Players.LocalPlayer.Character
                if v1025 and v1025:FindFirstChild("HumanoidRootPart") then
                    local v1026 = game:GetService("Workspace")._WorldOrigin.Locations
                    local v1027 = v1025.HumanoidRootPart.Position
                    if (v1027 - Vector3.new(- 6438.73535, 250.645355, - 4501.50684)).Magnitude < 1 or (v1027 - Vector3.new(- 5017.40869, 314.844055, - 2823.0127)).Magnitude < 1 then
                        vu1024 = {}
                    end
                    if v1026:FindFirstChild("Island 1") then
                        _G.AutoNear = true
                    end
                    if v1026:FindFirstChild("Island 2") and not vu1024["Island 2"] then
                        Tween(v1026:FindFirstChild("Island 2").CFrame)
                        vu1024["Island 2"] = true
                        AutoNextIsland = false
                        wait()
                        AutoNextIsland = true
                    elseif v1026:FindFirstChild("Island 3") and not vu1024["Island 3"] then
                        Tween(v1026:FindFirstChild("Island 3").CFrame)
                        vu1024["Island 3"] = true
                        AutoNextIsland = false
                        wait()
                        AutoNextIsland = true
                    elseif v1026:FindFirstChild("Island 4") and not vu1024["Island 4"] then
                        Tween(v1026:FindFirstChild("Island 4").CFrame)
                        vu1024["Island 4"] = true
                        AutoNextIsland = false
                        wait()
                        AutoNextIsland = true
                    elseif v1026:FindFirstChild("Island 5") and not vu1024["Island 5"] then
                        Tween(v1026:FindFirstChild("Island 5").CFrame)
                        vu1024["Island 5"] = true
                        AutoNextIsland = false
                        wait()
                        AutoNextIsland = true
                    end
                end
            end)
        end
    end
end)
v112.Raid:AddToggle("ToggleAwake", {
    ["Title"] = "Th\225\187\169c T\225\187\137nh",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1028)
    AutoAwakenAbilities = p1028
end)
v113.ToggleAwake:SetValue(false)
spawn(function()
    while task.wait() do
        if AutoAwakenAbilities then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken")
            end)
        end
    end
end)
v112.Raid:AddToggle("ToggleGetFruit", {
    ["Title"] = "L\225\186\165y Tr\195\161i D\198\176\225\187\155i 1 Tri\225\187\135u",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1029)
    _G.Autofruit = p1029
end)
spawn(function()
    while wait() do
        pcall(function()
            if _G.Autofruit then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Rocket-Rocket"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Spin-Spin"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Chop-Chop"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Spring-Spring"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Bomb-Bomb"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Smoke-Smoke"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Spike-Spike"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Flame-Flame"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Falcon-Falcon"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Ice-Ice"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Sand-Sand"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Dark-Dark"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Ghost-Ghost"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Diamond-Diamond"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Light-Light"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Rubber-Rubber"
                }))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
                    "LoadFruit",
                    "Barrier-Barrier"
                }))
            end
        end)
    end
end)
if Sea2 then
    v112.Raid:AddButton({
        ["Title"] = "Bay \196\144\225\186\191n Ch\225\187\151 T\225\186\173p K\195\173ch",
        ["Description"] = "",
        ["Callback"] = function()
            Tween2(CFrame.new(- 6438.73535, 250.645355, - 4501.50684))
        end
    })
elseif Sea3 then
    v112.Raid:AddButton({
        ["Title"] = "Bay \196\144\225\186\191n Ch\225\187\151 T\225\186\173p K\195\173ch",
        ["Description"] = "",
        ["Callback"] = function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(- 5075.50927734375, 314.5155029296875, - 3150.0224609375))
            Tween2(CFrame.new(- 5017.40869, 314.844055, - 2823.0127, - 0.925743818, 4.482175e-8, - 0.378151238, 4.5550315e-9, 1, 1.0737756e-7, 0.378151238, 9.768162e-8, - 0.925743818))
        end
    })
end
v112.Raid:AddSection("T\225\186\173p K\195\173ch Law")
v112.Raid:AddToggle("ToggleLaw", {
    ["Title"] = "Mua Chip V\195\160 \196\144\225\186\165m Law",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1030)
    Auto_Law = p1030
end)
v113.ToggleLaw:SetValue(false)
spawn(function()
    pcall(function()
        while wait() do
            if Auto_Law and not (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or (game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip") or (game:GetService("Workspace").Enemies:FindFirstChild("Order") or game:GetService("ReplicatedStorage"):FindFirstChild("Order")))) then
                wait()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "1")
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
            end
        end
    end)
end)
spawn(function()
    pcall(function()
        while wait() do
            if Auto_Law then
                if not game:GetService("Workspace").Enemies:FindFirstChild("Order") and (not game:GetService("ReplicatedStorage"):FindFirstChild("Order") and (game:GetService("Players").LocalPlayer.Character:FindFirstChild("Microchip") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Microchip"))) then
                    fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
                end
                if game:GetService("ReplicatedStorage"):FindFirstChild("Order") or game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Order") then
                        local v1031, v1032, v1033 = pairs(game:GetService("Workspace").Enemies:GetChildren())
                        while true do
                            local v1034
                            v1033, v1034 = v1031(v1032, v1033)
                            if v1033 == nil then
                                break
                            end
                            if v1034.Name == "Order" then
                                repeat
                                    wait(_G.Fast_Delay)
                                    AttackNoCoolDown()
                                    AutoHaki()
                                    EquipTool(SelectWeapon)
                                    Tween(v1034.HumanoidRootPart.CFrame * Pos)
                                    v1034.HumanoidRootPart.CanCollide = false
                                    v1034.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                                until not v1034.Parent or (v1034.Humanoid.Health <= 0 or Auto_Law == false)
                            end
                        end
                    elseif game:GetService("ReplicatedStorage"):FindFirstChild("Order") then
                        Tween(CFrame.new(- 6217.2021484375, 28.047645568848, - 5053.1357421875))
                    end
                end
            end
        end
    end)
end)
v112.Race:AddButton({
    ["Title"] = "\196\144\225\187\129n Th\225\187\157i Gian",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
    end
})
v112.Race:AddButton({
    ["Title"] = "C\225\186\167n G\225\186\161t",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
        Tween2(CFrame.new(28575.181640625, 14936.6279296875, 72.31636810302734))
    end
})
v112.Race:AddButton({
    ["Title"] = "Ch\225\187\151 Mua Gear",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
        Tween2(CFrame.new(28981.552734375, 14888.4267578125, - 120.245849609375))
    end
})
v112.Race:AddSection("T\225\187\153c")
v112.Race:AddButton({
    ["Title"] = "C\225\187\173a T\225\187\153c",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(28286.35546875, 14895.3017578125, 102.62469482421875))
        if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Human" then
            if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Skypiea" then
                if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Fishman" then
                    if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Cyborg" then
                        if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Ghoul" then
                            if game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                                Tween2(CFrame.new(29012.341796875, 14890.9755859375, - 380.1492614746094))
                            end
                        else
                            Tween2(CFrame.new(28674.244140625, 14890.6767578125, 445.4310607910156))
                        end
                    else
                        Tween2(CFrame.new(28502.681640625, 14895.9755859375, - 423.7279357910156))
                    end
                else
                    Tween2(CFrame.new(28231.17578125, 14890.9755859375, - 211.64173889160156))
                end
            else
                Tween2(CFrame.new(28960.158203125, 14919.6240234375, 235.03948974609375))
            end
        else
            Tween2(CFrame.new(29221.822265625, 14890.9755859375, - 205.99114990234375))
        end
    end
})
v112.Race:AddToggle("ToggleHumanandghoul", {
    ["Title"] = "Ho\195\160n Th\195\160nh \225\186\162i [Human/Ghoul]",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1035)
    KillAura = p1035
end)
v113.ToggleHumanandghoul:SetValue(false)
v112.Race:AddToggle("ToggleAutotrial", {
    ["Title"] = "Ho\195\160n Th\195\160nh \225\186\162i",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1036)
    _G.AutoQuestRace = p1036
end)
v113.ToggleAutotrial:SetValue(false)
spawn(function()
    pcall(function()
        while wait() do
            if _G.AutoQuestRace then
                if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Human" then
                    if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Skypiea" then
                        if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Fishman" then
                            if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Cyborg" then
                                if game:GetService("Players").LocalPlayer.Data.Race.Value ~= "Ghoul" then
                                    if game:GetService("Players").LocalPlayer.Data.Race.Value == "Mink" then
                                        local v1037, v1038, v1039 = pairs(game:GetService("Workspace"):GetDescendants())
                                        while true do
                                            local v1040
                                            v1039, v1040 = v1037(v1038, v1039)
                                            if v1039 == nil then
                                                break
                                            end
                                            if v1040.Name == "StartPoint" then
                                                Tween(v1040.CFrame * CFrame.new(0, 10, 0))
                                            end
                                        end
                                    end
                                else
                                    local v1041, v1042, v1043 = pairs(game.Workspace.Enemies:GetDescendants())
                                    while true do
                                        local vu1044
                                        v1043, vu1044 = v1041(v1042, v1043)
                                        if v1043 == nil then
                                            break
                                        end
                                        if vu1044:FindFirstChild("Humanoid") and (vu1044:FindFirstChild("HumanoidRootPart") and vu1044.Humanoid.Health > 0) then
                                            pcall(function()
												-- upvalues: (ref) vu1044
                                                repeat
                                                    wait()
                                                    vu1044.Humanoid.Health = 0
                                                    vu1044.HumanoidRootPart.CanCollide = false
                                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                                until not _G.AutoQuestRace or (not vu1044.Parent or vu1044.Humanoid.Health <= 0)
                                            end)
                                        end
                                    end
                                end
                            else
                                Tween(CFrame.new(28654, 14898.7832, - 30, 1, 0, 0, 0, 1, 0, 0, 0, 1))
                            end
                        else
                            local v1045, v1046, v1047 = pairs(game:GetService("Workspace").SeaBeasts.SeaBeast1:GetDescendants())
                            while true do
                                local v1048
                                v1047, v1048 = v1045(v1046, v1047)
                                if v1047 == nil then
                                    break
                                end
                                if v1048.Name == "HumanoidRootPart" then
                                    Tween(v1048.CFrame * Pos)
                                    local v1049, v1050, v1051 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                                    while true do
                                        local v1052
                                        v1051, v1052 = v1049(v1050, v1051)
                                        if v1051 == nil then
                                            break
                                        end
                                        if v1052:IsA("Tool") and v1052.ToolTip == "Melee" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1052)
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    local v1053, v1054, v1055 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                                    while true do
                                        local v1056
                                        v1055, v1056 = v1053(v1054, v1055)
                                        if v1055 == nil then
                                            break
                                        end
                                        if v1056:IsA("Tool") and v1056.ToolTip == "Blox Fruit" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1056)
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait()
                                    local v1057, v1058, v1059 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                                    while true do
                                        local v1060
                                        v1059, v1060 = v1057(v1058, v1059)
                                        if v1059 == nil then
                                            break
                                        end
                                        if v1060:IsA("Tool") and v1060.ToolTip == "Sword" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1060)
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait()
                                    local v1061, v1062, v1063 = pairs(game.Players.LocalPlayer.Backpack:GetChildren())
                                    while true do
                                        local v1064
                                        v1063, v1064 = v1061(v1062, v1063)
                                        if v1063 == nil then
                                            break
                                        end
                                        if v1064:IsA("Tool") and v1064.ToolTip == "Gun" then
                                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v1064)
                                        end
                                    end
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 122, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 120, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    wait(0.2)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(true, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                    game:GetService("VirtualInputManager"):SendKeyEvent(false, 99, false, game.Players.LocalPlayer.Character.HumanoidRootPart)
                                end
                            end
                        end
                    else
                        local v1065, v1066, v1067 = pairs(game:GetService("Workspace").Map.SkyTrial.Model:GetDescendants())
                        while true do
                            local v1068
                            v1067, v1068 = v1065(v1066, v1067)
                            if v1067 == nil then
                                break
                            end
                            if v1068.Name == "snowisland_Cylinder.081" then
                                BTPZ(v1068.CFrame * CFrame.new(0, 0, 0))
                            end
                        end
                    end
                else
                    local v1069, v1070, v1071 = pairs(game.Workspace.Enemies:GetDescendants())
                    while true do
                        local vu1072
                        v1071, vu1072 = v1069(v1070, v1071)
                        if v1071 == nil then
                            break
                        end
                        if vu1072:FindFirstChild("Humanoid") and (vu1072:FindFirstChild("HumanoidRootPart") and vu1072.Humanoid.Health > 0) then
                            pcall(function()
								-- upvalues: (ref) vu1072
                                repeat
                                    wait()
                                    vu1072.Humanoid.Health = 0
                                    vu1072.HumanoidRootPart.CanCollide = false
                                    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
                                until not _G.AutoQuestRace or (not vu1072.Parent or vu1072.Humanoid.Health <= 0)
                            end)
                        end
                    end
                end
            end
        end
    end)
end)
v112.Race:AddToggle("ToggleKillTrial", {
    ["Title"] = "\196\144\225\186\165m Ng\198\176\225\187\157i Ch\198\161i Trong Trial",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1073)
    _G.AutoKillTrial = p1073
end)
v113.ToggleKillTrial:SetValue(false)
spawn(function()
    while wait() do
        pcall(function()
            if _G.AutoKillTrial then
                local v1074, v1075, v1076 = pairs(game:GetService("Players"):GetChildren())
                while true do
                    local v1077
                    v1076, v1077 = v1074(v1075, v1076)
                    if v1076 == nil then
                        break
                    end
                    if v1077.Name and (v1077.Name ~= game.Players.LocalPlayer.Name and ((v1077.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 and v1077.Character.Humanoid.Health > 0)) then
                        repeat
                            wait(_G.Fast_Delay)
                            EquipTool(SelectWeapon)
                            AutoHaki()
                            Tween(v1077.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5))
                            v1077.Character.HumanoidRootPart.CanCollide = false
                            v1077.Character.HumanoidRootPart.Size = Vector3.new(60, 60, 60)
                            AttackNoCoolDown()
                        until not _G.AutoKillTrial or (not v1077.Parent or v1077.Character.Humanoid.Health <= 0)
                    end
                end
            end
        end)
    end
end)
v112.Race:AddSection("Hu\225\186\165n Luy\225\187\135n")
local v1078 = v112.Race:AddToggle("ToggleFarmRace", {
    ["Title"] = "C\195\160y Luy\225\187\135n T\225\187\153c",
    ["Description"] = "",
    ["Default"] = false
})
local vu1079 = false
v1078:OnChanged(function(p1080)
	-- upvalues: (ref) vu1079
    vu1079 = p1080
end)
v113.ToggleFarmRace:SetValue(false)
spawn(function()
	-- upvalues: (ref) vu1079
    while wait() do
        if vu1079 then
            pcall(function()
                if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
                    if game.Players.LocalPlayer.Character.RaceTransformed.Value ~= true then
                        if game.Players.LocalPlayer.Character.RaceTransformed.Value == false then
                            _G.AutoBoneNoQuest = true
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
                            wait()
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, "Y", false, game)
                        end
                    else
                        _G.AutoBoneNoQuest = false
                        Tween(CFrame.new(- 9698.4736328125, 445.09442138671875, 6545.8525390625))
                    end
                end
            end)
        else
            _G.AutoBoneNoQuest = false
        end
    end
end)
v112.Race:AddToggle("ToggleUpgrade", {
    ["Title"] = "Mua Gear",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1081)
    _G.AutoUpgrade = p1081
    if _G.AutoUpgrade then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
    end
end)
v113.ToggleUpgrade:SetValue(false)
v112.Shop:AddSection("Kh\225\186\163 N\196\131ng")
v112.Shop:AddButton({
    ["Title"] = "Nh\225\186\163y",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Haki \196\144\225\186\165m",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Buso")
    end
})
v112.Shop:AddButton({
    ["Title"] = "D\225\187\139ch Chuy\225\187\131n",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Soru")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Haki Quan S\195\161t",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("KenTalk", "Buy")
    end
})
v112.Shop:AddSection("Ki\225\186\191m")
v112.Shop:AddButton({
    ["Title"] = "Cutlass",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Cutlass")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Katana",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Katana")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Iron Mace",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Iron Mace")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Duel Katana",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Duel Katana")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Triple Katana",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Triple Katana")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Pipe",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Pipe")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Dual-Headed Blade",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Dual-Headed Blade")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Bisento",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Bisento")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Soul Cane",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyItem", "Soul Cane")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Pole V2",
    ["Description"] = "",
    ["Callback"] = function()
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ThunderGodTalk")
    end
})
v112.Shop:AddSection("V\195\181")
v112.Shop:AddButton({
    ["Title"] = "Black Leg",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Electro",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Fishman Karate",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Dragon Claw",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Superhuman",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Death Step",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDeathStep")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Sharkman Karate",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Electric Claw",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectricClaw")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Dragon Talon",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyDragonTalon")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Godhuman",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyGodhuman")
    end
})
v112.Shop:AddButton({
    ["Title"] = "Sanguine Art",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySanguineArt")
    end
})
v112.Shop:AddSection("Kh\195\161c")
v112.Shop:AddButton({
    ["Title"] = "\196\144\225\187\149i Ch\225\187\137 S\225\187\145",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Refund", "2")
    end
})
v112.Shop:AddButton({
    ["Title"] = "\196\144\225\187\149i T\225\187\153c",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "1")
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward", "Reroll", "2")
    end
})
v112.Shop:AddButton({
    ["Title"] = "\196\144\225\187\149i T\225\187\153c Ghoul",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            "Ectoplasm",
            "Change",
            4
        }))
    end
})
v112.Shop:AddButton({
    ["Title"] = "\196\144\225\187\149i T\225\187\153c Cyborg",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            "CyborgTrainer",
            "Buy"
        }))
    end
})
v112.Shop:AddButton({
    ["Title"] = "\196\144\225\187\149i T\225\187\153c Draco",
    ["Description"] = "Ch\225\187\137 \225\187\158 Bi\225\187\131n 3",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, - 334.9649963378906))
        Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
        local v1082 = Vector3.new(5814.42724609375, 1208.3267822265625, 884.5785522460938)
        local v1083 = game.Players.LocalPlayer
        local v1084 = v1083.Character
        if not v1084 then
            v1084 = v1083.CharacterAdded:Wait()
        end
        repeat
            wait()
        until (v1084.HumanoidRootPart.Position - v1082).Magnitude < 1
        local v1085 = {
            {
                ["NPC"] = "Dragon Wizard",
                ["Command"] = "DragonRace"
            }
        }
        game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack(v1085))
    end
})
v112.Misc:AddButton({
    ["Title"] = "Tham Gia M\195\161y Ch\225\187\167 L\225\186\161i",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})
v112.Misc:AddButton({
    ["Title"] = "\196\144\225\187\149i M\195\161y Ch\225\187\167",
    ["Description"] = "",
    ["Callback"] = function()
        Hop()
    end
})
function Hop()
	-- upvalues: (ref) vu935
    local vu1086 = game.PlaceId
    local vu1087 = {}
    local vu1088 = ""
    local vu1089 = os.date("!*t").hour
    function TPReturner()
		-- upvalues: (ref) vu1088, (ref) vu1086, (ref) vu1087, (ref) vu1089
        local v1090
        if vu1088 ~= "" then
            v1090 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. vu1086 .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. vu1088))
        else
            v1090 = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. vu1086 .. "/servers/Public?sortOrder=Asc&limit=100"))
        end
        if v1090.nextPageCursor and (v1090.nextPageCursor ~= "null" and v1090.nextPageCursor ~= nil) then
            vu1088 = v1090.nextPageCursor
        end
        local v1091, v1092, v1093 = pairs(v1090.data)
        local v1094 = 0
        while true do
            local v1095
            v1093, v1095 = v1091(v1092, v1093)
            if v1093 == nil then
                break
            end
            local v1096 = true
            local vu1097 = tostring(v1095.id)
            if tonumber(v1095.maxPlayers) > tonumber(v1095.playing) then
                local v1098, v1099, v1100 = pairs(vu1087)
                while true do
                    local v1101
                    v1100, v1101 = v1098(v1099, v1100)
                    if v1100 == nil then
                        break
                    end
                    if v1094 == 0 then
                        if tonumber(vu1089) ~= tonumber(v1101) then
                            pcall(function()
								-- upvalues: (ref) vu1087, (ref) vu1089
                                vu1087 = {}
                                table.insert(vu1087, vu1089)
                            end)
                        end
                    elseif vu1097 == tostring(v1101) then
                        v1096 = false
                    end
                    v1094 = v1094 + 1
                end
                if v1096 == true then
                    table.insert(vu1087, vu1097)
                    wait()
                    pcall(function()
						-- upvalues: (ref) vu1086, (ref) vu1097
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(vu1086, vu1097, game.Players.LocalPlayer)
                    end)
                    wait()
                end
            end
        end
    end
    vu935 = function()
		-- upvalues: (ref) vu1088
        while wait() do
            pcall(function()
				-- upvalues: (ref) vu1088
                TPReturner()
                if vu1088 ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    vu935()
end
v112.Misc:AddSection("\196\144\225\187\153i")
v112.Misc:AddButton({
    ["Title"] = "H\225\186\163i T\225\186\183c",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    end
})
v112.Misc:AddButton({
    ["Title"] = "H\225\186\163i Qu\195\162n",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
    end
})
v112.Misc:AddSection("Kinh Nghi\225\187\135m")
local vu1102 = {
    "KITT_RESET",
    "Sub2UncleKizaru",
    "SUB2GAMERROBOT_RESET1",
    "Sub2Fer999",
    "Enyu_is_Pro",
    "JCWK",
    "StarcodeHEO",
    "MagicBus",
    "KittGaming",
    "Sub2CaptainMaui",
    "Sub2OfficalNoobie",
    "TheGreatAce",
    "Sub2NoobMaster123",
    "Sub2Daigrock",
    "Axiore",
    "StrawHatMaine",
    "TantaiGaming",
    "Bluxxy",
    "SUB2GAMERROBOT_EXP1",
    "Chandler",
    "NOMOREHACK",
    "BANEXPLOIT",
    "WildDares",
    "BossBuild",
    "GetPranked",
    "EARN_FRUITS",
    "FIGHT4FRUIT",
    "NOEXPLOITER",
    "NOOB2ADMIN",
    "CODESLIDE",
    "ADMINHACKED",
    "ADMINDARES",
    "fruitconcepts",
    "krazydares",
    "TRIPLEABUSE",
    "SEATROLLING",
    "24NOADMIN",
    "REWARDFUN",
    "NEWTROLL",
    "fudd10_v2",
    "Fudd10",
    "Bignews",
    "SECRET_ADMIN"
}
v112.Misc:AddButton({
    ["Title"] = "Nh\225\186\173p H\225\186\191t",
    ["Description"] = "",
    ["Callback"] = function()
		-- upvalues: (ref) vu1102
        local v1103, v1104, v1105 = ipairs(vu1102)
        while true do
            local v1106
            v1105, v1106 = v1103(v1104, v1105)
            if v1105 == nil then
                break
            end
            RedeemCode(v1106)
        end
    end
})
function RedeemCode(p1107)
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(p1107)
end
v112.Misc:AddSection("Danh Hi\225\187\135u")
v112.Misc:AddButton({
    ["Title"] = "Danh Hi\225\187\135u",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            "getTitles"
        }))
        game.Players.localPlayer.PlayerGui.Main.Titles.Visible = true
    end
})
v112.Misc:AddSection("Th\225\187\169c T\225\187\137nh")
v112.Misc:AddButton({
    ["Title"] = "Th\225\187\169c T\225\187\137nh",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("Players").LocalPlayer.PlayerGui.Main.AwakeningToggler.Visible = true
    end
})
v112.Misc:AddSection("Kh\195\161c")
v112.Misc:AddToggle("ToggleRejoin", {
    ["Title"] = "Tham Gia M\195\161y Ch\225\187\167 L\225\186\161i",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p1108)
    _G.AutoRejoin = p1108
end)
v113.ToggleRejoin:SetValue(true)
spawn(function()
    while wait() do
        if _G.AutoRejoin then
            getgenv().rejoin = game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(p1109)
                if p1109.Name == "ErrorPrompt" and p1109:FindFirstChild("MessageArea") and p1109.MessageArea:FindFirstChild("ErrorFrame") then
                    game:GetService("TeleportService"):Teleport(game.PlaceId)
                end
            end)
        end
    end
end)
v112.Misc:AddSection("S\198\176\198\161ng")
local function vu1111()
    local v1110 = game:GetService("Lighting")
    if v1110:FindFirstChild("BaseAtmosphere") then
        v1110.BaseAtmosphere:Destroy()
    end
    if v1110:FindFirstChild("SeaTerrorCC") then
        v1110.SeaTerrorCC:Destroy()
    end
    if v1110:FindFirstChild("LightingLayers") then
        if v1110.LightingLayers:FindFirstChild("Atmosphere") then
            v1110.LightingLayers.Atmosphere:Destroy()
        end
        wait()
        if v1110.LightingLayers:FindFirstChild("DarkFog") then
            v1110.LightingLayers.DarkFog:Destroy()
        end
    end
    v1110.FogEnd = 100000
end
v112.Misc:AddButton({
    ["Title"] = "X\195\179a S\198\176\198\161ng M\195\185",
    ["Description"] = "",
    ["Callback"] = function()
		-- upvalues: (ref) vu1111
        vu1111()
    end
})
v112.Misc:AddToggle("ToggleAntiBand", {
    ["Title"] = "Ch\225\187\145ng Band",
    ["Description"] = "",
    ["Default"] = true
}):OnChanged(function(p1112)
    _G.AntiBand = p1112
end)
local vu1113 = {
    17884881,
    120173604,
    912348
}
spawn(function()
	-- upvalues: (ref) vu1113
    while wait() do
        if _G.AntiBand then
            local v1114, v1115, v1116 = pairs(game:GetService("Players"):GetPlayers())
            while true do
                local v1117
                v1116, v1117 = v1114(v1115, v1116)
                if v1116 == nil then
                    break
                end
                if table.find(vu1113, v1117.UserId) then
                    Hop()
                end
            end
        end
    end
end)
v112.Sea:AddSection("Leviathan")
v112.Sea:AddButton({
    ["Title"] = "Mua Chip Leviathan",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "2")
    end
})
local v1118 = v112.Sea:AddToggle("ToggleTPFrozenDimension", {
    ["Title"] = "Bay \196\144\225\186\191n \196\144\225\186\163o Leviathan",
    ["Description"] = "",
    ["Default"] = false
})
v1118:OnChanged(function(p1119)
    _G.TweenToFrozenDimension = p1119
end)
v1118:SetValue(false)
spawn(function()
    local v1120 = nil
    while not v1120 do
        v1120 = game:GetService("Workspace").Map:FindFirstChild("FrozenDimension")
        wait()
    end
    while wait() do
        if _G.TweenToFrozenDimension and v1120 then
            Tween(v1120.CFrame)
        end
    end
end)
if Sea3 then
    local vu1121 = v112.Sea:AddParagraph({
        ["Title"] = "Tr\225\186\161ng Th\195\161i Chip Leviathan",
        ["Content"] = ""
    })
    spawn(function()
		-- upvalues: (ref) vu1121
        pcall(function()
			-- upvalues: (ref) vu1121
            while wait() do
                local v1122 = game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("InfoLeviathan", "1")
                if v1122 == 5 then
                    vu1121:SetDesc("Leviathan Is Out There")
                elseif v1122 == 0 then
                    vu1121:SetDesc("I Don\'t Know")
                else
                    vu1121:SetDesc("Mua: " .. tostring(v1122))
                end
            end
        end)
    end)
end
local v1123 = v112.Sea:AddSection("Draco")
v112.Sea:AddToggle("ToggleBlazeEmber", {
    ["Title"] = "L\225\187\165m L\225\187\173a \196\144\225\187\143",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1124)
    _G.AutoBlazeEmber = p1124
end)
spawn(function()
    while wait() do
        if _G.AutoBlazeEmber then
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/DragonDojoEmber"):FireServer()
            end)
        end
    end
end)
v112.Sea:AddToggle("ToggleReceiveQuest", {
    ["Title"] = "Nh\225\186\173n Nhi\225\187\135m V\225\187\165 L\225\187\173a \196\144\225\187\143",
    ["Description"] = "B\225\186\173t L\195\170n 1 L\225\186\167n L\195\160 Nh\225\186\173n 1 Nh\225\186\173n N\225\187\175a Th\195\172 T\225\186\175t B\225\186\173t L\225\186\161i",
    ["Default"] = false
}):OnChanged(function(p1125)
    _G.AutoReceiveQuest = p1125
    if _G.AutoReceiveQuest then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, - 334.9649963378906))
        Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
        spawn(function()
            pcall(function()
                while wait() do
                    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack({
                        {
                            ["Context"] = "RequestQuest"
                        }
                    }))
                    game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack({
                        {
                            ["Context"] = "Check"
                        }
                    }))
                end
            end)
        end)
    end
end)
local vu1126 = v112.Sea:AddParagraph({
    ["Title"] = "Tr\225\186\161ng Th\195\161i Nhi\225\187\135m V\225\187\165 L\225\187\173a \196\144\225\187\143",
    ["Content"] = ""
})
spawn(function()
	-- upvalues: (ref) vu1126
    pcall(function()
		-- upvalues: (ref) vu1126
        while wait() do
            local v1127 = game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/DragonHunter"):InvokeServer(unpack({
                {
                    ["Context"] = "Check"
                }
            }))
            if typeof(v1127) ~= "table" then
                print(v1127)
            else
                local v1128, v1129, v1130 = pairs(v1127)
                while true do
                    local v1131
                    v1130, v1131 = v1128(v1129, v1130)
                    if v1130 == nil then
                        break
                    end
                    if v1131 == "Defeat 3 Venomous Assailants on Hydra Island." then
                        vu1126:SetDesc("Defeat 3 Venomous Assailants on Hydra Island.")
                    elseif v1131 == "Defeat 3 Hydra Enforcers on Hydra Island." then
                        vu1126:SetDesc("Defeat 3 Hydra Enforcers on Hydra Island.")
                    elseif v1131 == "Destroy 10 trees on Hydra Island." then
                        vu1126:SetDesc("Destroy 10 trees on Hydra Island.")
                    end
                end
            end
        end
    end)
end)
v112.Sea:AddToggle("ToggleHydraTree", {
    ["Title"] = "Ph\195\161 C\195\162y \225\187\158 \196\144\225\186\163o Hydra",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1132)
    _G.AutoHydraTree = p1132
end)
local function vu1135(p1133)
    local v1134 = game:GetService("VirtualInputManager")
    v1134:SendKeyEvent(true, p1133, false, game)
    v1134:SendKeyEvent(false, p1133, false, game)
end
local function vu1147(p1136)
	-- upvalues: (ref) vu1135
    local v1137 = game.Players.LocalPlayer
    local v1138 = v1137.Backpack
    local v1139, v1140, v1141 = pairs(v1138:GetChildren())
    while true do
        local v1142
        v1141, v1142 = v1139(v1140, v1141)
        if v1141 == nil then
            break
        end
        if v1142:IsA("Tool") and v1142.ToolTip == p1136 then
            v1142.Parent = v1137.Character
            local v1143, v1144, v1145 = ipairs({
                "Z",
                "X",
                "C",
                "V",
                "F"
            })
            while true do
                local vu1146
                v1145, vu1146 = v1143(v1144, v1145)
                if v1145 == nil then
                    break
                end
                wait()
                pcall(function()
					-- upvalues: (ref) vu1135, (ref) vu1146
                    vu1135(vu1146)
                end)
            end
            v1142.Parent = v1138
            break
        end
    end
end
local vu1148 = {
    CFrame.new(5288.61962890625, 1005.4000244140625, 392.43011474609375),
    CFrame.new(5343.39453125, 1004.1998901367188, 361.0687561035156),
    CFrame.new(5235.78564453125, 1004.1998901367188, 431.4530944824219),
    CFrame.new(5321.30615234375, 1004.1998901367188, 440.8951416015625),
    CFrame.new(5258.96484375, 1004.1998901367188, 345.5052490234375)
}
spawn(function()
	-- upvalues: (ref) vu1148, (ref) vu1147
    while wait() do
        if _G.AutoHydraTree then
            AutoHaki()
            local v1149, v1150, v1151 = ipairs(vu1148)
            while true do
                local v1152
                v1151, v1152 = v1149(v1150, v1151)
                if v1151 == nil or not _G.AutoHydraTree then
                    break
                end
                Tween2(v1152)
                wait()
                local v1153 = game.Players.LocalPlayer.Character
                if v1153 and (v1153:FindFirstChild("HumanoidRootPart") and (v1153.HumanoidRootPart.Position - v1152.Position).Magnitude <= 1) then
                    vu1147("Melee")
                    vu1147("Sword")
                    vu1147("Gun")
                end
            end
        end
    end
end)
v1123:AddButton({
    ["Title"] = "Bay \196\144\225\186\191n Khu V\225\187\177c Dragon Dojo",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(5661.5322265625, 1013.0907592773438, - 334.9649963378906))
        Tween2(CFrame.new(5814.42724609375, 1208.3267822265625, 884.5785522460938))
    end
})
v1123:AddButton({
    ["Title"] = "Ch\225\186\191 T\225\186\161o Volcanic Magnet",
    ["Description"] = "",
    ["Callback"] = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack({
            "CraftItem",
            "Craft",
            "Volcanic Magnet"
        }))
    end
})
v112.Sea:AddToggle("ToggleCollectFireFlowers", {
    ["Title"] = "L\225\187\165m Hoa \196\144\225\187\143",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1154)
    _G.AutoCollectFireFlowers = p1154
end)
spawn(function()
    while wait() do
        local v1155 = _G.AutoCollectFireFlowers and workspace:FindFirstChild("FireFlowers")
        if v1155 then
            local v1156, v1157, v1158 = pairs(v1155:GetChildren())
            while true do
                local v1159
                v1158, v1159 = v1156(v1157, v1158)
                if v1158 == nil then
                    break
                end
                if v1159:IsA("Model") and v1159.PrimaryPart then
                    local v1160 = v1159.PrimaryPart.Position
                    if (v1160 - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 1 then
                        Tween2(CFrame.new(v1160))
                    else
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        wait(1.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                    end
                end
            end
        end
    end
end)
v112.Sea:AddToggle("ToggleWhiteBelt", {
    ["Title"] = "C\195\160y \196\144ai Tr\225\186\175ng",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1161)
    _G.AutoLevel = p1161
    if p1161 then
        game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({
            {
                ["NPC"] = "Dojo Trainer",
                ["Command"] = "RequestQuest"
            }
        }))
        spawn(function()
            while _G.AutoLevel do
                game:GetService("ReplicatedStorage").Modules.Net:FindFirstChild("RF/InteractDragonQuest"):InvokeServer(unpack({
                    {
                        ["NPC"] = "Dojo Trainer",
                        ["Command"] = "ClaimQuest"
                    }
                }))
                wait()
            end
        end)
    end
end)
v112.Sea:AddParagraph({
    ["Title"] = "Ho\195\160n Th\195\160nh \225\186\162i Draco V4 (S\225\187\155m Ra)",
    ["Content"] = ""
})
v112.Sea:AddToggle("ToggleTrialTeleport", {
    ["Title"] = "Bay \196\144\225\186\191n C\225\187\173a Trial T\225\187\153c Draco",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1162)
    _G.AutoTrialTeleport = p1162
end)
spawn(function()
    while wait() do
        if _G.AutoTrialTeleport then
            local v1163 = workspace.Map.PrehistoricIsland:FindFirstChild("TrialTeleport")
            if v1163 and v1163:IsA("Part") then
                Tween2(CFrame.new(v1163.Position))
            end
        end
    end
end)
v112.Sea:AddSection("\196\144\225\186\163o Dung Nham")
local vu1164 = v112.Sea:AddParagraph({
    ["Title"] = "Tr\225\186\161ng Th\195\161i \196\144\225\186\163o Dung Nham",
    ["Content"] = ""
})
spawn(function()
	-- upvalues: (ref) vu1164
    pcall(function()
		-- upvalues: (ref) vu1164
        while wait() do
            if ggame:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland") then
                vu1164:SetDesc("\196\144\225\186\163o Dung Nham: \226\156\133\239\184\143")
            else
                vu1164:SetDesc("\196\144\225\186\163o Dung Nham: \226\157\140\239\184\143")
            end
        end
    end)
end)
v112.Sea:AddToggle("ToggleTPVolcano", {
    ["Title"] = "Bay \196\144\225\186\191n \196\144\225\186\163o Dung Nham",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1165)
    _G.TweenToPrehistoric = p1165
end)
v113.ToggleTPVolcano:SetValue(false)
spawn(function()
    local v1166 = nil
    while not v1166 do
        v1166 = game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
        wait()
    end
    while wait() do
        local v1167 = _G.TweenToPrehistoric and game:GetService("Workspace").Map:FindFirstChild("PrehistoricIsland")
        if v1167 then
            local v1168 = v1167:FindFirstChild("Core")
            if v1168 then
                v1168 = v1167.Core:FindFirstChild("PrehistoricRelic")
            end
            if v1168 then
                v1168 = v1168:FindFirstChild("Skull")
            end
            if v1168 then
                Tween2(CFrame.new(v1168.Position))
                _G.TweenToPrehistoric = false
            end
        end
    end
end)
v112.Sea:AddToggle("ToggleDefendVolcano", {
    ["Title"] = "Ph\195\178ng Th\225\187\167",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1169)
    _G.AutoDefendVolcano = p1169
end)
v112.Sea:AddToggle("ToggleMelee", {
    ["Title"] = "D\195\185ng Melee",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1170)
    _G.UseMelee = p1170
end)
v112.Sea:AddToggle("ToggleSword", {
    ["Title"] = "D\195\185ng Sword",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1171)
    _G.UseSword = p1171
end)
v112.Sea:AddToggle("ToggleGun", {
    ["Title"] = "D\195\185ng Gun",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1172)
    _G.UseGun = p1172
end)
local function vu1174(p1173)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, p1173, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, p1173, false, game)
end
local function vu1190()
    local v1175 = game.Workspace.Map.PrehistoricIsland.Core:FindFirstChild("InteriorLava")
    if v1175 and v1175:IsA("Model") then
        v1175:Destroy()
    end
    local v1176 = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
    if v1176 then
        local v1177, v1178, v1179 = pairs(v1176:GetDescendants())
        while true do
            local v1180
            v1179, v1180 = v1177(v1178, v1179)
            if v1179 == nil then
                break
            end
            if v1180:IsA("Part") and v1180.Name:lower():find("lava") then
                v1180:Destroy()
            end
        end
    end
    local v1181 = game.Workspace.Map:FindFirstChild("PrehistoricIsland")
    if v1181 then
        local v1182, v1183, v1184 = pairs(v1181:GetDescendants())
        while true do
            local v1185
            v1184, v1185 = v1182(v1183, v1184)
            if v1184 == nil then
                break
            end
            if v1185:IsA("Model") then
                local v1186, v1187, v1188 = pairs(v1185:GetDescendants())
                while true do
                    local v1189
                    v1188, v1189 = v1186(v1187, v1188)
                    if v1188 == nil then
                        break
                    end
                    if v1189:IsA("MeshPart") and v1189.Name:lower():find("lava") then
                        v1189:Destroy()
                    end
                end
            end
        end
    end
end
local function vu1198()
    local v1191 = game.Workspace.Map.PrehistoricIsland.Core.VolcanoRocks
    local v1192, v1193, v1194 = pairs(v1191:GetChildren())
    while true do
        local v1195
        v1194, v1195 = v1192(v1193, v1194)
        if v1194 == nil then
            break
        end
        if v1195:IsA("Model") then
            local v1196 = v1195:FindFirstChild("volcanorock")
            if v1196 and v1196:IsA("MeshPart") then
                local v1197 = v1196.Color
                if v1197 == Color3.fromRGB(185, 53, 56) or v1197 == Color3.fromRGB(185, 53, 57) then
                    return v1196
                end
            end
        end
    end
    return nil
end
local function vu1210(p1199)
	-- upvalues: (ref) vu1174
    local v1200 = game.Players.LocalPlayer
    local v1201 = v1200.Backpack
    local v1202, v1203, v1204 = pairs(v1201:GetChildren())
    while true do
        local v1205
        v1204, v1205 = v1202(v1203, v1204)
        if v1204 == nil then
            break
        end
        if v1205:IsA("Tool") and v1205.ToolTip == p1199 then
            v1205.Parent = v1200.Character
            local v1206, v1207, v1208 = ipairs({
                "Z",
                "X",
                "C",
                "V",
                "F"
            })
            while true do
                local vu1209
                v1208, vu1209 = v1206(v1207, v1208)
                if v1208 == nil then
                    break
                end
                wait()
                pcall(function()
					-- upvalues: (ref) vu1174, (ref) vu1209
                    vu1174(vu1209)
                end)
            end
            v1205.Parent = v1201
            break
        end
    end
end
spawn(function()
	-- upvalues: (ref) vu1190, (ref) vu1198, (ref) vu1210
    while wait() do
        if _G.AutoDefendVolcano then
            AutoHaki()
            pcall(vu1190)
            local v1211 = vu1198()
            if v1211 then
                local v1212 = CFrame.new(v1211.Position + Vector3.new(0, 0, 0))
                Tween2(v1212)
                local v1213 = v1211.Color
                if v1213 == Color3.fromRGB(185, 53, 56) or v1213 == Color3.fromRGB(185, 53, 57) then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v1211.Position - Vector3.new(0, 0, 0)).Magnitude <= 1 then
                        if _G.UseMelee then
                            vu1210("Melee")
                        end
                        if _G.UseSword then
                            vu1210("Sword")
                        end
                        if _G.UseGun then
                            vu1210("Gun")
                        end
                    end
                    _G.TweenToPrehistoric = false
                else
                    vu1198()
                end
            else
                _G.TweenToPrehistoric = true
            end
        end
    end
end)
v112.Sea:AddToggle("ToggleKillAura", {
    ["Title"] = "\196\144\225\186\165m Golems Aura",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1214)
    KillAura = p1214
end)
v113.ToggleKillAura:SetValue(false)
spawn(function()
    while wait() do
        if KillAura then
            pcall(function()
                local v1215, v1216, v1217 = pairs(game.Workspace.Enemies:GetDescendants())
                while true do
                    local v1218
                    v1217, v1218 = v1215(v1216, v1217)
                    if v1217 == nil then
                        break
                    end
                    if v1218:FindFirstChild("Humanoid") and (v1218:FindFirstChild("HumanoidRootPart") and v1218.Humanoid.Health > 0) then
                        repeat
                            task.wait()
                            sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRadius", math.huge)
                            v1218.Humanoid.Health = 0
                            v1218.HumanoidRootPart.CanCollide = false
                        until not KillAura or (not v1218.Parent or v1218.Humanoid.Health <= 0)
                    end
                end
            end)
        end
    end
end)
v112.Sea:AddToggle("ToggleCollectBone", {
    ["Title"] = "L\225\187\165m X\198\176\198\161ng",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1219)
    _G.AutoCollectBone = p1219
end)
spawn(function()
    while wait() do
        if _G.AutoCollectBone then
            local v1220, v1221, v1222 = pairs(workspace:GetDescendants())
            while true do
                local v1223
                v1222, v1223 = v1220(v1221, v1222)
                if v1222 == nil then
                    break
                end
                if v1223:IsA("BasePart") and v1223.Name == "DinoBone" then
                    Tween2(CFrame.new(v1223.Position))
                end
            end
        end
    end
end)
v112.Sea:AddToggle("ToggleCollectEgg", {
    ["Title"] = "L\225\187\165m Tr\225\187\169ng",
    ["Description"] = "",
    ["Default"] = false
}):OnChanged(function(p1224)
    _G.AutoCollectEgg = p1224
end)
spawn(function()
    while wait() do
        if _G.AutoCollectEgg then
            local v1225 = workspace.Map.PrehistoricIsland.Core.SpawnedDragonEggs:GetChildren()
            if # v1225 > 0 then
                local v1226 = v1225[math.random(1, # v1225)]
                if v1226:IsA("Model") and v1226.PrimaryPart then
                    Tween2(v1226.PrimaryPart.CFrame)
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v1226.PrimaryPart.Position).Magnitude <= 1 then
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                        wait(1.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                    end
                end
            end
        end
    end
end)
vu110:Notify({
    ["Title"] = "Maru Hub",
    ["Content"] = "T\225\186\163i Xong",
    ["Duration"] = 10
})