local main = ...
local utils = main.modules.Utils

--// Services
local UIS = game:GetService("UserInputService")
local RS = game:GetService("RunService")

local Adapters = {}
local EnvironmentBrowser = {
	Tool={
		Name="Environment Browser",
		Icon=nil
	}
}

local selectionColors = {
	Default=Color3.fromRGB(27, 121, 204),
	Started=Color3.fromRGB(29, 130, 219),
	Hovering=Color3.fromRGB(28, 126, 212)
}

local function filterGarbage(script, pause)
	local data = {}
	local source = script:GetFullName()
	for i,v in pairs(getgc()) do
		if getinfo(v).source:sub(2) == source then
			data[#data+1] = v
		end
		if pause and i % 800 == 0 then
			RS.RenderStepped:Wait()
		end
	end
	return data
end

local returnFromModule = '<font color="#1e88e5">[Return From Module]</font>'
local waterMark = "--// Script generated with Lunox [Environment Browser]\n"
local filterGarbageRawFunc = [[local function filterGarbage(script)
	local values = {}
	local source = script:GetFullName()
	for i,v in pairs(getgc()) do
		if getinfo(v).source:sub(2) == source then
			values[#values+1] = v
		end
	end
	return values
end]]

local function filterRequire(module)
	local r = require(module)
	return {[returnFromModule]=r}
end

local valueTypes = {
	LocalScript={{"Script Environment", getsenv, "getsenv", "s"}, {"Garbage", filterGarbage, "filterGarbage", "g"}},
	ModuleScript={{"Module Return", filterRequire, "require", "m"}, {"Garbage", filterGarbage, "filterGarbage", "g"}},
	["function"]={{"Upvalues", getupvalues, "debug.getupvalues", "u"}, {"Constants", getconstants, "debug.getconstants", "c"}, {"Protos", getprotos, "debug.getprotos", "p"}, {"Function Environment", getfenv, "getfenv", "f"}},
	["table"]={{"Table Entries", function(t) return t end, "pairs", "t"}, {"Metatable", getrawmetatable, "getrawmetatable", "m"}},
	["userdata"]={{"Metatable", getrawmetatable, "getrawmetatable", "m"}}
}

--// Filter scripts
local player = game.Players.LocalPlayer
local blacklist = {
	"PlayerScriptsLoader.", "StarterGui.", "CorePackages.", "CoreGui.RobloxGui.",
	"Chat.", "StarterPlayer.", "StarterPack.", "Lighting.",
	-- "Players." .. player.Name .. ".PlayerScripts.ChatScript.",
	-- "Players." .. player.Name .. ".PlayerScripts.PlayerModule."
}
for i,p in pairs(game.Players:GetChildren())do
	if p ~= player then
		table.insert(blacklist, "Players." .. p.Name)
		table.insert(blacklist, "Workspace." .. p.Name)
	end
end
game.Players.PlayerAdded:Connect(function(p)
	if p ~= player then
		table.insert(blacklist, "Players." .. p.Name)
		table.insert(blacklist, "Workspace." .. p.Name)
	end
end)

local function isValidScript(script)
	local source = script:GetFullName()
	for i,v in pairs(blacklist) do
		if source:sub(1, #v) == v then --// Faster than string.find in this case
			return false
		end
	end
	return blacklist
end

local function createValueType(type)
	local Type = Instance.new("TextButton")
	local Name = Instance.new("TextLabel")
	local Icon = Instance.new("ImageLabel")
	local Count = Instance.new("TextLabel")

	Type.Name = "Type"
	Type.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	Type.BorderSizePixel = 0
	Type.Size = UDim2.new(1, 0, 0, 25)
	Type.ZIndex = 2
	Type.AutoButtonColor = false
	Type.Font = Enum.Font.SourceSans
	Type.Text = ""
	Type.TextColor3 = Color3.fromRGB(255, 255, 255)
	Type.TextSize = 14.000

	Name.Name = "TypeName"
	Name.Parent = Type
	Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Name.BackgroundTransparency = 1.000
	Name.Position = UDim2.new(0, 25, 0, 0)
	Name.Size = UDim2.new(1, -25, 1, 0)
	Name.ZIndex = 2
	Name.Font = Enum.Font.SourceSans
	Name.Text = type
	Name.TextColor3 = Color3.fromRGB(255, 255, 255)
	Name.TextSize = 14.000
	Name.TextXAlignment = Enum.TextXAlignment.Left

	Icon.Name = "Icon"
	Icon.Parent = Type
	Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Icon.BackgroundTransparency = 1.000
	Icon.Position = UDim2.new(0, 4, 0, 5)
	Icon.Size = UDim2.new(0, 16, 0, 16)
	Icon.ZIndex = 2
	Icon.ImageRectOffset = Vector2.new(0, 32)
	Icon.ImageRectSize = Vector2.new(16, 16)
	Icon.ScaleType = Enum.ScaleType.Crop
	Icon.SliceScale = 0.000
	Icon.TileSize = UDim2.new(0, 16, 0, 16)

	Count.Name = "Count"
	Count.Parent = Type
	Count.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Count.BackgroundTransparency = 1
	Count.Text = "?"
	Count.Position = UDim2.new(0, 0, 0, 0)
	Count.Size = UDim2.new(0, 25, 0, 25)
	Count.ZIndex = 2
	Count.Font = Enum.Font.SourceSans
	Count.Text = type
	Count.TextColor3 = Color3.fromRGB(255, 255, 255)
	Count.TextSize = 14

	return Type
end

local function createPathPart(pathInfo)
	local Part = Instance.new("Frame")
	local Listener = Instance.new("TextButton")
	local Arrow = Instance.new("TextButton")

	local text = tostring(pathInfo.Script and pathInfo.Script.Name or pathInfo.Index):gsub("\n", "")
	if #text > 25 and text ~= returnFromModule then
		text = text:sub(1, 25) .. "..."
	end

	Part.Name = "Part"
	Part.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Part.BackgroundTransparency = 1.000
	Part.Size = UDim2.new(0, 85, 0, 25)

	Listener.Name = "Listener"
	Listener.Parent = Part
	Listener.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Listener.BorderColor3 = Color3.fromRGB(30, 136, 229)
	Listener.BorderSizePixel = 0
	Listener.Text = text
	Listener.Font = Enum.Font.SourceSans
	Listener.RichText = true
	Listener.TextColor3 = Color3.fromRGB(255, 255, 255)
	Listener.TextSize = 14.000
	Listener.BorderMode = Enum.BorderMode.Inset
	Listener.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

	Arrow.Name = "Arrow"
	Arrow.Parent = Part
	Arrow.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Arrow.BorderColor3 = Color3.fromRGB(30, 136, 229)
	Arrow.BorderSizePixel = 0
	Arrow.Position = UDim2.new(1, -14, 0, 0)
	Arrow.Size = UDim2.new(0, 14, 0, 25)
	Arrow.Font = Enum.Font.SciFi
	Arrow.Text = "›"
	Arrow.TextColor3 = Color3.fromRGB(255, 255, 255)
	Arrow.TextSize = 14.000
	Arrow.BorderMode = Enum.BorderMode.Inset
	Arrow.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)

	local function onMouseEnter()
		Arrow.BorderSizePixel = 1
		Listener.BorderSizePixel = 1
	end

	local function onMouseLeave()
		if not utils:inArea(Part) then
			Arrow.BorderSizePixel = 0
			Listener.BorderSizePixel = 0
		end
	end

	Listener.MouseEnter:Connect(onMouseEnter)
	Arrow.MouseEnter:Connect(onMouseEnter)

	Listener.MouseLeave:Connect(onMouseLeave)
	Arrow.MouseLeave:Connect(onMouseLeave)

	return Part
end

local function generateScript(explorerPath, pathDepth)
	local envIndex = 0
	local compactOutput = ""
	local stepOutput = ""
	for i = 1, pathDepth do
		local part = explorerPath[i]
		if part.Script then
			compactOutput = part.Type[3] .. "(" .. utils:getPath(part.Script) .. ")"
			stepOutput = compactOutput
		else
			local isModuleReturn = part.Index == returnFromModule
			local index = isModuleReturn and "" or utils:fixIndex(part.Index)
			local isLast = i == pathDepth and part.Type[3] ~= "getfenv"

			if part.Type[1] == "Table Entries" or (isLast and not isModuleReturn) then
				compactOutput = compactOutput .. index
				stepOutput = stepOutput .. index
			else
				stepOutput = stepOutput .. ("\nlocal env%d = %s(env%s%s)"):format(envIndex + 1, part.Type[3], envIndex > 0 and tostring(envIndex) or "", index)
				compactOutput = ("%s(%s%s)"):format(part.Type[3], compactOutput, index)
				envIndex += 1
			end
		end
	end
	return compactOutput, stepOutput, "env" .. (envIndex > 0 and envIndex or "")
end

local function serialize(explorerPath, pathDepth)
	local parts = {}
	for i = 1, pathDepth do
		local part = explorerPath[i]
		if part.Index == returnFromModule then
			parts[1] = parts[1]:sub(1, 1) .. part.Type[4] .. parts[1]:sub(2)
		else
			local index = tostring(part.Index):gsub("\\", "%%b")
			table.insert(parts, ("%s:%s"):format(part.Type[4] .. (part.Script and "" or type(part.Index):sub(1,1)),  part.Script and utils:getPath(part.Script) or index))
		end
	end
	return table.concat(parts, "\\")
end

local function deserialize(path)
	local explorerPath = {}
	local parts = path:split("\\")
	local depth = 1
	local prevValues;
	
	for _,part in pairs(parts) do
		local info, index = unpack(part:split(":"))
		local script = prevValues == nil and utils:fromPath(index or info)
		
		if index == nil then
			index = info
			info = valueTypes[script.ClassName][1][4]
		end
		
		local valueType, indexType = unpack(info:split(""))
		index = indexType=="n" and tonumber(index) or index:gsub("%%b", "\\")

		local value = prevValues ~= nil and prevValues[index]
		local types = valueTypes[depth == 1 and script.ClassName or typeof(value)]
		local type = utils:find(types, function(t) return t[4] == valueType end)

		if depth == 1 then
			explorerPath[depth] = { Type=type, Value=script, Script=script }
			prevValues = type[2](script)

			if indexType ~= nil then --// Module Script return
				depth += 1
				prevValues = prevValues[returnFromModule]

				local type = utils:find(valueTypes[typeof(prevValues)], function(t) return t[4] == indexType end)
				explorerPath[depth] = { Index=returnFromModule, Type=type, Value=prevValues }
			end
		else
			explorerPath[depth] = { Index=index, Type=type, Value=value }
			prevValues = type[2](value)
		end

		depth += 1
	end
	return explorerPath
end

local function Load(window, root, tool)
	local ScriptsList = Instance.new("Frame")
	local ScriptsOptions = Instance.new("Frame")
	local SearchBox = Instance.new("TextBox")
	local FilterScripts = Instance.new("ImageButton")
	local SearchIcon = Instance.new("ImageLabel")
	local RefreshScripts = Instance.new("ImageButton")
	local ScriptsDropShadow = Instance.new("Frame")
	local Explorer = Instance.new("Frame")
	local ExplorerOptions = Instance.new("Frame")
	local Generate = Instance.new("ImageButton")
	local Back = Instance.new("ImageButton")
	local Forward = Instance.new("ImageButton")
	local Refresh = Instance.new("ImageButton")
	local Path = Instance.new("Frame")
	local PathParts = Instance.new("ScrollingFrame")
	local PathLayout = Instance.new("UIListLayout")
	local AbsolutePath = Instance.new("ScrollingFrame")
	local AbsolutePathInput = Instance.new("TextBox")
	local ExplorerDropShadow = Instance.new("Frame")
	local ValueTypes = Instance.new("ScrollingFrame")
	local ValueTypesLayout = Instance.new("UIListLayout")
	local PathRecyclerHandle = Instance.new("Frame")

	ScriptsList.Name = "ScriptsList"
	ScriptsList.Parent = root
	ScriptsList.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	ScriptsList.BorderColor3 = Color3.fromRGB(30, 30, 30)
	ScriptsList.BorderSizePixel = 0
	ScriptsList.Size = UDim2.new(0, 200, 1, 0)
	ScriptsList.ZIndex = 2

	ScriptsOptions.Name = "ScriptsOptions"
	ScriptsOptions.Parent = ScriptsList
	ScriptsOptions.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	ScriptsOptions.BorderSizePixel = 0
	ScriptsOptions.Size = UDim2.new(1, 0, 0, 25)
	ScriptsOptions.ZIndex = 2

	SearchBox.Name = "SearchBox"
	SearchBox.Parent = ScriptsOptions
	SearchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	SearchBox.BackgroundTransparency = 1.000
	SearchBox.BorderSizePixel = 0
	SearchBox.ClipsDescendants = true
	SearchBox.Position = UDim2.new(0, 25, 0, 0)
	SearchBox.Size = UDim2.new(1, -75, 0, 25)
	SearchBox.ZIndex = 2
	SearchBox.ClearTextOnFocus = false
	SearchBox.Font = Enum.Font.SourceSans
	SearchBox.PlaceholderText = "Search Script..."
	SearchBox.Text = ""
	SearchBox.TextColor3 = Color3.fromRGB(233, 233, 233)
	SearchBox.TextSize = 14.000
	SearchBox.TextXAlignment = Enum.TextXAlignment.Left

	FilterScripts.Name = "FilterScripts"
	FilterScripts.Parent = ScriptsOptions
	FilterScripts.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	FilterScripts.BorderSizePixel = 0
	FilterScripts.Position = UDim2.new(1, -50, 0, 0)
	FilterScripts.Size = UDim2.new(0, 25, 0, 25)
	FilterScripts.ZIndex = 2
	FilterScripts.Image = "rbxassetid://6875536784"

	SearchIcon.Name = "SearchIcon"
	SearchIcon.Parent = ScriptsOptions
	SearchIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SearchIcon.BackgroundTransparency = 1.000
	SearchIcon.Size = UDim2.new(0, 25, 0, 25)
	SearchIcon.ZIndex = 2
	SearchIcon.Image = "rbxassetid://6875607749"

	RefreshScripts.Name = "RefreshScripts"
	RefreshScripts.Parent = ScriptsOptions
	RefreshScripts.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	RefreshScripts.BorderSizePixel = 0
	RefreshScripts.Position = UDim2.new(1, -25, 0, 0)
	RefreshScripts.Size = UDim2.new(0, 25, 0, 25)
	RefreshScripts.ZIndex = 2
	RefreshScripts.Image = "rbxassetid://7203691992"

	ScriptsDropShadow.Name = "DropShadow"
	ScriptsDropShadow.Parent = ScriptsList
	ScriptsDropShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScriptsDropShadow.BorderSizePixel = 0
	ScriptsDropShadow.Position = UDim2.new(0, 0, 0, -4)
	ScriptsDropShadow.Size = UDim2.new(1, 5, 1, 8)
	ScriptsDropShadow.Style = Enum.FrameStyle.DropShadow

	Explorer.Name = "Explorer"
	Explorer.Parent = root
	Explorer.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	Explorer.BorderSizePixel = 0
	Explorer.Position = UDim2.new(0, 200, 0, 0)
	Explorer.Size = UDim2.new(1, -350, 1, 0)

	ExplorerOptions.Name = "ExplorerOptions"
	ExplorerOptions.Parent = Explorer
	ExplorerOptions.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	ExplorerOptions.BorderSizePixel = 0
	ExplorerOptions.Size = UDim2.new(1, 0, 0, 25)
	ExplorerOptions.ZIndex = 2

	Generate.Name = "Generate"
	Generate.Parent = ExplorerOptions
	Generate.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	Generate.BorderSizePixel = 0
	Generate.Position = UDim2.new(1, -50, 0, 0)
	Generate.Size = UDim2.new(0, 25, 0, 25)
	Generate.ZIndex = 2
	Generate.Image = "rbxassetid://6875932153"

	Back.Name = "Back"
	Back.Parent = ExplorerOptions
	Back.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	Back.BorderSizePixel = 0
	Back.Size = UDim2.new(0, 25, 0, 25)
	Back.ZIndex = 2
	Back.ImageColor3 = Color3.fromRGB(120, 120, 120)
	Back.Image = "rbxassetid://6875665107"

	Forward.Name = "Forward"
	Forward.Parent = ExplorerOptions
	Forward.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	Forward.BorderSizePixel = 0
	Forward.Position = UDim2.new(0, 25, 0, 0)
	Forward.Size = UDim2.new(0, 25, 0, 25)
	Forward.ZIndex = 2
	Forward.ImageColor3 = Color3.fromRGB(120, 120, 120)
	Forward.Image = "rbxassetid://6875803625"

	Refresh.Name = "Refresh"
	Refresh.Parent = ExplorerOptions
	Refresh.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	Refresh.BorderSizePixel = 0
	Refresh.Position = UDim2.new(1, -25, 0, 0)
	Refresh.Size = UDim2.new(0, 25, 0, 25)
	Refresh.ZIndex = 2
	Refresh.Image = "rbxassetid://7203691992"

	Path.Name = "Path"
	Path.Parent = ExplorerOptions
	Path.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Path.BackgroundTransparency = 1.000
	Path.ClipsDescendants = true
	Path.Position = UDim2.new(0, 50, 0, 0)
	Path.Size = UDim2.new(1, -100, 0, 25)

	PathParts.Name = "PathParts"
	PathParts.Parent = Path
	PathParts.Active = true
	PathParts.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	PathParts.ScrollBarThickness = 0
	PathParts.BorderSizePixel = 0
	PathParts.Size = UDim2.new(1, 0, 0, 25)

	PathLayout.Name = "Layout"
	PathLayout.Parent = PathParts
	PathLayout.FillDirection = Enum.FillDirection.Horizontal
	PathLayout.SortOrder = Enum.SortOrder.LayoutOrder
	PathLayout.Padding = UDim.new(0, 1)

	AbsolutePath.Name = "AbsolutePath"
	AbsolutePath.Parent = Path
	AbsolutePath.Active = true
	AbsolutePath.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	AbsolutePath.ScrollBarThickness = 2
	AbsolutePath.Visible = false
	AbsolutePath.BorderSizePixel = 0
	AbsolutePath.Size = UDim2.new(1, 0, 0, 25)

	AbsolutePathInput.Name = "AbsolutePathInput"
	AbsolutePathInput.Parent = AbsolutePath
	AbsolutePathInput.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	AbsolutePathInput.BackgroundTransparency = 1
	AbsolutePathInput.ClearTextOnFocus = false
	AbsolutePathInput.BorderSizePixel = 0
	AbsolutePathInput.Position = UDim2.new(0, 5, 0, 0)
	AbsolutePathInput.Size = UDim2.new(1, -5, 0, 25)
	AbsolutePathInput.Font = Enum.Font.SourceSans
	AbsolutePathInput.PlaceholderText = "Script path [Ex: game.Players.LocalPlayer.PlayerScripts.LocalScript]"
	AbsolutePathInput.Text = ""
	AbsolutePathInput.TextColor3 = Color3.fromRGB(233, 233, 233)
	AbsolutePathInput.TextSize = 14
	AbsolutePathInput.TextXAlignment = Enum.TextXAlignment.Left

	ExplorerDropShadow.Name = "DropShadow"
	ExplorerDropShadow.Parent = Explorer
	ExplorerDropShadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ExplorerDropShadow.BorderSizePixel = 0
	ExplorerDropShadow.Position = UDim2.new(0, 0, 0, -4)
	ExplorerDropShadow.Size = UDim2.new(1, 5, 1, 8)
	ExplorerDropShadow.Style = Enum.FrameStyle.DropShadow

	ValueTypes.Name = "ValueTypes"
	ValueTypes.Parent = root
	ValueTypes.Active = true
	ValueTypes.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	ValueTypes.BorderSizePixel = 0
	ValueTypes.Position = UDim2.new(1, -150, 0, 0)
	ValueTypes.Size = UDim2.new(0, 150, 1, 0)
	ValueTypes.ZIndex = 0
	ValueTypes.BottomImage = "rbxassetid://6721574480"
	ValueTypes.CanvasSize = UDim2.new(0, 0, 0, 0)
	ValueTypes.MidImage = "rbxassetid://6721574480"
	ValueTypes.ScrollBarThickness = 4
	ValueTypes.TopImage = "rbxassetid://6721574480"

	ValueTypesLayout.Name = "Layout"
	ValueTypesLayout.Parent = ValueTypes
	ValueTypesLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ValueTypesLayout.Padding = UDim.new(0, 1)

	PathRecyclerHandle.Name = "PathRecyclerHandle"
	PathRecyclerHandle.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	PathRecyclerHandle.BorderSizePixel = 1
	PathRecyclerHandle.BorderColor3 = Color3.fromRGB(30, 136, 229)

	local explorerPath = {}
	local valueTypeInstances = {}
	local selectedValues = {}
	local pathParts = {}
	local pathDepth = 0

	local configurePathValue;
	local updateValueTypes;
	local selectValueType;
	local selectedScript;
	local selectedValueType;

	local scriptsAdapter = Adapters.Scripts()
	local scriptsRecycler = main.modules.Library:RecyclerFrame(ScriptsList, UDim2.new(0, 0, 0, 25), UDim2.new(1, 0, 1, -25), scriptsAdapter)

	local explorerAdapter = Adapters.Explorer()
	local explorerRecycler = main.modules.Library:RecyclerFrame(Explorer, UDim2.new(0, 0, 0, 25), UDim2.new(1, 0, 1, -25), explorerAdapter)

	local pathAdapter = Adapters.Explorer()
	local pathRecycler = main.modules.Library:RecyclerFrame(PathRecyclerHandle, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), pathAdapter)

	local generateOptions = main.modules.Library:ContextMenu(Generate, window.__Instance, UDim2.new(-1, 0, 1, 0), {"Step by step output", "Compact output"}, function(option)
		local compactOutput, stepOutput, env = generateScript(explorerPath, pathDepth)
		local isCompact = option == "Compact output"
		local valuesOutput = "\n"

		local path = explorerPath[pathDepth]
		local isDebugValue = type(path.Value) == "function" and path.Type[3] ~= "getfenv"
		local setter = path.Type[3]:sub(1, -2):gsub("get", "set")

		local hasUnknownValue = false
		env = isCompact and "env" or env

		local count = 0
		local useSelection = #selectedValues > 0
		for i,v in pairs(path.Type[2](path.Value)) do
			count += 1
			if i ~= returnFromModule and (not useSelection or selectedValues[count] ~= nil) then
				local fixedIndex = utils:fixIndex(i)
				local value = utils:stringify(v)
				if value == nil then
					hasUnknownValue = true
					value = (isDebugValue and "values" or env) .. fixedIndex
				end
				if isDebugValue then
					valuesOutput = valuesOutput .. ("\n%s(%s, %s, %s)"):format(setter, env, type(i) == "number" and i or '"' .. tostring(i) .. '"', value)
				else
					valuesOutput = valuesOutput .. ("\n%s%s = %s"):format(env, fixedIndex, value)
				end
			end
		end

		if hasUnknownValue then
			if path.Type[1] == "Table Entries" then
				valuesOutput = "local values = " .. env .. valuesOutput
			else
				valuesOutput = ("\n\nlocal values = %s(%s)"):format(path.Type[3], env) .. valuesOutput
			end
		end

		local initalPath = explorerPath[1]
		local wMark = waterMark

		if initalPath.Type[1] == "Garbage" then
			wMark = wMark .. filterGarbageRawFunc .. "\n\n"
		end

		setclipboard(wMark .. "local env = " .. (isCompact and compactOutput or stepOutput) .. valuesOutput)
	end)

	local function refreshValues()
		local path = explorerPath[pathDepth]
		local valueType = typeof(path.Value)

		updateValueTypes(valueTypes[valueType == "Instance" and path.Value.ClassName or valueType])
		selectValueType(path.Type)

		if path.ScrollPosition ~= nil then
			explorerRecycler.__Instance.CanvasPosition = path.ScrollPosition
		end
	end

	local function updatePathLayout()
		local contentSize = PathLayout.AbsoluteContentSize
		local containerSize = utils:scaleToOffset(Path, UDim2.new(1, 0, 0, 0))
		PathParts.CanvasSize = UDim2.new(0, math.max(contentSize.X + 70, containerSize.X.Offset), 0, 0)
		PathParts.CanvasPosition = Vector2.new(contentSize.X + 70, 0)
	end
	
	local function setPathDepth(depth, refresh)
		pathDepth = depth
		refresh = refresh == nil and true
		
		--// Update path parts
		if #pathParts > 0 then
			for i = pathDepth + 1, #pathParts do
				pathParts[i]:Destroy()
				pathParts[i] = nil
			end
		end

		for depth = 1, pathDepth do
			local part = pathParts[depth]

			if part == nil then
				local pathPart = explorerPath[depth]
				part = createPathPart(pathPart)

				part.Listener.MouseButton1Click:Connect(function()
					setPathDepth(depth)
				end)
				part.Arrow.MouseButton1Click:Connect(function()
					local absPos = part.Arrow.AbsolutePosition
					local values = pathPart.Type[2](pathPart.Value)
					local size = utils:getSize(values)

					if size > 0 then
						PathRecyclerHandle.Parent = window.__Instance
						PathRecyclerHandle.Position = UDim2.new(0, absPos.X - 10, 0, absPos.Y + 25)
						PathRecyclerHandle.Size = UDim2.new(0, 300, 0, math.min(size * 26, 350))

						local data = {}
						for i,v in pairs(values) do
							data[#data+1] = { Index=i, Value=v, Configure=configurePathValue, PathDepth=depth }
						end

						pathAdapter.Data = data
						pathRecycler:NotifyDataChange()
					end
				end)

				part.Parent = PathParts
				pathParts[depth] = part
			end

			local textBounds = utils:getBounds(part.Listener)
			local showArrow = depth < pathDepth

			part.Arrow.Visible = showArrow
			part.Size = UDim2.new(0, textBounds.X + (showArrow and 21 or 8), 0, 25)
			part.Listener.Size = UDim2.new(0, textBounds.X + 8, 0, 25)
		end

		updatePathLayout()
		if refresh then
			refreshValues()
		end

		Forward.ImageColor3 = pathDepth == #explorerPath and Color3.fromRGB(120, 120, 120) or Color3.new(1, 1, 1)
		Back.ImageColor3 = pathDepth == 1 and Color3.fromRGB(120, 120, 120) or Color3.new(1, 1, 1)
	end

	local function storePath(index, type, value, script)
		explorerPath[pathDepth + 1] = { Index=index, Type=type, Value=value, Script=script }
		setPathDepth(pathDepth + 1)
	end

	local lastSelectedValueIndex = 0
	local function selectValue(valueItem, controlHeld, shiftHeld)
		local index = valueItem.LayoutOrder
		local text = valueItem.Index.Text
		if not controlHeld then
			for i,v in pairs(selectedValues) do
				if i ~= index and (not shiftHeld or i ~= lastSelectedValueIndex) then
					selectedValues[i] = nil
					if type(v) == "userdata" then
						v.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
						v.Index.Text = v.Index.Text:gsub('color="#ffffff"', 'color="#1e88e5"')
					end
				end
			end
		end
		if shiftHeld then
			local min = math.min(index, lastSelectedValueIndex)
			local max = math.max(index, lastSelectedValueIndex)
			for i,v in pairs(explorerAdapter.Data) do
				if i > min and i < max then
					local item = explorerRecycler.VisibleItems[i]
					selectedValues[i] = item or true
					if item ~= nil then
						item.BackgroundColor3 = selectionColors.Default
						item.Index.Text = item.Index.Text:gsub('color="#1e88e5"', 'color="#ffffff"')
					end
				end
			end
		end
		selectedValues[index] = (not controlHeld or selectedValues[index] == nil) and valueItem or nil
		valueItem.Index.Text = selectedValues[index] and text:gsub('color="#1e88e5"', 'color="#ffffff"') or text:gsub('color="#ffffff"', 'color="#1e88e5"')
		lastSelectedValueIndex = index
	end

	function configurePathValue(data, valueItem)
		local types = valueTypes[typeof(data.Value)]
		local type = types and types[1] or nil
		
		local strIndex = tostring(data.Index)

		if type ~= nil then
			valueItem.MouseButton1Click:Connect(function()
				--// Remove parts that may no exist anymore
				for i = data.PathDepth + 1, #explorerPath do
					explorerPath[i] = nil
				end

				setPathDepth(data.PathDepth, false)
				explorerPath[pathDepth].ScrollPosition = explorerRecycler.__Instance.CanvasPosition
				storePath(data.Index, type, data.Value)
				PathRecyclerHandle.Parent = nil
			end)
		end
	end

	local function configureValue(data, valueItem)
		local types = valueTypes[typeof(data.Value)]
		local type = types and types[1] or nil
		local parent = explorerPath[pathDepth]

		local timeDelay = 0.4
		local lastClick = 0

		valueItem.MouseButton1Click:Connect(function()
			if (tick() - lastClick) <= timeDelay and type ~= nil then
				explorerPath[pathDepth].ScrollPosition = explorerRecycler.__Instance.CanvasPosition
				storePath(data.Index, type, data.Value)
			else
				selectValue(valueItem, UIS:IsKeyDown(Enum.KeyCode.LeftControl), UIS:IsKeyDown(Enum.KeyCode.LeftShift))
			end
			lastClick = tick()
		end)

		utils:setHovering(valueItem, {"BackgroundColor3"}, function()
			local isSelected = selectedValues[valueItem.LayoutOrder] ~= nil
			return {
				Default=isSelected and selectionColors.Default or Color3.fromRGB(33, 33, 33),
				ClickStarted=isSelected and selectionColors.Started or Color3.fromRGB(44, 44, 44),
				ClickEnded=isSelected and selectionColors.Hovering or Color3.fromRGB(33, 33, 33),
				Hovering=isSelected and selectionColors.Hovering or Color3.fromRGB(40, 40, 40)
			}
		end, 0.07)
	end

	function updateValueTypes(types)
		for i,v in pairs(valueTypeInstances) do
			v.Visible = false
		end
		for i,type in pairs(types) do
			local typeInstance = valueTypeInstances[type[1]]
			if typeInstance == nil then
				typeInstance = createValueType(type[1])
				valueTypeInstances[type[1]] = typeInstance

				typeInstance.Parent = ValueTypes
				typeInstance.MouseButton1Click:Connect(function()
					selectValueType(type)
				end)

				utils:setHovering(typeInstance, {"BackgroundColor3"}, function()
					local isSelected = selectedValueType.Type[1] == type[1]
					local success = selectedValueType.Success
					return {
						Default=isSelected and (success and selectionColors.Default or Color3.new(0.5, 0, 0)) or Color3.fromRGB(33, 33, 33),
						ClickStarted=isSelected and (success and selectionColors.Started or Color3.new(0.5, 0, 0)) or Color3.fromRGB(44, 44, 44),
						ClickEnded=isSelected and (success and selectionColors.Hovering or Color3.new(0.5, 0, 0)) or Color3.fromRGB(33, 33, 33),
						Hovering=isSelected and (success and selectionColors.Hovering or Color3.new(0.5, 0, 0)) or Color3.fromRGB(40, 40, 40)
					}
				end, 0.07)
			end
			
			typeInstance.LayoutOrder = i
			typeInstance.Count.Text = "..."
			typeInstance.Visible = true

			--// Count values
			coroutine.wrap(function()
				local path = explorerPath[pathDepth]
				local success, size = pcall(function()
					return utils:getSize(type[2](path.Value, true))
				end)
				
				typeInstance.Count.Text = success and tostring(size) or "?"
				typeInstance.TypeName.TextColor3 = success and Color3.new(1, 1, 1) or Color3.new(1, 0, 0)
			end)()
		end
	end

	function selectValueType(type)
		local data = {}
		local selected = valueTypeInstances[type[1]]
		local pathInfo = explorerPath[pathDepth]

		if selectedValueType ~= nil and (selectedValueType.Path ~= pathInfo or selectedValueType.Type ~= type) then
			selectedValues = {}
			lastSelectedValueIndex = 0
		end

		local success, values = pcall(function()
			return type[2](pathInfo.Value)
		end)

		success = success and values ~= nil
		selectedValueType = { Type=type, Success=success, Path=pathInfo }

		if success then
			for i,v in pairs(values) do
				data[#data+1] = { Index=i, Value=v, Configure=configureValue }
			end
			selected.TypeName.TextColor3 = Color3.new(1, 1, 1)
		end

		for i,v in pairs(valueTypeInstances) do
			if v ~= selected then
				v.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			elseif math.round(v.BackgroundColor3.R*255) == 33 then
				v.BackgroundColor3 = success and selectionColors.Default or Color3.new(0.5, 0, 0)
			end
		end

		pathInfo.Type = type
		explorerAdapter.Data = data
		explorerRecycler:NotifyDataChange()

		for i,v in pairs(selectedValues) do
			local item = explorerRecycler.VisibleItems[i]
			selectedValues[i] = item or true
			item.BackgroundColor3 = selectionColors.Default
		end
	end

	local function getScripts()
		local scripts = {}
		for i,script in pairs(game:GetDescendants()) do
			if (script:IsA("LocalScript") or script:IsA("ModuleScript")) and isValidScript(script) then
				scripts[#scripts+1] = {
					Text=script.Name:gsub("\n", ""),
					Type=script.ClassName,
					Script=script,
					OnClick=function(item)
						--// Reset path
						setPathDepth(0, false)
						explorerPath = {}

						--// Start of path
						storePath(nil, valueTypes[script.ClassName][1], script, script)
						
						if selectedScript ~= nil and selectedScript ~= item then
							selectedScript.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
							selectedScript.ScriptName.Text = selectedScript.ScriptName.Text:gsub('color="#ffffff"', 'color="#1e88e5"')
						end
						item.ScriptName.Text = item.ScriptName.Text:gsub('color="#1e88e5"', 'color="#ffffff"')
						selectedScript = item
					end
				}
			end
		end
		return scripts
	end

	local function navigate(i)
		if #explorerPath == 0 then
			return 
		end
		setPathDepth(math.min(math.max(1, pathDepth + i), #explorerPath))
	end

	--// Connections
	local function onRenderValue(self, position, item)
		local data = self.Data[position]
		local index = tostring(data.Index)
		if type(data.Value) == "function" and type(data.Index) == "number" then
			local funcName = getinfo(data.Value).name
			item.Index.Text = index .. (#funcName > 0 and (' <font color="#1e88e5">[' .. funcName .. "]</font>") or "")
		else
			item.Index.Text = index
		end

		if self == explorerAdapter and selectedValues[position] ~= nil then
			selectedValues[position] = item
			item.BackgroundColor3 = selectionColors.Default
			item.Index.Text = item.Index.Text:gsub('color="#1e88e5"', 'color="#ffffff"')
		end
	end

	explorerAdapter.RenderAgain = true
	explorerAdapter.OnRenderItem = onRenderValue
	pathAdapter.OnRenderItem = onRenderValue

	scriptsAdapter.OnRenderItem = function(self, position, item, searchKeyword)
		local text = self.Data[position].Text
		if searchKeyword then
			local i = text:lower():find(searchKeyword)
			local color = selectedScript == item and "ffffff" or "1e88e5"
			item.ScriptName.Text = text:sub(1, i - 1) .. ('<font color="#%s">%s</font>'):format(color, text:sub(i, i + #searchKeyword - 1)) .. text:sub(i + #searchKeyword)
		else
			item.ScriptName.Text = text
		end

		utils:setHovering(item, {"BackgroundColor3"}, function()
			local isSelected = selectedScript == item
			return {
				Default=isSelected and selectionColors.Default or Color3.fromRGB(33, 33, 33),
				ClickStarted=isSelected and selectionColors.Started or Color3.fromRGB(44, 44, 44),
				ClickEnded=isSelected and selectionColors.Hovering or Color3.fromRGB(33, 33, 33),
				Hovering=isSelected and selectionColors.Hovering or Color3.fromRGB(40, 40, 40)
			}
		end, 0.07)
	end
	
	Back.MouseButton1Click:Connect(function()
		navigate(-1)
	end)

	Forward.MouseButton1Click:Connect(function()
		navigate(1)
	end)

	PathParts.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			local serializedPath = serialize(explorerPath, pathDepth)

			PathParts.Visible = false
			AbsolutePath.Visible = true

			AbsolutePathInput:CaptureFocus()
			AbsolutePathInput.Text = serializedPath
			AbsolutePathInput.CursorPosition = #serializedPath + 1

			local textBounds = utils:getBounds(AbsolutePathInput).X + 5
			AbsolutePath.CanvasSize = UDim2.new(0, textBounds, 0, 0)
			AbsolutePath.CanvasPosition = Vector2.new(textBounds, 0)
		end
	end)

	AbsolutePathInput.FocusLost:Connect(function()
		local success, expPath = pcall(deserialize, AbsolutePathInput.Text)

		if success then
			explorerPath = expPath
			setPathDepth(#expPath)
		else
			warn(expPath)
		end

		PathParts.Visible = true
		AbsolutePath.Visible = false
	end)

	SearchBox.Changed:Connect(function(p)
		if p == "Text" then
			local text = SearchBox.Text
			scriptsRecycler:Search(text~="" and text or nil)
		end
	end)

	PathLayout.Changed:Connect(function(p)
		if p == "AbsoluteContentSize" then
			updatePathLayout()
		end
	end)

	root.Changed:Connect(function(p)
		if p == "AbsoluteSize" then
			updatePathLayout()
		end
	end)

	RefreshScripts.MouseButton1Click:Connect(function()
		scriptsAdapter.Data = getScripts()
		scriptsRecycler:NotifyDataChange()

		if selectedScript ~= nil then
			selectedScript = scriptsRecycler:GetItem(selectedScript.LayoutOrder)
			selectedScript.BackgroundColor3 = selectionColors.Default
			selectedScript.ScriptName.Text = selectedScript.ScriptName.Text:gsub('color="#1e88e5"', 'color="#ffffff"')
		end
	end)
	
	Generate.MouseButton1Click:Connect(generateOptions.Show)
	Refresh.MouseButton1Click:Connect(refreshValues)

	tool:AddConnection(UIS.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.Keyboard and PathRecyclerHandle.Parent ~= nil and not utils:inArea(PathRecyclerHandle) then
			PathRecyclerHandle.Parent = nil
		end
	end))

	scriptsAdapter.Data = getScripts()
	scriptsRecycler:NotifyDataChange()
end

function Adapters:Scripts(data)
	return {
		Data=data or {},
		FixedSize=25,
		Padding=1,
		OnCreateItem=function(self, position)
			local Script = Instance.new("TextButton")
			local ScriptName = Instance.new("TextLabel")
			local ScriptIcon = Instance.new("ImageLabel")

			local data = self.Data[position]
			local isModule = data.Type == "ModuleScript"
	
			Script.Name = "Script"
			Script.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			Script.BorderSizePixel = 0
			Script.Size = UDim2.new(1, 0, 0, 25)
			Script.ZIndex = 2
			Script.AutoButtonColor = false
			Script.Font = Enum.Font.SourceSans
			Script.Text = ""
			Script.TextColor3 = Color3.fromRGB(255, 255, 255)
			Script.TextSize = 14.000

			ScriptName.Name = "ScriptName"
			ScriptName.Parent = Script
			ScriptName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScriptName.BackgroundTransparency = 1.000
			ScriptName.Position = UDim2.new(0, 25, 0, 0)
			ScriptName.Size = UDim2.new(1, -25, 1, 0)
			ScriptName.ZIndex = 2
			ScriptName.RichText = true
			ScriptName.Font = Enum.Font.SourceSans
			ScriptName.Text = data.Text
			ScriptName.TextColor3 = Color3.fromRGB(255, 255, 255)
			ScriptName.TextSize = 14.000
			ScriptName.TextXAlignment = Enum.TextXAlignment.Left

			ScriptIcon.Name = "ScriptIcon"
			ScriptIcon.Parent = Script
			ScriptIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ScriptIcon.BackgroundTransparency = 1.000
			ScriptIcon.Position = UDim2.new(0, 4, 0, 5)
			ScriptIcon.Size = UDim2.new(0, 16, 0, 16)
			ScriptIcon.ZIndex = 2
			ScriptIcon.Image = "rbxassetid://6873499343"
			ScriptIcon.ImageRectOffset = Vector2.new(isModule and 64 or 0, isModule and 128 or 32)
			ScriptIcon.ImageRectSize = Vector2.new(16, 16)
			ScriptIcon.ScaleType = Enum.ScaleType.Crop
			ScriptIcon.SliceScale = 0.000
			ScriptIcon.TileSize = UDim2.new(0, 16, 0, 16)
	
			Script.MouseButton1Click:Connect(function()
				data.OnClick(Script)
			end)
	
			return Script
		end,
		OnSearch=function(self, keyword)
			return utils:filter(self.Data, function(i)
				return i.Text:lower():find(keyword)
			end, true)
		end
	}
end

function Adapters:Explorer(data)
	return {
		Data=data or {},
		FixedSize=25,
		Padding=1,
		OnCreateItem=function(self, position)
			local data = self.Data[position]

			local ValueItem = Instance.new("TextButton")
			local Icon = Instance.new("ImageLabel")
			local Index = Instance.new("TextLabel")
			local Value = Instance.new("TextLabel")
			local Separator = Instance.new("Frame")

			ValueItem.Name = "ValueItem"
			ValueItem.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
			ValueItem.BorderSizePixel = 0
			ValueItem.AutoButtonColor = false
			ValueItem.Size = UDim2.new(1, 0, 0, 25)
			ValueItem.Font = Enum.Font.SourceSans
			ValueItem.Text = ""
			ValueItem.TextColor3 = Color3.fromRGB(0, 0, 0)
			ValueItem.TextSize = 14.000

			Icon.Name = "Icon"
			Icon.Parent = ValueItem
			Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Icon.BackgroundTransparency = 1.000
			Icon.Position = UDim2.new(0, 4, 0, 5)
			Icon.Size = UDim2.new(0, 16, 0, 16)
			Icon.ZIndex = 2
			Icon.ImageRectOffset = Vector2.new(0, 32)
			Icon.ImageRectSize = Vector2.new(16, 16)
			Icon.ScaleType = Enum.ScaleType.Crop
			Icon.SliceScale = 0.000
			Icon.TileSize = UDim2.new(0, 16, 0, 16)

			Index.Name = "Index"
			Index.Parent = ValueItem
			Index.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Index.BackgroundTransparency = 1.000
			Index.Position = UDim2.new(0, 25, 0, 0)
			Index.Size = UDim2.new(0.5, -25, 0, 25)
			Index.ClipsDescendants = true
			Index.Font = Enum.Font.SourceSans
			Index.Text = tostring(data.Index)
			Index.RichText = true
			Index.TextColor3 = Color3.fromRGB(255, 255, 255)
			Index.TextSize = 14.000
			Index.TextXAlignment = Enum.TextXAlignment.Left

			Value.Name = "Value"
			Value.Parent = ValueItem
			Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Value.BackgroundTransparency = 1.000
			Value.Position = UDim2.new(0.5, 10, 0, 0)
			Value.Size = UDim2.new(0.5, -10, 0, 25)
			Value.Font = Enum.Font.SourceSans
			Value.Text = table.concat(tostring(data.Value):split("\n"), " ")
			Value.TextColor3 = Color3.fromRGB(255, 255, 255)
			Value.TextSize = 14.000
			Value.TextXAlignment = Enum.TextXAlignment.Left

			Separator.Name = "Separator"
			Separator.Parent = ValueItem
			Separator.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			Separator.BorderSizePixel = 0
			Separator.Position = UDim2.new(0.5, 0, 0, 0)
			Separator.Size = UDim2.new(0, 1, 0, 25)

			data.Configure(data, ValueItem)
			return ValueItem
		end
	}
end

function EnvironmentBrowser:Initialize(window)
	local content = Instance.new("Frame")

	content.Name = "Content"
	content.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
	content.Size = UDim2.new(1, 0, 1, 0)
	content.Position = UDim2.new(0, 0, 0, 0)

	local tool = {
		Name=EnvironmentBrowser.Tool.Name,
		Content=content,
		Connections={}
	}

	function tool:AddConnection(connection)
		table.insert(tool.Connections, connection)
	end

	function tool:Terminate()
		for i,connection in pairs(tool.Connections) do
			connection:Disconnect()
		end
	end

	Load(window, content, tool)
	return tool
end

return EnvironmentBrowser