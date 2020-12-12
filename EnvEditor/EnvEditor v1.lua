--[[
	Date of creation: 24/3/2019-24/6/2019 - I don't remember the exact date of creation, this is an assumption from old discord conversations.
	Creator: danisty§#9161
	
	Info: This version was created for only reason of learning and mostly my laziness, some things require the use of keys combinations which I may write down later.
	A newer version is coming probably by new year!
]]

local EnvEditor = Instance.new("ScreenGui")
local TitleFrm = Instance.new("Frame")
local TitleTxt = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton")
local MinBtn = Instance.new("TextButton")
local BodyFrm = Instance.new("Frame")
local PathFrm = Instance.new("Frame")
local PathTxtB = Instance.new("TextBox")
local LoadBtn = Instance.new("TextButton")
local EraseBtn = Instance.new("TextButton")
local PathTxt = Instance.new("TextLabel")
local ScriptsFrm = Instance.new("Frame")
local ScriptsSFrm = Instance.new("ScrollingFrame")
local ScriptBtn = Instance.new("TextButton")
local ScriptScrVl = Instance.new("ObjectValue")
local ScriptsTxt = Instance.new("TextLabel")
local RefreshBtn = Instance.new("TextButton")
local VisSBFrm = Instance.new("Frame")
local UpValuesFrm = Instance.new("Frame")
local UpValuesTxt = Instance.new("TextLabel")
local UpValuesSFrm = Instance.new("ScrollingFrame")
local DetailsTable = Instance.new("Frame")
local TItemInfoVl = Instance.new("StringValue")
local TSelectedVl = Instance.new("BoolValue")
local TableBtn = Instance.new("TextButton")
local UVNameTxt = Instance.new("TextLabel")
local DetailsNormal = Instance.new("Frame")
local NItemInfoVl = Instance.new("StringValue")
local NSelectedVl = Instance.new("BoolValue")
local UVNameTxt_2 = Instance.new("TextLabel")
local NormalBtn = Instance.new("TextButton")
local CopyToCBBtn = Instance.new("TextButton")
local RFuncBtn = Instance.new("TextButton")
local BackBtn = Instance.new("TextButton")
local Vis2SBFrm = Instance.new("Frame")

EnvEditor.Name = "EnvEditor"
EnvEditor.Parent = game.CoreGui.RobloxGui
EnvEditor.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
EnvEditor.ResetOnSpawn = false

TitleFrm.Archivable = false
TitleFrm.Name = "TitleFrm"
TitleFrm.Parent = EnvEditor
TitleFrm.Active = true
TitleFrm.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
TitleFrm.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
TitleFrm.BorderSizePixel = 2
TitleFrm.Position = UDim2.new(0, 840, 0, 270)
TitleFrm.Size = UDim2.new(0, 500, 0, 20)
TitleFrm.Draggable = true

TitleTxt.Name = "TitleTxt"
TitleTxt.Parent = TitleFrm
TitleTxt.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
TitleTxt.BorderSizePixel = 0
TitleTxt.Size = UDim2.new(0, 89, 0, 20)
TitleTxt.Font = Enum.Font.SourceSansSemibold
TitleTxt.Text = " Environment v1"
TitleTxt.TextColor3 = Color3.new(0.658824, 0.658824, 0.658824)
TitleTxt.TextSize = 14
TitleTxt.TextXAlignment = Enum.TextXAlignment.Left

CloseBtn.Name = "CloseBtn"
CloseBtn.Parent = TitleFrm
CloseBtn.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
CloseBtn.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
CloseBtn.BorderSizePixel = 0
CloseBtn.Position = UDim2.new(0.959999979, 0, 0, 0)
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.Font = Enum.Font.SourceSans
CloseBtn.Text = "x"
CloseBtn.TextColor3 = Color3.new(0.658824, 0.658824, 0.658824)
CloseBtn.TextSize = 17

MinBtn.Name = "MinBtn"
MinBtn.Parent = TitleFrm
MinBtn.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
MinBtn.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
MinBtn.BorderSizePixel = 0
MinBtn.Position = UDim2.new(0.917999983, 0, 0, 0)
MinBtn.Size = UDim2.new(0, 20, 0, 20)
MinBtn.Font = Enum.Font.SourceSans
MinBtn.Text = "_"
MinBtn.TextColor3 = Color3.new(0.658824, 0.658824, 0.658824)
MinBtn.TextSize = 15
MinBtn.TextYAlignment = Enum.TextYAlignment.Top

BodyFrm.Archivable = false
BodyFrm.Name = "BodyFrm"
BodyFrm.Parent = TitleFrm
BodyFrm.BackgroundColor3 = Color3.new(0.133333, 0.133333, 0.133333)
BodyFrm.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
BodyFrm.BorderSizePixel = 2
BodyFrm.ClipsDescendants = true
BodyFrm.Position = UDim2.new(0, 0, 1, 2)
BodyFrm.Size = UDim2.new(0, 500, 0, 250)

PathFrm.Name = "PathFrm"
PathFrm.Parent = BodyFrm
PathFrm.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
PathFrm.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
PathFrm.BorderSizePixel = 2
PathFrm.Position = UDim2.new(0, 5, 0, 5)
PathFrm.Size = UDim2.new(0, 490, 0, 20)

PathTxtB.Name = "PathTxtB"
PathTxtB.Parent = PathFrm
PathTxtB.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
PathTxtB.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
PathTxtB.BorderSizePixel = 0
PathTxtB.Position = UDim2.new(0.0719999969, 3, 0, 0)
PathTxtB.Size = UDim2.new(0, 360, 0, 20)
PathTxtB.ClearTextOnFocus = false
PathTxtB.Font = Enum.Font.SourceSans
PathTxtB.PlaceholderColor3 = Color3.new(0.458824, 0.458824, 0.458824)
PathTxtB.PlaceholderText = "Example: game.Workspace.LocalScript"
PathTxtB.Text = ""
PathTxtB.TextColor3 = Color3.new(0.658824, 0.658824, 0.658824)
PathTxtB.TextSize = 14
PathTxtB.TextWrapped = true
PathTxtB.TextXAlignment = Enum.TextXAlignment.Left

