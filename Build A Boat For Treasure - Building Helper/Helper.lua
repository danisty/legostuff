--[[
	Date of creation: 01/01/2021
	Creator: danisty§#9161
	Original idea: Sten
]]

local BABFTBuildingHelper = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Body = Instance.new("Frame")
local Preview = Instance.new("Frame")
local PreviewTitle = Instance.new("TextButton")
local PreviewViewport = Instance.new("ViewportFrame")
local UICorner = Instance.new("UICorner")
local Player = Instance.new("Frame")
local BuildPreview = Instance.new("TextButton")
local PlayerLayout = Instance.new("UIListLayout")
local PreviewBuilding = Instance.new("TextButton")
local ToggleTools = Instance.new("TextButton")
local Settings = Instance.new("Frame")
local SettingsTitle = Instance.new("TextButton")
local Instructions = Instance.new("Frame")
local TypeSelection = Instance.new("TextButton")
local Selection = Instance.new("TextLabel")
local Down = Instance.new("TextLabel")
local Input = Instance.new("TextBox")
local Options = Instance.new("Frame")
local OptionsLayout = Instance.new("UIListLayout")
local Validation = Instance.new("TextLabel")
local Info = Instance.new("Frame")
local Blocks = Instance.new("TextLabel")
local UIPadding = Instance.new("UIPadding")
local Speed = Instance.new("TextLabel")
local ETA = Instance.new("TextLabel")
local Head = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Shadow = Instance.new("Frame")
local Close = Instance.new("TextButton")
local Minimize = Instance.new("TextButton")
local Outline = Instance.new("Frame")

BABFTBuildingHelper.Name = "BABFT-BuildingHelper"
BABFTBuildingHelper.Parent = game.CoreGui

Main.Name = "Main"
Main.Parent = BABFTBuildingHelper
Main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(1, -443, 0.5, -167)
Main.Size = UDim2.new(0, 438, 0, 335)

Body.Name = "Body"
Body.Parent = Main
Body.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Body.BorderSizePixel = 0
Body.Position = UDim2.new(0, 0, 0, 30)
Body.Size = UDim2.new(1, 0, 1, -30)

Preview.Name = "Preview"
Preview.Parent = Body
Preview.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Preview.BackgroundTransparency = 1
Preview.Size = UDim2.new(0, 170, 0, 190)

PreviewTitle.Name = "PreviewTitle"
PreviewTitle.Parent = Preview
PreviewTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PreviewTitle.BackgroundTransparency = 1
PreviewTitle.Position = UDim2.new(0, 5, 0, 0)
PreviewTitle.Size = UDim2.new(1, -5, 0, 20)
PreviewTitle.Font = Enum.Font.Roboto
PreviewTitle.Text = "Building Preview"
PreviewTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
PreviewTitle.TextSize = 15
PreviewTitle.TextXAlignment = Enum.TextXAlignment.Left
PreviewTitle.TextYAlignment = Enum.TextYAlignment.Bottom

PreviewViewport.Name = "PreviewViewport"
PreviewViewport.Parent = Preview
PreviewViewport.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
PreviewViewport.Position = UDim2.new(0, 5, 0, 25)
PreviewViewport.Size = UDim2.new(0, 160, 0, 160)
PreviewViewport.BorderSizePixel = 0
PreviewViewport.ZIndex = 2

UICorner.Name = "UICorner"
UICorner.CornerRadius = UDim.new(0, 2)

Player.Name = "Player"
Player.Parent = Body
Player.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Player.BackgroundTransparency = 1
Player.Position = UDim2.new(0, 5, 0, 190)
Player.Size = UDim2.new(0, 160, 0, 85)

BuildPreview.Name = "BuildPreview"
BuildPreview.Parent = Player
BuildPreview.BackgroundColor3 = Color3.fromRGB(25, 80, 197)
BuildPreview.BorderSizePixel = 0
BuildPreview.Size = UDim2.new(1, 0, 0, 25)
BuildPreview.Font = Enum.Font.RobotoMono
BuildPreview.Text = "BUILD PREVIEW"
BuildPreview.TextColor3 = Color3.fromRGB(255, 255, 255)
BuildPreview.TextSize = 16

PlayerLayout.Name = "PlayerLayout"
PlayerLayout.Parent = Player
PlayerLayout.SortOrder = Enum.SortOrder.LayoutOrder
PlayerLayout.Padding = UDim.new(0, 5)

PreviewBuilding.Name = "PreviewBuilding"
PreviewBuilding.Parent = Player
PreviewBuilding.BackgroundColor3 = Color3.fromRGB(74, 32, 212)
PreviewBuilding.BorderSizePixel = 0
PreviewBuilding.Size = UDim2.new(1, 0, 0, 25)
PreviewBuilding.Font = Enum.Font.RobotoMono
PreviewBuilding.Text = "PREVIEW BUILDING"
PreviewBuilding.TextColor3 = Color3.fromRGB(255, 255, 255)
PreviewBuilding.TextSize = 16

ToggleTools.Name = "ToggleTools"
ToggleTools.Parent = Player
ToggleTools.BackgroundColor3 = Color3.fromRGB(148, 19, 212)
ToggleTools.BorderSizePixel = 0
ToggleTools.Size = UDim2.new(1, 0, 0, 25)
ToggleTools.Font = Enum.Font.RobotoMono
ToggleTools.Text = "SHOW PREVIEW TOOLS"
ToggleTools.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleTools.TextSize = 16

Settings.Name = "Settings"
Settings.Parent = Body
Settings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Settings.BackgroundTransparency = 1
Settings.Position = UDim2.new(0, 170, 0, 0)
Settings.Size = UDim2.new(1, -170, 1, 0)

SettingsTitle.Name = "SettingsTitle"
SettingsTitle.Parent = Settings
SettingsTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SettingsTitle.BackgroundTransparency = 1
SettingsTitle.Size = UDim2.new(1, -5, 0, 20)
SettingsTitle.Font = Enum.Font.Roboto
SettingsTitle.Text = "Settings"
SettingsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingsTitle.TextSize = 15
SettingsTitle.TextXAlignment = Enum.TextXAlignment.Left
SettingsTitle.TextYAlignment = Enum.TextYAlignment.Bottom

Instructions.Name = "Instructions"
Instructions.Parent = Settings
Instructions.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instructions.BackgroundTransparency = 1
Instructions.Position = UDim2.new(0, 0, 0, 25)
Instructions.Size = UDim2.new(1, 0, 1, -23)

TypeSelection.Name = "TypeSelection"
TypeSelection.Parent = Instructions
TypeSelection.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TypeSelection.BorderColor3 = Color3.fromRGB(80, 80, 80)
TypeSelection.Size = UDim2.new(0, 118, 0, 23)
TypeSelection.ZIndex = 2
TypeSelection.AutoButtonColor = false
TypeSelection.Font = Enum.Font.Roboto
TypeSelection.Text = ""
TypeSelection.TextColor3 = Color3.fromRGB(255, 255, 255)
TypeSelection.TextSize = 14
TypeSelection.TextWrapped = true

