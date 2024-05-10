-- Http Requests
local fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local save_manager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local interface_manager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Services
local service = setmetatable(getrawmetatable(newproxy(true)), {
    __index = function(self, key)
        return cloneref(game:GetService(key))
    end
})

local players = service.Players
local runservice = service.RunService
local userinputservice = service.UserInputService
local tweenservice = service.TweenService

-- Variables
local holding, client, settings, camera = false, players.LocalPlayer, {}, workspace:FindFirstChildWhichIsA('Camera')

-- Functions
local get_mouse = function()
    local mouse_pos = UserInputService:GetMouseLocation()

    return Vector2.new(mouse_pos.x, mouse_pos.y)
end

local closest_player = function(fov_radius)
    local highest, closest = fov_radius or math.huge

    for i,v in pairs(players:GetPlayers()) do
        if not (v.Character and v.Character:FindFirstChild('HumanoidRootPart')) then continue end

        local position, on_screen = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
        local magnitude = (get_mouse() - Vector2.new(position.x, position.y)).magnitude
        
        if (magnitude < highest) then
            highest = magnitude
            closest = v
        end
    end

    return closest
end

-- UI
local window = fluent:CreateWindow({Title = fluent.Version, SubTitle = 'hydra hub v3', TabWidth = 160, UDim2.fromOffset(580, 460), Acrylic = true, Theme = "Dark", MinimizeKey = Enum.KeyCode.LeftControl})
local tabs = {
    esp_section = window:AddTab({Title = 'Visuals', Icon = 'egg'}),
    aim_section = window:AddTab({Title = 'Aim', Icon = 'crosshair'}),
    settings_section = window:AddTab({Title = 'Settings', Icon = 'settings'})
}

-- Toggles
tabs.esp_section:AddToggle('ESP', {
    Title = 'Highlight ESP',
    Default = false,

    Callback = function(self)
        settings.highlight_esp = self

        while (settings.highlight_esp and task.wait()) do
            for i, v in pairs(players:GetPlayers()) do
                if (not v.Character) then continue end

                if (v.Character:FindFirstChildWhichIsA('Highlight')) then
                    if (settings.picked_color) then
                        highlighted.FillColor = settings.picked_color
                    end
                else
                    Instance.new('Highlight', v.Character)
                end
            end
        end
    end
})

tabs.esp_section:AddColorpicker('Color Picker', {
    Title = 'Highcolor Color',
    Default = Color3.new(fromRGB(255, 255, 255)),

    Callback = function(self)
        settings.picked_color = self
    end
})

tabs.aim_section:AddDropdown('Aim Parts', {
    Title = 'Aim Part',
    Values = {'Head', 'HumanoidRootPart'},
    Multi = false,
    Default = 1,

    Callback = function(self)
        settings.selected_part = self
    end
})

tabs.aim_section:AddKeybind('Aim Key', {
    Title = 'Aimbot Bind',
    Mode = 'Hold',
    Default = 'MouseRight',

    Callback = function(self)
        settings.aimbot_held = self
    end
})

tabs.aim_section:AddToggle('Aimbot', {
    Title = 'Aimbot',
    Default = false,

    Callback = function(self)
        settings.aim_status = self

        while (settings.aim_status and task.wait()) do
            local player = closest_player()
            local player_character = player and player.Character
            local selected_part = player_character and player_character:FindFirstChild(settings.selected_part or 'Head')

            if (selected_part) then
                tweenservice:Create(camera, TweenInfo.new(0, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(camera.CFrame.Position, selected_part.Position)}):Play
            end
        end
    end
})

save_manager:SetLibrary(fluent)
save_manager:SetLibrary(fluent)
interface_manager:SetLibrary(fluent)
save_manager:IgnoreThemeSettings()