LoadBtn.Name = "LoadBtn"
LoadBtn.Parent = PathFrm
LoadBtn.BackgroundColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
LoadBtn.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
LoadBtn.BorderSizePixel = 0
LoadBtn.Position = UDim2.new(0.857142866, 0, 0, 0)
LoadBtn.Size = UDim2.new(0, 70, 0, 20)
LoadBtn.Font = Enum.Font.SourceSansSemibold
LoadBtn.Text = "LOAD"
LoadBtn.TextColor3 = Color3.new(0.658824, 0.658824, 0.658824)
LoadBtn.TextSize = 14

EraseBtn.Name = "EraseBtn"
EraseBtn.Parent = PathFrm
EraseBtn.BackgroundColor3 = Color3.new(0.807843, 0, 0.0117647)
EraseBtn.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
EraseBtn.BorderSizePixel = 2
EraseBtn.Position = UDim2.new(0.800000012, 7, 0, 0)
EraseBtn.Size = UDim2.new(0, 20, 0, 20)
EraseBtn.Font = Enum.Font.SourceSansSemibold
EraseBtn.Text = "X"
EraseBtn.TextColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
EraseBtn.TextSize = 14

PathTxt.Name = "PathTxt"
PathTxt.Parent = PathFrm
PathTxt.BackgroundColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
PathTxt.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
PathTxt.BorderSizePixel = 0
PathTxt.Position = UDim2.new(-0.000526677351, 0, 0, 0)
PathTxt.Size = UDim2.new(0, 36, 0, 20)
PathTxt.Font = Enum.Font.SourceSansSemibold
PathTxt.Text = " PATH:"
PathTxt.TextColor3 = Color3.new(0.658824, 0.658824, 0.658824)
PathTxt.TextSize = 14
PathTxt.TextXAlignment = Enum.TextXAlignment.Left

ScriptsFrm.Name = "ScriptsFrm"
ScriptsFrm.Parent = BodyFrm
ScriptsFrm.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
ScriptsFrm.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
ScriptsFrm.BorderSizePixel = 2
ScriptsFrm.Position = UDim2.new(0.00999999978, 0, 0.128000006, 0)
ScriptsFrm.Size = UDim2.new(0, 120, 0, 190)

ScriptsSFrm.Name = "ScriptsSFrm"
ScriptsSFrm.Parent = ScriptsFrm
ScriptsSFrm.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
ScriptsSFrm.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
ScriptsSFrm.Position = UDim2.new(0, 0, 0.0579999425, 1)
ScriptsSFrm.Size = UDim2.new(0, 120, 0, 178)
ScriptsSFrm.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
ScriptsSFrm.CanvasSize = UDim2.new(0, 0, 0, 0)
ScriptsSFrm.ScrollBarThickness = 7
ScriptsSFrm.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
ScriptsSFrm.VerticalScrollBarInset = Enum.ScrollBarInset.Always

ScriptBtn.Name = "ScriptBtn"
ScriptBtn.Parent = ScriptsSFrm
ScriptBtn.BackgroundColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
ScriptBtn.BorderSizePixel = 0
ScriptBtn.Position = UDim2.new(0, 2, 0, 2)
ScriptBtn.Size = UDim2.new(0, 108, 0, 20)
ScriptBtn.Visible = false
ScriptBtn.Font = Enum.Font.SourceSans
ScriptBtn.Text = "LocalScript"
ScriptBtn.TextColor3 = Color3.new(0.658824, 0.658824, 0.658824)
ScriptBtn.TextSize = 14

ScriptScrVl.Name = "ScriptScrVl"
ScriptScrVl.Parent = ScriptBtn
ScriptScrVl.Value = nil

ScriptsTxt.Name = "ScriptsTxt"
ScriptsTxt.Parent = ScriptsFrm
ScriptsTxt.BackgroundColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
ScriptsTxt.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
ScriptsTxt.BorderSizePixel = 2
ScriptsTxt.Size = UDim2.new(0, 120, 0, 10)
ScriptsTxt.ZIndex = 2
ScriptsTxt.Font = Enum.Font.SourceSansSemibold
ScriptsTxt.Text = "SCRIPTS"
ScriptsTxt.TextColor3 = Color3.new(0.658824, 0.658824, 0.658824)
ScriptsTxt.TextSize = 12

RefreshBtn.Name = "RefreshBtn"
RefreshBtn.Parent = ScriptsFrm
RefreshBtn.BackgroundColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
RefreshBtn.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
RefreshBtn.BorderSizePixel = 0
RefreshBtn.Position = UDim2.new(0.0170000009, -4, 1.04499996, -4)
RefreshBtn.Size = UDim2.new(0, 124, 0, 20)
RefreshBtn.Font = Enum.Font.SourceSansSemibold
RefreshBtn.Text = "REFRESH"
RefreshBtn.TextColor3 = Color3.new(0.658824, 0.658824, 0.658824)
RefreshBtn.TextSize = 14

VisSBFrm.Name = "VisSBFrm"
VisSBFrm.Parent = ScriptsFrm
VisSBFrm.BackgroundColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
VisSBFrm.BorderSizePixel = 0
VisSBFrm.Position = UDim2.new(0.967000008, -4, 0, 0)
VisSBFrm.Size = UDim2.new(0, 1, 0, 190)

UpValuesFrm.Name = "UpValuesFrm"
UpValuesFrm.Parent = BodyFrm
UpValuesFrm.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
UpValuesFrm.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
UpValuesFrm.BorderSizePixel = 2
UpValuesFrm.Position = UDim2.new(0.25999999, 2, 0.128000006, 0)
UpValuesFrm.Size = UDim2.new(0, 363, 0, 190)