Selection.Name = "Selection"
Selection.Parent = TypeSelection
Selection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Selection.BackgroundTransparency = 1
Selection.ClipsDescendants = true
Selection.Position = UDim2.new(0, 5, 0, 0)
Selection.Size = UDim2.new(1, -20, 1, 0)
Selection.ZIndex = 2
Selection.Font = Enum.Font.Roboto
Selection.Text = "Roblox Model Id"
Selection.TextColor3 = Color3.fromRGB(255, 255, 255)
Selection.TextSize = 14
Selection.TextXAlignment = Enum.TextXAlignment.Left

Down.Name = "Down"
Down.Parent = TypeSelection
Down.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Down.BackgroundTransparency = 1
Down.ClipsDescendants = true
Down.Position = UDim2.new(1, -20, 0, 0)
Down.Size = UDim2.new(0, 20, 1, 0)
Down.ZIndex = 2
Down.Font = Enum.Font.Roboto
Down.Text = "▼"
Down.TextColor3 = Color3.fromRGB(255, 255, 255)
Down.TextSize = 10

Input.Name = "Input"
Input.Parent = Instructions
Input.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Input.BorderSizePixel = 0
Input.ClipsDescendants = true
Input.Position = UDim2.new(0, 123, 0, 0)
Input.Size = UDim2.new(0, 118, 0, 23)
Input.ClearTextOnFocus = false
Input.Font = Enum.Font.Roboto
Input.PlaceholderText = "Model Id"
Input.Text = ""
Input.TextColor3 = Color3.fromRGB(255, 255, 255)
Input.TextSize = 14

Options.Name = "Options"
Options.Parent = Instructions
Options.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Options.BackgroundTransparency = 1
Options.Position = UDim2.new(0, 0, 0, 25)
Options.Size = UDim2.new(1, -5, 1, -25)

OptionsLayout.Name = "OptionsLayout"
OptionsLayout.Parent = Options
OptionsLayout.SortOrder = Enum.SortOrder.LayoutOrder

Validation.Name = "Validation"
Validation.Parent = Instructions
Validation.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Validation.BackgroundTransparency = 1
Validation.Position = UDim2.new(1, -25, 0, 0)
Validation.Size = UDim2.new(0, 23, 0, 23)
Validation.Font = Enum.Font.Garamond
Validation.Text = "..."
Validation.TextColor3 = Color3.fromRGB(120, 120, 120)
Validation.TextSize = 25

Info.Name = "Info"
Info.Parent = Body
Info.BackgroundColor3 = Color3.fromRGB(25, 80, 197)
Info.BorderSizePixel = 0
Info.Position = UDim2.new(0, 0, 1, -25)
Info.Size = UDim2.new(1, 0, 0, 25)

Blocks.Name = "Blocks"
Blocks.Parent = Info
Blocks.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Blocks.BackgroundTransparency = 1
Blocks.Size = UDim2.new(0, 52, 1, 0)
Blocks.Font = Enum.Font.Roboto
Blocks.Text = "Blocks: 0"
Blocks.TextColor3 = Color3.fromRGB(255, 255, 255)
Blocks.TextSize = 14
Blocks.TextXAlignment = Enum.TextXAlignment.Left

UIPadding.Parent = Info
UIPadding.PaddingBottom = UDim.new(0, 5)
UIPadding.PaddingLeft = UDim.new(0, 5)
UIPadding.PaddingRight = UDim.new(0, 5)
UIPadding.PaddingTop = UDim.new(0, 5)

Speed.Name = "Speed"
Speed.Parent = Info
Speed.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Speed.BackgroundTransparency = 1
Speed.Position = UDim2.new(0.5, 0, 0, 0)
Speed.Size = UDim2.new(0, 0, 1, 0)
Speed.Font = Enum.Font.Roboto
Speed.Text = "Building Speed: 0b/s"
Speed.TextColor3 = Color3.fromRGB(255, 255, 255)
Speed.TextSize = 14

ETA.Name = "ETA"
ETA.Parent = Info
ETA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ETA.BackgroundTransparency = 1
ETA.Position = UDim2.new(1, 0, 0, 0)
ETA.Size = UDim2.new(0, 0, 1, 0)
ETA.Font = Enum.Font.Roboto
ETA.Text = "ETA: 0s"
ETA.TextColor3 = Color3.fromRGB(255, 255, 255)
ETA.TextSize = 14
ETA.TextXAlignment = Enum.TextXAlignment.Right

Head.Name = "Head"
Head.Parent = Main
Head.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Head.BorderSizePixel = 0
Head.Size = UDim2.new(1, 0, 0, 30)
Head.ZIndex = 2

Title.Name = "Title"
Title.Parent = Head
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0, 30)
Title.ZIndex = 2
Title.Font = Enum.Font.SourceSansSemibold
Title.Text = "BABFT - Building Helper"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 17

Shadow.Name = "Shadow"
Shadow.Parent = Head
Shadow.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Shadow.BorderSizePixel = 0
Shadow.Position = UDim2.new(0, 0, 1, 0)
Shadow.Size = UDim2.new(1, 0, 0, 1)

Close.Name = "Close"
Close.Parent = Head
Close.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(1, -30, 0, 0)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.ZIndex = 2
Close.Font = Enum.Font.Garamond
Close.Text = "✕"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 25

Minimize.Name = "Minimize"
Minimize.Parent = Head
Minimize.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(1, -60, 0, 0)
Minimize.Size = UDim2.new(0, 30, 0, 30)
Minimize.ZIndex = 2
Minimize.Font = Enum.Font.Garamond
Minimize.LineHeight = 1.7000000476837
Minimize.Text = "_"
Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize.TextSize = 25

Outline.Name = "Outline"
Outline.Parent = Main
Outline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Outline.Position = UDim2.new(0, -5, 0, -5)
Outline.Size = UDim2.new(1, 10, 1, 10)
Outline.ZIndex = 0
Outline.Style = Enum.FrameStyle.DropShadow

UICorner:Clone().Parent = PreviewViewport

--[[Custom UI Templates]]
--> CheckBox
local CheckBox = Instance.new("TextButton")
local Check = Instance.new("ImageLabel")

CheckBox.Name = "CheckBox"
CheckBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CheckBox.BackgroundTransparency = 1
CheckBox.Size = UDim2.new(1, 0, 0, 22)
CheckBox.Font = Enum.Font.Roboto
CheckBox.Text = "What are you doing Step bro?"
CheckBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckBox.TextSize = 14
CheckBox.TextXAlignment = Enum.TextXAlignment.Left

Check.Name = "Check"
Check.Parent = CheckBox
Check.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Check.BorderColor3 = Color3.fromRGB(25, 80, 197)
Check.BorderSizePixel = 0
Check.Position = UDim2.new(1, -18, 0, 2)
Check.Size = UDim2.new(0, 18, 0, 18)
Check.Image = "rbxassetid://6082216563"
Check.ImageColor3 = Color3.fromRGB(25, 80, 197)
Check.ImageRectOffset = Vector2.new(48, 0)
Check.ImageRectSize = Vector2.new(48, 48)
Check.ScaleType = Enum.ScaleType.Slice

