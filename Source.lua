if game.PlaceId == 90607665522400 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RyuuSecretLua/AllScriptHub/refs/heads/main/UhhTest%3F"))()
end
local PlaceId = game.PlaceId

if PlaceId ~= 18334179599 and PlaceId ~= 74395953411817 and PlaceId ~= 18799085098 then return end

local VeloraCityX = loadstring(game:HttpGet("https://raw.githubusercontent.com/RyuuSecretLua/UiLibriariesLuau.com/refs/heads/main/VeloraCityX-1.lua"))()

local Window = VeloraCityX:CreateWindow({
    Title = PlaceId == 18334179599 and "Chained [2 Player Obby]" or PlaceId == 74395953411817 and "Dreamville RP" or "Hide Or Die"
})

local MainTab = Window:AddTab({
    Name = "Main",
    Icon = "house"
})

local CreditsTab = Window:AddTab({
    Name = "Credits",
    Icon = "info"
})

if PlaceId == 18334179599 then
    local Event = game:GetService("ReplicatedStorage").SheepDetectivesRemotes.ClueFound

    MainTab:AddButton({
        Name = "Talk Sheep NPC",
        Callback = function()
            fireproximityprompt(workspace.SmartCharacters.WhiteSheep.HumanoidRootPart.ProximityPrompt)
        end
    })

    MainTab:AddButton({
        Name = "Complete Clues",
        Callback = function()
            for i = 1, 6 do
                Event:FireServer(i)
            end
        end
    })
end

if PlaceId == 74395953411817 then
    local RF = game:GetService("ReplicatedStorage").Packages.Flux.Services.IntegrationService.RF

    MainTab:AddButton({
        Name = "Get Quest",
        Callback = function()
            game:GetService("ReplicatedStorage").Packages.Flux.Services.IntegrationService.RE.ActivateQuest:FireServer()
        end
    })

    MainTab:AddButton({
        Name = "Auto Collect Clue",
        Callback = function()
            local char = game.Players.LocalPlayer.Character
            if not char then return end

            local locations = {
                Vector3.new(-1744.0516357421875, 4.748029708862305, 1198.0550537109375),
                Vector3.new(-1476.527587890625, 4.489880084991455, 1597.2745361328125),
                Vector3.new(-1070.0938720703125, 23.248016357421875, 1394.701171875)
            }

            for _, pos in ipairs(locations) do
                char:PivotTo(CFrame.new(pos))
                task.wait(1)
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("ProximityPrompt") and v.Name == "PromptInteract" then
                        local part = v.Parent
                        if part:IsA("BasePart") and (part.Position - pos).Magnitude < 50 then
                            fireproximityprompt(v)
                        end
                    end
                end
                task.wait(1)
            end
        end
    })

    MainTab:AddButton({
        Name = "Claim UGC",
        Callback = function()
            game:GetService("ReplicatedStorage").Packages.Flux.Services.UgcService.RF.RequestClaim:InvokeServer()
        end
    })
end

if PlaceId == 18799085098 then
    local espLoop

    MainTab:AddButton({
        Name = "Get Quest",
        Callback = function()
            local Event = game:GetService("ReplicatedStorage").SheepDetectives.Assets.Remotes["SC:ChattedWithCharacterEvent"]
            Event:FireServer(game:GetService("Players").LocalPlayer, "Sebastian")
        end
    })

    MainTab:AddToggle({
        Name = "ESP All Player",
        Default = false,
        Callback = function(state)
            if state then
                espLoop = game:GetService("RunService").Heartbeat:Connect(function()
                    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                        if player ~= game:GetService("Players").LocalPlayer and player.Character then
                            local char = player.Character
                            if not char:FindFirstChild("_RyuuESP") then
                                local highlight = Instance.new("Highlight")
                                highlight.Name = "_RyuuESP"
                                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                highlight.FillTransparency = 0.5
                                highlight.OutlineTransparency = 0
                                highlight.Parent = char

                                task.spawn(function()
                                    local t = 0
                                    while highlight and highlight.Parent do
                                        t = t + 0.05
                                        local r = math.abs(math.sin(t))
                                        highlight.FillColor = Color3.fromRGB(0, math.floor(r * 100), 255)
                                        highlight.OutlineColor = Color3.fromRGB(math.floor(r * 120), 0, 255)
                                        task.wait(0.05)
                                    end
                                end)
                            end
                        end
                    end
                end)
            else
                if espLoop then
                    espLoop:Disconnect()
                    espLoop = nil
                end
                for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                    if player.Character then
                        local h = player.Character:FindFirstChild("_RyuuESP")
                        if h then h:Destroy() end
                    end
                end
            end
        end
    })
end

CreditsTab:AddButton({
    Name = "Ryuu Yt",
    Callback = function()
        setclipboard("https://www.youtube.com/@justcallmeryuu")
    end
})

CreditsTab:AddSection({
    Name = "Supporters"
})

