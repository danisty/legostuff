local SilentAim = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Bevel1 = Instance.new("Frame")
local Bevel2 = Instance.new("Frame")
local Bevel3 = Instance.new("Frame")
local Handler = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local BackBtn = Instance.new("TextButton")
local InfoBtn = Instance.new("TextButton")
local Message = Instance.new("Frame")
local MsgTitle = Instance.new("TextLabel")
local MsgContent = Instance.new("TextLabel")
local AcceptBtn = Instance.new("TextButton")
local CancelBtn = Instance.new("TextButton")

SilentAim.Name = "SilentAim"
SilentAim.Parent = game.CoreGui
SilentAim.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = SilentAim
Main.BackgroundColor3 = Color3.new(1, 1, 1)
Main.BackgroundTransparency = 1
Main.BorderSizePixel = 0
Main.Position = UDim2.new(1, -260, 0.45, -150)
Main.Size = UDim2.new(0, 260, 0, 300)

Bevel1.Name = "Bevel1"
Bevel1.BackgroundColor3 = Color3.new(0.0941176, 0.0941176, 0.0941176)
Bevel1.BorderSizePixel = 0
Bevel1.Position = UDim2.new(0, 0, 1, 0)
Bevel1.Size = UDim2.new(1, 0, 0, 1)

Bevel2.Name = "Bevel2"
Bevel2.Parent = Bevel1
Bevel2.BackgroundColor3 = Color3.new(0.0941176, 0.0941176, 0.0941176)
Bevel2.BackgroundTransparency = 0.60000002384186
Bevel2.BorderSizePixel = 0
Bevel2.Position = UDim2.new(0, 0, 0, 1)
Bevel2.Size = UDim2.new(1, 0, 0, 1)

Bevel3.Name = "Bevel3"
Bevel3.Parent = Bevel2
Bevel3.BackgroundColor3 = Color3.new(0.0941176, 0.0941176, 0.0941176)
Bevel3.BackgroundTransparency = 0.89999997615814
Bevel3.BorderSizePixel = 0
Bevel3.Position = UDim2.new(0, 0, 0, 1)
Bevel3.Size = UDim2.new(1, 0, 0, 1)

Handler.Name = "Handler"
Handler.Parent = Main
Handler.BackgroundColor3 = Color3.new(1, 1, 1)
Handler.BackgroundTransparency = 1
Handler.ClipsDescendants = true
Handler.Position = UDim2.new(0, 0, 0, 25)
Handler.Size = UDim2.new(1, 0, 1, -25)

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0, 25)
Title.Font = Enum.Font.Code
Title.Text = "SETTINGS"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 14

BackBtn.Name = "BackBtn"
BackBtn.Parent = Title
BackBtn.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
BackBtn.BorderSizePixel = 0
BackBtn.Size = UDim2.new(0, 25, 1, 0)
BackBtn.Font = Enum.Font.SourceSans
BackBtn.LineHeight = 1.1200000047684
BackBtn.Text = "←"
BackBtn.TextColor3 = Color3.new(1, 1, 1)
BackBtn.TextSize = 20

InfoBtn.Name = "InfoBtn"
InfoBtn.Parent = Title
InfoBtn.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
InfoBtn.BorderSizePixel = 0
InfoBtn.Position = UDim2.new(1, -25, 0, 0)
InfoBtn.Size = UDim2.new(0, 25, 1, 0)
InfoBtn.Font = Enum.Font.Code
InfoBtn.Text = "?"
InfoBtn.TextColor3 = Color3.new(1, 1, 1)
InfoBtn.TextSize = 15

Message.Name = "Message"
Message.BackgroundColor3 = Color3.new(0.160784, 0.160784, 0.160784)
Message.BorderSizePixel = 0
Message.Position = UDim2.new(0.5, -133, 0.5, -75)
Message.Size = UDim2.new(0, 266, 0, 150)

