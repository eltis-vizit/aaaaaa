-- Создаем основной ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "gui"
screenGui.ResetOnSpawn = false -- Важное изменение!
screenGui.Parent = game:GetService("CoreGui") -- Или game:GetService("PlayerGui")

-- Защита от удаления
screenGui.Destroying:Connect(function()
    warn("Попытка удалить GUI - восстанавливаю")
    local newGui = screenGui:Clone()
    newGui.Parent = screenGui.Parent
    screenGui = newGui
    setupGUI() -- Нужно будет перенести весь код GUI в функцию setupGUI
end)

-- Остальной код остается таким же, как у вас...
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainScreenGui"
mainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
mainFrame.BorderSizePixel = 0
mainFrame.Position = UDim2.new(0.196, 0, 0.238, 0)
mainFrame.Size = UDim2.new(0, 440, 0, 202)
mainFrame.Parent = screenGui

-- ... (весь остальной ваш код) ...

-- Дополнительно можно добавить защиту через метатаблицу
local protected = {}
protected.__index = protected

function protected:__newindex(k, v)
    rawset(self, k, v)
end

setmetatable(_G, protected)

-- Или более простая защита:
getgenv().screenGui = screenGui
getgenv().mainFrame = mainFrame
