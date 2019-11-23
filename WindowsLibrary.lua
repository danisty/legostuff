--> Gui Stuff
local WindowScreen = Instance.new("ScreenGui")
local Window = Instance.new("Frame")
local WindowIcon = Instance.new("ImageLabel")
local WindowTitle = Instance.new("TextLabel")
local Body = Instance.new("ScrollingFrame")
local BodyBorder = Instance.new("Frame")
local ShadowL1 = Instance.new("Frame")
local ShadowL2 = Instance.new("Frame")

local UIColors = {
	PrimaryColor = Color3.fromRGB(25, 25, 25),
	SecondaryColor = Color3.fromRGB(35, 35, 35)	
}

WindowScreen.Name = "ScriptSpy"
WindowScreen.ResetOnSpawn = false

Window.Name = "Window"
Window.Parent = WindowScreen
Window.BackgroundColor3 = UIColors.PrimaryColor
Window.BorderColor3 = Color3.new(0, 0, 0)
Window.BorderSizePixel = 0
Window.Position = UDim2.new(0, 500, 0, 100)
Window.Size = UDim2.new(0, 500, 0, 24)
Window.ZIndex = 2

WindowIcon.Name = "WindowIcon"
WindowIcon.Parent = Window
WindowIcon.BackgroundColor3 = Color3.new(1, 1, 1)
WindowIcon.BackgroundTransparency = 1
WindowIcon.Position = UDim2.new(0, 4, 0, 0)
WindowIcon.Size = UDim2.new(0, 22, 0, 24)
WindowIcon.ZIndex = 2
WindowIcon.Image = "rbxassetid://4146941292"
WindowIcon.ScaleType = Enum.ScaleType.Fit

WindowTitle.Name = "WindowTitle"
WindowTitle.Parent = Window
WindowTitle.BackgroundColor3 = Color3.new(1, 1, 1)
WindowTitle.BackgroundTransparency = 1
WindowTitle.BorderSizePixel = 0
WindowTitle.Position = UDim2.new(0, 30, 0, 0)
WindowTitle.Size = UDim2.new(0, 54, 0, 24)
WindowTitle.ZIndex = 2
WindowTitle.Font = Enum.Font.SourceSans
WindowTitle.Text = "ScriptSpy"
WindowTitle.TextColor3 = Color3.new(1, 1, 1)
WindowTitle.TextSize = 15
WindowTitle.TextXAlignment = Enum.TextXAlignment.Left

Body.Name = "Body"
Body.Active = true
Body.Parent = Window
Body.BackgroundColor3 = UIColors.SecondaryColor
Body.BorderColor3 = Color3.new(0.117647, 0.117647, 0.117647)
Body.BorderSizePixel = 0
Body.CanvasSize = UDim2.new(0,0,0,0)
Body.Position = UDim2.new(0, 0, 0, 24)
Body.Size = UDim2.new(0, 700, 0, 342)

BodyBorder.Name = "BodyBorder"
BodyBorder.Parent = Window
BodyBorder.BackgroundColor3 = UIColors.SecondaryColor
BodyBorder.BorderColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
BodyBorder.Position = UDim2.new(0, 0, 0, 0)
BodyBorder.Size = UDim2.new(0, 500, 0, 313)
BodyBorder.ZIndex = 0

ShadowL1.Name = "ShadowL1"
ShadowL1.BackgroundColor3 = Color3.new(0, 0, 0)
ShadowL1.BackgroundTransparency = 0.8
ShadowL1.BorderSizePixel = 0
ShadowL1.Position = UDim2.new(0, -2, 0, -2)
ShadowL1.Size = UDim2.new(0, 504, 0, 317)
ShadowL1.ZIndex = 0

ShadowL2.Name = "ShadowL2"
ShadowL2.BackgroundColor3 = Color3.new(0, 0, 0)
ShadowL2.BackgroundTransparency = 0.9
ShadowL2.BorderSizePixel = 0
ShadowL2.Position = UDim2.new(0, -4, 0, -4)
ShadowL2.Size = UDim2.new(0, 508, 0, 321)
ShadowL2.ZIndex = 0