--> TextInput
local NumInput = Instance.new("Frame")
local NITitle = Instance.new("TextLabel")
local NIInput = Instance.new("TextBox")

NumInput.Name = "TextInput"
NumInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NumInput.BackgroundTransparency = 1
NumInput.Size = UDim2.new(1, 0, 0, 22)

NITitle.Name = "Title"
NITitle.Parent = NumInput
NITitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NITitle.BackgroundTransparency = 1
NITitle.Size = UDim2.new(1, 0, 1, 0)
NITitle.Font = Enum.Font.Roboto
NITitle.Text = "Just Monika"
NITitle.TextColor3 = Color3.fromRGB(255, 255, 255)
NITitle.TextSize = 14
NITitle.TextXAlignment = Enum.TextXAlignment.Left

NIInput.Name = "Input"
NIInput.Parent = NumInput
NIInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
NIInput.BorderSizePixel = 0
NIInput.ClipsDescendants = true
NIInput.Position = UDim2.new(1, -50, 0, 2)
NIInput.Size = UDim2.new(0, 50, 0, 18)
NIInput.ClearTextOnFocus = false
NIInput.Font = Enum.Font.Roboto
NIInput.PlaceholderText = "Sayori"
NIInput.Text = ""
NIInput.BorderColor3 = Color3.fromRGB(25, 80, 197)
NIInput.TextColor3 = Color3.fromRGB(255, 255, 255)
NIInput.TextSize = 14

--> Separation
local Separation = Instance.new("Frame")
Separation.Name = "Separation"
Separation.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Separation.BackgroundTransparency = 1
Separation.Size = UDim2.new(1, 0, 0, 5)

--[[Utilities]]
local Mouse = game.Players.LocalPlayer:GetMouse()
local RS = game:GetService('RunService')
local UIS = game:GetService('UserInputService')
local TS = game:GetService('TweenService')

function makeDraggable(panel, handle)
	local canDrag = false
	local isMouseDown = false
	panel.Active = true
	handle.Active = true
	handle.InputBegan:connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseMovement then
			canDrag = true
		elseif inp.UserInputType == Enum.UserInputType.MouseButton1 then
			isMouseDown = true
			if canDrag then
				local pX = Mouse.X - panel.Position.X.Offset
				local pY = Mouse.Y - panel.Position.Y.Offset
				repeat RS.RenderStepped:wait()
					panel.Position = UDim2.new(panel.Position.X.Scale, Mouse.X - pX, panel.Position.Y.Scale, Mouse.Y - pY)
				until not isMouseDown
			end
		end
	end)
	handle.InputEnded:connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseMovement then
			canDrag = false
		elseif inp.UserInputType == Enum.UserInputType.MouseButton1 then
			isMouseDown = false
		end
	end)
end

local function tableCast(table, cast)
	local ntable = {}
	for i,v in pairs(table) do
		ntable[i] = cast(v)
	end
	return ntable
end

local function getSize(table)
	local size = 0
	for i,v in pairs(table) do
		size += 1
	end
	return size
end

local function module(vector)
	return math.sqrt(vector.X^2 + vector.Y^2 + vector.Z^2)
end

local function fixVec3FloatingDifference(vec3)
	return tostring(vec3):gsub("(%d+)%.%d+(,? ?)", function(g1, g2)
		return g1 .. g2
	end)
end

local function getCornersPositions(part, n)
	local c, s = part.CFrame, part.Size
	local i = c + c.lookVector*(s.Z/2)*n

	local c1 = i + c.rightVector*(s.X/2) + c.upVector*(s.Y/2)
	local c2 = i - c.rightVector*(s.X/2) + c.upVector*(s.Y/2)
	local c3 = i + c.rightVector*(s.X/2) - c.upVector*(s.Y/2)
	local c4 = i - c.rightVector*(s.X/2) - c.upVector*(s.Y/2)

	return c1, c2, c3, c4
end

local function getPartsCFrameAndSize(parts)
	local minx, maxx = math.huge, -math.huge
	local miny, maxy = math.huge, -math.huge
	local minz, maxz = math.huge, -math.huge

	for i,v in pairs(parts) do
		local lv11, lv12, lv13, lv14 = getCornersPositions(v, 1)
		local lv21, lv22, lv23, lv24 = getCornersPositions(v, -1)

		minx = math.min(lv11.X, lv12.X, lv13.X, lv14.X, lv21.X, lv22.X, lv23.X, lv24.X, minx)
		maxx = math.max(lv11.X, lv12.X, lv13.X, lv14.X, lv21.X, lv22.X, lv23.X, lv24.X, maxx)
		miny = math.min(lv11.Y, lv12.Y, lv13.Y, lv14.Y, lv21.Y, lv22.Y, lv23.Y, lv24.Y, miny)
		maxy = math.max(lv11.Y, lv12.Y, lv13.Y, lv14.Y, lv21.Y, lv22.Y, lv23.Y, lv24.Y, maxy)
		minz = math.min(lv11.Z, lv12.Z, lv13.Z, lv14.Z, lv21.Z, lv22.Z, lv23.Z, lv24.Z, minz)
		maxz = math.max(lv11.Z, lv12.Z, lv13.Z, lv14.Z, lv21.Z, lv22.Z, lv23.Z, lv24.Z, maxz)
	end

	local modelSize = Vector3.new(maxx-minx, maxy-miny, maxz-minz)
	local modelPosition = CFrame.new(minx, miny, minz) + modelSize/2
	return modelPosition, modelSize
end

local function addToColor(color, i)
	local r = math.min(color.R*255+i, 255)
	local g = math.min(color.G*255+i, 255)
	local b = math.min(color.B*255+i, 255)
	return Color3.fromRGB(r, g, b)
end

--[[Logic]]
local instructions = {}
local player = game.Players.LocalPlayer
local playerData = player.Data
local isBuilding = false

local usePaintingTool = true
local useScalingTool = true

local fileName = ""
local robloxModelId = 185687363
local usecubesModelId = 0
local validModel = true

local grid = false
local gridSize = 2

local usePTCB;
local useSTCB;
local useGridCB;
local gridSizeInput;

--> Model Tools
local previewModel;
local selectedModel;
local tools = {Move=1, Resize=2, Rotate=3}
local selection = Instance.new("SelectionBox")
local selectionPart = Instance.new("Part")
local selectedTool = tools.Move
local toolsActive = false
local previewPartsCount = 0

selectionPart.Anchored = true
selectionPart.Transparency = 1
selectionPart.CanCollide = false

selection.LineThickness = .1
selection.Adornee = selectionPart
selection.Color3 = Color3.fromRGB(8, 82, 255)
selection.Parent = selectionPart