MsgTitle.Name = "MsgTitle"
MsgTitle.Parent = Message
MsgTitle.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
MsgTitle.BorderSizePixel = 0
MsgTitle.Size = UDim2.new(1, 0, 0, 25)
MsgTitle.Font = Enum.Font.Code
MsgTitle.Text = "MESSAGE TITLE"
MsgTitle.TextColor3 = Color3.new(1, 1, 1)
MsgTitle.TextSize = 15

MsgContent.Name = "MsgContent"
MsgContent.Parent = Message
MsgContent.BackgroundColor3 = Color3.new(1, 1, 1)
MsgContent.BackgroundTransparency = 1
MsgContent.Position = UDim2.new(0, 4, 0, 29)
MsgContent.Size = UDim2.new(1, -8, 1, -60)
MsgContent.Font = Enum.Font.SourceSans
MsgContent.Text = "ASASDSADSDASDAS"
MsgContent.TextWrapped = true
MsgContent.TextColor3 = Color3.new(0.792157, 0.792157, 0.792157)
MsgContent.TextSize = 14
MsgContent.TextXAlignment = Enum.TextXAlignment.Left
MsgContent.TextYAlignment = Enum.TextYAlignment.Top

AcceptBtn.Name = "AcceptBtn"
AcceptBtn.Parent = Message
AcceptBtn.BackgroundColor3 = Color3.new(0.243137, 0.290196, 0.596078)
AcceptBtn.BorderColor3 = Color3.new(0.12549, 0.12549, 0.12549)
AcceptBtn.BorderSizePixel = 0
AcceptBtn.Position = UDim2.new(0, 4, 1, -27)
AcceptBtn.Size = UDim2.new(0.5, -1, 0, 23)
AcceptBtn.Font = Enum.Font.Code
AcceptBtn.Text = "ACCEPT"
AcceptBtn.TextColor3 = Color3.new(1, 1, 1)
AcceptBtn.TextSize = 15

CancelBtn.Name = "CancelBtn"
CancelBtn.Parent = Message
CancelBtn.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
CancelBtn.BorderColor3 = Color3.new(0.12549, 0.12549, 0.12549)
CancelBtn.BorderSizePixel = 0
CancelBtn.Position = UDim2.new(0.5, 7, 1, -27)
CancelBtn.Size = UDim2.new(0.5, -11, 0, 23)
CancelBtn.Font = Enum.Font.Code
CancelBtn.Text = "CANCEL"
CancelBtn.TextColor3 = Color3.new(1, 1, 1)
CancelBtn.TextSize = 15

local Mouse = game.Players.LocalPlayer:GetMouse()
local RS = game:GetService('RunService')
local UIS = game:GetService('UserInputService')

local Library = {}
local HandlersHistory = {}
local Handlers = {}

local function makeDraggable(panel, handle)
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

local function createBavel(guiObj)
	Bevel1:Clone().Parent = guiObj
end

local function openHandler(self)
	Title.Text = self.Title
	for i,v in pairs(Handlers)do
		v.Handler.Parent = nil
	end
	
	table.insert(HandlersHistory, self)
	self.Handler.Parent = Handler
end

