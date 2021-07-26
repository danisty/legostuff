--// Services
local Mouse = game.Players.LocalPlayer:GetMouse()
local RS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

local Library = {}

local function inArea(gO)
	return Mouse.X >= gO.AbsolutePosition.X and Mouse.X <= gO.AbsolutePosition.X + gO.AbsoluteSize.X
		and Mouse.Y >= gO.AbsolutePosition.Y and Mouse.Y <= gO.AbsolutePosition.Y + gO.AbsoluteSize.Y
end

local function makeDraggable(panel, handle)
	local isMouseDown = false
	panel.Active = true
	handle.Active = true
	handle.InputBegan:connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton1 and not isMouseDown then
			isMouseDown = true
			local pX = Mouse.X - panel.Position.X.Offset
			local pY = Mouse.Y - panel.Position.Y.Offset
			repeat RS.RenderStepped:wait()
				panel.Position = UDim2.new(panel.Position.X.Scale, Mouse.X - pX, panel.Position.Y.Scale, Mouse.Y - pY)
			until not isMouseDown
		end
	end)
	handle.InputEnded:connect(function(inp)
		if inp.UserInputType == Enum.UserInputType.MouseButton1 then
			isMouseDown = false
		end
	end)
end

local function setHovering(gO, properties, colorRetriever, tweenDelay)
	gO.InputBegan:Connect(function(input)
		local colors = colorRetriever()
		if input.UserInputType == Enum.UserInputType.MouseButton1 and colors.ClickStarted then
			for i,v in pairs(properties) do
				TS:Create(gO, TweenInfo.new(tweenDelay or .1), {[v]=colors.ClickStarted}):Play()
			end
		end
	end)
	gO.InputEnded:Connect(function(input)
		local colors = colorRetriever()
		if input.UserInputType == Enum.UserInputType.MouseButton1 and colors.ClickEnded and inArea(gO) then
			for i,v in pairs(properties) do
				TS:Create(gO, TweenInfo.new(tweenDelay or .1), {[v]=colors.ClickEnded}):Play()
			end
		end
	end)
	gO.MouseEnter:Connect(function()
		local colors = colorRetriever()
		if colors.Hovering then
			for i,v in pairs(properties) do
				TS:Create(gO, TweenInfo.new(tweenDelay or .1), {[v]=colors.Hovering}):Play()
			end
		end
	end)
	gO.MouseLeave:Connect(function()
		local colors = colorRetriever()
		if colors.Default then
			for i,v in pairs(properties) do
				TS:Create(gO, TweenInfo.new(tweenDelay or .1), {[v]=colors.Default}):Play()
			end
		end
	end)
end