local ModelTools = Instance.new("Frame")
local Outline = Instance.new("Frame")
local Tools = Instance.new("Frame")
local ToolsLayout = Instance.new("UIListLayout")
local Move = Instance.new("TextButton")
local MoveIcon = Instance.new("ImageLabel")
local Resize = Instance.new("TextButton")
local Rotate = Instance.new("TextButton")
local MIncrement = Instance.new("Frame")
local MOutline = Instance.new("Frame")
local MInput = Instance.new("TextBox")
local MUp = Instance.new("TextButton")
local MDown = Instance.new("TextButton")
local RIncrement = Instance.new("Frame")
local ROutline = Instance.new("Frame")
local RInput = Instance.new("TextBox")
local RUp = Instance.new("TextButton")
local RDown = Instance.new("TextButton")

ModelTools.Name = "ModelTools"
ModelTools.Parent = BABFTBuildingHelper
ModelTools.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ModelTools.BorderSizePixel = 0
ModelTools.Position = UDim2.new(0.5, -90, 1, -140)
ModelTools.Size = UDim2.new(0, 180, 0, 60)
ModelTools.Visible = false

Outline.Name = "Outline"
Outline.Parent = ModelTools
Outline.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Outline.BorderSizePixel = 0
Outline.Position = UDim2.new(0, -5, 0, -5)
Outline.Size = UDim2.new(1, 10, 1, 10)
Outline.ZIndex = 0
Outline.Style = Enum.FrameStyle.DropShadow

Tools.Name = "Tools"
Tools.Parent = ModelTools
Tools.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tools.BackgroundTransparency = 1
Tools.BorderColor3 = Color3.fromRGB(27, 42, 53)
Tools.Size = UDim2.new(1, 0, 1, 0)

ToolsLayout.Name = "ToolsLayout"
ToolsLayout.Parent = Tools
ToolsLayout.FillDirection = Enum.FillDirection.Horizontal
ToolsLayout.SortOrder = Enum.SortOrder.LayoutOrder

Move.Name = "Move"
Move.Parent = Tools
Move.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Move.BorderColor3 = Color3.fromRGB(17, 80, 217)
Move.BorderSizePixel = 0
Move.Size = UDim2.new(0, 60, 0, 60)
Move.Font = Enum.Font.SourceSans
Move.LineHeight = 1.3999999761581
Move.Text = "MOVE"
Move.TextColor3 = Color3.fromRGB(255, 255, 255)
Move.TextSize = 14
Move.TextYAlignment = Enum.TextYAlignment.Bottom

MoveIcon.Name = "Icon"
MoveIcon.Parent = Move
MoveIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MoveIcon.BackgroundTransparency = 1
MoveIcon.Position = UDim2.new(0.5, -12, 0.5, -18)
MoveIcon.Size = UDim2.new(0, 25, 0, 25)
MoveIcon.Image = "rbxassetid://6100326302"

Resize.Name = "Resize"
Resize.Parent = Tools
Resize.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Resize.BorderSizePixel = 0
Resize.Size = UDim2.new(0, 60, 0, 60)
Resize.Font = Enum.Font.SourceSans
Resize.LineHeight = 1.3999999761581
Resize.Text = "RESIZE"
Resize.TextColor3 = Color3.fromRGB(255, 255, 255)
Resize.TextSize = 14
Resize.TextYAlignment = Enum.TextYAlignment.Bottom

local ResizeIcon = MoveIcon:Clone()
ResizeIcon.Parent = Resize
ResizeIcon.Image = "rbxassetid://6100326414"

Rotate.Name = "Rotate"
Rotate.Parent = Tools
Rotate.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Rotate.BorderSizePixel = 0
Rotate.Size = UDim2.new(0, 60, 0, 60)
Rotate.Font = Enum.Font.SourceSans
Rotate.LineHeight = 1.4
Rotate.Text = "ROTATE"
Rotate.TextColor3 = Color3.fromRGB(255, 255, 255)
Rotate.TextSize = 14
Rotate.TextYAlignment = Enum.TextYAlignment.Bottom

local RotateIcon = MoveIcon:Clone()
RotateIcon.Parent = Rotate
RotateIcon.Image = "rbxassetid://6100326494"

MIncrement.Name = "MIncrement"
MIncrement.Parent = ModelTools
MIncrement.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MIncrement.BorderSizePixel = 0
MIncrement.Position = UDim2.new(1, 5, 0.5, 2)
MIncrement.Size = UDim2.new(0, 90, 0.5, -2)

MOutline.Name = "Outline"
MOutline.Parent = MIncrement
MOutline.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MOutline.BorderSizePixel = 0
MOutline.Position = UDim2.new(0, -4, 0, -4)
MOutline.Size = UDim2.new(1, 8, 1, 8)
MOutline.ZIndex = 0
MOutline.Style = Enum.FrameStyle.DropShadow

MInput.Name = "Input"
MInput.Parent = MIncrement
MInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MInput.BackgroundTransparency = 1
MInput.ClipsDescendants = true
MInput.Position = UDim2.new(0, 5, 0, 0)
MInput.Size = UDim2.new(1, -20, 1, 0)
MInput.Font = Enum.Font.SourceSans
MInput.Text = "2 studs"
MInput.ClearTextOnFocus = false
MInput.TextColor3 = Color3.fromRGB(255, 255, 255)
MInput.TextSize = 16
MInput.TextXAlignment = Enum.TextXAlignment.Left

MUp.Name = "Up"
MUp.Parent = MIncrement
MUp.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MUp.BorderSizePixel = 0
MUp.Position = UDim2.new(1, -15, 0, 0)
MUp.Size = UDim2.new(0, 15, 0.5, 0)
MUp.Font = Enum.Font.DenkOne
MUp.Text = "▲"
MUp.TextColor3 = Color3.fromRGB(255, 255, 255)

MDown.Name = "Down"
MDown.Parent = MIncrement
MDown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MDown.BorderSizePixel = 0
MDown.Position = UDim2.new(1, -15, 0.5, 0)
MDown.Size = UDim2.new(0, 15, 0.5, 0)
MDown.Font = Enum.Font.DenkOne
MDown.Text = "▼"
MDown.TextColor3 = Color3.fromRGB(255, 255, 255)

RIncrement.Name = "RIncrement"
RIncrement.Parent = ModelTools
RIncrement.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
RIncrement.BorderSizePixel = 0
RIncrement.Position = UDim2.new(1, 5, 0, 0)
RIncrement.Size = UDim2.new(0, 90, 0.5, -2)

ROutline.Name = "Outline"
ROutline.Parent = RIncrement
ROutline.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ROutline.BorderSizePixel = 0
ROutline.Position = UDim2.new(0, -4, 0, -4)
ROutline.Size = UDim2.new(1, 8, 1, 8)
ROutline.ZIndex = 0
ROutline.Style = Enum.FrameStyle.DropShadow