local function closeHandler(self)
	self = self or HandlersHistory[#HandlersHistory]
	self.Handler.Parent = nil
	
	HandlersHistory[#HandlersHistory] = nil
	HandlersHistory[#HandlersHistory].Handler.Parent = Handler
	
	Title.Text = HandlersHistory[#HandlersHistory].Title
	BackBtn.Visible = self.CanReturn
end

local function createMessage(title, content, accept, cancel)
	local msgHandler = Instance.new("ScreenGui", game.CoreGui)
	local message = Message:Clone()
	message.Parent = msgHandler
	message.MsgTitle.Text = title
	message.MsgContent.Text = content

	local size = math.max(#message.MsgContent.Text / 43, 2) * 20 + 40
	message.Size = UDim2.new(0, 266, 0, size)
	message.Position = UDim2.new(0.5, -133, 0.5, -size/2)
	
	local function input(btn, func)
		btn.MouseButton1Click:Connect(function()
			msgHandler:Destroy()
			func()
		end)
	end
	
	if not cancel then
		message.CancelBtn.Visible = false
		message.AcceptBtn.Size = UDim2.new(1, -8, 0, 23)
	end
	
	createBavel(message)
	input(message.AcceptBtn, accept or function()end)
	input(message.CancelBtn, cancel or function()end)
	makeDraggable(message, message.MsgTitle)
end

local function createOptionsHandler(title, canReturn)
	local OptionsHandler = Instance.new("Frame")
	local HandlerLayout = Instance.new("UIListLayout")
	local HandlerPadd = Instance.new("UIPadding")
	
	OptionsHandler.Name = "OptionsHandler"
	OptionsHandler.Parent = nil
	OptionsHandler.BackgroundColor3 = Color3.new(0.160784, 0.160784, 0.160784)
	OptionsHandler.BorderSizePixel = 0
	OptionsHandler.Size = UDim2.new(1, 0, 1, 0)
	OptionsHandler.ZIndex = 2
	
	HandlerLayout.Name = "HandlerLayout"
	HandlerLayout.Parent = OptionsHandler
	HandlerLayout.SortOrder = Enum.SortOrder.LayoutOrder
	HandlerLayout.Padding = UDim.new(0, 1)
	
	HandlerPadd.Name = "HandlerPadd"
	HandlerPadd.Parent = OptionsHandler
	HandlerPadd.PaddingBottom = UDim.new(0, 2)
	HandlerPadd.PaddingLeft = UDim.new(0, 2)
	HandlerPadd.PaddingRight = UDim.new(0, 2)
	HandlerPadd.PaddingTop = UDim.new(0, 2)
	
	local controls = {Handler = OptionsHandler, CanReturn = canReturn, Title = title}
	function controls:CreateOption()
		local OptionBtn = Instance.new("TextButton")
		local OptionText = Instance.new("TextLabel")
		local OptionArrow = Instance.new("TextLabel")
		
		OptionBtn.Name = "OptionBtn"
		OptionBtn.Parent = self.Handler
		OptionBtn.BackgroundColor3 = Color3.new(0.137255, 0.137255, 0.137255)
		OptionBtn.BorderSizePixel = 0
		OptionBtn.Size = UDim2.new(1, 0, 0, 30)
		OptionBtn.Font = Enum.Font.SourceSans
		OptionBtn.Text = ""
		OptionBtn.TextColor3 = Color3.new(0, 0, 0)
		OptionBtn.TextSize = 14
		
		OptionText.Name = "OptionText"
		OptionText.Parent = OptionBtn
		OptionText.BackgroundColor3 = Color3.new(0.14902, 0.14902, 0.14902)
		OptionText.BackgroundTransparency = 1
		OptionText.BorderSizePixel = 0
		OptionText.Position = UDim2.new(0, 10, 0, 0)
		OptionText.Size = UDim2.new(0, 0, 1, 0)
		OptionText.Font = Enum.Font.Gotham
		OptionText.Text = title
		OptionText.TextColor3 = Color3.new(0.792157, 0.792157, 0.792157)
		OptionText.TextSize = 12
		OptionText.TextXAlignment = Enum.TextXAlignment.Left
		
		OptionArrow.Name = "OptionArrow"
		OptionArrow.Parent = OptionBtn
		OptionArrow.BackgroundColor3 = Color3.new(0.14902, 0.14902, 0.14902)
		OptionArrow.BackgroundTransparency = 1
		OptionArrow.BorderSizePixel = 0
		OptionArrow.Position = UDim2.new(1, -15, 0, 0)
		OptionArrow.Size = UDim2.new(0, 0, 1, 0)
		OptionArrow.Font = Enum.Font.Gotham
		OptionArrow.Text = ">"
		OptionArrow.TextColor3 = Color3.new(0.792157, 0.792157, 0.792157)
		OptionArrow.TextSize = 14
		OptionArrow.TextXAlignment = Enum.TextXAlignment.Left
	end
	
	function controls:CreateSlider(title, actualValue, minValue, maxValue)
		local Slider = Instance.new("Frame")
		local SliderBackground = Instance.new("ImageLabel")
		local SliderFill = Instance.new("ImageLabel")
		local SliderDot = Instance.new("ImageLabel")
		local SliderValue = Instance.new("TextLabel")
		local SliderText = Instance.new("TextLabel")
		
		Slider.Name = "Slider"
		Slider.Parent = self.Handler
		Slider.AnchorPoint = Vector2.new(1, 1)
		Slider.BackgroundColor3 = Color3.fromRGB(41, 41, 41)
		Slider.BackgroundTransparency = 1
		Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Slider.Size = UDim2.new(1, 0, 0, 50)
		
		SliderBackground.Name = "SliderBackground"
		SliderBackground.Parent = Slider
		SliderBackground.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		SliderBackground.BackgroundTransparency = 1
		SliderBackground.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SliderBackground.Position = UDim2.new(0, 10, 0.5, 0)
		SliderBackground.Size = UDim2.new(1, -20, 0, 6)
		SliderBackground.Image = "rbxassetid://3570695787"
		SliderBackground.ImageColor3 = Color3.fromRGB(35, 35, 35)
		SliderBackground.ScaleType = Enum.ScaleType.Slice
		SliderBackground.SliceCenter = Rect.new(100, 100, 100, 100)
		SliderBackground.SliceScale = 0.04
		
		SliderFill.Name = "SliderFill"
		SliderFill.Parent = SliderBackground
		SliderFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SliderFill.BackgroundTransparency = 1
		SliderFill.Size = UDim2.new(0.5, 0, 1, 0)
		SliderFill.Image = "rbxassetid://3570695787"
		SliderFill.ImageTransparency = 0.20000000298023
		SliderFill.ScaleType = Enum.ScaleType.Slice
		SliderFill.SliceCenter = Rect.new(100, 100, 100, 100)
		SliderFill.SliceScale = 0.04
		
		SliderDot.Name = "SliderDot"
		SliderDot.Parent = SliderBackground
		SliderDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SliderDot.BackgroundTransparency = 1
		SliderDot.Position = UDim2.new(0.5, -5, 0, -2)
		SliderDot.Size = UDim2.new(0, 10, 0, 10)
		SliderDot.Image = "rbxassetid://3570695787"
		SliderDot.ScaleType = Enum.ScaleType.Slice
		SliderDot.SliceCenter = Rect.new(100, 100, 100, 100)
		SliderDot.SliceScale = 0.1
		
		SliderValue.Name = "SliderValue"
		SliderValue.Parent = SliderBackground
		SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SliderValue.Position = UDim2.new(0.5, 0, 0.5, 12)
		SliderValue.Font = Enum.Font.SourceSansSemibold
		SliderValue.Text = ("%s/%s"):format(actualValue, maxValue)
		SliderValue.TextColor3 = Color3.fromRGB(202, 202, 202)
		SliderValue.TextSize = 14
		
		SliderText.Name = "SliderText"
		SliderText.Parent = Slider
		SliderText.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
		SliderText.BackgroundTransparency = 1
		SliderText.BorderSizePixel = 0
		SliderText.Position = UDim2.new(0, 10, 0, 0)
		SliderText.Size = UDim2.new(0, 0, 0, 25)
		SliderText.Font = Enum.Font.Gotham
		SliderText.Text = title
		SliderText.TextColor3 = Color3.fromRGB(202, 202, 202)
		SliderText.TextSize = 12
		SliderText.TextXAlignment = Enum.TextXAlignment.Left
	end
	
	Handlers[title] = controls
	return setmetatable(controls, {__index = {Close = closeHandler, Open = openHandler}})
end

createBavel(Main)
BackBtn.MouseButton1Click:Connect(closeHandler)

Library.CreateMessage = createMessage
Library.CreateBavel = createBavel
Library.CreateOptionsHandler = createOptionsHandler
Library.MakeDraggable = makeDraggable
return Library
