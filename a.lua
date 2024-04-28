repeat
    task.wait()
until game:IsLoaded()
getgenv().loaded = false
local a = game:GetService("Players")
local b = game:GetService("ReplicatedStorage")
local c = game:GetService("RunService")
local d = game:GetService("Workspace")
local e = a.LocalPlayer
local f = clonefunction
local g = b.Remotes.ServerCombatHandler
local h = c.Heartbeat
local i = false
local j = f(loadstring)
local k = {"Fishbone", "Frisker", "LostSoul", "Jackal"}
getgenv().Settings = {
    Autofarm = {Toggle = false, Mob = "Fishbone", Position = -10},
    TweenSpeed = 150,
    Fly = {Toggle = false, Speed = 100},
    Speed = {Toggle = false, Speed = 100},
    InfJump = false,
    JumpHeight = 50,
    Autoraid = {Toggle = false},
    Noclip = false
}
function angles(l)
    if l >= 0 then
        return -90
    else
        return 90
    end
end
local m, n, o, p, q, r, s, t
_G.Played = false
function Tween(u, v)
    q = e.Character and e.Character:FindFirstChild("HumanoidRootPart")
    if not q then
        return
    end
    p = q.Position
    o = u.p - p
    n = tick()
    m = (p - u.p).magnitude / getgenv().Settings.TweenSpeed
    if v then
        if v:FindFirstChildWhichIsA("Humanoid") then
            if not _G.Played then
                repeat
                    task.wait()
                    angle = angles(getgenv().Settings.Autofarm.Position)
                    if not i and getgenv().Settings.Autofarm.Toggle then
                        r = tick() - n
                        s = math.min(r / m, 1)
                        t = p + o * s
                        if (q.Position - u.p).magnitude > 25 then
                            q.Velocity = Vector3.new()
                            q.CFrame =
                                CFrame.new(t) * CFrame.new(0, getgenv().Settings.Autofarm.Position, 0) *
                                CFrame.Angles(math.rad(angle), 0, 0)
                            _G.Played = true
                        else
                            q.Velocity = Vector3.new()
                            q.CFrame =
                                CFrame.new(u.p) * CFrame.new(0, getgenv().Settings.Autofarm.Position, 0) *
                                CFrame.Angles(math.rad(angle), 0, 0)
                        end
                    end
                until (q.Position - u.p).magnitude <= 25 or i or not getgenv().Settings.Autofarm.Toggle
                if (q.Position - u.p).magnitude <= 25 then
                    _G.Played = false
                end
            end
        end
    end
    if i then
        _G.Played = false
        i = false
        return
    end