UpValuesTxt.Name = "UpValuesTxt"
UpValuesTxt.Parent = UpValuesFrm
UpValuesTxt.BackgroundColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
UpValuesTxt.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
UpValuesTxt.BorderSizePixel = 2
UpValuesTxt.Size = UDim2.new(0, 363, 0, 10)
UpValuesTxt.ZIndex = 2
UpValuesTxt.Font = Enum.Font.SourceSansSemibold
UpValuesTxt.Text = "UP VALUES"
UpValuesTxt.TextColor3 = Color3.new(0.658824, 0.658824, 0.658824)
UpValuesTxt.TextSize = 12

UpValuesSFrm.Name = "UpValuesSFrm"
UpValuesSFrm.Parent = UpValuesFrm
UpValuesSFrm.BackgroundColor3 = Color3.new(0.117647, 0.117647, 0.117647)
UpValuesSFrm.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
UpValuesSFrm.BorderSizePixel = 0
UpValuesSFrm.Position = UDim2.new(0, 0, 0.0710526332, -1)
UpValuesSFrm.Size = UDim2.new(0, 363, 0, 177)
UpValuesSFrm.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
UpValuesSFrm.CanvasSize = UDim2.new(0, 0, 0, 176)
UpValuesSFrm.HorizontalScrollBarInset = Enum.ScrollBarInset.Always
UpValuesSFrm.ScrollBarThickness = 7
UpValuesSFrm.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
UpValuesSFrm.VerticalScrollBarInset = Enum.ScrollBarInset.Always

DetailsTable.Name = "DetailsTable"
DetailsTable.Parent = UpValuesSFrm
DetailsTable.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
DetailsTable.BorderSizePixel = 0
DetailsTable.Position = UDim2.new(0, 2, 0, 1)
DetailsTable.Size = UDim2.new(0, 351, 0, 20)
DetailsTable.Visible = false

TItemInfoVl.Name = "TItemInfoVl"
TItemInfoVl.Parent = DetailsTable
TItemInfoVl.Value = ""

TSelectedVl.Name = "TSelectedVl"
TSelectedVl.Parent = DetailsTable
TSelectedVl.Value = false

TableBtn.Name = "TableBtn"
TableBtn.Parent = DetailsTable
TableBtn.BackgroundColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
TableBtn.BorderSizePixel = 0
TableBtn.Position = UDim2.new(0, 231, 0, 0)
TableBtn.Size = UDim2.new(0, 120, 0, 20)
TableBtn.Font = Enum.Font.SourceSans
TableBtn.Text = "table: 2DEB3C4"
TableBtn.TextColor3 = Color3.new(0.658824, 0.658824, 0.658824)
TableBtn.TextSize = 14

UVNameTxt.Name = "UVNameTxt"
UVNameTxt.Parent = DetailsTable
UVNameTxt.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
UVNameTxt.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
UVNameTxt.Position = UDim2.new(0, 1, 0, 1)
UVNameTxt.Size = UDim2.new(0, 229, 0, 18)
UVNameTxt.Font = Enum.Font.SourceSans
UVNameTxt.Text = "Data"
UVNameTxt.TextColor3 = Color3.new(0.658824, 0.658824, 0.658824)
UVNameTxt.TextSize = 14
UVNameTxt.ZIndex = 2

DetailsNormal.Name = "DetailsNormal"
DetailsNormal.Parent = UpValuesSFrm
DetailsNormal.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
DetailsNormal.BorderSizePixel = 0
DetailsNormal.Position = UDim2.new(0, 2, 0, 1)
DetailsNormal.Size = UDim2.new(0, 351, 0, 20)
DetailsNormal.Visible = false

NItemInfoVl.Name = "NItemInfoVl"
NItemInfoVl.Parent = DetailsNormal
NItemInfoVl.Value = ""

NSelectedVl.Name = "NSelectedVl"
NSelectedVl.Parent = DetailsNormal
NSelectedVl.Value = false

UVNameTxt_2.Name = "UVNameTxt"
UVNameTxt_2.Parent = DetailsNormal
UVNameTxt_2.BackgroundColor3 = Color3.new(0.0823529, 0.0823529, 0.0823529)
UVNameTxt_2.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
UVNameTxt_2.Position = UDim2.new(0, 1, 0, 1)
UVNameTxt_2.Size = UDim2.new(0, 229, 0, 18)
UVNameTxt_2.Font = Enum.Font.SourceSans
UVNameTxt_2.Text = "Damage"
UVNameTxt_2.TextColor3 = Color3.new(0.658824, 0.658824, 0.658824)
UVNameTxt_2.TextSize = 14
UVNameTxt_2.ZIndex = 2

NormalBtn.Name = "NormalBtn"
NormalBtn.Parent = DetailsNormal
NormalBtn.BackgroundColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
NormalBtn.BorderSizePixel = 0
NormalBtn.Position = UDim2.new(0, 231, 0, 0)
NormalBtn.Size = UDim2.new(0, 120, 0, 20)
NormalBtn.Font = Enum.Font.SourceSans
NormalBtn.Text = "43"
NormalBtn.TextColor3 = Color3.new(0.658824, 0.658824, 0.658824)
NormalBtn.AutoButtonColor = false
NormalBtn.TextSize = 14

CopyToCBBtn.Name = "CopyToCBBtn"
CopyToCBBtn.Parent = UpValuesFrm
CopyToCBBtn.BackgroundColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
CopyToCBBtn.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
CopyToCBBtn.BorderSizePixel = 0
CopyToCBBtn.Position = UDim2.new(0.216000006, 1, 1.04499972, -4)
CopyToCBBtn.Size = UDim2.new(0, 205, 0, 20)
CopyToCBBtn.Font = Enum.Font.SourceSansSemibold
CopyToCBBtn.Text = "COPY VALUES TO CLIPBOARD"
CopyToCBBtn.TextColor3 = Color3.new(0.658824, 0.658824, 0.658824)
CopyToCBBtn.TextSize = 14

