local Lunox = Instance.new("Folder")
local TempScreen = Instance.new("ScreenGui")

local Loading = Instance.new("Frame")
local LoadingTitle = Instance.new("TextLabel")
local Progress = Instance.new("Frame")
local Bar = Instance.new("Frame")
local CurrentResource = Instance.new("TextLabel")

Loading.Name = "Loading"
Loading.Parent = TempScreen
Loading.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
Loading.BorderColor3 = Color3.fromRGB(30, 136, 229)
Loading.Position = UDim2.new(0.5, -170, 0.5, -40)
Loading.Size = UDim2.new(0, 340, 0, 51)

LoadingTitle.Name = "LoadingTitle"
LoadingTitle.Parent = Loading
LoadingTitle.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
LoadingTitle.BorderColor3 = Color3.fromRGB(30, 30, 30)
LoadingTitle.BorderSizePixel = 0
LoadingTitle.Size = UDim2.new(1, 0, 0, 25)
LoadingTitle.Font = Enum.Font.SourceSansLight
LoadingTitle.Text = "Now Loading"
LoadingTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadingTitle.TextSize = 20.000

Progress.Name = "Progress"
Progress.Parent = Loading
Progress.BackgroundColor3 = Color3.fromRGB(11, 52, 88)
Progress.BorderSizePixel = 0
Progress.Position = UDim2.new(0, 0, 1, -5)
Progress.Size = UDim2.new(1, 0, 0, 5)

Bar.Name = "Bar"
Bar.Parent = Progress
Bar.BackgroundColor3 = Color3.fromRGB(30, 136, 229)
Bar.BorderSizePixel = 0
Bar.Size = UDim2.new(0.5, 0, 0, 5)

CurrentResource.Name = "CurrentResource"
CurrentResource.Parent = Loading
CurrentResource.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CurrentResource.BackgroundTransparency = 1.000
CurrentResource.Position = UDim2.new(0, 5, 0, 27)
CurrentResource.Selectable = true
CurrentResource.Size = UDim2.new(1, -5, 0, 21)
CurrentResource.Font = Enum.Font.SourceSans
CurrentResource.Text = "Loading extra UI Controls"
CurrentResource.TextColor3 = Color3.fromRGB(150, 150, 150)
CurrentResource.TextSize = 17.000
CurrentResource.TextXAlignment = Enum.TextXAlignment.Left
CurrentResource.TextYAlignment = Enum.TextYAlignment.Top

--// Services
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local HTTPS = game:GetService("HttpService")

--// Loader
local baseUrl = "https://raw.githubusercontent.com/danisty/legostuff/master/Lunox/"
local modules, modulesInfo = {}, {
	["Library.lua"] = "[UI] Loading library.",
	["EnvironmentEditor.lua"] = "[Tools] Loading Environment Editor."
}

local function require(module)
	local success, rawModule = pcall(function()
		return game:HttpGet(baseUrl .. "/" .. HTTPS:UrlEncode(module))
	end)
	return success and loadstring(rawModule)()
end

local p, s = 1, table.getn(modules)
for module, info in pairs(modules) do
	CurrentResource.Text = info
	TS:Create(Bar, TweenInfo.new(.2, Enum.EasingStyle.Linear), {
		Size=UDim2.new(p/s, 0, 0, 5)
	}):Play()

	modules[module:sub(1, -3)] = require(module)
	p = p + 1
end
TempScreen:Destroy()

local MainWindow = modules.Library:CreateWindow(nil, Lunox)