RInput.Name = "Input"
RInput.Parent = RIncrement
RInput.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RInput.BackgroundTransparency = 1
RInput.ClipsDescendants = true
RInput.Position = UDim2.new(0, 5, 0, 0)
RInput.Size = UDim2.new(1, -20, 1, 0)
RInput.Font = Enum.Font.SourceSans
RInput.Text = "15º"
RInput.TextColor3 = Color3.fromRGB(255, 255, 255)
RInput.TextSize = 16
RInput.ClearTextOnFocus = false
RInput.TextXAlignment = Enum.TextXAlignment.Left

RUp.Name = "Up"
RUp.Parent = RIncrement
RUp.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
RUp.BorderSizePixel = 0
RUp.Position = UDim2.new(1, -15, 0, 0)
RUp.Size = UDim2.new(0, 15, 0.5, 0)
RUp.Font = Enum.Font.DenkOne
RUp.Text = "▲"
RUp.TextColor3 = Color3.fromRGB(255, 255, 255)

RDown.Name = "Down"
RDown.Parent = RIncrement
RDown.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
RDown.BorderSizePixel = 0
RDown.Position = UDim2.new(1, -15, 0.5, 0)
RDown.Size = UDim2.new(0, 15, 0.5, 0)
RDown.Font = Enum.Font.DenkOne
RDown.Text = "▼"
RDown.TextColor3 = Color3.fromRGB(255, 255, 255)

--> Handles
local moveResizeHandles = Instance.new("Handles")
local rotateHandles = Instance.new("ArcHandles")

moveResizeHandles.Parent = BABFTBuildingHelper
moveResizeHandles.Adornee = selectionPart
moveResizeHandles.Visible = false

rotateHandles.Parent = BABFTBuildingHelper
rotateHandles.Adornee = selectionPart
rotateHandles.Visible = false

local originalRotateCF;
rotateHandles.MouseButton1Down:Connect(function()
	originalRotateCF = selectionPart.CFrame
end)

rotateHandles.MouseDrag:Connect(function(axis, relativeAngle)
	local increment = tonumber(RInput.Text:match("[0-9.]+"))*math.pi/180
	local aV = Vector3.fromAxis(axis) * math.floor(relativeAngle/increment)*increment
	selectedModel:SetPrimaryPartCFrame(originalRotateCF * CFrame.Angles(aV.X, aV.Y, aV.Z))
end)

local originalMoveResizeCF, originalResizeSize, originalData, directionVector;
moveResizeHandles.MouseButton1Down:Connect(function(face)
	if selectedTool == tools.Move then
		originalMoveResizeCF = selectionPart.CFrame

		if face == Enum.NormalId.Front or face == Enum.NormalId.Back then
			local d = (face == Enum.NormalId.Front and 1 or -1)
			directionVector = originalMoveResizeCF.lookVector * d
		elseif face == Enum.NormalId.Top or face == Enum.NormalId.Bottom then
			local d = (face == Enum.NormalId.Top and 1 or -1)
			directionVector = originalMoveResizeCF.upVector * d
		elseif face == Enum.NormalId.Right or face == Enum.NormalId.Left then
			local d = (face == Enum.NormalId.Right and 1 or -1)
			directionVector = originalMoveResizeCF.rightVector * d
		end
	else
		local modelCFrame = selectedModel:GetModelCFrame()
		local modelSize = selectedModel:GetExtentsSize()
		originalResizeSize = modelSize

		--> A
		if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then
			originalMoveResizeCF = modelCFrame
		elseif face == Enum.NormalId.Front then
			originalMoveResizeCF = modelCFrame + modelCFrame.lookVector*-(modelSize.Z/2)
		elseif face == Enum.NormalId.Back then
			originalMoveResizeCF = modelCFrame + modelCFrame.lookVector*(modelSize.Z/2)
		elseif face == Enum.NormalId.Bottom then
			originalMoveResizeCF = modelCFrame + modelCFrame.upVector*(modelSize.Y/2)
		elseif face == Enum.NormalId.Top then
			originalMoveResizeCF = modelCFrame + modelCFrame.upVector*-(modelSize.Y/2)
		elseif face == Enum.NormalId.Left then
			originalMoveResizeCF = modelCFrame + modelCFrame.rightVector*(modelSize.X/2)
		elseif face == Enum.NormalId.Right then
			originalMoveResizeCF = modelCFrame + modelCFrame.rightVector*-(modelSize.X/2)
		end

		originalData = {}
		for i,v in pairs(selectedModel:GetDescendants()) do
			if v:IsA("BasePart") then
				table.insert(originalData, {CFrame=v.CFrame, Position=v.Position, Size=v.Size})
			end
		end
	end
end)

moveResizeHandles.MouseDrag:Connect(function(face, distance)
	local increment = tonumber(MInput.Text:match("[0-9.]+"))
	local t = (distance < 0 and math.ceil or math.floor)(distance/increment)*increment
	if selectedTool == tools.Move then
		selectedModel:SetPrimaryPartCFrame(originalMoveResizeCF + directionVector*t)
	else
		local scale = (originalResizeSize.X+t)/originalResizeSize.X
		for i,v in pairs(selectedModel:GetDescendants()) do
			if v:IsA("BasePart") then
				local rotation = originalData[i].CFrame - originalData[i].Position
				local distance = originalData[i].Position - originalMoveResizeCF.p
				v.CFrame = (CFrame.new(originalMoveResizeCF.p + distance * scale) * rotation)
				v.Size = originalData[i].Size * scale
			end
		end
	end
end)

local toolsFuncs;
local function selectTool(tool)
	selectedTool = tool
	Move.BackgroundColor3 = tool==tools.Move and Color3.fromRGB(20, 20, 20) or Color3.fromRGB(30, 30, 30)
	Resize.BackgroundColor3 = tool==tools.Resize and Color3.fromRGB(20, 20, 20) or Color3.fromRGB(30, 30, 30)
	Rotate.BackgroundColor3 = tool==tools.Rotate and Color3.fromRGB(20, 20, 20) or Color3.fromRGB(30, 30, 30)
	toolsFuncs[tool]()
end

local function toolsMove()
	if not toolsActive then return end
	moveResizeHandles.Visible = true
	moveResizeHandles.Color3 = Color3.fromRGB(25, 80, 197)
	moveResizeHandles.Style = Enum.HandlesStyle.Movement
	selection.Color3 = Color3.fromRGB(25, 80, 197)
	rotateHandles.Visible = false
end

local function toolsResize()
	if not toolsActive then return end
	moveResizeHandles.Visible = true
	moveResizeHandles.Color3 = Color3.fromRGB(74, 32, 212)
	moveResizeHandles.Style = Enum.HandlesStyle.Resize
	selection.Color3 = Color3.fromRGB(74, 32, 212)
	rotateHandles.Visible = false
end

local function toolsRotate()
	if not toolsActive then return end
	rotateHandles.Visible = true
	moveResizeHandles.Visible = false
end

toolsFuncs = {
	[tools.Move]=toolsMove,
	[tools.Resize]=toolsResize,
	[tools.Rotate]=toolsRotate
}