RFuncBtn.Name = "RFuncBtn"
RFuncBtn.Parent = UpValuesFrm
RFuncBtn.BackgroundColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
RFuncBtn.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
RFuncBtn.BorderSizePixel = 0
RFuncBtn.Position = UDim2.new(0.216000006, 209, 1.04499972, -4)
RFuncBtn.Size = UDim2.new(0, 78, 0, 20)
RFuncBtn.Font = Enum.Font.SourceSansSemibold
RFuncBtn.Text = "REFRESH"
RFuncBtn.TextColor3 = Color3.new(0.658824, 0.658824, 0.658824)
RFuncBtn.TextSize = 14

BackBtn.Name = "BackBtn"
BackBtn.Parent = UpValuesFrm
BackBtn.BackgroundColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
BackBtn.BorderColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
BackBtn.BorderSizePixel = 0
BackBtn.Position = UDim2.new(0.00499999989, -4, 1.04499972, -4)
BackBtn.Size = UDim2.new(0, 78, 0, 20)
BackBtn.Font = Enum.Font.SourceSansSemibold
BackBtn.Text = "BACK"
BackBtn.TextColor3 = Color3.new(0.658824, 0.658824, 0.658824)
BackBtn.TextSize = 14

Vis2SBFrm.Name = "Vis2SBFrm"
Vis2SBFrm.Parent = UpValuesFrm
Vis2SBFrm.BackgroundColor3 = Color3.new(0.0705882, 0.0705882, 0.0705882)
Vis2SBFrm.BorderSizePixel = 0
Vis2SBFrm.Position = UDim2.new(0.967000008, 4, 0, 0)
Vis2SBFrm.Size = UDim2.new(0, 1, 0, 190)

_G.NModules = _G.NModules and _G.NModules or {}
local SP = 2
local UVP = 1
local LFunc = ""
local keydown = false
local Buttons = {}
local RButtons = {}
local UVButtons = {}
local CFunc = ""
local LFName = ""
local LTName = ""
local LUDName = ""
local fn = 1
local Funcs = {}
local SFuncs = {}
local AFunc = nil
local AScript = nil
local nilscript = "function GetInst(inst)\n	for i,v in next, getnilinstances()do\n		if v.Name and v.Name == inst then\n			return v\n		end\n	end\nend\n"
local tobj = Instance.new("Part", workspace)
tobj.CanCollide = false
tobj.Transparency = 1

function Message(title, msg, duration)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = title;
		Text = msg;
		Duration = duration;
	})
end