--> Functions && Stuff
local TS = game:GetService('TweenService')
local Mouse = game.Players.LocalPlayer:GetMouse()
local UIS = game:GetService('UserInputService')
local Derbis = game:GetService("Debris")
local RS = game:GetService('RunService')
function MakeDraggable(panel, handle)
	local canDrag = false
	panel.Active = true
	handle.Active = true
	handle.InputBegan:connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseMovement then
			canDrag = true
		elseif inp.UserInputType == Enum.UserInputType.MouseButton1 then
			if canDrag then
				local pX = Mouse.X - panel.Position.X.Offset
				local pY = Mouse.Y - panel.Position.Y.Offset
				repeat RS.RenderStepped:wait()
					panel.Position = UDim2.new(panel.Position.X.Scale, Mouse.X - pX, panel.Position.Y.Scale, Mouse.Y - pY)
				until not UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
			end
		end
	end)
	handle.InputEnded:connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseMovement then
			canDrag = false
		end
	end)
end

function AddShadow(gObj, size, cZIndex)
	local Shadow1 = ShadowL1:Clone()
	local Shadow2 = ShadowL2:Clone()
	Shadow1.Parent = gObj
	Shadow1.ZIndex = cZIndex or 1
	Shadow1.Position = UDim2.new(0, -size, 0, -size)
	Shadow1.Size = gObj.Size + UDim2.new(0, size*2, 0, size*2)
	Shadow2.Parent = gObj
	Shadow2.ZIndex = cZIndex or 1
	Shadow2.Position = UDim2.new(0, -size*2, 0, -size*2)
	Shadow2.Size = gObj.Size + UDim2.new(0, size*4, 0, size*4)
	gObj.Changed:connect(function()
		Shadow1.Size = gObj.Size + UDim2.new(0, size*2, 0, size*2)
		Shadow2.Size = gObj.Size + UDim2.new(0, size*4, 0, size*4)
	end)
	
	if cZIndex then return end
	gObj.ZIndex = gObj.ZIndex+1
	for i,v in next, gObj:GetDescendants()do
		v.ZIndex = v.ZIndex+1
	end
end

local tweenData = {}
function Tween(guiObject, props, tm)
	local ind = 0
	for i,v in next, tweenData do
		ind = ind+1
		if i == guiObject then
			v:Cancel()
			table.remove(tweenData, ind)
		end
	end
	local info = TweenInfo.new(tm, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, 0, false, 0)
	local tween = TS:Create(guiObject, info, props)
	tweenData[guiObject] = tween
	tween:Play()
	Derbis:AddItem(tween, tm+1)
	return tween
end

local function CreateTabControl(windowInfo, name, info, width, inColor, outColor, imgInColor, imgOutColor, clickColor, imgClickColor, connection)
	local button = typeof(info) == "number" and Instance.new("ImageButton") or Instance.new("TextButton")
	button.Size = UDim2.new(0, width, 0, 24)
	button.Position = UDim2.new(0, windowInfo.window.Size.X.Offset-width, 0, 0)
	button.BackgroundColor3 = outColor
	button.BorderSizePixel = 0
	button.Parent = windowInfo.window
	button.ZIndex = 3
	button.Name = name
	if button:IsA("ImageButton")then
		button.ScaleType = Enum.ScaleType.Fit
		button.AutoButtonColor = false
		button.Image = "rbxassetid://"..info
	else
		button.Text = info
	end
	
	--connections
	AddHovering(button, inColor, outColor, imgInColor, imgOutColor, clickColor, imgClickColor, 0.05, 0.25)
	button.MouseButton1Click:connect(function()
		connection(button)
		local leave = button:IsA("ImageButton") and {BackgroundColor3 = outColor, ImageColor3 = imgOutColor} or {BackgroundColor3 = outColor, TextColor3 = imgOutColor}
		Tween(button, leave, 0.25)
	end)
	table.insert(windowInfo.TabControls, button)
	windowInfo:UpdateTabControls()
	return button
end

function AddHovering(button, inColor, outColor, scnInColor, scnOutColor, clickColor, scnClickColor, inTime, outTime)
	button.AutoButtonColor = false
	local enter = button:IsA("ImageButton") and {BackgroundColor3 = inColor, ImageColor3 = scnInColor} or {BackgroundColor3 = inColor , TextColor3 = scnInColor}
	local leave = button:IsA("ImageButton") and {BackgroundColor3 = outColor, ImageColor3 = scnOutColor} or {BackgroundColor3 = outColor, TextColor3 = scnOutColor}
	local click = button:IsA("ImageButton") and {BackgroundColor3 = clickColor, ImageColor3 = scnClickColor} or {BackgroundColor3 = clickColor, TextColor3 = scnClickColor}
	local isMouseIn = false
	local isMouseDown = false
	button.MouseEnter:connect(function()
		isMouseIn = true
		if not UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then isMouseDown = false end
		Tween(button, isMouseDown and click or enter, isMouseDown and 0 or inTime)
	end)
	button.MouseLeave:connect(function()
		isMouseIn = false
		Tween(button, leave, isMouseDown and 0 or outTime)
	end)
	button.MouseButton1Down:connect(function()
		isMouseDown = true
		Tween(button, click, 0)
	end)
	button.MouseButton1Up:connect(function()
		isMouseDown = false
		Tween(button, isMouseIn and enter or leave, 0)
	end)
	Tween(button, leave, isMouseDown and 0 or outTime)