local function toggleModelTools(status, customModel, force)
	if isBuilding and not force then return end
	if not previewModel or #previewModel:GetChildren() == 0 then
		return --> A preview is needed, show message.
	end

	ToggleTools.Text = isBuilding and "SHOW PREVIEW TOOLS" or "WAITING FOR PREVIEW"
	while #previewModel:GetChildren() < previewPartsCount do wait() end

	toolsActive = not toolsActive
	if status ~= nil then toolsActive = status end
	local model = customModel or previewModel

	ToggleTools.Text = toolsActive and "HIDE PREVIEW TOOLS" or "SHOW PREVIEW TOOLS"
	ModelTools.Visible = toolsActive

	if toolsActive then
		local cframe, size = getPartsCFrameAndSize(model:GetDescendants())
		selectionPart.CFrame = cframe
		selectionPart.Size = size

		selectedModel = model
		model.PrimaryPart = selectionPart
		selectionPart.Parent = selectedModel
		selection.Visible = true
		selectTool(selectedTool)
	else
		selection.Visible = false
		selectionPart.Parent = nil
		moveResizeHandles.Visible = false
		rotateHandles.Visible = false
	end
end

MInput.Focused:Connect(function()
	MInput.Text = MInput.Text:match("[0-9.]+")
end)

MInput.FocusLost:Connect(function()
	local value = MInput.Text:match("[0-9.]+")
	MInput.Text = (value and math.max(math.min(tonumber(value) or 0, 1024), 0.001) or "2") .. " studs"
end)

RInput.Focused:Connect(function()
	RInput.Text = RInput.Text:match("[0-9.]+")
end)

RInput.FocusLost:Connect(function()
	local value = RInput.Text:match("[0-9.]+")
	RInput.Text = (value and math.max(math.min(tonumber(value) or 0, 180), 1) or "15") .. "º"
end)

Move.MouseButton1Click:Connect(function()selectTool(tools.Move)end)
Resize.MouseButton1Click:Connect(function()selectTool(tools.Resize)end)
Rotate.MouseButton1Click:Connect(function()selectTool(tools.Rotate)end)

--> Game data
local buildingTool;
local paintingTool;
local scalingTool;
--local updateBuildGui;
local func;
local team;

local whiteZone = workspace.WhiteZone
previewModel = Instance.new("Model")
previewModel.Parent = workspace

local viewportCamera = Instance.new("Camera")
local viewportModel = Instance.new("Model")
PreviewViewport.CurrentCamera = viewportCamera
viewportModel.Parent = PreviewViewport

local blocks = 0
local speed = 0
local eta = 0

local function checkGameData()
	if not player.Character then repeat wait() until player.Character end
	buildingTool = player.Character:FindFirstChild("BuildingTool") or player.Backpack.BuildingTool
	paintingTool = player.Character:FindFirstChild("PaintingTool") or player.Backpack:FindFirstChild("PaintingTool")
	scalingTool = player.Character:FindFirstChild("ScalingTool") or player.Backpack:FindFirstChild("ScalingTool")

	--updateBuildGui = getsenv(buildingTool.LocalScript).updateBuildGui
	func = getsenv(player.PlayerGui.ShopGui.MainFrame.TabFrame.QuestFrame.ScrollingFrame.QuestsLS).updateStats
	team = debug.getupvalue(func, 2)
end

local function gridify(parts, customGridSize, ignore)
	if not grid and not ignore then return parts end
	local gridSize = customGridSize or gridSize
	local gridParts = {}
	for i,part in pairs(parts) do
		local cframe = part.CFrame
		local size = part.Size
		local color = part.Color

		local origin = (cframe
			-cframe.rightVector*size.X/2
			-cframe.upVector*size.Y/2
			-cframe.lookVector*size.Z/2)
		for x = 1, (size.X/gridSize < 1 and 1 or math.ceil(size.X/gridSize)) do
			for y = 1, (size.Y/gridSize < 1 and 1 or math.ceil(size.Y/gridSize)) do
				for z = 1, (size.Z/gridSize < 1 and 1 or math.ceil(size.Z/gridSize)) do
					local nPart = Instance.new("Part")
					table.insert(gridParts, nPart)
					nPart.CFrame=(origin 
						+origin.rightVector*((x-1)*gridSize + (x*gridSize>size.X and (size.X-(x-1)*gridSize)/2 or gridSize/2))
						+origin.upVector*((y-1)*gridSize + (y*gridSize>size.Y and (size.Y-(y-1)*gridSize)/2 or gridSize/2))
						+origin.lookVector*((z-1)*gridSize + (z*gridSize>size.Z and (size.Z-(z-1)*gridSize)/2 or gridSize/2))
					)
					nPart.Size=Vector3.new(
						(size.X-x*gridSize<0 and size.X-(x-1)*gridSize or gridSize),
						(size.Y-y*gridSize<0 and size.Y-(y-1)*gridSize or gridSize),
						(size.Z-z*gridSize<0 and size.Z-(z-1)*gridSize or gridSize)
					)
					nPart.Color=color
				end
			end
		end
	end
	return gridParts
end

local function parseInstructions(rawInstructions)
	local instructions = {}
	for classname, cframe, size, color in rawInstructions:gmatch("\/(%w+);([0-9., -e]+);([0-9., -e]+);([0-9., e]+)") do
		local cframe = CFrame.new(unpack(tableCast(cframe:split(","), tonumber)))
		local size = Vector3.new(unpack(tableCast(size:split(","), tonumber)))
		local color = Color3.new(unpack(tableCast(color:split(","), tonumber)))

		table.insert(instructions, {
			ClassName=classname,
			CFrame=cframe,
			Size=size,
			Color=color
		})
	end
	return gridify(instructions)
end

local function getRobloxModelParts(id)
	local parts = {}
	local s, model = pcall(game.GetObjects, game, "rbxassetid://" .. id)
	if s then
		local model = model[1]
		if not (model:IsA("Model") or model:IsA("BasePart") or model:IsA("Tool")) then
			validModel = false
			return parts
		end
		for i,v in pairs(model:GetDescendants()) do
			if v:IsA("BasePart") then
				table.insert(parts, v)
			end
		end
	end

	validModel = s
	return parts
end

local function previewBuildingInViewport(previewParts)
	local modelCFrame, modelSize = getPartsCFrameAndSize(previewParts)
	viewportCamera.CFrame = modelCFrame + modelCFrame.lookVector * -module(modelSize)
	viewportModel:ClearAllChildren()

	for i,v in pairs(previewParts) do
		local part = Instance.new("Part")

		part.Parent = viewportModel
		part.Anchored = true
		part.CFrame = v.CFrame
		part.Size = v.Size
		part.Color = v.Color
		part.Material = Enum.Material.Plastic

		if i%20 == 0 then wait() end
	end
end

local colorTween;
local function toggleBuildPreview(value)
	if colorTween then colorTween:Cancel() end
	isBuilding = not isBuilding
	if value ~= nil then isBuilding = value end

	BuildPreview.Text = isBuilding and "ABORT BUILDING" or "BUILD PREVIEW"
	BuildPreview.BackgroundColor3 = isBuilding and Color3.fromRGB(255, 10, 14) or Color3.fromRGB(25, 80, 197)
