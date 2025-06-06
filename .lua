local source = [[
local ToastNotification = {}
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local function createToast()
    local Toast = Instance.new("ScreenGui")
    Toast.Name = "ToastNotification"
    Toast.ResetOnSpawn = false
    
    local Container = Instance.new("Frame")
    Container.Name = "Container"
    Container.Size = UDim2.new(0, 280, 0, 80)
    Container.Position = UDim2.new(1, 20, 0.8, 0)
    Container.BackgroundTransparency = 0.3
    Container.BackgroundColor3 = Color3.fromRGB(13, 19, 35)
    Container.BorderSizePixel = 0
    Container.Parent = Toast
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Container
    
    local UIGradient = Instance.new("UIGradient")
    UIGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(26, 39, 73)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(13, 19, 35))
    })
    UIGradient.Rotation = 45
    UIGradient.Parent = Container
    
    local Icon = Instance.new("ImageLabel")
    Icon.Name = "Icon"
    Icon.Size = UDim2.new(0, 30, 0, 30)
    Icon.Position = UDim2.new(0, 15, 0, 25)
    Icon.BackgroundTransparency = 1
    Icon.Image = "rbxassetid://108117559791463"
    Icon.ImageColor3 = Color3.fromRGB(255, 255, 255)
    Icon.Parent = Container
    
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Size = UDim2.new(0, 200, 0, 25)
    Title.Position = UDim2.new(0, 60, 0, 15)
    Title.BackgroundTransparency = 1
    Title.Font = Enum.Font.GothamBold
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 20
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = Container
    
    local Description = Instance.new("TextLabel")
    Description.Name = "Description"
    Description.Size = UDim2.new(0, 200, 0, 25)
    Description.Position = UDim2.new(0, 60, 0, 40)
    Description.BackgroundTransparency = 1
    Description.Font = Enum.Font.Gotham
    Description.TextColor3 = Color3.fromRGB(200, 200, 200)
    Description.TextSize = 15
    Description.TextXAlignment = Enum.TextXAlignment.Left
    Description.Parent = Container
    
    return Toast
end

function ToastNotification:Show(title, description, duration)
    duration = duration or 3
    
    local toast = createToast()
    toast.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    
    local container = toast.Container
    container.Title.Text = title
    container.Description.Text = description
    
    local slideIn = TweenService:Create(container, TweenInfo.new(
        0.7,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.Out
    ), {Position = UDim2.new(1, -300, 0.8, 0)})
    
    local slideOut = TweenService:Create(container, TweenInfo.new(
        0.7,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.In
    ), {Position = UDim2.new(1, 20, 0.8, 0)})
    
    slideIn:Play()
    
    task.delay(duration, function()
        slideOut:Play()
        slideOut.Completed:Wait()
        toast:Destroy()
    end)
end

return ToastNotification
]]

local ToastNotification = loadstring(source)()
ToastNotification:Show("Conex", "Conex attached successfully!", 5)
warn("Pandora Loaded.")