local function RemoveType(str)
    local ret = ""
    for i = 1,#str do
        if str:sub(i, i+2) == "--t" or str:sub(i, i+2) == "--f"then break end
        ret = ret..str:sub(i, i)
    end
    return str:sub(1, #ret-1)
end

local function CheckModule(mod)
	for i,v in pairs(_G.NModules)do
		if v == mod then
			return true
		end
	end
end

local function ClearScripts(search)
	if not search then search = false end
	for i,v in pairs(ScriptsSFrm:GetChildren())do
		if v ~= ScriptBtn then
		v:Destroy()end
	end
	if search then RButtons = {} else Buttons = {} end
	SP = 2
end

local function ClearUV()
	for i,v in pairs(UpValuesSFrm:GetChildren())do
		if v ~= DetailsTable and v ~= DetailsNormal then
		v:Destroy()end
	end
	UVButtons = {}
	UVP = 1
end

function SearchCharNum(str1, str2)
	for i = 1,#str1 do
		if str1:sub(i,i+#str2-1) == str2 then
			return str1:sub(i,i+#str2-1)
		end
	end
end

local function Extract(s)
	local ns = tostring(s)
	local ret = ""
	local r = {}
	for v in string.gmatch(ns, "[^\n]+") do
		r[#r+1] = string.gsub(v, 'local env'..GGV(#r)..' = ', "")
	end
	for i,v in pairs(r)do
		if i ~= 1 then
			local str = SearchCharNum(v, 'env'..GGV(i-2))
			ret = string.gsub(v, str, ret)
		else
			ret = v
		end
	end
	return ret
end

local function Decompile(scr)
	Message("Decompiler", "Decompiling "..scr.ClassName..'...')
	syn.write_clipboard(decompile(scr))
	Message("Decompiler", scr.ClassName..' decompiled and copied to clipboard!')
end

local function Convert(s)
	local typ
	local suc,fail = pcall(function() tostring(s)end)
	if fail then typ = typeof(s)..': ???'else typ = s end
	local str = SFuncs[#SFuncs]
	local RetVal
	local st = tostring(typ)
	if (typeof(s) == "string" or typeof(s) == "Content")then
		RetVal = '"' .. s .. '"'
	elseif typeof(s) == "EnumItem" then			
		RetVal = "Enum." .. tostring(s.EnumType) .. "." .. s.Name
	elseif typeof(s) == "Enum" then			
		RetVal = "Enum." .. st
	elseif typeof(s) == "Instance" then
		if s.Parent ~= nil then RetVal = GP(s)else RetVal = typeof(Funcs[#Funcs]) == 'function' and "nil" or "nil --Removed path" end
	elseif typeof(s) == "CFrame" then
		RetVal = "CFrame.new(" .. st .. ")"
	elseif typeof(s) == "Vector3" then
		RetVal = "Vector3.new(" .. st .. ")"
	elseif typeof(s) == "Vector2" then
		RetVal = "Vector2.new(" .. st .. ")"
	elseif typeof(s) == "UDim2" then
		RetVal = "UDim2.new(" .. st:gsub("[{}]", "") .. ")"
	elseif typeof(s) == "BrickColor" then
		RetVal = "BrickColor.new(\"" .. st .. "\")"
	elseif typeof(s) == "Color3" then
		RetVal = "Color3.new(" .. st .. ")"
	elseif typeof(s) == "NumberRange" then
		RetVal = "NumberRange.new(" .. s:gsub("^%s*(.-)%s*$", "%1"):gsub(" ", ", ") .. ")"
	elseif typeof(s) == "PhysicalProperties" then
		RetVal = "PhysicalProperties.new(" .. st .. ")"
	elseif typeof(s) == "table" then
		RetVal = Extract(str)..Fix(LTName)..' --'..tostring(typ)
	elseif typeof(s) == "function" then
		RetVal = Extract(str)..Fix(LFName)..' --'..tostring(typ)
	elseif typeof(s) == "userdata" then
		RetVal = Extract(str)..Fix(LUDName)..' --'..tostring(typ)
	else
		RetVal = s
	end
	return tostring(RetVal)
end

local function AddScriptButton(btn, color, disabled, search)
	local b = ScriptBtn:Clone()
	b.Parent = ScriptsSFrm
	b.Text = btn.Name
	b.Position = UDim2.new(0, 2, 0, SP)
	b.TextColor3 = color
	b.Visible = true
	b.ScriptScrVl.Value = btn
	SP = SP+22
	if search then UpdateBtns(b, RButtons) else UpdateBtns(b, Buttons)end
	b.MouseButton1Click:Connect(function()
		local ret = btn
		btn = tobj
		GP(btn)
		AFunc = btn
		btn = ret
		if btn.Parent == nil and CheckModule(btn) == false then Message("Uh", "Looks like the script doesnt exist anymore, refresh please!", 10)return end
		if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl)then
			if GP(btn) == "nilinstance"then ToClipboard(false, nilscript..'GetInst("'..btn.Name..'")', false)return end
			ToClipboard(false, GP(btn))
		else
			PathTxtB.Text = GP(btn)
			Funcs = {}
			SFuncs = {}
			local succ, fail = pcall(function()getsenv(btn)end)
			if disabled then 
				Message("Script Disabled!", "This is script is disabled, that means that you cant get its environment, you can only decompile it by pressing the right mouse button", 10)
				return
			elseif fail and btn:IsA("LocalScript")then 
				Message("Aw :(!", "Your exploit couldn't get the script environment, you can only decompile it by pressing the right mouse button", 5)
				return
			else
				AScript = btn
				getups(btn, nil, true)
			end
			AFunc = btn
		end
	end)
	b.MouseButton2Click:Connect(function()
		local ret = btn
		btn = tobj
		GP(btn)
		AFunc = btn
		btn = ret
		if btn.Parent == nil and CheckModule(btn) == false then Message("Uh", "Looks like the script doesnt exist anymore, refresh please!", 10)return end
		PathTxtB.Text = GP(btn)
		Decompile(btn)
	end)
end

local function Custom()
	local Custom = false
	for i,v in pairs(UpValuesSFrm:GetChildren())do
		if v ~= DetailsTable and v ~= DetailsNormal then
			if v.Name == "DetailsTable"then
				if v.TSelectedVl.Value then Custom = true break end
			else
				if v.NSelectedVl.Value then Custom = true break end
			end
		end
	end
	if Custom then
		CopyToCBBtn.Text = "COPY SELECTED VALUES"
	else
		CopyToCBBtn.Text = "COPY VALUES TO CLIPBOARD"
	end
	return Custom
end

local function AddUpValue(i, v, tab)
	local typ
	local indval
	if typeof(i) == 'number'then
		indval = Instance.new("NumberValue")
	elseif typeof(i) == 'string'then
		indval = Instance.new("StringValue")
	else
		indval = Instance.new("NumberValue")
	end
	local s,f = pcall(function() tostring(v)end)
	if f then typ = typeof(v)..': ???'else typ = tostring(v)end
	if tab then
		local b = DetailsTable:Clone()
		b.Parent = UpValuesSFrm
		b.Position = UDim2.new(0, 2, 0, UVP)
		b.TableBtn.Text = typ
		b.UVNameTxt.Text = tostring(i)
		b.Visible = true
		UVP = UVP+22
		UpdateUV(b)
		b.TItemInfoVl.Value = Convert(v)
		if typeof(i) == 'number'then
			indval.Value = i
		elseif typeof(i) == 'string'then
			indval.Value = tostring(i)
		else
			indval.Value = tonumber(#UpValuesSFrm:GetChildren()+1)
		end
		indval.Parent = b
		indval.Name = "indval"
		b.TableBtn.MouseButton1Click:Connect(function()
			if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl)then
				ToClipboard(false, RemoveType(b.TItemInfoVl.Value))
			else
				getups(v, i, true)
				AFunc = v
			end
		end)
		b.TableBtn.MouseButton2Click:Connect(function()
			b.TSelectedVl.Value = not b.TSelectedVl.Value
			if b.TSelectedVl.Value then
				b.TableBtn.BackgroundColor3 = Color3.fromRGB(0, 50, 50)
			else
				b.TableBtn.BackgroundColor3 = TableBtn.BackgroundColor3
			end
			Custom()
		end)
	else
		local b = DetailsNormal:Clone()
		b.Parent = UpValuesSFrm
		b.Position = UDim2.new(0, 2, 0, UVP)
		b.NormalBtn.Text = typ
		b.UVNameTxt.Text = tostring(i)
		b.Visible = true
		UVP = UVP+22
		UpdateUV(b)
		b.NItemInfoVl.Value = Convert(v)
		if typeof(i) == 'number'then
			indval.Value = i
		elseif typeof(i) == 'string'then
			indval.Value = tostring(i)
		else
			indval.Value = tonumber(#UpValuesSFrm:GetChildren()+1)
		end
		indval.Parent = b
		indval.Name = "indval"
		b.NormalBtn.MouseButton1Click:Connect(function()
			if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl)then
				ToClipboard(false, b.NItemInfoVl.Value)
			end
		end)
		b.NormalBtn.MouseButton2Click:Connect(function()
			b.NSelectedVl.Value = not b.NSelectedVl.Value
			if b.NSelectedVl.Value then
				b.NormalBtn.BackgroundColor3 = Color3.fromRGB(0, 50, 50)
			else
				b.NormalBtn.BackgroundColor3 = NormalBtn.BackgroundColor3
			end
			Custom()
		end)
	end
end

local Ignore = {"game.ReplicatedStorage.Utilities", "game.ReplicatedStorage.AnalyticsModule", "game.Players.LocalPlayer.PlayerScripts.ChatScript","PlayerScriptsLoader", "game.StarterGui.", "game.CorePackages.", "game.CoreGui.RobloxGui.", "game.Chat.", "game.StarterPlayer.", "game.Players.LocalPlayer.PlayerScripts.PlayerModule", "game.StarterPack.", "game.Lighting"}
for i,v in pairs(game.Players:GetChildren())do
	if v.Name ~= game.Players.LocalPlayer.Name then
		table.insert(Ignore, "game.Players."..v.Name)
		table.insert(Ignore, "game.Workspace."..v.Name)
	end
end
game.Players.PlayerAdded:Connect(function(player)
	if player.Name ~= game.Players.LocalPlayer.Name then
		table.insert(Ignore, "game.Players."..player.Name)
		table.insert(Ignore, "game.Workspace."..player.Name)
	end
end)
local function CheckScript(scr)
	if string.find(scr, 'Players.'..game.Players.LocalPlayer.Name)then scr = string.gsub(scr, game.Players.LocalPlayer.Name, "LocalPlayer")end
	for i,v in pairs(Ignore)do
		if string.find('game.'..scr, v)then
			return false
		end
	end
	return true
end

local function LoadScripts()
	ClearScripts()
	for i,v in pairs(game:GetDescendants())do
		FilterScript(v)
	end
	for i,v in pairs(_G.NModules)do
		FilterScript(v)
	end
end

function UpdateBtns(Btn, Btns)
	if Btn.Position.Y.Offset+Btn.Size.Y.Offset > ScriptsSFrm.AbsoluteSize.Y then
	    ScriptsSFrm.CanvasSize = UDim2.new(0,0,0,#Btns*Btn.Size.Y.Offset+#Btns*2+Btn.Size.Y.Offset+4)
	else
	    ScriptsSFrm.CanvasSize = UDim2.new(0,0,0,0)
	end
	Btns[#Btns+1] = {Btn, Btn.ScriptScrVl.Value}
end

function UpdateUV(Btn)
	if Btn.Position.Y.Offset+Btn.Size.Y.Offset > UpValuesSFrm.AbsoluteSize.Y then
	    UpValuesSFrm.CanvasSize = UDim2.new(0,0,0,#UVButtons*Btn.Size.Y.Offset+#UVButtons*2+Btn.Size.Y.Offset+3)
	else
	    UpValuesSFrm.CanvasSize = UDim2.new(0,0,0,0)
	end
	UVButtons[#UVButtons+1] = Btn
end

function GP(s)
if CheckModule(s)then return 'nilinstance' end
if s.Parent == nil then Message("Uh", "Looks like the script doesnt exist anymore, refresh please!", 10)return end
local r = s
local rr = ""
local check = true
repeat
    if string.find(r.Name, " ") or string.find(r.Name, "*") or string.find(r.Name, "%d+") or string.find(r.Name, "-") or r.Name == ""then
		local nr = r.Name
		local pname = game.Players.LocalPlayer.Name
		if pname == nr and r.Parent == game.Players then
			nr = "LocalPlayer"
		elseif pname == nr and r.Parent ~= game.Players then
			nr = 'game.Players.LocalPlayer.Name'
		end
		if nr ~= 'game.Players.LocalPlayer.Name' then
        	rr = nr == "LocalPlayer" and '.'..nr..rr or '["'..nr..'"]'..rr
		else
			rr = '['..nr..']'..rr
		end
        r = r.Parent
    else
		local nr = r.Name
		local pname = game.Players.LocalPlayer.Name
		if pname == nr and r.Parent == game.Players then
			nr = "LocalPlayer"
		elseif pname == nr and r.Parent ~= game.Players then
			nr = 'game.Players.LocalPlayer.Name'
		end
		if nr == 'game.Players.LocalPlayer.Name' then
			rr = '['..nr..']'..rr
		else
			rr = '.'..nr..rr
		end
        r = r.Parent
	end
until r.Parent == nil
rr = 'game'..rr
return rr
end

local function CheckP(p, s)
	if p:FindFirstChild(s)then
		return true
	else
		return false
	end
end

function GGV(n)
	if n == nil then n = 0 end
	if n == 0 then
		return ""
	else
		return tostring(n)
	end
end

function GV()
	local n = fn-1
	if n == 0 then
		return ""
	else
		return tostring(n)
	end
end

function Fix(s)
	if typeof(s) == 'number'then
		return '['..tostring(s)..']'
	end
	s = tostring(s)
	if string.find(s, " ")or string.find(s, "%c") or string.find(s:sub(1,1), '%d')then
		return '["'..tostring(s)..'"]'
	else
		return '.'..tostring(s)
	end
end

local function Store(s, f)
	if s then
	Funcs[#Funcs+1] = f
	SFuncs[#SFuncs+1] = CFunc end
end

function CreateUVButton(i, v)
	if typeof(v) == "table" or typeof(v) == "function" or typeof(v) == "userdata" then
		if typeof(v) == "table" then
			LTName = i
		elseif typeof(v) == "function" then
			LFName = i
		else
			LUDName = i
		end
		AddUpValue(i, v, true)
	else
		AddUpValue(i, v, false)
	end
end

function getups(f, n, store)
	ClearUV()
	CopyToCBBtn.Text = "COPY VALUES TO CLIPBOARD"
	if not n then n = nil end
	if typeof(f) == "Instance"then
		CFunc = ""
		fn = 1
		if f:IsA("LocalScript")then
			CFunc = "local env = getsenv("..GP(f)..')'
			Store(store, f)
			local env = getsenv(f)
			for i,v in next, env do
				CreateUVButton(i, v)
			end
		elseif f:IsA("ModuleScript")then
			CFunc = "local env = require("..GP(f)..')'
			Store(store, f)
			local env = require(f)
			if typeof(env) == "function" or typeof(env) == "userdata"then
				getups(env, nil, true)
			elseif typeof(env) == "table"then
				for i,v in next, env do
					CreateUVButton(i, v)
				end
			end
		end
	elseif typeof(f) == "function" then
		LFName = n
		LFunc = RemoveType(Convert(f))
		if n ~= nil then CFunc = CFunc..'\nlocal env'..fn..' = debug.getupvalues(env'..GV()..Fix(n)..')' else CFunc = CFunc..'\nlocal env'..fn..' = debug.getupvalues(env'..GV()..')'end
		Store(store, f)
		fn = fn+1
		local env = debug.getupvalues(f)
		for i,v in next, env do
			CreateUVButton(i, v)
		end
	elseif typeof(f) == "table" then
		if n ~= nil then CFunc = CFunc..Fix(n)else CFunc = CFunc end
		Store(store, f)
		for i,v in next, f do
			CreateUVButton(i, v)
		end
	elseif typeof(f) == "userdata" then
		if n ~= nil then CFunc = CFunc..'\nlocal env'..fn..' = getrawmetatable(env'..GV()..Fix(n)..')' else CFunc = CFunc..'\nlocal env'..fn..' = getrawmetatable(env'..GV()..')'end
		Store(store, f)
		fn = fn+1
		local env = getrawmetatable(f)
		for i,v in next, env do
			CreateUVButton(i, v)
		end
	end
end
		
function RefreshUps(f)
	ClearUV()
	CopyToCBBtn.Text = "COPY VALUES TO CLIPBOARD"
	if typeof(f) == "Instance"then
		CFunc = ""
		fn = 1
		if f:IsA("LocalScript")then
			CFunc = "local env = getsenv("..GP(f)..')'
			local env = getsenv(f)
			for i,v in next, env do
				CreateUVButton(i, v)
			end
		elseif f:IsA("ModuleScript")then
			CFunc = "local env = require("..GP(f)..')'
			local env = require(f)
			if typeof(env) == "function" or typeof(env) == "userdata"then
				getups(env)
			elseif typeof(env) == "table"then
				for i,v in next, env do
					CreateUVButton(i, v)
				end
			end
		end
	elseif typeof(f) == "function" then
		local env = debug.getupvalues(f)
		for i,v in next, env do
			CreateUVButton(i, v)
		end
	elseif typeof(f) == "table" then
		for i,v in next, f do
			CreateUVButton(i, v)
		end
	elseif typeof(f) == "userdata" then
		local env = getrawmetatable(f)
		for i,v in next, env do
			CreateUVButton(i, v)
		end
	end
end

local done = true
function SearchScript(scr, clr)
	clr = clr and clr or Color3.fromRGB(0, 50, 50)
	if scr.Parent == nil or not done then done = true return end
	done = false
	for i,v in pairs(ScriptsSFrm:GetChildren())do
		if v.ScriptScrVl.Value == scr then
			ScriptsSFrm.CanvasPosition = Vector2.new(0, v.Position.Y.Offset-66)
			for i = 0,1,0.2 do
				v.BackgroundColor3 = v.BackgroundColor3:lerp(clr, i)wait()
			end wait(.2)
			for i = 0,1,0.2 do
				v.BackgroundColor3 = v.BackgroundColor3:lerp(ScriptBtn.BackgroundColor3, i)wait()
			end
		end
	end
	done = true
end

function FilterScript(scr)
	if scr:IsA("LocalScript")then
		if not scr.Disabled and CheckScript(scr:GetFullName())then
			AddScriptButton(scr, ScriptBtn.TextColor3)
		elseif CheckScript(scr:GetFullName())then
			AddScriptButton(scr, Color3.fromRGB(181, 17, 19), true)
		end
	elseif scr:IsA("ModuleScript")then
		if CheckScript(scr:GetFullName())then
			AddScriptButton(scr, Color3.fromRGB(99, 168, 158))
		end
	end
end

local function Search(v)
	v = string.sub(v, 2, #v)
	ClearScripts(true)
	for i,s in pairs(Buttons)do
		if string.find(s[1].Text:lower(), v:lower())then
			local scr = s[2]
			if scr:IsA("LocalScript")then
				if not scr.Disabled and CheckScript(scr:GetFullName())then
					AddScriptButton(scr, ScriptBtn.TextColor3, false, true)
				elseif CheckScript(scr:GetFullName())then
					AddScriptButton(scr, Color3.fromRGB(181, 17, 19), true, true)
				end
			elseif scr:IsA("ModuleScript")then
				if CheckScript(scr:GetFullName())then
					AddScriptButton(scr, Color3.fromRGB(99, 168, 158), false, true)
				end
			end
		end
	end
end

function Reload()
	local NButtons = Buttons
	ClearScripts()
	for i,v in pairs(NButtons)do
		local scr = v[2]
		FilterScript(scr)
	end
end

local function Load(dcmpl)
	local scr = PathTxtB.Text
	repeat
		scr = string.gsub(scr, '%\91"', ".")
		scr = string.gsub(scr, '"%\93', "")
	until not string.find(scr, '%\91"') and not string.find(scr, '"%\93')
	local path = nil
	local check = {}
	for v in string.gmatch(scr, "[^.]+") do
		table.insert(check, v)
	end
	if scr == "" then Message("Error", "Invalid path!", 5)Reload()return end
	local jo = true
	if scr:sub(1,1) == '>' then
		if scr:sub(2,#scr) == "getnils"then
			_G.NModules = {}
			local num = 0
			for i,s in next, getnilinstances()do
				local succ, fail = pcall(function()getsenv(s)end)
				if s:IsA("ModuleScript") and CheckScript(s:GetFullName()) then
					table.insert(_G.NModules, s)
					num = num+1
				end
			end
			LoadScripts()
			Message("Done!", num.." Local/Module nil parented scripts were logged properly!", 5)
			return
		end
	end
	for i,v in pairs(check)do
		Reload()
		if v:sub(1,1) == '-' then
			Search(v)
			return
		end
		if v == 'game' or v == 'Game' and jo then
			jo = false
			path = game
		elseif v == "LocalPlayer" then
			if CheckP(path, game.Players.LocalPlayer.Name)then
				path = path:FindFirstChild(game.Players.LocalPlayer.Name)
			else
				Message("Error", "Script removed or parent changed!", 5)return
			end
		elseif path ~= nil then
			if CheckP(path, v)then
				path = path:FindFirstChild(v)
			else
				Message("Error", "Script removed or parent changed!", 5)return
			end
		else
			Message("Error", "Invalid path!", 5)break
		end
	end
	if path:IsA("LocalScript") or path:IsA("ModuleScript")then
		if dcmpl then
			local ret = path
			local btn = tobj
			GP(btn)
			AFunc = btn
			btn = ret
			if btn.Parent == nil and CheckModule(btn) == false then Message("Uh", "Looks like the script doesnt exist anymore, refresh please!", 10)return end
			Decompile(btn)
		else
			local ret = path
			local btn = tobj
			GP(btn)
			AFunc = btn
			btn = ret
			if btn.Parent == nil and CheckModule(btn) == false then Message("Uh", "Looks like the script doesnt exist anymore, refresh please!", 10)return end
			Funcs = {}
			SFuncs = {}
			if not btn:IsA("ModuleScript") and btn.Disabled then 
				Message("Script Disabled!", "This is script is disabled, that means that you cant get its environment, you can only decompile it by pressing the right mouse button", 10)SearchScript(btn, Color3.fromRGB(60, 0, 0))
				return
			else
				getups(btn, nil, true)
			end
			SearchScript(btn)
			AFunc = btn
		end
	else
		Message("Error", "Chosen path isnt a LocalScript or a ModuleScript!", 5)
	end
end

PathTxtB.Changed:connect(function()
	if PathTxtB.Text:sub(1,1) == '-' then
	Load(false)end
end)

CloseBtn.MouseButton1Click:Connect(function()
	EnvEditor:Destroy()
end)

MinBtn.MouseButton1Click:Connect(function()
	BodyFrm.Visible = not BodyFrm.Visible
end)

RefreshBtn.MouseButton1Click:Connect(function()
	LoadScripts()
end)

LoadBtn.MouseButton1Click:Connect(function()
	Load(false)
end)

LoadBtn.MouseButton2Click:Connect(function()
	Load(true)
end)

EraseBtn.MouseButton1Click:Connect(function()
	Reload()
	PathTxtB.Text = ""
end)

function ToClipboard(min, obj, change)
	if obj then
		if string.find(obj, 'nilinstance')and (change == true or change == nil) then
			obj = string.gsub(obj, 'nilinstance', 'GetInst("'..AScript.Name..'")')
			obj = nilscript..obj
		end
		syn.write_clipboard(obj)
	else
		local NCFunc = ""
		for i,v in pairs(UpValuesSFrm:GetChildren())do
			if v ~= DetailsTable and v ~= DetailsNormal then
				if typeof(Funcs[#Funcs]) == 'function' then
					local indval = typeof(v.indval.Value) == 'number' and v.indval.Value or '"'..v.indval.Value..'"'
					if Custom() then
						if v.Name == "DetailsTable" and v.TSelectedVl.Value then
							NCFunc = NCFunc..'\ndebug.setupvalue(func, '..indval..', '..RemoveType(v.TItemInfoVl.Value)..')'
						elseif v.Name == "DetailsNormal" and v.NSelectedVl.Value then
							NCFunc = NCFunc..'\ndebug.setupvalue(func, '..indval..', '..v.NItemInfoVl.Value..')'
						end
					else
						if v.Name == "DetailsTable" then
							NCFunc = NCFunc..'\ndebug.setupvalue(func, '..indval..', '..RemoveType(v.TItemInfoVl.Value)..')'
						else
							NCFunc = NCFunc..'\ndebug.setupvalue(func, '..indval..', '..v.NItemInfoVl.Value..')'
						end
					end
				else
					if Custom() then
						if v.Name == "DetailsTable" and v.TSelectedVl.Value then
							NCFunc = NCFunc..'\nenv'..(min and "" or GV())..Fix(v.indval.Value)..' = '..v.TItemInfoVl.Value
						elseif v.Name == "DetailsNormal" and v.NSelectedVl.Value then
							NCFunc = NCFunc..'\nenv'..(min and "" or GV())..Fix(v.indval.Value)..' = '..v.NItemInfoVl.Value
						end
					else
						if v.Name == "DetailsTable" then
							NCFunc = NCFunc..'\nenv'..(min and "" or GV())..Fix(v.indval.Value)..' = '..v.TItemInfoVl.Value
						else
							NCFunc = NCFunc..'\nenv'..(min and "" or GV())..Fix(v.indval.Value)..' = '..v.NItemInfoVl.Value
						end
					end
				end
			end
		end
		if string.find(NCFunc, 'debug.setupvalue')then
			NCFunc = 'local func = '..LFunc..NCFunc
		else
			NCFunc = min and 'local env = '..Extract(CFunc)..NCFunc or CFunc..NCFunc
		end
		if string.find(NCFunc, 'nilinstance')then
			NCFunc = string.gsub(NCFunc, 'nilinstance', 'GetInst("'..AScript.Name..'")')
			NCFunc = nilscript..NCFunc
		end
		syn.write_clipboard(NCFunc)
	end
end

CopyToCBBtn.MouseButton1Click:Connect(function()
	ToClipboard(false)
end)

CopyToCBBtn.MouseButton2Click:Connect(function()
	ToClipboard(true)
end)

RFuncBtn.MouseButton1Click:Connect(function()
	RefreshUps(AFunc)
end)

local rdone = true
BackBtn.MouseButton1Click:Connect(function()
	if #Funcs-1 ~= 0 and rdone then
		rdone = false
		if typeof(Funcs[#Funcs]) == "function"then
			fn = fn-1
		end
		CFunc = SFuncs[#SFuncs-1]
		table.remove(Funcs, #Funcs)
		table.remove(SFuncs, #SFuncs)
		RefreshUps(Funcs[#Funcs])
		AFunc = Funcs[#Funcs]
		rdone = true
	end
end)

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(key)
	if key == 'e' then
		BodyFrm.Visible = not BodyFrm.Visible
	end
end)
LoadScripts()