end
local w = game:GetService("TeleportService")
local x
_G.queued = false
_G.Teleporting = false
function autoraid()
    if getgenv().Settings.Autoraid.Toggle then
        if game.PlaceId == 14069678431 then
            x = d.NPCs.RaidBoss.Kisuke
            if x and e.Character and e.Character:FindFirstChild("CharacterHandler") then
                if e.PlayerGui.MissionsUI.MainFrame.Visible then
                    if not e:FindFirstChild("Kisuke") then
                        fireclickdetector(x:FindFirstChildWhichIsA("ClickDetector"))
                    else
                        e.Kisuke:FireServer("Yes")
                        if not _G.queued then
                            queue_on_teleport(
                                [[
									local clonef = clonefunction
									local loading= clonef(loadstring)
									loading(game:HttpGet("https://raw.githubusercontent.com/mac2115/Asteriadebug/main/Asteriaunreleased"))()
									]]
                            )
                            queue_on_teleport(
                                [[
										repeat task.wait() until getgenv().loaded == true
										getgenv().Settings = {
										Autofarm = { Toggle = false, Mob = "Fishbone", Position = -10 },
										TweenSpeed = 150,
										Fly = { Toggle = false, Speed = 100 },
										Speed = { Toggle = false, Speed = 100 },
										InfJump = false,
										JumpHeight = 50,
										Autoraid = { Toggle = true },
										Noclip = false,
									}]]
                            )
                            _G.queued = true
                        end
                    end
                else
                    e.Character.CharacterHandler.Remotes.PartyCreate:FireServer()
                end
            end
        elseif game.PlaceId == 17047374266 then
            for y, z in next, d.Entities:GetChildren() do
                if z.Name ~= e.Name and z:FindFirstChild("Head") then
                    e.Character.HumanoidRootPart.CFrame =
                        z.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                    e.Character.HumanoidRootPart.Velocity = Vector3.new()
                    if e.Character:FindFirstChild("Zanpakuto") then
                        e.Character.CharacterHandler.Remotes.Weapon:FireServer()
                    end
                    g:FireServer("LightAttack")
                    if isnetworkowner(z.HumanoidRootPart) then
                        z.Head:Destroy()
                        task.wait()
                        z.Humanoid.Health = 0
                        e.Character.HumanoidRootPart.CFrame =
                            z.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                        e.Character.HumanoidRootPart.Velocity = Vector3.new()
                    end
                end
            end
            if not _G.queued then
                queue_on_teleport(
                    [[
						local clonef = clonefunction
						local loading= clonef(loadstring)
						loading(game:HttpGet("https://raw.githubusercontent.com/mac2115/Asteriadebug/main/Asteriaunreleased"))()
						]]
                )
                queue_on_teleport(
                    [[
						repeat task.wait() until getgenv().loaded == true
						getgenv().Settings = {
						Autofarm = { Toggle = false, Mob = "Fishbone", Position = -10 },
						TweenSpeed = 150,
						Fly = { Toggle = false, Speed = 100 },
						Speed = { Toggle = false, Speed = 100 },
						InfJump = false,
						JumpHeight = 50,
						Autoraid = { Toggle = true },
						Noclip = false,
					}]]
                )
                _G.queued = true
            end
        else
            if not _G.queued then
                queue_on_teleport(
                    [[
						local clonef = clonefunction
						local loading= clonef(loadstring)
						loading(game:HttpGet("https://raw.githubusercontent.com/mac2115/Asteriadebug/main/Asteriaunreleased"))()
						]]
                )
                queue_on_teleport(
                    [[
						repeat task.wait() until getgenv().loaded == true
						getgenv().Settings = {
						Autofarm = { Toggle = false, Mob = "Fishbone", Position = -10 },
						TweenSpeed = 150,
						Fly = { Toggle = false, Speed = 100 },
						Speed = { Toggle = false, Speed = 100 },
						InfJump = false,
						JumpHeight = 50,
						Autoraid = { Toggle = true },
						Noclip = false,
					}]]
                )
                _G.queued = true
            end
            if e.Character then
                local A = b.Requests.RequestServerList:InvokeServer("Karakura Town")
                b.Requests.RequestCCList:InvokeServer()
                function teleport()
                    local B
                    local C = math.huge
                    if A and not _G.Teleporting then
                        for y, z in next, A do
                            e.Character.CharacterHandler.Remotes.ServerListTeleport:FireServer(
                                "Karakura Town",
                                z["JobID"]
                            )
                            _G.Teleporting = true
                        end
                    end
                end
                teleport()
            end
        end
    end
end
function getmob()
    local C = math.huge
    local v
    if getgenv().Settings.Autofarm.Toggle then
        for y, z in pairs(d.Entities:GetChildren()) do
            if
                string.find(z.Name, getgenv().Settings.Autofarm.Mob) and z.Humanoid.Health > 0 and
                    z:FindFirstChildWhichIsA("Part")
             then
                local D = (e.Character.HumanoidRootPart.Position - z:GetPivot().Position).magnitude
                if D <= C then
                    C = D
                    v = z
                end
            end
        end
        return v
    end