end

local function abortBuilding()
	selectionPart.Parent = nil
	previewModel:ClearAllChildren()
	toggleBuildPreview(false)
end

local function updateVisualInfo()
	Blocks.Text = ("Blocks: %d"):format(blocks)
	Speed.Text = ("Building Speed: %db/s"):format(speed)
	ETA.Text = ("ETA: %ds"):format(eta)
end

local partsCallbacks = {}
local connection;
connection = workspace.ChildAdded:Connect(function(child)
	if child.Name:find("Block") and child:WaitForChild("PPart").Size == Vector3.new(2, 2, 2) then
		local vec = fixVec3FloatingDifference(child.PPart.Position)
		local callback = partsCallbacks[vec]
		if callback then
			callback(child.PPart)
			partsCallbacks[vec] = nil
			updateVisualInfo()
		end
	end
end)

local tasks = {}
local tasksIds = {}
local function addPartTask(taskName, callback)
	if partsCallbacks[taskName] == nil then
		task.spawn(callback)
	else
		local partTasks = tasks[taskName]
		if partTasks == nil then
			partTasks = {}
			tasks[taskName] = partTasks
		end

		local taskId = (tasksIds[taskName] or 0) + 1
		tasksIds[taskName] = taskId
		partTasks[taskId] = callback
	end
end

--// Manage tasks
local checkingTasks = {}
task.spawn(function()
	while connection.Connected do
		for taskName,partTasks in pairs(tasks) do
			if partsCallbacks[taskName] == nil and not checkingTasks[taskName] then
				checkingTasks[taskName] = true
				task.spawn(function()
					local taskId, callback = next(partTasks)
					if callback ~= nil then
						callback()
						partTasks[taskId] = nil
					end
					checkingTasks[taskName] = false
				end)
			end
		end
		RS.RenderStepped:Wait()
	end
end)

local function getActualBlocksAmount(blockType)
	local block = playerData:FindFirstChild(blockType)
	return block and block.Value - block.Used.Value or 0
end

local function canSelect(block)
	if block.Name:find("Block") and block.Name ~= "BalloonBlock" then
		return true
	end
	return false
end

local function getNeededBlocks(size)
	return math.max((size.X*size.Y*size.Z)/8, 1)
end

local availableBlocks = {}
local buildingParts = game.ReplicatedStorage.BuildingParts
local blocksFrame = player.PlayerGui.BuildGui.InventoryFrame.ScrollingFrame.BlocksFrame

local function saveBlocks()
	checkGameData()
	availableBlocks = {}
	for i,v in pairs(blocksFrame:GetChildren()) do
		local actualAmount = getActualBlocksAmount(v.Name)
		local block = game.ReplicatedStorage.BuildingParts:FindFirstChild(v.Name)
		if block and canSelect(block) then
			availableBlocks[v.Name] = {
				Type = v.Name,
				Amount = actualAmount,
				Health = block.Health.Value
			}
		end
	end
end

local function checkBlocks(size)
	checkGameData()
	local maxAmount, maxHealth = 0, 0
	local blockType = nil

	for i,blockData in pairs(availableBlocks) do
		if blockData.Health > maxHealth and getNeededBlocks(size) <= math.floor(blockData.Amount) then
			blockType = blockData.Type
			maxAmount = blockData.Amount
			maxHealth = blockData.Health
		end
	end

	return blockType
end

local function splitPart(part, customUsedBlocks)
	local parts = {}
	local usedBlocks = customUsedBlocks or {}
	local function split(p, size)
		local neededBlocks = getNeededBlocks(p.Size)
		for i,blockData in pairs(availableBlocks) do
			local used = usedBlocks[blockData.Type]
			local usedAmount = used or 0
			if math.floor(blockData.Amount - usedAmount) >= neededBlocks then
				usedBlocks[blockData.Type] = usedAmount + neededBlocks
				return table.insert(parts, p) or true
			end
		end

		--> If the needed amount of blocks is 1, you don't have more blocks.
		if neededBlocks == 1 then
			return false
		end

		local s = p.Size
		for i,v in pairs(gridify({p}, math.max(s.X, s.Y, s.Z)/size, true)) do
			local success = split(v, size+1)
			if not success then return false end
		end

		return true
	end
	local success = split(part, 2)
	return success and parts or false
end

local function timer()
	local oldBlocksCount = blocks
	while wait(1) and isBuilding do
		speed = oldBlocksCount - blocks
		eta = math.floor(blocks/math.max(speed, 1))
		oldBlocksCount = blocks
		updateVisualInfo()
	end

	blocks = 0
	speed = 0
	eta = 0

	updateVisualInfo()
end

local function hasEnoughBlocks(previewParts)
	local usedBlocks = {}
	for i,v in pairs(previewParts) do
		if v ~= selectionPart and not splitPart(v, usedBlocks) then
			return false
		end
	end
	return true
end

local lastUsed = 0
local function buildPreview(previewParts)
	saveBlocks()
	if not hasEnoughBlocks(previewParts) then
		print("Not enough blocks")
		return
	end

	local colors = {}
	blocks = #previewParts
	coroutine.wrap(timer)()
	table.sort(previewParts, function(p1, p2)
		return p1.Position.Y < p2.Position.Y
	end)

	for i,v in pairs(previewParts) do
		if v == selectionPart then
			previewParts[i] = nil
			continue
		end
		for _,v in pairs(splitPart(v) or {}) do
			local partBlockType = checkBlocks(v.Size)
			if not isBuilding then break end
			if not partBlockType then abortBuilding() break end
			local relativePosition = team.CFrame:ToObjectSpace(v.CFrame)

			local amount = player.Data[partBlockType].Value
			local vec = fixVec3FloatingDifference(v.CFrame.p)

			addPartTask(vec, function()
				partsCallbacks[vec] = function(part)
					table.insert(colors, {part.Parent, v.Color})
					if scalingTool and useScalingTool and useSTCB.Checked and v.Size ~= Vector3.new(2, 2, 2) then
						scalingTool.RF:InvokeServer(part.Parent, v.Size, v.CFrame)
					end
					if previewParts[i] then
						previewParts[i]:Destroy()
						previewParts[i] = nil
					end
					blocks = blocks - 1
				end
				buildingTool.RF:InvokeServer(partBlockType, amount, team, relativePosition, true, 1, v.CFrame)
			end)

			availableBlocks[partBlockType].Amount = availableBlocks[partBlockType].Amount - getNeededBlocks(v.Size)
			RS.RenderStepped:Wait()
		end
	end

	while blocks > 0 do
		RS.RenderStepped:Wait()
	end

	partTasks = {}
	partsCallbacks = {}

	if paintingTool and usePaintingTool and usePTCB.Checked then
		paintingTool.RF:InvokeServer(colors)
	end
end