function Library:CreateWindow(tools, parent)
	local Window = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local Body = Instance.new("Frame")
	local TabContent = Instance.new("Frame")
	local Lost = Instance.new("TextLabel")
	local Tabs = Instance.new("ScrollingFrame")
	local TabsLayout = Instance.new("UIListLayout")
	local TabPlaceHolder = Instance.new("Frame")
	local TabsDropShadow = Instance.new("Frame")
	local TitleBar = Instance.new("Frame")
	local Icon = Instance.new("ImageLabel")
	local Title = Instance.new("TextLabel")
	local Close = Instance.new("ImageButton")
	local Maximize = Instance.new("ImageButton")
	local Minimize = Instance.new("ImageButton")
	local Tab = Instance.new("TextButton")

    local methods = {}
	
	Window.Name = "Window"
	Window.Parent = parent
	Window.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = Window
	Main.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	Main.BorderColor3 = Color3.fromRGB(30, 136, 229)
	Main.Position = UDim2.new(0.5, -350, 0.5, -200)
	Main.Size = UDim2.new(0, 700, 0, 400)

	Body.Name = "Body"
	Body.Parent = Main
	Body.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Body.BackgroundTransparency = 1.000
	Body.BorderSizePixel = 0
	Body.ClipsDescendants = true
	Body.Position = UDim2.new(0, 0, 0, 30)
	Body.Size = UDim2.new(1, 0, 1, -30)

	TabContent.Name = "TabContent"
	TabContent.Parent = Body
	TabContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabContent.BackgroundTransparency = 1.000
	TabContent.Position = UDim2.new(0, 0, 0, 30)
	TabContent.Size = UDim2.new(1, 0, 1, -30)

	Lost.Name = "Lost"
	Lost.Parent = TabContent
	Lost.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Lost.BackgroundTransparency = 1.000
	Lost.Position = UDim2.new(0, 10, 0, 10)
	Lost.Size = UDim2.new(1, -10, 1, -10)
	Lost.Font = Enum.Font.SourceSans
	Lost.Text = "<font size=\"24\">Welcome to Lunox!</font><br/><font color=\"#999999\">It seems that you got kinda lost here. You might be looking for the<font color=\"#42a5f5\"> Tools </font>menu option.\n\nMore detailed description here</font>"
	Lost.TextColor3 = Color3.fromRGB(181, 181, 181)
	Lost.TextSize = 16.000
	Lost.TextWrapped = true
	Lost.RichText = true
	Lost.TextXAlignment = Enum.TextXAlignment.Left
	Lost.TextYAlignment = Enum.TextYAlignment.Top
	
	Tabs.Name = "Tabs"
	Tabs.Parent = Body
	Tabs.Active = true
	Tabs.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
	Tabs.BorderSizePixel = 0
	Tabs.Size = UDim2.new(1, 0, 0, 30)
	Tabs.ZIndex = 2
	Tabs.CanvasSize = UDim2.new(0, 180, 0, 0)
	Tabs.ScrollBarThickness = 0

	TabsLayout.Parent = Tabs
	TabsLayout.FillDirection = Enum.FillDirection.Horizontal
	TabsLayout.SortOrder = Enum.SortOrder.LayoutOrder

	TabPlaceHolder.Name = "TabPlaceHolder"
	TabPlaceHolder.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
	TabPlaceHolder.BorderSizePixel = 0
	TabPlaceHolder.Size = UDim2.new(0, 180, 0, 30)

	TabsDropShadow.Name = "TabsDropShadow"
	TabsDropShadow.Parent = Body
	TabsDropShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabsDropShadow.BorderSizePixel = 0
	TabsDropShadow.Size = UDim2.new(1, 0, 0, 33)
	TabsDropShadow.Style = Enum.FrameStyle.DropShadow

	TitleBar.Name = "TitleBar"
	TitleBar.Parent = Main
	TitleBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TitleBar.BackgroundTransparency = 1.000
	TitleBar.BorderSizePixel = 0
	TitleBar.Size = UDim2.new(1, 0, 0, 30)

	Icon.Name = "Icon"
	Icon.Parent = TitleBar
	Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon.BackgroundTransparency = 1.000
	Icon.Size = UDim2.new(0, 30, 0, 30)
	Icon.Image = "rbxassetid://6865413952"

	Title.Name = "Title"
	Title.Parent = TitleBar
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0, 30, 0, 0)
	Title.Size = UDim2.new(0, 0, 0, 30)
	Title.Font = Enum.Font.SourceSansSemibold
	Title.Text = "LUNOX"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 16.000
	Title.TextXAlignment = Enum.TextXAlignment.Left

	Close.Name = "Close"
	Close.Parent = TitleBar
	Close.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	Close.BorderSizePixel = 0
	Close.Position = UDim2.new(1, -40, 0, 0)
	Close.Size = UDim2.new(0, 40, 0, 30)
	Close.Image = "rbxassetid://6875911058"
	Close.ScaleType = Enum.ScaleType.Fit

	Maximize.Name = "Maximize"
	Maximize.Parent = TitleBar
	Maximize.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	Maximize.BorderSizePixel = 0
	Maximize.Position = UDim2.new(1, -80, 0, 0)
	Maximize.Size = UDim2.new(0, 40, 0, 30)
	Maximize.ScaleType = Enum.ScaleType.Fit
	Maximize.Image = "rbxassetid://6876865517"

	Minimize.Name = "Minimize"
	Minimize.Parent = TitleBar
	Minimize.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	Minimize.BorderSizePixel = 0
	Minimize.Position = UDim2.new(1, -120, 0, 0)
	Minimize.Size = UDim2.new(0, 40, 0, 30)
	Minimize.Image = "rbxassetid://6875921379"
	Minimize.ScaleType = Enum.ScaleType.Fit
	
	local tabs = {}
	local selectedTab;
	
	local function selectTab(tab)
		for i,v in pairs(tabs) do
			v.Title.TextColor3 = v==tab and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 180)
			v.BackgroundColor3 = v==tab and Color3.fromRGB(33, 33, 33) or Color3.fromRGB(27, 27, 27)
		end
		selectedTab = tab
	end
	
	function methods:CreateTab(name, content)
		local Tab = Instance.new("TextButton")
		local TabTitle = Instance.new("TextLabel")
		local TabClose = Instance.new("ImageButton")
		
		Tab.Name = "Tab"
		Tab.Parent = Tabs
		Tab.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
		Tab.BorderSizePixel = 0
		Tab.Size = UDim2.new(0, 180, 0, 30)
		Tab.AutoButtonColor = false
		Tab.Font = Enum.Font.SourceSans
		Tab.Text = ""
		Tab.TextColor3 = Color3.fromRGB(0, 0, 0)
		Tab.TextSize = 14.000
		Tab.ZIndex = 2

		TabTitle.Name = "Title"
		TabTitle.Parent = Tab
		TabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabTitle.BackgroundTransparency = 1.000
		TabTitle.Position = UDim2.new(0, 10, 0, 0)
		TabTitle.Size = UDim2.new(1, -10, 1, 0)
		TabTitle.Font = Enum.Font.SourceSans
		TabTitle.Text = name
		TabTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
		TabTitle.TextSize = 14.000
		TabTitle.TextXAlignment = Enum.TextXAlignment.Left

		TabClose.Name = "TabClose"
		TabClose.Parent = Tab
		TabClose.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		TabClose.BorderSizePixel = 0
		TabClose.Position = UDim2.new(1, -23, 0, 8)
		TabClose.Size = UDim2.new(0, 15, 0, 15)
		TabClose.AutoButtonColor = false
		TabClose.Image = "rbxassetid://6876957469"
		TabClose.Visible = false
		
		local mouseDown = false
		local mouseDownPosition;
		local dragging = false
		
		Tab.MouseEnter:Connect(function()
			TabClose.Visible = true
		end)
		Tab.MouseLeave:Connect(function()
			TabClose.Visible = false
		end)
		
		Tab.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 and not mouseDown then
				mouseDown = true
				mouseDownPosition = Vector2.new(Mouse.X, Mouse.Y)
				local rX = Mouse.X - Tab.AbsolutePosition.X
				while mouseDown do
					if (mouseDownPosition - Vector2.new(Mouse.X, Mouse.Y)).Magnitude > 10 then
						TabPlaceHolder.Parent = Tabs
						TabPlaceHolder.LayoutOrder = table.find(tabs, Tab)
						Tab.Parent = Body
						while mouseDown do
							Tab.Position = UDim2.new(0, Mouse.X - Body.AbsolutePosition.X - rX, 0, 0)
							dragging = true

							--// Order tabs, homemade method, probably not recommended
							local tabsSorted = {}
							for i,v in pairs(tabs) do
								table.insert(tabsSorted, {v, v==Tab and (v.AbsolutePosition.X + v.AbsoluteSize.X/2) - Body.AbsolutePosition.X or (i-1)*Tab.AbsoluteSize.X + Tab.AbsoluteSize.X/2})
							end
							table.sort(tabsSorted, function(v1, v2)
								return v1[2] < v2[2]
							end)
							for i,v in pairs(tabsSorted) do
								tabs[i] = v[1]
								tabs[i].LayoutOrder = i
								if v[1] == Tab then
									TabPlaceHolder.LayoutOrder = i
								end
							end

							RS.RenderStepped:Wait()
						end
						TabPlaceHolder.Parent = nil
						Tab.Parent = Tabs
					end
					RS.RenderStepped:Wait()
				end
			end
		end)
		Tab.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				mouseDown = false
				if inArea(Tab) and not dragging then
					selectTab(Tab)
				end
				dragging = false
			end
		end)

		setHovering(Tab, {"BackgroundColor3"}, function()
			return {
				Default=selectedTab==Tab and Color3.fromRGB(33, 33, 33) or Color3.fromRGB(27, 27, 27),
				Hovering=selectedTab==Tab and Color3.fromRGB(36, 36, 36) or Color3.fromRGB(33, 33, 33),
				ClickStarted=Color3.fromRGB(40, 40, 40),
				ClickEnded=Color3.fromRGB(36, 36, 36)
			}
		end)

		table.insert(tabs, Tab)
		Tab.LayoutOrder = #tabs
	end
	
	makeDraggable(Main, TitleBar)
    return methods
end
return Library