end
function autolootbox()
end
function autofarm()
    local v = getmob()
    if v then
        Tween(v.HumanoidRootPart.CFrame * CFrame.new(0, getgenv().Settings.Autofarm.Position, 0), v)
        if e.Character:FindFirstChild("Zanpakuto") then
            e.Character.CharacterHandler.Remotes.Weapon:FireServer()
        end
        g:FireServer("LightAttack")
    else
        i = true
    end
end
local E = game:GetService("UserInputService")
local F = nil
function speed()
    if e.Character and e.Character:FindFirstChild("HumanoidRootPart") then
        if getgenv().Settings.Speed.Toggle then
            if F == nil then
                F = Instance.new("BodyVelocity")
            end
            F.Name = "Lolywap"
            F.MaxForce = Vector3.new(1000000000, 0, 10000000000)
            F.Parent = e.Character.HumanoidRootPart
            if
                e.Character.Humanoid.MoveDirection.Magnitude ~= 0 and
                    e.Character.Humanoid.MoveDirection ~= Vector3.new(0, 0, 0)
             then
                F.Velocity = e.Character.Humanoid.MoveDirection * getgenv().Settings.Speed.Speed
            else
                F.Velocity = e.Character.Humanoid.MoveDirection
            end
        elseif F ~= nil and not getgenv().Settings.Speed.Toggle then
            F.Parent = nil
        end
    end
end
function infjump()
    if not getgenv().Settings.InfJump then
        return
    end
    if e.Character and e.Character:FindFirstChild("HumanoidRootPart") and E:IsKeyDown(Enum.KeyCode.Space) then
        e.Character.HumanoidRootPart.Velocity =
            Vector3.new(
            e.Character.HumanoidRootPart.Velocity.X,
            getgenv().Settings.JumpHeight,
            e.Character.HumanoidRootPart.Velocity.Z
        )
    end
    task.wait(0.1)
end
getgenv().Control = {left = 0, right = 0, back = 0, forward = 0}
game:GetService("UserInputService").InputBegan:Connect(
    function(G, H)
        if not H then
            if G.KeyCode == Enum.KeyCode.W then
                getgenv().Control.forward = -1
            elseif G.KeyCode == Enum.KeyCode.S then
                getgenv().Control.back = 1
            elseif G.KeyCode == Enum.KeyCode.A then
                getgenv().Control.left = -1
            elseif G.KeyCode == Enum.KeyCode.D then
                getgenv().Control.right = 1
            end
        end
    end
)
game:GetService("UserInputService").InputEnded:Connect(
    function(G, H)
        if not H then
            if G.KeyCode == Enum.KeyCode.W then
                getgenv().Control.forward = 0
            elseif G.KeyCode == Enum.KeyCode.S then
                getgenv().Control.back = 0
            elseif G.KeyCode == Enum.KeyCode.A then
                getgenv().Control.left = 0
            elseif G.KeyCode == Enum.KeyCode.D then
                getgenv().Control.right = 0
            end
        end
    end
)
function getvector()
    return Vector3.new(
        getgenv().Control.left + getgenv().Control.right,
        0,
        getgenv().Control.forward + getgenv().Control.back
    )
end
local I = nil
local J = d.CurrentCamera
function fly()
    if getgenv().Settings.Fly.Toggle == true then
        if I == nil then
            I = Instance.new("BodyVelocity")
        end
        I.Name = "Flylolwap"
        I.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        I.Parent = e.Character.HumanoidRootPart
        if
            getgenv().Control.left == -1 or getgenv().Control.right == 1 or getgenv().Control.back == 1 or
                getgenv().Control.forward == -1
         then
            if I ~= nil then
                I.Velocity = J.CFrame:VectorToWorldSpace(getvector() * getgenv().Settings.Fly.Speed)
            else
                return
            end
        else
            if I ~= nil then
                I.Velocity = J.CFrame:VectorToWorldSpace(getvector())
            else
                return
            end
        end
    else
        if e.Character and e.Character:FindFirstChild("HumanoidRootPart") and I then
            I.Parent = nil
        end
    end