CreditsTab:AddButton({
    Name = "Fier Yt",
    Callback = function()
        setclipboard("https://youtube.com/@itsfier?si=VqT_o3OfkRIPV56P")
    end
})

CreditsTab:AddButton({
    Name = "Fier Team",
    Callback = function()
        setclipboard("https://discord.gg/fierteam")
    end
})
if game.PlaceId == 11164179537 then
    
local VeloraCityX = loadstring(game:HttpGet("https://raw.githubusercontent.com/RyuuSecretLua/UiLibriariesLuau.com/refs/heads/main/VeloraCityX-1.lua"))()

local Window = VeloraCityX:CreateWindow({
    Title = "[BETA] Blue Building Detectives (DPA)"
})

local MainTab = Window:AddTab({
    Name = "Main",
    Icon = "house"
})

local CreditsTab = Window:AddTab({
    Name = "Credits",
    Icon = "info"
})

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

pcall(function()
    ReplicatedStorage.Packages:ClearAllChildren()
end)

pcall(function()
    if LocalPlayer.PlayerGui:FindFirstChild("PopupGui") then
        LocalPlayer.PlayerGui.PopupGui:Destroy()
    end
end)

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    local args = {...}
    if (tostring(self) == "AddPopupActive" or tostring(self) == "RemovePopupActive") and args[1] == "RewardGainPopup" then
        return nil
    end
    return old(self, ...)
end)
setreadonly(mt, true)

task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            local gui = LocalPlayer:FindFirstChild("PlayerGui")
            if gui then
                for _, v in pairs(gui:GetDescendants()) do
                    if v.Name == "RewardGainPopup" or v.Name == "PopupFrame" then v:Destroy() end
                end
            end
        end)
    end
end)

local Toggles = {
    InfCoins = false,
    AutoClaimUGC = false,
    AntiAFK = false,
}

local function getHRP()
    local char = LocalPlayer.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

RunService.Heartbeat:Connect(function()
    if not Toggles.InfCoins then return end
    local hrp = getHRP()
    if not hrp then return end
    pcall(function()
        local s1 = workspace.Obby["Porao da Amaranta - Gigante"].Teleportes.Checkpoints.CheckpointStart
        local e1 = workspace.Obby["Porao da Amaranta - Gigante"].Teleportes.TeleportPoint_end
        firetouchinterest(hrp, s1, 0)
        firetouchinterest(hrp, s1, 1)
        firetouchinterest(hrp, e1, 0)
        firetouchinterest(hrp, e1, 1)
    end)
    pcall(function()
        local s2 = workspace.Obby["Clubinho - Gigante"].Teleports.Checkpoints.CheckpointStart
        local e2 = workspace.Obby["Clubinho - Gigante"].Teleports.TeleportPoint_end
        firetouchinterest(hrp, s2, 0)
        firetouchinterest(hrp, s2, 1)
        firetouchinterest(hrp, e2, 0)
        firetouchinterest(hrp, e2, 1)
    end)
    pcall(function()
        local s3 = workspace.Obby["Armazem do Theobaldo - Gigante"].Level.Teleports.Checkpoints.CheckpointStart
        local e3 = workspace.Obby["Armazem do Theobaldo - Gigante"].Level.Teleports.TeleportPoint_end
        firetouchinterest(hrp, s3, 0)
        firetouchinterest(hrp, s3, 1)
        firetouchinterest(hrp, e3, 0)
        firetouchinterest(hrp, e3, 1)
    end)
end)

local function AutoClaimUGCLoop()
    while Toggles.AutoClaimUGC do
        pcall(function()
            local touch = workspace.Building.Npc.NpcSpawnBerenice.Elements.PlatformAction.Base.TouchInterest
            firetouchinterest(touch, 0)
            firetouchinterest(touch, 1)
        end)
        task.wait(0.1)
    end
end

task.spawn(function()
    while true do
        if Toggles.AntiAFK then
            pcall(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end
        task.wait(60)
    end
end)

MainTab:AddToggle({
    Name = "Infinite Coin",
    Default = false,
    Callback = function(state)
        Toggles.InfCoins = state
    end
})

MainTab:AddToggle({
    Name = "Auto Claim UGC",
    Default = false,
    Callback = function(state)
        Toggles.AutoClaimUGC = state
        if state then task.spawn(AutoClaimUGCLoop) end
    end
})

MainTab:AddToggle({
    Name = "Anti AFK",
    Default = false,
    Callback = function(state)
        Toggles.AntiAFK = state
    end
})

CreditsTab:AddButton({
    Name = "Ryuu Yt",
    Callback = function()
        setclipboard("https://www.youtube.com/@lostryuu")
    end
})

CreditsTab:AddSection({
    Name = "Supporters"
})

CreditsTab:AddButton({
    Name = "Fier Yt",
    Callback = function()
        setclipboard("https://youtube.com/@itsfier?si=VqT_o3OfkRIPV56P")
    end
})

CreditsTab:AddButton({
    Name = "Fier Team",
    Callback = function()
        setclipboard("https://discord.gg/fierteam")
    end
})