local function previewBuilding(force, keepSizeAndPosition)
	if isBuilding and not force then return end
	local toolsActived = toolsActive
	toggleModelTools(false)

	checkGameData()
	local modelParts = getRobloxModelParts(tonumber(robloxModelId))
	local cframe, size = getPartsCFrameAndSize(modelParts)
	local origin = cframe - Vector3.new(0, size.Y/2, 0)
	
	if keepSizeAndPosition then
		local previewMCF, previewMS = getPartsCFrameAndSize(previewModel:GetChildren())
		local scale = previewMS.X / size.X
		origin = previewMCF - Vector3.new(0, previewMS.Y/2, 0)

		for i,v in pairs(modelParts) do
			local rotation = v.CFrame - v.Position
			local distance = v.Position - cframe.p
			v.CFrame = CFrame.new(previewMCF.p + distance * scale) * rotation
			v.Size = v.Size * scale
		end
	else
		for i,v in pairs(modelParts) do
			v.CFrame = v.CFrame - origin.p + team.Position + Vector3.new(0, team.Size.Y/2, 0)
		end
	end
	
	previewPartsCount = #gridify(modelParts)
	previewModel:ClearAllChildren()
	for i,v in pairs(gridify(modelParts)) do
		local part = Instance.new("Part")

		part.Parent = previewModel
		part.Anchored = true
		part.Size = v.Size
		part.CFrame = v.CFrame
		part.Color = v.Color
		part.Transparency = 0.7
		part.Material = Enum.Material.Plastic
		part.CanCollide = false

		if i%20 == 0 then wait() end
	end

	toggleModelTools(toolsActived)
end

--> UI Custom Controls
local function changeCheckBoxState(self, value, callback)
	self.Instance.Check.ImageRectOffset = Vector2.new(value and 48 or 0, 0)
	self.Checked = value
	if callback then
		callback(value)
	end
end

local function createCheckBox(title, initialValue, callback)
	local checkbox = CheckBox:Clone()
	local instance = {Checked=initialValue or false, Instance=checkbox}
	local methods = {}

	checkbox.Parent = Options
	checkbox.Text = title

	checkbox.MouseButton1Click:Connect(function()
		instance:toggle()
	end)

	checkbox.MouseEnter:Connect(function()
		checkbox.Check.BorderSizePixel = 1
	end)

	checkbox.MouseLeave:Connect(function()
		checkbox.Check.BorderSizePixel = 0
	end)

	function methods:toggle()
		changeCheckBoxState(self, not self.Checked, callback)
	end

	function methods:setChecked(value)
		changeCheckBoxState(self, value, callback)
	end

	changeCheckBoxState(instance, instance.Checked)
	return setmetatable(instance, {__index=methods})
end

local function changeNumberInputValue(self, value, callback)
	local nums = {}
	for n in tostring(value):gmatch("%d*[.]?%d*") do
		table.insert(nums, n)
	end
	local nValue = tonumber(table.concat(nums, "")) or 2
	nValue = math.max(nValue, 0.5)
	self.Instance.Input.Text = tostring(nValue)
	self.Value = nValue
	
	if callback then
		callback(nValue)
	end
end

local function createNumberInput(title, defaultValue, placeholder, callback)
	local input = NumInput:Clone()
	local focused = false
	local instance = {Value=defaultValue or "", Instance=input}
	local methods = {}
	
	input.Parent = Options
	input.Title.Text = title
	input.Input.PlaceholderText = placeholder
	
	input.Input.FocusLost:Connect(function()
		input.Input.BorderSizePixel = 0
		instance:setValue(input.Input.Text)
		focused = false
	end)
	
	input.Input.Focused:Connect(function()
		input.Input.BorderSizePixel = 1
		focused = true
	end)
	
	input.Input.MouseEnter:Connect(function()
		input.Input.BorderSizePixel = 1
	end)
	
	input.Input.MouseLeave:Connect(function()
		if focused then return end
		input.Input.BorderSizePixel = 0
	end)
	
	function methods:setValue(value)
		changeNumberInputValue(self, value, callback)
	end
	
	changeNumberInputValue(instance, instance.Value, callback)
	return setmetatable(instance, {__index=methods})
end

local function main()
	Input.Text = tostring(robloxModelId)
	usePTCB = createCheckBox("Use Painting Tool", paintingTool and true or false)
	useSTCB = createCheckBox("Use Scaling Tool", scalingTool and true or false)
	useGridCB = createCheckBox("Use Grid", false, function(value)
		grid = value
		if previewPartsCount > 0 then
			previewBuilding(false, true)
		end
	end)
	gridSizeInput = createNumberInput("Grid Size", gridSize, "", function(value)
		gridSize = value
		if previewPartsCount > 0 and grid then
			previewBuilding(false, true)
		end
	end)
end

BuildPreview.MouseButton1Click:Connect(function()
	checkGameData()
	toggleBuildPreview()
	if not isBuilding then abortBuilding() end
	if #previewModel:GetChildren() == 0 and isBuilding then
		previewBuilding(true)
	end

	BuildPreview.Text = "WAITING FOR PREVIEW"
	while #previewModel:GetChildren() < previewPartsCount do wait() end
	BuildPreview.Text = "ABORT BUILDING"
	previewPartsCount = 0

	task.spawn(function()
		while isBuilding do
			colorTween = TS:Create(BuildPreview, TweenInfo.new(0.4), {BackgroundColor3=Color3.fromRGB(255, 35, 38)})
			colorTween:Play(); colorTween.Completed:Wait(); wait(.1)
			if not isBuilding then break end
			colorTween = TS:Create(BuildPreview, TweenInfo.new(0.4), {BackgroundColor3=Color3.fromRGB(255, 10, 14)})
			colorTween:Play(); colorTween.Completed:Wait(); wait(.1)
		end
	end)

	toggleModelTools(false, nil, true)
	buildPreview(previewModel:GetChildren())
	toggleBuildPreview(false)
end)

PreviewBuilding.MouseButton1Click:Connect(previewBuilding)
ToggleTools.MouseButton1Click:Connect(function()
	toggleModelTools()
end)

local acceptInputs = true
Input.Changed:Connect(function(property)
	if property == "Text" and acceptInputs then
		acceptInputs = false
		local newInput = Input.Text:match("%d+")
		Input.Text = newInput or ""

		if tonumber(newInput) then
			robloxModelId = tonumber(newInput)
			local modelParts = getRobloxModelParts(tonumber(newInput))
			previewBuildingInViewport(modelParts)
		end
		acceptInputs = true
	end
end)

Minimize.MouseButton1Click:Connect(function()
	Body.Visible = not Body.Visible
	Main.Size = UDim2.new(0, 438, 0, Body.Visible and 335 or 30)
end)

Close.MouseButton1Click:Connect(function()
	abortBuilding()
	connection:Disconnect()
	viewportModel:Destroy()
	BABFTBuildingHelper:Destroy()
	selectionPart:Destroy()
	previewModel:Destroy()
end)

checkGameData()
makeDraggable(Main, Head)
main()