end
function noclip()
    if getgenv().Settings.Noclip then
        if e.Character then
            for y, z in next, e.Character:GetChildren() do
                if z:IsA("Part") and not string.find(z.Name, "Leg") then
                    z.CanCollide = false
                end
            end
        end
    else
        if e.Character then
            for y, z in next, e.Character:GetChildren() do
                if z:IsA("Part") and not string.find(z.Name, "Leg") then
                    z.CanCollide = true
                end
            end
        end
    end
end
function getfunc()
    for y, z in pairs(getgc()) do
        if type(z) == "function" and debug.info(z, "l") == 2242 and string.find(debug.info(z, "s"), "ClientHandler") then
            return z
        end
    end
end
function exchange()
    local K = getfunc()
    local L = getupvalues(K)[2][1]["ItemName"]
    if K and L then
        local M = {
            [1] = {["ID"] = "d", ["ItemName"] = L, ["Rarity"] = "Legendary"},
            [2] = {["ID"] = "", ["ItemName"] = L, ["Rarity"] = "Legendary"},
            [3] = {["ID"] = "", ["ItemName"] = L, ["Rarity"] = "Legendary"},
            [4] = {["ID"] = "", ["ItemName"] = L, ["Rarity"] = "Legendary"},
            [5] = {["ID"] = "", ["ItemName"] = L, ["Rarity"] = "Legendary"},
            [6] = {["ID"] = "", ["ItemName"] = L, ["Rarity"] = "Legendary"},
            [7] = {["ID"] = "", ["ItemName"] = L, ["Rarity"] = "Legendary"},
            [8] = {["ID"] = "", ["ItemName"] = L, ["Rarity"] = "Legendary"},
            [9] = {["ID"] = "", ["ItemName"] = L, ["Rarity"] = "Legendary"},
            [10] = {["ID"] = "", ["ItemName"] = L, ["Rarity"] = "Legendary"}
        }
        e.PlayerGui["EXECHANGE ITEM"].RemoteEvent:FireServer(M)
    end
end
local N = "https://raw.githubusercontent.com/HTDBarsi/LinoriaLib/main/"
local O = j(game:HttpGet(N .. "Library.lua"))()
local P = j(game:HttpGet(N .. "addons/ThemeManager.lua"))()
local Q = j(game:HttpGet(N .. "addons/SaveManager.lua"))()
local R =
    O:CreateWindow({Title = "Pro Type Soul script by lucii", Center = true, AutoShow = true, TabPadding = 8, MenuFadeTime = 0.2})