end

function LoadVisuals(window)
	AddShadow(window.BodyBorder, 2, 0)
	MakeDraggable(window, window)
end

local WindowProps = {}
function WindowProps:UpdateTabControls()
	local window = self.window
	local X = window.Size.X.Offset
	for i,v in next, self.TabControls do
		if X ~= window.Size.X.Offset then X = X - 2 end
		X = X - v.Size.X.Offset
		v.Position = UDim2.new(0, X, 0, v.Position.Y.Offset)
	end
end
function WindowProps:UpdateUI()
	local window = self.window
	if not self.closing then window.Size = UDim2.new(0, window.Body.Size.X.Offset, 0, 24)end
	window.BodyBorder.Size = UDim2.new(0, window.Size.X.Offset, 0, self.closing and window.Size.Y.Offset or window.Body.Size.Y.Offset + 24)
	window.WindowIcon.Size = UDim2.new(0, window.WindowIcon.Size.X.Offset, 0, window.Size.Y.Offset)
	window.WindowTitle.Size = UDim2.new(0, window.WindowTitle.Size.X.Offset, 0, window.Size.Y.Offset)
	for i,tab in next, self.TabControls do
		tab.Size = UDim2.new(0, tab.Size.X.Offset, 0, window.Size.Y.Offset)
	end
	self:UpdateTabControls()
end

local WindowPrefs = {}
WindowPrefs.UIColors = UIColors
WindowPrefs.AddShadow = AddShadow
WindowPrefs.MakeDraggable = MakeDraggable

function WindowPrefs:CreateWindow(title, size, iconId)
	local windowScreen = WindowScreen:Clone()
	local window = windowScreen.Window
	windowScreen.Parent = game.CoreGui
	window.WindowTitle.Text = title
	window.WindowIcon.Image = "rbxassetid://"..iconId
	window.Body.Size = UDim2.new(0, size.X, 0, size.Y)
	
	--> Configure the window with the WindowProps functions
	local Colors = newproxy(true)
	local mt = getmetatable(Colors)
	mt.__index = UIColors
	mt.__newindex = function(self, key, val)
		UIColors[key] = val
		window.BackgroundColor3 = UIColors.PrimaryColor
		window.Body.BackgroundColor3 = UIColors.SecondaryColor
		window.BodyBorder.BackgroundColor3 = UIColors.SecondaryColor
	end
	local windowInfo = {window = window, closing = false, TabControls = {}, UIColors = Colors}
	setmetatable(windowInfo, {__index = WindowProps})
	
	--> Configure buttons
	local clicked = false
	CreateTabControl(windowInfo, "Close", 4191392901, 24, Color3.fromRGB(220, 0, 0), UIColors.PrimaryColor, Color3.new(0,0,0), Color3.new(1,1,1), Color3.fromRGB(255, 0, 0), Color3.new(0,0,0), function(self)
		if clicked then return end
		clicked = true
		Tween(window.Body, {Size = UDim2.new(0,window.Body.Size.X.Offset,0,0)}, 0.3).Completed:Wait()
		windowInfo.closing = true
		Tween(window, {Size = UDim2.new(0,window.Body.Size.X.Offset,0,0)}, 0.2).Completed:Wait()
		windowScreen:Destroy()
	end)
	CreateTabControl(windowInfo, "Minimize", 4154771750, 24, Color3.fromRGB(40, 40, 40), UIColors.PrimaryColor, Color3.new(1,1,1), Color3.new(1,1,1), Color3.fromRGB(60, 60, 60), Color3.new(1,1,1), function(self)
		local visible = window.Body.Size.Y.Offset > 0
		if visible then
			Tween(window.Body, {Size = UDim2.new(0, 200, 0, 0)}, 0.25)
		else
			Tween(window.Body, {Size = UDim2.new(0, size.X, 0, size.Y)}, 0.25)
		end wait(0.03)
	end)
	
	windowInfo:UpdateUI()
	window.Body.Changed:connect(function()
		windowInfo:UpdateUI()
	end)
	window.Changed:connect(function()
		windowInfo:UpdateUI()
	end)
	LoadVisuals(windowInfo.window)
	return windowInfo
end
return WindowPrefs