local S = {Main = R:AddTab("Main"), Misc = R:AddTab("Misc"), ["UI Settings"] = R:AddTab("UI Settings")}
local T = S.Main:AddLeftGroupbox("Main")
local U =
    T:AddButton(
    {Text = "Exchange helper lol", Func = function()
            exchange()
        end, DoubleClick = false, Tooltip = "Click it only if you already have put an item inside of the box "}
)
T:AddToggle(
    "MyToggle",
    {Text = "Autoraid toggle", Default = false, Tooltip = "", Callback = function(V)
            _G.Teleporting = false
            getgenv().Settings.Autoraid.Toggle = V
        end}
)
T:AddToggle(
    "MyToggle",
    {Text = "Autofarm toggle", Default = false, Tooltip = "", Callback = function(V)
            getgenv().Settings.Autofarm.Toggle = V
        end}
)
T:AddDropdown(
    "MyDropdown",
    {Values = k, Default = 1, Multi = false, Text = "NPCS Teleports", Tooltip = "", Callback = function(V)
            getgenv().Settings.Autofarm.Mob = V
        end}
)
T:AddSlider(
    "MySlider",
    {Text = "Farm position", Default = -10, Min = -25, Max = 25, Rounding = 0, Compact = false, Callback = function(V)
            getgenv().Settings.Autofarm.Position = V
        end}
)
T:AddSlider(
    "MySlider",
    {Text = "Tween Speed", Default = 150, Min = 0, Max = 350, Rounding = 0, Compact = false, Callback = function(V)
            getgenv().Settings.TweenSpeed = V
        end}
)
local T = S.Misc:AddLeftGroupbox("Movement")
T:AddToggle(
    "MyToggle",
    {Text = "Fly toggle", Default = false, Tooltip = "", Callback = function(V)
            getgenv().Settings.Fly.Toggle = V
        end}
)
T:AddSlider(
    "MySlider",
    {Text = "Speed", Default = 50, Min = 0, Max = 250, Rounding = 0, Compact = false, Callback = function(V)
            getgenv().Settings.Fly.Speed = V
        end}
)
T:AddToggle(
    "MyToggle",
    {Text = "Noclip toggle", Default = false, Tooltip = "", Callback = function(V)
            getgenv().Settings.Noclip = V
        end}
)
T:AddToggle(
    "MyToggle",
    {Text = "Infinite jump toggle", Default = false, Tooltip = "", Callback = function(V)
            getgenv().Settings.InfJump = V
        end}
)
T:AddToggle(
    "MyToggle",
    {Text = "Speed toggle", Default = false, Tooltip = "", Callback = function(V)
            getgenv().Settings.Speed.Toggle = V
        end}
)
T:AddSlider(
    "MySlider",
    {Text = "Speed", Default = 50, Min = 0, Max = 250, Rounding = 0, Compact = false, Callback = function(V)
            getgenv().Settings.Speed.Speed = V
        end}
)
O:SetWatermarkVisibility(false)
local W = tick()
local X = 0
local Y = 60
local Z =
    game:GetService("RunService").RenderStepped:Connect(
    function()
        X = X + 1
        if tick() - W >= 1 then
            Y = X
            W = tick()
            X = 0
        end
        O:SetWatermark(
            ("Lucii.lol beta | %s fps | %s ms"):format(
                math.floor(Y),
                math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
            )
        )
    end
)
O.KeybindFrame.Visible = false
O:OnUnload(
    function()
        Z:Disconnect()
        getgenv().Settings = {
            Autofarm = {Toggle = false, Mob = "Fishbone", Position = -10},
            TweenSpeed = 150,
            Fly = {Toggle = false, Speed = 100},
            Speed = {Toggle = false, Speed = 100},
            InfJump = false,
            JumpHeight = 50,
            Autoraid = {Toggle = false},
            Noclip = false
        }
        print("Unloaded!")
        O.Unloaded = true
    end
)
local _ = S["UI Settings"]:AddLeftGroupbox("Menu")
local a0 =
    _:AddButton(
    {Text = "Copy discord link", Func = function()
            setclipboard("discord.gg/t2cXFpkGBh")
        end, DoubleClick = false, Tooltip = ""}
)
_:AddToggle(
    "MyToggle",
    {Text = "Keybinds toggle", Default = false, Tooltip = "", Callback = function(V)
            O.KeybindFrame.Visible = V
        end}
)
_:AddButton(
    "Unload",
    function()
        O:Unload()
    end
)
_:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {Default = "End", NoUI = true, Text = "Menu keybind"})
O.ToggleKeybind = Options.MenuKeybind
P:SetLibrary(O)
Q:SetLibrary(O)
Q:IgnoreThemeSettings()
Q:SetIgnoreIndexes({"MenuKeybind"})
P:SetFolder("Lucii.lol")
Q:SetFolder("Lucii.lol/TypeSoul")
Q:BuildConfigSection(S["UI Settings"])
P:ApplyToTab(S["UI Settings"])
Q:LoadAutoloadConfig()
task.spawn(
    function()
        c.RenderStepped:Connect(
            function()
                fly()
                speed()
                noclip()
                infjump()
                autofarm()
            end
        )
    end
)
task.spawn(
    function()
        c.Heartbeat:Connect(
            function()
                autoraid()
            end
        )
    end
)
getgenv().loaded = true
