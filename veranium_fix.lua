--Veranium XI | Rewritten by V B#9923 (601478105248432148) & Uniqua
--[[Keywords:
    VIn: Veranium Instance.
    VEn: Veranium Enumerator.
    VCv: Veranium Color Variant.
    VCt: Veranium Custom TweenService .
    VCn: Veranium Constructor.
    VCf: Veranium Core Function.
    VLb: Veranium Library.

    Veranium: Class Library | Works Similar To RLua's Instance.new()
    Vera: Automated UIL | Works Similar To Most UILs Out There
]]

local Veranium;
--Getting Services
local UserInputService = game:GetService("UserInputService");
local TweenService = game:GetService("TweenService");
local TextService = game:GetService("TextService");
local RunService = game:GetService("RunService");
local CoreGui = game:GetService("CoreGui");
local Players = game:GetService("Players");
local Debris = game:GetService("Debris");
local Player = Players.LocalPlayer;
local PlayerGui = Player.PlayerGui;
local Mouse = Player:GetMouse();

local _PREFIX = "\226\128\139\226\128\139\226\128\139";
local VeraniumSpace = Instance.new("ScreenGui");

VeraniumSpace.ResetOnSpawn = false
VeraniumSpace.Name = "VeraniumSpace"
VeraniumSpace.DisplayOrder = 9e5;
VeraniumSpace.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
pcall(function()
    VeraniumSpace.Parent = CoreGui;
end);
if VeraniumSpace.Parent == nil then
    VeraniumSpace.Parent = PlayerGui;
end;

local VLb_CVMath;
VLb_CVMath = {
    Map = function(Num, Start1, Stop1, Start2, Stop2)
        return ((Num-Start1)/(Stop1-Start1))*(Stop2-Start2)+Start2
    end,
    MapColor = function(StartColor, EndColor, StartFrame, EndFrame, Frame)
        local Map = VLb_CVMath.Map
        return Color3.new(
            Map(Frame, StartFrame, EndFrame, StartColor.r, EndColor.r),
            Map(Frame, StartFrame, EndFrame, StartColor.g, EndColor.g),
            Map(Frame, StartFrame, EndFrame, StartColor.b, EndColor.b)
        )
    end,
    Round = function(Num)
        local Low = math.floor(Num)
        local High = math.floor(Num) + 1
        local LV = -(Low - Num)
        local HV = High - Num
        if (HV > LV) then
            return Low
        else
            return High
        end
    end
};

local VCf_IsA;
local VCf_Destructor;
local function VCf_SRO_NDX(Value)
    error("This Object is read-only.");
end;

local function VCf_SetReadOnly(Value)
    if type(Value) == "table" then
        local Meta = getmetatable(Value);
        if type(Meta) == "table" then
            Meta.__newindex = VCf_SRO_NDX;
        elseif Meta == nil then
            setmetatable(Value, {
                __newindex = VCf_SRO_NDX,
                __index = rawget
            });
        else
            error("This table is Protected.");
        end;
    elseif type(Value) == "userdata" then
        local Meta = getmetatable(Value);
        if type(Meta) == "table" then
            Meta.__newindex = VCf_SRO_NDX;
        else
            error("This userdata is Protected.");
        end;
    else
        error("Value given must be a table/userdata.");
    end;
end;

--Enum Library.
local VEn_Data = {
    CornerType = {
        Sharp = "rbxassetid://3457842171",
        Smooth = "rbxassetid://3457843087",
        Edged = "rbxassetid://3457843868",
        None = "",
        [0] = "rbxassetid://3457842171",
        [1] = "rbxassetid://3457843087",
        [2] = "rbxassetid://3457843868",
        [3] = ""
    },
    CheckBoxType = {
        Sharp = 0,
        Smooth = 1,
        Circular = 2,
        Diamond = 3,
        None = 4,
        [0] = 0,
        [1] = 1,
        [2] = 2,
        [3] = 3,
        [4] = 4
    },
    FillBoxType = {
        Sharp = "rbxassetid://4049002850",
        Smooth = "rbxassetid://4049766910",
        Circular = "rbxassetid://4049877539",
        [0] = "rbxassetid://4049002850",
        [1] = "rbxassetid://4049766910",
        [2] = "rbxassetid://4049877539"
    },
    NotificationType = {
        Info = "rbxassetid://4057220511",
        Error = "rbxassetid://4057319805",
        None = "",
        [0] = "rbxassetid://4057220511",
        [1] = "rbxassetid://4057319805",
        [2] = ""
    },
    TabControlType = {
        Top = 0,
        Right = 1,
        Bottom = 2,
        Left = 3,
        [0] = 0,
        [1] = 1,
        [2] = 2,
        [3] = 3
    },
    MetroLocation = {
        TopLeft = {
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.new(0, 0, 0, 0),
            SizeConstraint = "X",
            ThicknessConstraint = "Y",
            BOffsetX = 1,
            BOffsetY = 1
        },
        TopCenter = {
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.new(0.5, 0, 0, 0),
            SizeConstraint = "X",
            ThicknessConstraint = "Y",
            BOffsetX = 0,
            BOffsetY = 1
        },
        TopRight = {
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.new(1, 0, 0, 0),
            SizeConstraint = "X",
            ThicknessConstraint = "Y",
            BOffsetX = -1,
            BOffsetY = 1
        },
        LeftTop = {
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.new(0, 0, 0, 0),
            SizeConstraint = "Y",
            ThicknessConstraint = "X",
            BOffsetX = 1,
            BOffsetY = 1
        },
        LeftCenter = {
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 0, 0.5, 0),
            SizeConstraint = "Y",
            ThicknessConstraint = "X",
            BOffsetX = 1,
            BOffsetY = 0
        },
        LeftBottom = {
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.new(0, 0, 1, 0),
            SizeConstraint = "Y",
            ThicknessConstraint = "X",
            BOffsetX = 1,
            BOffsetY = -1
        },
        RightTop = {
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.new(1, 0, 0, 0),
            SizeConstraint = "Y",
            ThicknessConstraint = "X",
            BOffsetX = -1,
            BOffsetY = 1
        },
        RightCenter = {
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.new(1, 0, 0.5, 0),
            SizeConstraint = "Y",
            ThicknessConstraint = "X",
            BOffsetX = -1,
            BOffsetY = 0
        },
        RightBottom = {
            AnchorPoint = Vector2.new(1, 1),
            Position = UDim2.new(1, 0, 1, 0),
            SizeConstraint = "Y",
            ThicknessConstraint = "X",
            BOffsetX = -1,
            BOffsetY = -1
        },
        BottomLeft = {
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.new(0, 0, 1, 0),
            SizeConstraint = "X",
            ThicknessConstraint = "Y",
            BOffsetX = 1,
            BOffsetY = -1
        },
        BottomCenter = {
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.new(0.5, 0, 1, 0),
            SizeConstraint = "X",
            ThicknessConstraint = "Y",
            BOffsetX = 0,
            BOffsetY = -1
        },
        BottomRight = {
            AnchorPoint = Vector2.new(1, 1),
            Position = UDim2.new(1, 0, 1, 0),
            SizeConstraint = "X",
            ThicknessConstraint = "Y",
            BOffsetX = -1,
            BOffsetY = -1
        };
    };
};

local VEn_References = {};
local VEn_Meta = {
    __tostring = function(Proxy)
        local Meta = VEn_References[Proxy];
        if typeof(Meta) == "table" then
            return Meta.___Path;
        else
            error("Unable to get the meta of VEnum.");
        end;
    end,
    __index = function(Proxy, Field)
        local Meta = VEn_References[Proxy];
        if typeof(Field) ~= "string" then
            error("Attempt to index VEnum with "..typeof(Field).." (string expected).");
        end;
        if typeof(Meta) == "table" then
            if Meta.___IsLib then
                return Meta.___Value[Field];
            else
                error("This is a VEnum. Not an EnumLibrary.");
            end;
        else
            error("Unable to get the meta of VEnum.");
        end;
    end,
    __newindex = function(Proxy, Field, Value)
        error("VEnums are read-only ;w;");
    end,
    __metatable = "S-Stay from my Metatable! P-Prevert!";--No context uwu
}
local function VEn_Create(VEn_Value, VEn_Path, VEn_IsLib, VEn_SubLib)
    local Proxy = newproxy(true);
    local Meta = getmetatable(Proxy);
    --Metadata Setup
    Meta.___Value = VEn_Value;
    Meta.___Path = VEn_Path;
    Meta.___IsLib = VEn_IsLib;
    Meta.___SubLib = VEn_SubLib;
    --Metamethod Setup
    Meta.__tostring = VEn_Meta.__tostring;
    Meta.__index = VEn_Meta.__index;
    Meta.__newindex = VEn_Meta.__newindex;
    Meta.__metatable = VEn_Meta.__metatable;
    --Linking Proxy To Meta
    VEn_References[Proxy] = Meta;
    return Proxy;
end

--Initial Library
local function VCf_GetEnumValue(Proxy)
    return VEn_References[Proxy].___Value;
end
local function VCf_IsEnum(Proxy)
    return (VEn_References[Proxy] ~= nil);
end
local function VCf_GetEnumMeta(Proxy)
    return VEn_References[Proxy];
end
local function VCf_GetEnumLValue(L, V)
    if VCf_IsEnum(V) then
        return VCf_GetEnumValue(V);
    end;
    return VEn_Data[L][V];
end
--This may look complicated but it's not.
--This is just calling VEn_Create() to make the Proxy versions of VEnums.

--Setup
--SliderType
VEn_Data.SliderType = VEn_Data.CornerType;

local VLb_Enums = VEn_Create({
    CornerType = VEn_Create({
        Sharp = VEn_Create(VEn_Data.CornerType.Sharp, "VLb_Enums.CornerType.Sharp", false, "CornerType"),
        Smooth = VEn_Create(VEn_Data.CornerType.Smooth, "VLb_Enums.CornerType.Smooth", false, "CornerType"),
        Edged = VEn_Create(VEn_Data.CornerType.Edged, "VLb_Enums.CornerType.Edged", false, "CornerType")
    }, "VLb_Enums.CornerType", true, "VLb_Enums"),
    SliderType = VEn_Create({
        Box = VEn_Create(VEn_Data.SliderType.Sharp, "VLb_Enums.SliderType.Box", false, "SliderType"),
        Round = VEn_Create(VEn_Data.SliderType.Smooth, "VLb_Enums.SliderType.Round", false, "SliderType"),
        Diamond = VEn_Create(VEn_Data.SliderType.Edged, "VLb_Enums.SliderType.Diamond", false, "SliderType"),
        Custom = VEn_Create(VEn_Data.SliderType.None, "VLb_Enums.SliderType.Custom", false, "SliderType")
    }, "VLb_Enums.SliderType", true, "VLb_Enums"),
    MetroLocation = VEn_Create({
        TopLeft = VEn_Create(VEn_Data.MetroLocation.TopLeft, "VLb_Enums.MetroLocation.TopLeft", false, "MetroLocation"),
        TopCenter = VEn_Create(VEn_Data.MetroLocation.TopCenter, "VLb_Enums.MetroLocation.TopCenter", false, "MetroLocation"),
        TopRight = VEn_Create(VEn_Data.MetroLocation.TopRight, "VLb_Enums.MetroLocation.TopRight", false, "MetroLocation"),
        LeftTop = VEn_Create(VEn_Data.MetroLocation.LeftTop, "VLb_Enums.MetroLocation.LeftTop", false, "MetroLocation"),
        LeftCenter = VEn_Create(VEn_Data.MetroLocation.LeftCenter, "VLb_Enums.MetroLocation.LeftCenter", false, "MetroLocation"),
        LeftBottom = VEn_Create(VEn_Data.MetroLocation.LeftBottom, "VLb_Enums.MetroLocation.LeftBottom", false, "MetroLocation"),
        RightTop = VEn_Create(VEn_Data.MetroLocation.RightTop, "VLb_Enums.MetroLocation.RightTop", false, "MetroLocation"),
        RightCenter = VEn_Create(VEn_Data.MetroLocation.RightCenter, "VLb_Enums.MetroLocation.RightCenter", false, "MetroLocation"),
        RightBottom = VEn_Create(VEn_Data.MetroLocation.RightBottom, "VLb_Enums.MetroLocation.RightBottom", false, "MetroLocation"),
        BottomLeft = VEn_Create(VEn_Data.MetroLocation.BottomLeft, "VLb_Enums.MetroLocation.BottomLeft", false, "MetroLocation"),
        BottomCenter = VEn_Create(VEn_Data.MetroLocation.BottomCenter, "VLb_Enums.MetroLocation.BottomCenter", false, "MetroLocation"),
        BottomRight = VEn_Create(VEn_Data.MetroLocation.BottomRight, "VLb_Enums.MetroLocation.BottomRight", false, "MetroLocation")
    }, "VLb_Enums.MetroLocation", true, "VLb_Enums"),
    CheckBoxType = VEn_Create({
        Sharp = VEn_Create(VEn_Data.CheckBoxType.Sharp, "VLb_Enums.CheckBoxType.Sharp", false, "CheckBoxType"),
        Smooth = VEn_Create(VEn_Data.CheckBoxType.Smooth, "VLb_Enums.CheckBoxType.Smooth", false, "CheckBoxType"),
        Circular = VEn_Create(VEn_Data.CheckBoxType.Circular, "VLb_Enums.CheckBoxType.Circular", false, "CheckBoxType"),
        Diamond = VEn_Create(VEn_Data.CheckBoxType.Diamond, "VLb_Enums.CheckBoxType.Diamond", false, "CheckBoxType"),
        Custom = VEn_Create(VEn_Data.CheckBoxType.None, "VLb_Enums.CheckBoxType.Custom", false, "CheckBoxType")
    }, "VLb_Enums.CheckBoxType", true, "VLb_Enums"),
    FillBoxType = VEn_Create({
        Sharp = VEn_Create(VEn_Data.FillBoxType.Sharp, "VLb_Enums.FillBoxType.Sharp", false, "FillBoxType"),
        Smooth = VEn_Create(VEn_Data.FillBoxType.Smooth, "VLb_Enums.FillBoxType.Smooth", false, "FillBoxType"),
        Circular = VEn_Create(VEn_Data.FillBoxType.Circular, "VLb_Enums.FillBoxType.Circular", false, "FillBoxType")
    }, "VLb_Enums.FillBoxType", true, "VLb_Enums"),
    NotificationType = VEn_Create({
        Info = VEn_Create(VEn_Data.NotificationType.Info, "VLb_Enums.NotificationType.Info", false, "NotificationType"),
        Error = VEn_Create(VEn_Data.NotificationType.Error, "VLb_Enums.NotificationType.Error", false, "NotificationType"),
        None = VEn_Create(VEn_Data.NotificationType.None, "VLb_Enums.NotificationType.None", false, "NotificationType")
    }, "VLb_Enums.NotificationType", true, "VLb_Enums"),
    TabControlType = VEn_Create({
        Top = VEn_Create(VEn_Data.TabControlType.Top, "VLb_Enums.TabControlType.Top", false, "TabControlType"),
        Bottom = VEn_Create(VEn_Data.TabControlType.Bottom, "VLb_Enums.TabControlType.Bottom", false, "TabControlType"),
        Right = VEn_Create(VEn_Data.TabControlType.Right, "VLb_Enums.TabControlType.Right", false, "TabControlType"),
        Left = VEn_Create(VEn_Data.TabControlType.Left, "VLb_Enums.TabControlType.Left", false, "TabControlType")
    }, "VLb_Enums.TabControlType", true, "VLb_Enums")
}, "VLb_Enums", true);


local VCv_Data = {};
local VLb_ColorVariants = {
    LinkFunction = function(Proxy, Object, Field)
        if type(Object) ~= "userdata" and type(Object) ~= "table" then
            error("Arg#2 must be a userdata/table (Usually VeraniumInstances.)");
        end;
        if type(Field) ~= "string" then
            error("Arg#3 must be a string. (Resembles the varying field.)");
        end;
        local Meta = VCv_Data[Proxy];
        if type(Meta) == "table" and type(Meta.___Linked) == "table" then
            local Linked = Meta.___Linked;
            if type(Linked[Object]) == "table" then
                Object[Field] = Meta.___Value.Value;
                Linked[Object][Field] = true;
            else
                Object[Field] = Meta.___Value.Value;
                Linked[Object] = {
                    [Field] = true
                };
            end;
        else
            error("Arg#1 is not a VCv. (This could be because you're using '.' instead of ':'.)");
        end;
    end,
    UnlinkFunction = function(Proxy, Object, Field, NoErrors)
        if type(Object) ~= "userdata" and type(Object) ~= "table" then
            error("Arg#2 must be a userdata/table (Usually VeraniumInstances.)");
        end;
        if type(Field) ~= "string" then
            error("Arg#3 must be a string. (Resembles the varying field.)");
        end;
        local Meta = VCv_Data[Proxy];
        if type(Meta) == "table" and type(Meta.___Linked) == "table" then
            local Linked = Meta.___Linked;
            if type(Linked[Object]) == "table" then
                Linked[Object][Field] = nil;
            elseif not NoErrors then
                error("This Object wasn't linked.");
            else return;
            end;
        else
            error("Arg#1 is not a VCv. (This could be because you're using '.' instead of ':'.)");
        end;
    end,
    RemoveVariant = function(Proxy)
        local Meta = VCv_Data[Proxy];
        if type(Meta) == "table" then
            VCv_Data[Proxy] = nil;
            Meta.___Connection:Disconnect();
            Meta.___Value:Remove();
            Meta.___Value:Destroy();
            Meta.___Tweens = nil;
            Meta.___Linked = nil;
            Meta.___On = false;
            Meta.___Removed = true;
            Meta.___ColorCycle = nil;
        else
            error("OwO what's this? (Incorrect Meta).");
        end;
    end
};
local VCv_Meta = {
    __tostring = function(Proxy)
        if type(VCv_Data[Proxy]) == "table" then
            return "VeraniumColorVariant";
        else
            error("OwO what's this? (Incorrect Meta).");
        end;
    end,
    __index = function(Proxy, Field)
        local Meta = VCv_Data[Proxy];
        if type(Meta) == "table" then
            local Value = Meta["___"..Field];
            if Value and Field ~= "Linked" and Field ~= "Tweens" then
                return Value;
            elseif Field == "Link" then
                return VLb_ColorVariants.LinkFunction;
            elseif Field == "Unlink" then
                return VLb_ColorVariants.UnlinkFunction;
            elseif Field == "Remove" or Field == "Destroy" then
                return VLb_ColorVariants.RemoveVariant;
            else
                return error("Attempt to index field '"..Field.."'.");
            end;
        else
            error("OwO what's this? (Incorrect Meta)");
        end;
    end,
    __newindex = function(Proxy, Field, Value)
        local Meta = VCv_Data[Proxy];
        if type(Meta) == "table" then
            if Field == "On" then
                if type(Value) ~= "boolean" then
                    return error("Invalid property type. (Expected boolean, got "..typeof(Value)..")");
                end;
                Meta.___On = Value;
                return;
            end;
            error("ColorVariants cannot be modified after creation.");
        else
            error("OwO what's this? (Incorrect Meta.)");
        end;
    end,
    __metatable = "I-... I can't let you see that! >///<"--No Context x2 uwu
}

local function VCv_Create(EasingStyle, EasingDirection, Interval, ...)
    local VCv_Cycle = {...};
    --Type Checks | EasingStyle
    if typeof(EasingStyle) == "EnumItem" then
        if not string.find(tostring(EasingStyle), "Enum.EasingStyle.") then
            error("Arg#1 Must Be A Color3 Or An EasingStyle.");
        end;
    elseif typeof(EasingStyle) == "Color3" then
        table.insert(VCv_Cycle, 1, EasingStyle);
        EasingStyle = Enum.EasingStyle.Sine;
    else
        error("Arg#1 Must Be A Color3 Or An EasingStyle.");
    end;
    --Type Checks | EasingDirection
    if typeof(EasingDirection) == "EnumItem" then
        if not string.find(tostring(EasingDirection), "Enum.EasingDirection.") then
            error("Arg#2 Must Be A Color3 Or An EasingDirection.");
        end;
    elseif typeof(EasingDirection) == "Color3" then
        table.insert(VCv_Cycle, 2, EasingDirection);
        EasingDirection = Enum.EasingDirection.Out;
    else
        error("Arg#2 Must Be A Color3 Or An EasingDirection.");
    end;
    --Type Checks | Interval
    if typeof(Interval) == "Color3" or Interval == nil then
        table.insert(VCv_Cycle, 3, Interval);
        Interval = 1;
    elseif type(Interval) ~= "number" then
        error("Arg#3 Must Be A Color3 Or A Number.");
    end;
    if #VCv_Cycle < 2 then
        error("There Must Be At Least 2 Colors In The Cycle.");
    end;
    VCf_SetReadOnly(VCv_Cycle);
    --Proxy Creation
    local Proxy = newproxy(true);
    local Meta = getmetatable(Proxy);
    local Tweens = {};
    local Linked = {};
    local Base = Instance.new("Color3Value");
    Base.Value = VCv_Cycle[1];
    Base.Name = _PREFIX.."VeraniumColorVariantBase";
    --Metatable Setup
    Meta.___EasingStyle = EasingStyle;
    Meta.___EasingDirection = EasingDirection;
    Meta.___Interval = Interval;
    Meta.___ColorCycle = VCv_Cycle;
    Meta.___On = true;
    Meta.___Value = Base;
    Meta.___Linked = Linked;
    Meta.___Tweens = Tweens;
    Meta.___Removed = false;
    Meta.___Connection = Base.Changed:Connect(function()
        local Color = Base.Value;
        if Meta.___On then
            for Object, Fields in pairs(Linked)do
                for Field, _ in pairs(Fields)do
                    if _ then
                        Object[Field] = Color;
                    end;
                end;
            end;
        end;
    end);
    --Metamethod Setup
    Meta.__tostring = VCv_Meta.__tostring;
    Meta.__index = VCv_Meta.__index;
    Meta.__newindex = VCv_Meta.__newindex;
    Meta.__metatable = VCv_Meta.__metatable;
    --Linking Proxy To Meta
    VCv_Data[Proxy] = Meta;
    --Creating Tweens
    for _, Color in pairs(VCv_Cycle)do
        table.insert(Tweens, TweenService:Create(Base, TweenInfo.new(
            Interval,
            EasingStyle,
            EasingDirection,
            0,
            false,
            0
        ), {
            Value = Color,nil
        }));
    end;
    spawn(function()
        while not Meta.___Removed do
            if Meta.___On then
                for _, Tween in pairs(Tweens)do
                    if Meta.___On then
                        Tween:Play();
                        wait(Interval);
                    end;
                end;
            else
                wait(Interval);
            end;
        end;
        Linked = nil;
        Tweens = nil;
        VCv_Cycle = nil;
    end);
    return Proxy;
end;
VLb_ColorVariants.Create = VCv_Create;
VCf_SetReadOnly(VLb_ColorVariants);

--Libraries | ModernColors | Source: https://flatuicolors.com/
local VLb_ModernColors = {
    DimMidnightBlue = Color3.fromRGB(32, 34, 37),
    MidnightBlue = Color3.fromRGB(47, 49, 54),
    LightMidnightBlue = Color3.fromRGB(54, 57, 63),
    WetAsphalt = Color3.fromRGB(44, 62, 80),
    Asphalt = Color3.fromRGB(52, 73, 94),
    Midnight = Color3.fromRGB(47, 53, 66),
    ElectricBlue = Color3.fromRGB(52, 152, 219),
    Blurple = Color3.fromRGB(72, 52, 212),
    Exodus = Color3.fromRGB(104, 109, 224),
    Komaru = Color3.fromRGB(48, 51, 107),
    DimKomaru = Color3.fromRGB(19, 15, 64),
    LightExodus = Color3.fromRGB(126, 214, 223),
    Amythest = Color3.fromRGB(155, 89, 182),
    Wisteria = Color3.fromRGB(142, 68, 173),
    Emerald = Color3.fromRGB(46, 204, 113),
    Carrot = Color3.fromRGB(230, 126, 34),
    Orange = Color3.fromRGB(243, 156, 18),
    SunFlower = Color3.fromRGB(241, 196, 15),
    Ruby = Color3.fromRGB(231, 76, 60),
    Rose = Color3.fromRGB(192, 57, 43),
    LightPink = Color3.fromRGB(255, 121, 121),
    DimPink = Color3.fromRGB(235, 77, 75),
    Pink = Color3.fromRGB(224, 86, 253),
    SteelPink = Color3.fromRGB(224, 86, 253),
    Light = Color3.fromRGB(213, 217, 255),
    Cloud = Color3.fromRGB(236, 240, 241),
    Silver = Color3.fromRGB(189, 195, 199),
    Concrete = Color3.fromRGB(149, 165, 166),
    Abestos = Color3.fromRGB(127, 140, 141)
};

--Veranium Defaults Library.
--This is used to define defaults for VIn Objects.
local VLb_Defaults = {
    --Background:Corners
    CornerSize = 6,
    CornerType = VLb_Enums.CornerType.Smooth,
    --Background:Self
    BackgroundColor = VLb_ModernColors.MidnightBlue,
    BackgroundTransparency = 0,
    --Background:Borders
    BorderSize = 0,
    BorderColor = Color3.new(0, 0, 0),
    BorderTransparency = 1,
    --Text Properties
    TextColor = VLb_ModernColors.Silver,
    TextTransparency = 0,
    Font = Enum.Font.Legacy,
    --Text:Stroke
    TextStrokeColor = VLb_ModernColors.Abestos,
    TextStrokeTransparency = 1,
    --Text:Alignment
    TextXAlignment = Enum.TextXAlignment.Center,
    TextYAlignment = Enum.TextYAlignment.Center,
    --Text:Placeholder
    PlaceholderColor = VLb_ModernColors.Silver,
    --Global
    ZIndex = 1,
    SecondaryColor = VLb_ModernColors.DimMidnightBlue,
    HighlightColor = VLb_ModernColors.ElectricBlue,
    MetroStyle = true
};

local VIn_References = {};--Stores refrences by proxies as keys.
local VIn_Data = {};--Contains data for different instances, such as their Propeties, TypeLocks, & so on.
local VIn_ParseD = {};--Contains all proxies created by Veranium by MainInstances as keys.
local VIn_Methods = {};--Contains most common methods for VeraniumInstances.
local VIn_SReg = {};--Contains frequently used tables/proxies. Exists to stop the creation of new tables/proxies.(SReg = Secondary Registry).
local VIn_Meta = {};--Main metatable for VeraniumInstances.

local function GetMeta(Proxy)--Gets the metatable of Veranium Proxies, ignoring __metatable.
    return VIn_References[Proxy];
end;

local VCn_Main = function(Class, ...)--Main Constructor. Usef for Veranium.Create.
    local Constructor = VIn_Data[Class];
    if type(Constructor) == "table" then
        Constructor = Constructor.Constructor;
        if type(Constructor) == "function" then
            local Proxy = Constructor(...);
            local Meta = GetMeta(Proxy);
            VIn_ParseD[Proxy] = Meta.___Instance;
            return Proxy;
        else
            return error("Unable to create Instance of type "..tostring(Class));
        end;
    else
        return error("Unable to create Instance of type "..tostring(Class));
    end;
end;

local function GetInstance(Object)
    if not Object then return nil end;
    if typeof(Object) == "Instance" then return Object end;
    local Meta = VIn_References[Object];
    if type(Meta) == "table" and typeof(Meta.___Instance) == "Instance" then
        return Meta.___Instance;
    end;
    return nil;
end;

local function GetPInstance(Object)
    if not Object then return nil end;
    if typeof(Object) == "Instance" then return Object end;
    local Meta = VIn_References[Object];
    if type(Meta) == "table" and typeof(Meta.___Instance) == "Instance" then
        if Meta.___Children then
            return Meta.___Children;
        end;
        return Meta.___Instance;
    end;
    return nil;
end;

local function VCf_ParseInstance(Object, RemoveJunk)
    if typeof(Object) ~= "Instance" then
        return error("Invalid type for Argument #1: Instance expected, got "..typeof(Object)..".");
    end
    if VIn_ParseD[Object] then
        if RemoveJunk then
            if not string.find(Object.Name, _PREFIX) then
                return VIn_ParseD[Object];
            end;
        else
            return VIn_ParseD[Object];
        end;
    end;
    return Object;
end;

local function VCf_IsVera(Object)
    return (VIn_References[Object] ~= nil);
end;

local function VCf_AssertIsVera(Object, ArgN)--Makes it easy for me to say: error if Proxy isn't Veranium. ArgN = Argument Number.
    if not VIn_References[Object] then
        error("Expected VeraniumInstance for arg#"..tostring(ArgN or 1)..". got "..typeof(Object).." (Object might be destroyed).");
    end;
end;


--metatable Setup.
--__tostring
VIn_Meta.__tostring = function(self)
    VCf_AssertIsVera(self);
    local Meta = GetMeta(self);
    local Fields = Meta.___Fields;
    local Object = GetInstance(self);
    --Instance Name tostring
    if typeof(Object) == "Instance" then
        if Object.Name:find(_PREFIX) then
            return Object.Name:sub(#_PREFIX+1, -1);
        else
            return Object.Name;
        end;
    end;
    --Field tostring
    if Fields and Fields.Name then
        return Fields.Name;
    elseif Fields and Fields.ClassName then--ClassName tostring
        return Fields.ClassName;
    end;
    --Exception tostring
    return "VeraniumInstance";
end;

--__index
VIn_Meta.__index = function(self, Field)
    local Meta = GetMeta(self);
    if (Field == "Destructor" or Field == "Destroy" or Field == "Remove") then
        return VCf_Destructor;
    elseif Field == "IsDestroyed" then
        return not VCf_IsVera(self);
    else
        VCf_AssertIsVera(self);
    end;
    local Fields = Meta.___Fields;
    local MetaData = Meta.___MetaData;
    if MetaData then
        --Changed Idx
        if Field == "Changed" then
            return Meta.___ChangeSignal.Event;
        end;
        --Method Idx
        if VIn_Methods[Field] then
            return VIn_Methods[Field];
        end;
        --Property Idx
        local Route = MetaData.Routing[Field];
        local IVRouting = VIn_SReg.IVRouting[Field];
        if MetaData.Fields[Field] then
            return Fields[Field];
        end;
        --Routing Idx
        if type(Route) == "string" then
            return self[Route];
        elseif type(Route) == "table" then
            return Meta[Route.RouteInstance][Route.RouteField];
        end;
        --IVRouting Idx
        if type(IVRouting) == "string" then
            IVRouting = Meta[IVRouting]
            if IVRouting then
                return IVRouting[Field];
            end;
        end;
        --Children Idx
        local Object = GetInstance(self);
        if typeof(Object) == "Instance" then
            local Child = Object:FindFirstChild(Field);
            if Child then
                return VCf_ParseInstance(Child);
            end;
        end;
        --Exception Error
        error("Unable to index VeraniumInstance with '"..tostring(Field).."'");
    else
        error("Unable to get MetaData. [001]");
    end;
    error("Unable to index VeraniumInstance with '"..tostring(Field).."'");
end;

--__newindex
VIn_Meta.__newindex =  function(self, Field, Value)
    VCf_AssertIsVera(self);
    local Meta = GetMeta(self);
    local Fields = Meta.___Fields;
    local MetaData = Meta.___MetaData;
    if MetaData then
        local Route = MetaData.Routing[Field];
        local IVRouting = VIn_SReg.IVRouting[Field];
        local FieldData = MetaData.Fields[Field];
        local ReadOnly;
        if FieldData then
            ReadOnly = (FieldData:sub(3, 3) == "\1");
        end;
        --Direct Ndx
        if FieldData and not ReadOnly then
            if not VCf_IsA(Value, FieldData) then
                return error("Invalid type for "..Field..". ("..FieldData:sub(4, -1).." expected, got "..typeof(Value)..").");
            end;
            if Field == "Parent" then
                Meta.___Instance.Parent = GetPInstance(Value);
            end;
            Fields[Field] = Value;
            MetaData.Redraw(self, Field, Value);
            if Meta.___ChangeSignal then
                Meta.___ChangeSignal:Fire(Field, Value);
            end;
            return;
        elseif FieldData and ReadOnly then
            error(Field.." is read-only.");
        end;
        --Routing Ndx
        if type(Route) == "string" then
            self[Route] = Value
            if Meta.___ChangeSignal then
                Meta.___ChangeSignal:Fire(Field, Value);
            end;
            return
        elseif type(Route) == "table" then
            Meta[Route.RouteInstance][Route.RouteField] = Value
            if Meta.___ChangeSignal then
                Meta.___ChangeSignal:Fire(Field, Value);
            end;
            return;
        end;
        --IVRouting Ndx
        if typeof(IVRouting) == "string" then
            IVRouting = Meta[IVRouting]
            if IVRouting then
                IVRouting[Field] = Value
                if Meta.___ChangeSignal then
                    Meta.___ChangeSignal:Fire(Field, Value);
                end;
                return;
            end;
        end;
        --Exceptional Error
        error("Unable to index VeraniumInstance with '"..tostring(Field).."'");
    end;
end;

--metatable Protection
VIn_Meta.__metatable = "Hewo, can you pwease not cwash Vewanium? uwu";


--Inputs
local function VIn_CreateClass(ClassName, Fields, Routing, Constructor, Redraw, Methods)
    local ClassData = {};
    VIn_Data[ClassName] = ClassData;
    --Fields
    ClassData.Fields = Fields;
    --Routing
    ClassData.Routing = Routing;
    --Constructor
    ClassData.Constructor = Constructor;
    --Redraw
    if type(Redraw) == "function" then
        ClassData.Redraw = Redraw;
    elseif type(Redraw) == "table" then
        ClassData.Redraw = function(self, Field, Value)
            if Field == nil then
                for Idx, Function in pairs(Redraw) do
                    if Idx == "Main" then
                        Function(self, Field, Value);
                    else
                        Function(self, Value);
                    end;
                end;
                return;
            end;
            if type(Redraw[Field]) == "function" then
                return Redraw[Field](self, Value);
            elseif type(Redraw.Main) == "function" then
                return Redraw.Main(self, Field, Value);
            end;
        end;
    end;
    --Methods Implement
    if Methods then
        for MethodName, Method in pairs(Methods)do
            ClassData[MethodName] = Method;
        end;
    end;

    return ClassData;
end;

local function VIn_CreateInstance(MetaData)
    local Proxy = newproxy(true);
    local Meta = getmetatable(Proxy);
    local ChangeSignal = Instance.new("BindableEvent");
    local Fields = {};
    ChangeSignal.Name = "VeraniumChangeSignal";
    Meta.___MetaData = MetaData;
    Meta.__index = VIn_Meta.__index;
    Meta.__newindex = VIn_Meta.__newindex;
    Meta.__tostring = VIn_Meta.__tostring;
    Meta.__metatable = VIn_Meta.__metatable;
    VIn_References[Proxy] = Meta;
    Meta.___Fields = Fields;
    Meta.___ChangeSignal = ChangeSignal;
    return Proxy, Meta, Fields, ChangeSignal;
end;

--VIn_SReg IVRouting Setup
VIn_SReg.IVRouting = {
    --Properties
    --Base2D
    AbsolutePosition = "___Base2D",
    AbsoluteRotation = "___Base2D",
    AbsoluteSize = "___Base2D",
    Active = "___Base2D",
    AnchorPoint = "___Base2D",
    ClipsDescendants = "___Base2D",
    LayoutOrder = "___Base2D",
    Position = "___Base2D",
    Rotation = "___Base2D",
    Size = "___Base2D",
    SizeConstraint = "___Base2D",
    Visible = "___Base2D",
    ZIndex = "___Base2D",
    Parent = "___Base2D",
    Name = "___Base2D",

    --TextRender
    Font = "___TextRender",
    LineHeight = "___TextRender",
    LocalizedText = "___TextRender",
    Text = "___TextRender",
    TextBounds = "___TextRender",
    TextColor3 = "___TextRender",
    TextFits = "___TextRender",
    TextScaled = "___TextRender",
    TextSize = "___TextRender",
    TextStrokeColor3 = "___TextRender",
    TextStrokeTransparency = "___TextRender",
    TextTransparency = "___TextRender",
    TextTruncate = "___TextRender",
    TextWrapped = "___TextRender",
    TextXAlignment = "___TextRender",
    TextYAlignment = "___TextRender",

    --ImageRender
    HoverImage = "___ImageRender",
    Image = "___ImageRender",
    ImageColor3 = "___ImageRender",
    ImageRectOffset = "___ImageRender",
    ImageRectSize = "___ImageRender",
    ImageTransparency = "___ImageRender",
    IsLoaded = "___ImageRender",
    PressedImage = "___ImageRender",
    ScaleType = "___ImageRender",
    SliceCenter = "___ImageRender",
    SliceScale = "___ImageRender",
    TileSize = "___ImageRender",

    --TextBox
    IsFocused = "___TextBox",
    PlaceholderColor3 = "___TextBox",
    PlaceholderText = "___TextBox",
    ClearTextOnFocus = "___TextBox",
    TextEditable = "___TextBox",
    CursorPosition = "___TextBox",
    SelectionStart = "___TextBox",
    Selectable = "___TextBox",

    --Background
    Color = "___Background",
    BackgroundColor = "___Background",
    BackgroundColor3 = "___Background",
    BackgroundTransparency = "___Background",
    Transparency = "___Background",
    Type = "___Background",
    CornerType = "___Background",
    CornerSize = "___Background",
    TopLeft = "___Background",
    TopBorder = "___Background",
    TopRight = "___Background",
    LeftBorder = "___Background",
    RightBorder = "___Background",
    BottomLeft = "___Background",
    BottomBorder = "___Background",
    BottomRight = "___Background",

    BorderSizePixel = "___Background",
    BorderSize = "___Background",
    BorderColor3 = "___Background",
    BorderColor = "___Background",
    BorderTransparency = "___Background",

    --Methods
    --Background
    CreateBorder = "___Background",
    --Base2D
    TweenPosition = "___Base2D",
    TweennSize = "___Base2D",
    TweenSizeAndPosition = "___Base2D",

    --Hitbox
    SetTextFromInput = "___CHitbox",

    --TextBox
    CaptureFocus = "___TextBox",
    ReleaseFocus = "___TextBox",
    --Signals
    --Hitbox
    MouseButton1Click = "___CHitbox",
    MouseButton2Click = "___CHitbox",
    MouseButton1Down = "___CHitbox",
    MouseButton2Down = "___CHitbox",
    MouseButton1Up = "___CHitbox",
    MouseButton2Up = "___CHitbox",
    MouseEnter = "___CHitbox",
    MouseLeave = "___CHitbox",
    MouseMoved = "___CHitbox",
    MouseWheelBackward = "___Base2D",
    MouseWheelForward = "___Base2D",
    InputBegan = "___CHitbox",
    InputEnded = "___CHitbox",
    InputChanged = "___CHitbox",

    --Textbox
    Focused = "___TextBox",
    FocusLost = "___TextBox"
};

--VIn_SReg OffsetMap Setup
VIn_SReg.OffsetMap = {
    [0] = {
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(0, 0, 0, 0),
        SizeConstraint = Vector2.new(0, 0),
        ImageRectSize = Vector2.new(400, 400),
        ImageRectOffset = Vector2.new(0, 0),
        Name = "TopLeft"
    },
    [1] = {
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.new(0.5, 0, 0, 0),
        SizeConstraint = Vector2.new(1, 0),
        ImageRectSize = Vector2.new(1, 1),
        ImageRectOffset = Vector2.new(399, 399),
        Name = "TopCenter"
    },
    [2] = {
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.new(1, 0, 0, 0),
        SizeConstraint = Vector2.new(0, 0),
        ImageRectSize = Vector2.new(400, 400),
        ImageRectOffset = Vector2.new(400, 0),
        Name = "TopRight"
    },
    [3] = {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(0, 0, 0.5, 0),
        SizeConstraint = Vector2.new(0, 1),
        ImageRectSize = Vector2.new(1, 1),
        ImageRectOffset = Vector2.new(399, 399),
        Name = "LeftCenter"
    },
    [4] = {
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(1, 0, 0.5, 0),
        SizeConstraint = Vector2.new(0, 1),
        ImageRectSize = Vector2.new(1, 1),
        ImageRectOffset = Vector2.new(399, 399),
        Name = "RightCenter"
    },
    [5] = {
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(0, 0, 1, 0),
        SizeConstraint = Vector2.new(0, 0),
        ImageRectSize = Vector2.new(400, 400),
        ImageRectOffset = Vector2.new(0, 400),
        Name = "BottomLeft"
    },
    [6] = {
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 1, 0),
        SizeConstraint = Vector2.new(1, 0),
        ImageRectSize = Vector2.new(1, 1),
        ImageRectOffset = Vector2.new(399, 399),
        Name = "BottomCenter"
    },
    [7] = {
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.new(1, 0, 1, 0),
        SizeConstraint = Vector2.new(0, 0),
        ImageRectSize = Vector2.new(400, 400),
        ImageRectOffset = Vector2.new(400, 400),
        Name = "BottomRight"
    }
};

--[[Offset Map
    ____________________
    |                    |
    |0         1        2|
    |                    |
    |3                  4|
    |                    |
    |5         6        7|
    |____________________|

    Typelock Syntax

    [Byte#]: Definer
    [1]: VCf_IsA Instruction (Explained Below)
    [2]: Nullable (Property can be NULL/NIL)
    [3]: Read-Only (Property cannot be written to)
    [4-#s]: Type DataString

    VCf_IsA Instructions:
    [0]: VEnum IsA (Checks if the value is a VEnum of the type provided in DataString)
    [1]: VCv IsA (Checks if the value is a VeraniumColorVariant | Doesn't need a DataString)
    [2]: BaseInstance IsA (BaseInstance = VeraniumProxy/RbxInstance | Doesn't need a DataString)
    [3]: type() IsA (Checks the type() of the Value and compares it to DataString)
    [4]: typeof() IsA (Check the typeof() of the Value and compares it to DataString)
    [5]: Accepts all value types (No DataString needed)

    All VCf_IsA Instructions could be altered by [Byte#2], Nullable.
    No instruction uses [Byte#3]. It is only used by __newindex.
]]

--VIn_SReg TransparencyLayer Setup
VIn_SReg.TransparencyLayer = {
    VeraniumLabel = {"BackgroundTransparency", "TextTransparency"},
    VeraniumButton = {"BackgroundTransparency", "TextTransparency"},
    VeraniumTextBox = {"BackgroundTransparency", "TextTransparency"},

    VeraniumSlider = {"BarTransparency", "MarkupTransparency"},
    VeraniumCheckBox = {"StartBoxTransparency", "EndBoxTransparency", "StartCheckTransparency", "EndCheckTransparency"},
    VeraniumFillBox = {"StartBoxTransparency", "EndBoxTransparency"},
    VeraniumCounter = {"BackgroundTransparency", "SubtractTransparency", "AddTransparency"},
    VeraniumDropdownBox = {"BackgroundTransparency", "TextTransparency"}
};

--ClassData Creations
--Boundary
VIn_CreateClass("Boundary",
    {
        BackgroundColor3 = "\4\0\0Color3",
        BackgroundTransparency = "\3\0\0number",

        Size = "\3\0\0number",
        Offset = "\3\0\1number",

        Background = "\2\1\1",
        ClassName = "\3\0\1string",

        Type = "\0\0\0CornerType",

        --Border Properties
        BorderColor3 = "\4\0\0Color3",
        BorderTransparency = "\3\0\0number",
        BorderSizePixel = "\3\0\0number",

        --Methods
        Redraw = "\3\0\1function",
        Destructor = "\3\0\1function",
        CreateBorder = "\3\0\1function"
    },
    {
        BoundarySize = "Size",

        BoundaryColor3 = "BackgroundColor3",
        BoundaryColor = "BackgroundColor3",
        Color = "BackgroundColor3",
        --Color

        BoundaryTransparency = "BackgroundTransparency",
        Transparency = "BackgroundTransparency",
        --Transparency

        BorderColor = "BorderColor3",
        BorderSize = "BorderSizePixel",
        --Border
    },
    function(Background, Offset)
        local BGMeta = GetMeta(Background);
        if BGMeta and BGMeta.___Fields.ClassName == "VeraniumBoundary" then
            Offset = Background.Offset;
        end;
        if type(Offset) ~= "number" then Offset = 0 end
        local Proxy, Meta, Fields, Cs = VIn_CreateInstance(VIn_Data.Boundary)
        --Proxy Setup
        Fields.BackgroundColor3 = VLb_Defaults.BackgroundColor;
        Fields.BackgroundTransparency = VLb_Defaults.BackgroundTransparency;

        Fields.Size = VLb_Defaults.CornerSize;
        Fields.Offset = Offset or 0;

        Fields.Background = Background;
        Fields.ClassName = "VeraniumBoundary";

        Fields.Type = VLb_Defaults.CornerType;

        Fields.BorderColor3 = VLb_Defaults.BorderColor;
        Fields.BorderTransparency = VLb_Defaults.BorderTransparency;
        Fields.BorderSizePixel = VLb_Defaults.BorderSize;

        --Methods Setup
        Fields.CreateBorder = VIn_Data.Boundary.CreateBorder;
        Fields.Redraw = VIn_Data.Boundary.Redraw;
        --Defaults Setup
        local Boundary = Instance.new("ImageLabel", GetInstance(Background));
        local OffsetMap = VIn_SReg.OffsetMap[Offset or 0];
        --Boundary Setup
        Boundary.Name = _PREFIX..OffsetMap.Name.."Boundary";
        Boundary.BackgroundTransparency = 1;
        Boundary.AnchorPoint = OffsetMap.AnchorPoint;
        Boundary.Position = OffsetMap.Position;
        Boundary.BorderSizePixel = 0;
        Boundary.ImageRectSize = OffsetMap.ImageRectSize;
        Boundary.ImageRectOffset = OffsetMap.ImageRectOffset;
        --ChangedSignal
        Cs.Parent = Boundary;
        --MetaData Setup
        Meta.___Instance = Boundary;
        Meta.___Base2D = Boundary;
        --Border Linkage
        if BGMeta and BGMeta.___Fields.ClassName == "VeraniumBoundary" then
            Meta.IsBorder = true;
            BGMeta.___Border = Boundary;
            Boundary.Parent = Background.Background;
            Boundary.Name = _PREFIX..OffsetMap.Name.."Border";
            for Idx, Value in pairs(BGMeta.___Fields) do
                Fields[Idx] = Value;
            end;
            Fields.CornerSize = Background.Size+Background.BorderSizePixel;
            Fields.BackgroundColor3 = Background.BorderColor3;
            Fields.BackgroundTransparency = Background.BorderTransparency;
            Boundary.ZIndex = 0;

            local function RefreshSize()
                local OffsetMap = VIn_SReg.OffsetMap[Background.Offset];
                local SizeConstraint = OffsetMap.SizeConstraint;
                local BorderSizePixel = Background.BorderSizePixel + Background.Size;
                Boundary.Size = UDim2.new(
                    SizeConstraint.X,
                    BorderSizePixel-(SizeConstraint.X*BorderSizePixel),
                    SizeConstraint.Y,
                    BorderSizePixel-(SizeConstraint.Y*BorderSizePixel)
                );
            end;

            Background.Changed:Connect(function(Field)
                if Field == "Size" or Field == "BorderSizePixel" then
                    RefreshSize();
                elseif Field == "Type" then
                    Proxy.Type = Background.Type;
                end;
            end);

            VIn_Data.Boundary.Redraw(Proxy);
            Background:Redraw();
            RefreshSize();
        else
            VIn_Data.Boundary.Redraw(Proxy);
        end;

        return Proxy;
    end,
    function(self, Field, Value)
        --Setup
        local Meta = GetMeta(self);
        local Boundary = Meta.___Instance;
        local Fields = Meta.___Fields;
        local Border = Meta.___Border;
        local IsBorder = Meta.IsBorder;
        --Type
        if Field == nil or Field == "Type" then
            Boundary.Image = VCf_GetEnumLValue("CornerType", Fields.Type);
            if Field then return; end;
        end;
        --BackgroundColor3
        if Field == nil or Field == "BackgroundColor3" then
            Boundary.ImageColor3 = Fields.BackgroundColor3;
            if Field then return; end;
        end;
        --BackgroundTransparency
        if Field == nil or Field == "BackgroundTransparency" then
            Boundary.ImageTransparency = Fields.BackgroundTransparency;
            if Field then return; end;
        end;
        --Size
        if Field == nil or Field == "Size" and not IsBorder then
            local OffsetMap = VIn_SReg.OffsetMap[Fields.Offset];
            local SizeConstraint = OffsetMap.SizeConstraint;
            Boundary.Size = UDim2.new(
                SizeConstraint.X,
                Fields.Size-(SizeConstraint.X*Fields.Size),
                SizeConstraint.Y,
                Fields.Size-(SizeConstraint.Y*Fields.Size)
            );
            if Field then return; end;
        end;
        --BorderColor3
        if Field == nil or Field == "BorderColor3" then
            if Border then
                Border.ImageColor3 = Fields.BorderColor3;
                if Field then return; end;
            elseif Field then
                return; --warn("This Boundary has no Border. Use CreateBorder() to make one.");
            end;
        end;
        --BorderTransparency
        if Field == nil or Field == "BorderTransparency" then
            if Border then
                Border.ImageTransparency = Fields.BorderTransparency;
                if Field then return; end;
            elseif Field then
                return; --warn("This Boundary has no Border. Use CreateBorder() to make one.");
            end;
        end;
    end,
    {
        CreateBorder = function(self, Core)
            if Core then
                return VIn_Data.Boundary.Constructor(self);
            else
                VIn_Data.Boundary.Constructor(self);
            end;
        end
    }
);

VIn_CreateClass("Background", 
    {
        BackgroundColor3 = "\4\0\0Color3";
        BackgroundTransparency = "\3\0\0number",
        CornerSize = "\3\0\0number",
        Container = "\2\1\1",
        ClassName = "\3\0\1string",
        CornerType = "\0\0\0CornerType",

        --Border Properties
        BorderColor3 = "\4\0\0Color3",
        BorderTransparency = "\3\0\0number",
        BorderSizePixel = "\3\0\0number",

        --Methods
        Redraw = "\3\0\1function",
        CreateBorder = "\3\0\1function",

        TopLeft = "\2\1\1",
        TopCenter = "\2\1\1",
        TopRight = "\2\1\1",
        LeftCenter = "\2\1\1",
        RightCenter = "\2\1\1",
        BottomLeft = "\2\1\1",
        BottomCenter = "\2\1\1",
        BottomRight = "\2\1\1"
        --Boundaries
    },
    {
        BoundarySize = "CornerSize",
        BoundaryType = "CornerType",
        Type = "CornerType",
        --Boundary

        BoundaryColor3 = "BackgroundColor3",
        BoundaryColor = "BackgroundColor3",
        Color = "BackgroundColor3",
        --Color

        BoundaryTransparency = "BackgroundTransparency",
        Transparency = "BackgroundTransparency",
        --Transparency

        BorderColor = "BorderColor3",
        BorderSize = "BorderSizePixel"
        --Border
    },
    function(Container)
        local Proxy, Meta, Fields, Cs = VIn_CreateInstance(VIn_Data.Background);
        --Proxy Setup
        Fields.BackgroundColor3 = VLb_Defaults.BackgroundColor;
        Fields.BackgroundTransparency = VLb_Defaults.BackgroundTransparency;        
        Fields.Container = Container;
        Fields.ClassName = "VeraniumBackground";
        Fields.CornerSize = VLb_Defaults.CornerSize;
        Fields.CornerType = VLb_Defaults.CornerType;

        Fields.BorderColor3 = VLb_Defaults.BorderColor;
        Fields.BorderTransparency = VLb_Defaults.BorderTransparency;
        Fields.BorderSizePixel = VLb_Defaults.BorderSize;

        --Methods Setup
        Fields.CreateBorder = VIn_Data.Background.CreateBorder;
        Fields.Redraw = VIn_Data.Background.Redraw;
        --Elements Creation
        local Background = Instance.new("Frame", GetInstance(Container));
        local TopLeft = VIn_Data.Boundary.Constructor(Background, 0);
        local TopCenter = VIn_Data.Boundary.Constructor(Background, 1);
        local TopRight = VIn_Data.Boundary.Constructor(Background, 2);
        local LeftCenter = VIn_Data.Boundary.Constructor(Background, 3);
        local RightCenter = VIn_Data.Boundary.Constructor(Background, 4);
        local BottomLeft = VIn_Data.Boundary.Constructor(Background, 5);
        local BottomCenter = VIn_Data.Boundary.Constructor(Background, 6);
        local BottomRight = VIn_Data.Boundary.Constructor(Background, 7);
        --Follow:Proxy Setup
        Fields.TopLeft = TopLeft;
        Fields.TopCenter = TopCenter;
        Fields.TopRight = TopRight;
        Fields.LeftCenter = LeftCenter;
        Fields.RightCenter = RightCenter;
        Fields.BottomLeft = BottomLeft;
        Fields.BottomCenter = BottomCenter;
        Fields.BottomRight = BottomRight;
        --Background Setup
        Background.Name = _PREFIX.."VeraniumBackground";
        Background.BorderSizePixel = 0;
        Background.AnchorPoint = Vector2.new(0.5, 0.5);
        Background.Position = UDim2.new(0.5, 0, 0.5, 0);
        --ChangedSignal
        Cs.Parent = Background;
        --MetaData Setup
        Meta.___Instance = Background;
        Meta.___Base2D = Background;
        Meta.Boundaries = {
            TopLeft = TopLeft,
            TopCenter = TopCenter,
            TopRight = TopRight,
            LeftCenter = LeftCenter,
            RightCenter = RightCenter,
            BottomLeft = BottomLeft,
            BottomCenter = BottomCenter,
            BottomRight = BottomRight
        };
        --First Draw
        VIn_Data.Background.Redraw(Proxy);

        return Proxy;
    end,
    function(self, Field, Value)
        --Setup
        local Meta = GetMeta(self);
        local Background = Meta.___Instance;
        local Fields = Meta.___Fields;
        local SetAll = VIn_Data.Background.SetAll;
        --Type
        if Field == nil or Field == "CornerType" then
            SetAll(self, "Type", Fields.CornerType);
            if Field then return; end;
        end;
        --Size
        if Field == nil or Field == "CornerSize" then
            Background.Size = UDim2.new(
                1,
                -(Fields.CornerSize+Fields.BorderSizePixel)*2,
                1,
                -(Fields.CornerSize+Fields.BorderSizePixel)*2
            );
            SetAll(self, "Size", Fields.CornerSize);
            if Field then return; end;
        end;
        --BackgroundColor3
        if Field == nil or Field == "BackgroundColor3" then
            Background.BackgroundColor3 = Fields.BackgroundColor3;
            SetAll(self, "BackgroundColor3", Fields.BackgroundColor3);
            if Field then return; end;
        end;
        --BackgroundTransparency
        if Field == nil or Field == "BackgroundTransparency" then
            Background.BackgroundTransparency = Fields.BackgroundTransparency;
            SetAll(self, "BackgroundTransparency", Fields.BackgroundTransparency);
            if Field then return; end;
        end;
        --BorderColor3
        if Field == nil or Field == "BorderColor3" then
            SetAll(self, "BorderColor3", Fields.BorderColor3);
            if Field then return; end;
        end;
        --BorderTransparency
        if Field == nil or Field == "BorderTransparency" then
            SetAll(self, "BorderTransparency", Fields.BorderTransparency);
            if Field then return; end;
        end;
        --BorderSizePixel
        if Field == nil or Field == "BorderSizePixel" then
            Background.Size = UDim2.new(
                1,
                -(Fields.CornerSize+Fields.BorderSizePixel)*2,
                1,
                -(Fields.CornerSize+Fields.BorderSizePixel)*2
            );
            SetAll(self, "BorderSizePixel", Fields.BorderSizePixel);
            if Field then return; end;
        end;
    end,
    {
        CreateBorder = function(self)
            local Meta = GetMeta(self);
            if Meta.___Background then
                self = Meta.___Background;
                Meta = GetMeta(self);
            end;
            if type(Meta) == "table" and type(Meta.Boundaries) == "table" then
                for Idx, Boundary in pairs(Meta.Boundaries)do
                    Boundary:CreateBorder();
                end;
            end;
        end,
        SetAll = function(self, Field, Value)
            local Meta = GetMeta(self);
            if type(Meta) == "table" and type(Meta.Boundaries) == "table" then
                for Idx, Boundary in pairs(Meta.Boundaries)do
                    Boundary[Field] = Value;
                end;
            end;
        end
    }
);

VIn_CreateClass("Label",
    {
        --Main
        Parent = "\2\1\0",
        ClassName = "\3\0\1string",
        ZIndex = "\3\0\0number",

        --Methods
        Redraw = "\3\0\1function"
    },
    {

    },
    function(Parent)
        local Proxy, Meta, Fields, Cs = VIn_CreateInstance(VIn_Data.Label);
        --Proxy Setup
        Fields.ClassName = "VeraniumLabel";
        Fields.Parent = Parent;
        Fields.ZIndex = VLb_Defaults.ZIndex;
        --Methods Setup
        Fields.Redraw = VIn_Data.Label.Redraw;
        --Elements Creation
        local Main = Instance.new("Frame", GetPInstance(Parent));
        local Background = VIn_Data.Background.Constructor(Main);
        local ImageRender = Instance.new("ImageLabel", Main);
        local TextRender = Instance.new("TextLabel", Main);
        --Main Setup
        Main.BackgroundTransparency = 1;
        Main.BorderSizePixel = 0;
        Main.Name = "VeraniumLabel";
        Main.Size = UDim2.new(0, 105, 0, 25);
        --TextRender Setup
        TextRender.Name = _PREFIX.."TextRender";
        TextRender.Text = "Veranium Label";
        TextRender.BackgroundTransparency = 1;
        TextRender.BorderSizePixel = 0;
        TextRender.Size = UDim2.new(1, 0, 1, 0);
        TextRender.Position = UDim2.new(0.5, 0, 0.5, 0);
        TextRender.AnchorPoint = Vector2.new(0.5, 0.5);
        --TextRender Defaults
        TextRender.TextColor3 = VLb_Defaults.TextColor;
        TextRender.TextTransparency = VLb_Defaults.TextTransparency;
        TextRender.Font = VLb_Defaults.Font;

        TextRender.TextStrokeColor3 = VLb_Defaults.TextStrokeColor;
        TextRender.TextStrokeTransparency = VLb_Defaults.TextStrokeTransparency;
        
        TextRender.TextXAlignment = VLb_Defaults.TextXAlignment;
        TextRender.TextYAlignment = VLb_Defaults.TextYAlignment;
        --ImageRender Setup
        ImageRender.Name = _PREFIX.."ImageRender";
        ImageRender.Image = "";
        ImageRender.BackgroundTransparency = 1;
        ImageRender.BorderSizePixel = 0;
        ImageRender.Size = UDim2.new(1, 0, 1, 0);
        ImageRender.Position = UDim2.new(0.5, 0, 0.5, 0);
        ImageRender.AnchorPoint = Vector2.new(0.5, 0.5);
        --ChangedSignal
        Cs.Parent = Main;
        --MetaData Setup
        Meta.___Instance = Main;
        Meta.___Base2D = Main;
        Meta.___Background = Background;
        Meta.___TextRender = TextRender;
        Meta.___ImageRender = ImageRender;
        --First Draw
        VIn_Data.Label.Redraw(Proxy);

        return Proxy;
    end,
    function(self, Field, Value)
        --Setup
        local Meta = GetMeta(self);
        local Main = Meta.___Instance;
        local Fields = Meta.___Fields;
        --Shortest Redraw known to man!
        Main.ZIndex = Fields.ZIndex;
    end,
    {

    }
);

VIn_CreateClass("Button",
    {
        --Main
        Parent = "\2\1\0",
        ClassName = "\3\0\1string",
        ZIndex = "\3\0\0number",
        BackgroundColor3 = "\4\0\0Color3",
        Image = "\3\0\0string",
        ClipsDescendants = "\3\0\0boolean",

        --Hovers
        HoverColor3 = "\4\0\0Color3",
        HoverImage = "\3\0\0string",
        --MouseDown
        MouseDownColor3 = "\4\0\0Color3",
        MouseDownImage = "\3\0\0string",
        --Metro Properties
        MetroStyle = "\3\0\0boolean",
        MetroStartColor3 = "\4\0\0Color3",
        MetroEndColor3 = "\4\0\0Color3",
        MetroStartTransparency = "\3\0\0number",
        MetroEndTransparency = "\3\0\0number",
        MetroTweenInfo = "\4\0\0TweenInfo",
        AutoButtonColor = "\3\0\0boolean",
        --Methods
        Redraw = "\3\0\1function"
    },
    {
        MetroStartColor = "MetroStartColor3",
        MetroEndColor3 = "MetroEndColor",
        HoverColor3 = "HoverColor",
        MouseDownColor3 = "MouseDownColor",
        BackgroundColor = "BackgroundColor3",
        Color = "BackgroundColor3"
    },
    function(Parent)
        local Proxy, Meta, Fields, Cs = VIn_CreateInstance(VIn_Data.Button);
        --Proxy Setup
        Fields.ClassName = "VeraniumButton";
        Fields.Parent = Parent;
        Fields.ZIndex = VLb_Defaults.ZIndex;
        Fields.BackgroundColor3 = VLb_Defaults.BackgroundColor;
        Fields.Image = "";

        Fields.MetroStyle = VLb_Defaults.MetroStyle;

        Fields.MetroStartColor3 = VLb_Defaults.HighlightColor;
        Fields.MetroEndColor = VLb_Defaults.HighlightColor;

        Fields.MetroStartTransparency = 0.5;
        Fields.MetroEndTransparency = 1;

        Fields.MetroTweenInfo = TweenInfo.new(
            0.5,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.Out
        );
        Fields.AutoButtonColor = false;
        Fields.ClipsDescendants = false;
        Fields.HoverColor3 = VLb_Defaults.SecondaryColor;
        Fields.MouseDownColor3 = VLb_Defaults.SecondaryColor;
        Fields.HoverImage = "";
        Fields.MouseDownImage = "";
        --Methods Setup
        Fields.Redraw = VIn_Data.Button.Redraw;
        --Elements Creation
        local Main = Instance.new("Frame", GetPInstance(Parent));
        local Background = VIn_Data.Background.Constructor(Main);
        local ImageRender = Instance.new("ImageLabel", Main);
        local TextRender = Instance.new("TextButton", Main);
        --Main Setup
        Main.BackgroundTransparency = 1;
        Main.BorderSizePixel = 0;
        Main.Name = "VeraniumButton";
        Main.Size = UDim2.new(0, 105, 0, 25);
        --TextRender Setup
        TextRender.Name = _PREFIX.."TextRender";
        TextRender.Text = "Veranium Button";
        TextRender.BackgroundTransparency = 1;
        TextRender.BorderSizePixel = 0;
        TextRender.Size = UDim2.new(1, 0, 1, 0);
        TextRender.Position = UDim2.new(0.5, 0, 0.5, 0);
        TextRender.AnchorPoint = Vector2.new(0.5, 0.5);
        TextRender.AutoButtonColor = false;
        --TextRender Defaults
        TextRender.TextColor3 = VLb_Defaults.TextColor;
        TextRender.TextTransparency = VLb_Defaults.TextTransparency;
        TextRender.Font = VLb_Defaults.Font;

        TextRender.TextStrokeColor3 = VLb_Defaults.TextStrokeColor;
        TextRender.TextStrokeTransparency = VLb_Defaults.TextStrokeTransparency;
        
        TextRender.TextXAlignment = VLb_Defaults.TextXAlignment;
        TextRender.TextYAlignment = VLb_Defaults.TextYAlignment;
        --ImageRender Setup
        ImageRender.Name = _PREFIX.."ImageRender";
        ImageRender.Image = "";
        ImageRender.BackgroundTransparency = 1;
        ImageRender.BorderSizePixel = 0;
        ImageRender.Size = UDim2.new(1, 0, 1, 0);
        ImageRender.Position = UDim2.new(0.5, 0, 0.5, 0);
        ImageRender.AnchorPoint = Vector2.new(0.5, 0.5);
        --ChangedSignal
        Cs.Parent = Main;
        --Connections
        TextRender.MouseEnter:Connect(function()
            if Fields.AutoButtonColor then
                Background.BackgroundColor3 = Fields.HoverColor3;
                ImageRender.Image = Fields.HoverImage;
            end;
        end);

        TextRender.MouseLeave:Connect(function()
            if Fields.AutoButtonColor then
                Background.BackgroundColor3 = Fields.BackgroundColor3;
                ImageRender.Image = Fields.Image;
            end;
        end);

        local MetroCircle;

        TextRender.MouseButton1Down:Connect(function()
            if Fields.AutoButtonColor then
                Background.BackgroundColor3 = Fields.MouseDownColor3;
                ImageRender.Image = Fields.MouseDownImage;
            end;
        end);

        TextRender.MouseButton1Up:Connect(function(X, Y)
            if Fields.AutoButtonColor then
                Background.BackgroundColor3 = Fields.HoverColor3;
                ImageRender.Image = Fields.HoverImage;
            end;
            if Fields.MetroStyle then
                Main.ClipsDescendants = true;
                MetroCircle = Instance.new("ImageLabel", Main);
                MetroCircle.Name = _PREFIX.."MetroCircle";
                MetroCircle.ImageColor3 = Fields.MetroStartColor3;
                MetroCircle.ImageTransparency = Fields.MetroStartTransparency;
                MetroCircle.Image = "rbxassetid://3457843087";
                MetroCircle.BackgroundTransparency = 1;
                MetroCircle.BorderSizePixel = 0;
                MetroCircle.AnchorPoint = Vector2.new(0.5, 0.5);
                MetroCircle.Position = UDim2.new(
                    0,
                    X-Main.AbsolutePosition.X,
                    0,
                    Y-Main.AbsolutePosition.Y-36
                );
                MetroCircle.Size = UDim2.new(0, 5, 0, 5);
                local TargetSize = math.floor(math.max(
                    Main.AbsoluteSize.X,
                    Main.AbsoluteSize.Y
                )*1.5);
                TweenService:Create(
                    MetroCircle,
                    Fields.MetroTweenInfo,
                    {
                        ImageTransparency = Fields.MetroEndTransparency,
                        ImageColor3 = Fields.MetroEndColor3,
                        Size = UDim2.new(
                            0,
                            TargetSize,
                            0,
                            TargetSize
                        )
                    }
                ):Play();
                Debris:AddItem(MetroCircle, Fields.MetroTweenInfo.Time+0.1);
                local MetroLocation = MetroCircle;
                wait(Fields.MetroTweenInfo.Time+0.1);
                if MetroLocation == MetroCircle then
                    MetroLocation, MetroCircle = nil;
                    Main.ClipsDescendants = Fields.ClipsDescendants;
                end;
            end;
        end);
        --MetaData Setup
        Meta.___Instance = Main;
        Meta.___Base2D = Main;
        Meta.___Background = Background;
        Meta.___TextRender = TextRender;
        Meta.___CHitbox = TextRender;
        Meta.___ImageRender = ImageRender;
        --First Draw
        VIn_Data.Button.Redraw(Proxy);

        return Proxy;
    end,
    function(self, Field, Value)
        --Setup
        local Meta = GetMeta(self);
        local Main = Meta.___Instance;
        local Fields = Meta.___Fields;
        local Background = Meta.___Background;
        local ImageRender = Meta.___ImageRender;
        --ZIndex
        if Field == nil or Field == "ZIndex" then
            Main.ZIndex = Fields.ZIndex;
            if Field then return; end;
        end;
        --BackgroundColor3
        if Field == nil or Field == "BackgroundColor3" then
            Background.BackgroundColor3 = Fields.BackgroundColor3;
            if Field then return; end;
        end;
        --Image
        if Field == nil or Field == "Image" then
            ImageRender.Image = Fields.Image;
            if Field then return; end;
        end;
        --ClipsDescendants
        if Field == nil or Field == "ClipsDescendants" then
            Main.ClipsDescendants = Fields.ClipsDescendants;
            if Field then return; end;
        end;
    end,
    {

    }
);

--[[MetroDirection Instructions:
    The value given is a UDim2.
    X[0]: StartX Location
    X[1]: StartY Location
    Y[0]: EndX Location
    Y[1]: EndY Location

    Locations can be values from 0-1 (usually 1, 0.5 or 0)
    1 = Start
    0.5 = Center
    0 = End

    1   1   0   1
        -1   0

    Examples:
    UDim2.new(0, 0, 1, 0)
    This refers to a MetroLine that starts from TopLeft(0, 0) to TopRight(1, 0)
    The default value is UDim2.new(0, 1, 1, 1)
]]

VIn_CreateClass("TextBox",
    {
        --Main
        Parent = "\2\1\0",
        ClassName = "\3\0\1string",
        BackgroundColor3 = "\4\0\0Color3",
        AutoTextBoxColor = "\3\0\0boolean",
        FocusedColor3 = "\4\0\0Color3",
        PasswordChar = "\3\0\0string",
        TextTransparency = "\3\0\0number",
        --Metro Properties
        MetroStyle = "\3\0\0boolean",
        MetroDirection = "\4\0\0UDim2",
        MetroStartColor3 = "\4\0\0Color3",
        MetroEndColor3 = "\4\0\0Color3",
        MetroStartTransparency = "\3\0\0number",
        MetroEndTransparency = "\3\0\0number",
        MetroStartSize = "\3\0\0number",
        MetroEndSize = "\3\0\0number",
        MetroTweenInfo = "\4\0\0TweenInfo",
        --Methods
        Redraw = "\3\0\1function"
    },
    {
        MetroStartColor = "MetroStartColor3",
        MetroEndColor = "MetroEndColor",
    },
    function(Parent)
        local Proxy, Meta, Fields, Cs = VIn_CreateInstance(VIn_Data.TextBox);
        --Proxy Setup
        Fields.ClassName = "VeraniumTextBox";
        Fields.Parent = Parent;
        Fields.BackgroundColor3 = VLb_Defaults.BackgroundColor;
        Fields.AutoTextBoxColor = true;
        Fields.FocusedColor3 = VLb_Defaults.SecondaryColor;
        Fields.PasswordChar = "";
        Fields.TextTransparency = VLb_Defaults.TextTransparency or 0;

        Fields.MetroStyle = true;

        Fields.MetroStartColor3 = VLb_Defaults.HighlightColor;
        Fields.MetroEndColor3 = VLb_Defaults.HighlightColor;

        Fields.MetroStartTransparency = 0;
        Fields.MetroEndTransparency = 0;

        Fields.MetroStartSize = 3;
        Fields.MetroEndSize = 3;
        Fields.MetroDirection = UDim2.new(0, 1, 1, 1);

        Fields.MetroTweenInfo = TweenInfo.new(
            0.5,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.Out
        );
        --Methods Setup
        Fields.Redraw = VIn_Data.TextBox.Redraw;
        --Elements Creation
        local Main = Instance.new("Frame", GetPInstance(Parent));
        local Background = VIn_Data.Background.Constructor(Main);
        local MetroClip = Instance.new("Frame", Main);
        local MetroCont = Instance.new("Frame", MetroClip)
        local MetroBG = VIn_Data.Background.Constructor(MetroCont);
        local TextRender = Instance.new("TextBox", Main);
        local PasswordChar = Instance.new("TextLabel", Main);
        --Main Setup
        Main.BackgroundTransparency = 1;
        Main.BorderSizePixel = 0;
        Main.Name = "VeraniumTextBox";
        Main.Size = UDim2.new(0, 105, 0, 25);
        Main.ZIndex = VLb_Defaults.ZIndex;
        --MetroClip Setup
        MetroClip.BackgroundTransparency = 1;
        MetroClip.BorderSizePixel = 0;
        MetroClip.Name = _PREFIX.."MetroClip";
        MetroClip.ClipsDescendants = true;
        MetroClip.Changed:Connect(function()
            MetroBG.BackgroundColor3 = MetroClip.BackgroundColor3;
            MetroBG.BackgroundTransparency = MetroClip.BorderColor3.r;
        end);
        --MetroCont Setup
        MetroCont.BackgroundTransparency = 1;
        MetroCont.BorderSizePixel = 0;
        MetroCont.Name = _PREFIX.."MetroCont";
        --TextRender Setup
        TextRender.Name = _PREFIX.."TextRender";
        TextRender.Text = "Veranium TextBox";
        TextRender.BackgroundTransparency = 1;
        TextRender.BorderSizePixel = 0;
        TextRender.Size = UDim2.new(1, 0, 1, 0);
        TextRender.Position = UDim2.new(0.5, 0, 0.5, 0);
        TextRender.AnchorPoint = Vector2.new(0.5, 0.5);
        --TextRender Defaults
        TextRender.TextColor3 = VLb_Defaults.TextColor;
        TextRender.TextTransparency = VLb_Defaults.TextTransparency;
        TextRender.Font = VLb_Defaults.Font;

        TextRender.TextStrokeColor3 = VLb_Defaults.TextStrokeColor;
        TextRender.TextStrokeTransparency = VLb_Defaults.TextStrokeTransparency;
        
        TextRender.TextXAlignment = VLb_Defaults.TextXAlignment;
        TextRender.TextYAlignment = VLb_Defaults.TextYAlignment;

        TextRender.PlaceholderColor3 = VLb_Defaults.PlaceholderColor;
        --PasswordChar Setup
        PasswordChar.Name = _PREFIX.."PasswordChar";
        PasswordChar.Text = "";
        PasswordChar.BackgroundTransparency = 1;
        PasswordChar.BorderSizePixel = 0;
        PasswordChar.Size = UDim2.new(1, 0, 1, 0);
        PasswordChar.Position = UDim2.new(0.5, 0, 0.5, 0);
        PasswordChar.AnchorPoint = Vector2.new(0.5, 0.5);
        --PasswordChar Defaults
        PasswordChar.TextColor3 = VLb_Defaults.TextColor;
        PasswordChar.TextTransparency = VLb_Defaults.TextTransparency;
        PasswordChar.Font = VLb_Defaults.Font;

        PasswordChar.TextStrokeColor3 = VLb_Defaults.TextStrokeColor;
        PasswordChar.TextStrokeTransparency = VLb_Defaults.TextStrokeTransparency;
        
        PasswordChar.TextXAlignment = VLb_Defaults.TextXAlignment;
        PasswordChar.TextYAlignment = VLb_Defaults.TextYAlignment;
        --ChangedSignal
        Cs.Parent = Main;
        --Connections
        TextRender.Changed:Connect(function(Field)
            if Field == "Text" then
                if Fields.PasswordChar == "" then
                    return;
                end;
                local Lenght = #TextRender.Text;
                local PChr0 = Fields.PasswordChar;
                local PChr = "";
                for Chars = 1, Lenght do
                    PChr = PChr..PChr0;
                end;
                if TextRender.Text == "" then
                    TextRender.TextTransparency = Fields.TextTransparency;
                    PasswordChar.TextTransparency = 1;
                else
                    TextRender.TextTransparency = 1;
                    PasswordChar.TextTransparency = Fields.TextTransparency;
                end;
                PasswordChar.Text = PChr;
                return;
            elseif Field == "TextTransparency" then
                if Fields.PasswordChar == "" then
                    PasswordChar.TextTransparency = 1;
                    return;
                end;
            end;
            if VIn_SReg.IVRouting[Field] == "___TextRender" then
                pcall(function()
                    PasswordChar[Field] = TextRender[Field];
                end);
            end;
        end);
        TextRender.FocusLost:Connect(function()
            if Fields.AutoTextBoxColor then
                Background.BackgroundColor3 = Fields.BackgroundColor3;
            end;
            if Fields.MetroStyle then
                local Position, AnchorPoint, MetroDirection, Size, CornerSize;
                MetroClip.BackgroundColor3 = Fields.MetroEndColor3;
                MetroClip.BorderColor3 = Color3.new(Fields.MetroEndTransparency, 0, 0);
                MetroBG.CornerSize = Background.CornerSize;
                Size = Background.AbsoluteSize;
                CornerSize = (Background.CornerSize + Background.BorderSizePixel)*2;
                MetroCont.Size = UDim2.new(
                    0, Size.X +CornerSize,
                    0, Size.Y +CornerSize
                );
                Size = Background.BorderSizePixel;
                MetroDirection = Fields.MetroDirection;
                Position = UDim2.new(
                    MetroDirection.X.Scale,
                    0,
                    MetroDirection.X.Offset,
                    0
                );
                AnchorPoint = Vector2.new(
                    MetroDirection.X.Scale,
                    MetroDirection.X.Offset
                );
                MetroClip.Position = Position;
                MetroClip.AnchorPoint = AnchorPoint;

                Position = UDim2.new(
                    MetroDirection.X.Scale,
                    0,
                    MetroDirection.X.Offset,
                    0
                );
                MetroCont.Position = Position;
                MetroCont.AnchorPoint = AnchorPoint;

                local SizeConstraint, ThicknessConstraint;
                local TX, TY, UT;
                TX = MetroDirection.Y.Scale - MetroDirection.X.Scale;
                TY = MetroDirection.Y.Offset - MetroDirection.X.Offset;
                UT = {
                    X0 = 0, X1 = 0,
                    Y0 = 0, Y1 = 0
                };

                if math.abs(TX) >= math.abs(TY) then
                    SizeConstraint, ThicknessConstraint = "X", "Y";
                else
                    SizeConstraint, ThicknessConstraint = "Y", "X";
                end;

                UT[SizeConstraint.."0"] = 1;
                UT[ThicknessConstraint.."1"] = 1;

                local MetroTween = TweenService:Create(
                    MetroClip,
                    Fields.MetroTweenInfo,
                    {
                        Size = UDim2.new(
                            0,
                            UT.X1*Fields.MetroStartSize,
                            0,
                            UT.Y1*Fields.MetroStartSize
                        ),
                        BackgroundColor3 = Fields.MetroStartColor3,
                        BorderColor3 = Color3.new(Fields.MetroStartTransparency)
                    }
                );
                MetroTween:Play();
                CornerSize = nil;
            end;
        end);
        TextRender.Focused:Connect(function()
            if Fields.AutoTextBoxColor then
                Background.BackgroundColor3 = Fields.FocusedColor3;
            end;
            if Fields.MetroStyle then
                local Position, AnchorPoint, MetroDirection, Size, CornerSize;
                MetroClip.BackgroundColor3 = Fields.MetroStartColor3;
                MetroClip.BorderColor3 = Color3.new(Fields.MetroStartTransparency, 0, 0);
                MetroBG.CornerSize = Background.CornerSize;
                Size = Background.AbsoluteSize;
                CornerSize = (Background.CornerSize --[[+ Background.BorderSizePixel]])*2;
                MetroCont.Size = UDim2.new(
                    0, Size.X +CornerSize,
                    0, Size.Y +CornerSize
                );
                Size = Background.BorderSizePixel;
                CornerSize = function(Offset)
                    if Offset == 1 then
                        return -1;
                    end;
                    return 1;
                end;
                MetroDirection = Fields.MetroDirection;
                Position = UDim2.new(
                    MetroDirection.X.Scale,
                    CornerSize(MetroDirection.X.Scale)*Size,
                    MetroDirection.X.Offset,
                    CornerSize(MetroDirection.X.Offset)*Size
                );
                AnchorPoint = Vector2.new(
                    MetroDirection.X.Scale,
                    MetroDirection.X.Offset
                );
                MetroClip.Position = Position;
                MetroClip.AnchorPoint = AnchorPoint;

                Position = UDim2.new(
                    MetroDirection.X.Scale,
                    0,
                    MetroDirection.X.Offset,
                    0
                );
                MetroCont.Position = Position;
                MetroCont.AnchorPoint = AnchorPoint;

                local SizeConstraint, ThicknessConstraint;
                local TX, TY, UT;
                TX = MetroDirection.Y.Scale - MetroDirection.X.Scale;
                TY = MetroDirection.Y.Offset - MetroDirection.X.Offset;
                UT = {
                    X0 = 0, X1 = 0,
                    Y0 = 0, Y1 = 0
                };

                if math.abs(TX) >= math.abs(TY) then
                    SizeConstraint, ThicknessConstraint = "X", "Y";
                else
                    SizeConstraint, ThicknessConstraint = "Y", "X";
                end;

                UT[SizeConstraint.."0"] = 1;
                UT[ThicknessConstraint.."1"] = 1;

                MetroClip.Size = UDim2.new(
                    0,
                    UT.X1*Fields.MetroStartSize,
                    0,
                    UT.Y1*Fields.MetroStartSize
                );

                local MetroTween = TweenService:Create(
                    MetroClip,
                    Fields.MetroTweenInfo,
                    {
                        Size = UDim2.new(
                            UT.X0,
                            UT.X1*Fields.MetroEndSize,
                            UT.Y0,
                            UT.Y1*Fields.MetroEndSize
                        ),
                        BackgroundColor3 = Fields.MetroEndColor3,
                        BorderColor3 = Color3.new(Fields.MetroEndTransparency)
                    }
                );
                MetroTween:Play();
                CornerSize = nil;
            end;
        end);
        --MetaData Setup
        Meta.___Instance = Main;
        Meta.___Base2D = Main;
        Meta.___Background = Background;
        Meta.___TextRender = TextRender;
        Meta.___TextBox = TextRender;

        Meta.PasswordChar = PasswordChar;
        Meta.MetroClip = MetroClip;
        Meta.MetroCont = MetroCont;
        Meta.MetroBG = MetroBG;
        --First Draw
        VIn_Data.TextBox.Redraw(Proxy);

        return Proxy;
    end,
    function(self, Field, Value)
        --Setup
        local Meta = GetMeta(self);
        local Main = Meta.___Instance;
        local Fields = Meta.___Fields;
        local Background = Meta.___Background;
        local TextBox = Meta.___TextBox;

        local PasswordChar = Meta.PasswordChar;
        local MetroClip = Meta.MetroClip;
        local MetroCont = Meta.MetroCont;
        local MetroBG = Meta.MetroBG;
        --BackgroundColor3
        if (Field == nil or Field == "BackgroundColor3") and (not Fields.AutoTextBoxColor or not TextBox:IsFocused()) then
            Background.BackgroundColor3 = Fields.BackgroundColor3;
            if Field then return; end;
        end;
        --TextTransparency | PasswordChar
        if (Field == nil) or (Field == "TextTransparency" or Field == "PasswordChar") then
            if Fields.PasswordChar == "" then
                PasswordChar.TextTransparency = 1;
                TextBox.TextTransparency = Fields.TextTransparency;
            else
                if TextBox.Text == "" then
                    TextBox.TextTransparency = Fields.TextTransparency;
                    PasswordChar.TextTransparency = 1;
                    if Field then return; end;
                else
                    TextBox.TextTransparency = 1;
                    PasswordChar.TextTransparency = Fields.TextTransparency;
                end;
                local Lenght = #TextBox.Text;
                local PChr0 = Fields.PasswordChar;
                local PChr = "";
                for Chars = 1, Lenght do
                    PChr = PChr..PChr0;
                end;
                PasswordChar.Text = PChr;
            end;
            if Field then return; end;
        end;
        --AutoTextBoxColor | FocusedColor3
        if (Field == nil or Field == "AutoTextBoxColor" or Field == "FocusedColor3") and TextBox.IsFocused then
            Background.BackgroundColor3 = Fields.FocusedColor3;
            if Field then return; end;
        end;
    end,
    {

    }
);

--Standard Instances
VIn_CreateClass("Slider", {
        --Main
        Parent = "\2\1\0",
        ClassName = "\3\0\1string",

        --Functionality
        MinValue = "\3\0\0number",
        MaxValue = "\3\0\0number",
        Value = "\3\0\0number",
        Step = "\3\0\0number",
        Size = "\4\0\0Vector2",

        --Metro Properties
        MetroStyle = "\3\0\0boolean",
        MetroTweenInfo = "\4\0\0TweenInfo",

        --MISC
        SliderType = "\0\0\0SliderType",
        SideSheet = "\3\0\0string",
        MarkupImage = "\3\0\0string",

        --Appearance
        BarColor3 = "\4\0\0Color3",
        BarTransparency = "\3\0\0number",
        BarThickness = "\3\0\0number",

        MarkupColor3 = "\4\0\0Color3",
        MarkupTransparency = "\3\0\0number",
        MarkupSize = "\3\0\0number",

        --Eevents
        DragEnd = "\4\0\1Instance",
        DragStart = "\4\0\1Instance",
        ValueChanged = "\4\0\1Instance",
        --Methods
        Redraw = "\3\0\1function",
        RelocateMarkup = "\3\0\1function"
    },
    {

    },
    function(Parent)
        local Proxy, Meta, Fields, Cs = VIn_CreateInstance(VIn_Data.Slider);
        local Connections = {};
        --Proxy Setup
        Fields.ClassName = "VeraniumSlider";
        Fields.Parent = Parent;

        Fields.MinValue = 0;
        Fields.MaxValue = 1;
        Fields.Value = 0.5;
        Fields.Step = 0.01;
        Fields.Size = Vector2.new(0, 100);

        Fields.MetroStyle = true;
        Fields.MetroTweenInfo = TweenInfo.new(
            0.25,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.Out
        );

        Fields.SliderType = VLb_Enums.SliderType.Round;
        Fields.SideSheet = "";
        Fields.MarkupImage = "";

        Fields.BarColor3 = VLb_Defaults.SecondaryColor;
        Fields.BarTransparency = 0;
        Fields.BarThickness = 10;
        
        Fields.MarkupColor3 = VLb_Defaults.HighlightColor;
        Fields.MarkupTransparency = 0;
        Fields.MarkupSize = 0.6;
        --Methods Setup
        Fields.Redraw = VIn_Data.Slider.Redraw;
        Fields.RelocateMarkup = VIn_Data.Slider.RelocateMarkup;
        --Elements Creation
        local Main = Instance.new("Frame", GetPInstance(Parent));
        local Bar = Instance.new("Frame", Main);
        local LeftSide = Instance.new("ImageLabel", Bar);
        local RightSide = Instance.new("ImageLabel", Bar);
        local Markup = Instance.new("ImageLabel", Bar);
        local Hitbox = Instance.new("TextButton", Main);

        local DragEnd, DragStart, ValueChanged = Instance.new("BindableEvent", Main);
        DragStart = DragEnd:Clone();
        ValueChanged = DragEnd:Clone();
        --Main Setup
        Main.BackgroundTransparency = 1;
        Main.BorderSizePixel = 0;
        Main.Name = "VeraniumSlider";
        Main.ZIndex = VLb_Defaults.ZIndex;
        --Bar Setup
        Bar.BorderSizePixel = 0;
        Bar.AnchorPoint = Vector2.new(0.5, 0.5);
        Bar.Position = UDim2.new(0.5, 0, 0.5, 0);
        Bar.Name = _PREFIX.."Bar";
        --LeftSide Setup
        LeftSide.BackgroundTransparency = 1;
        LeftSide.BorderSizePixel = 0;
        LeftSide.AnchorPoint = Vector2.new(1, 0.5);
        LeftSide.Position = UDim2.new(0, 0, 0.5, 0);
        LeftSide.ImageRectSize = Vector2.new(400, 800);
        LeftSide.ImageRectOffset = Vector2.new(0, 0);
        LeftSide.Name = _PREFIX.."LeftSide";
        --RightSide Setup
        RightSide.BackgroundTransparency = 1;
        RightSide.BorderSizePixel = 0;
        RightSide.AnchorPoint = Vector2.new(0, 0.5);
        RightSide.Position = UDim2.new(1, 0, 0.5, 0);
        RightSide.ImageRectSize = Vector2.new(400, 800);
        RightSide.ImageRectOffset = Vector2.new(400, 0);
        RightSide.Name = _PREFIX.."RightSide";
        --Markup Setup
        Markup.BackgroundTransparency = 1;
        Markup.BorderSizePixel = 0;
        Markup.AnchorPoint = Vector2.new(0.5, 0.5);
        Markup.Name = _PREFIX.."Markup";
        --Hitbox Setup
        Hitbox.Text = "";
        Hitbox.TextTransparency = 1;
        Hitbox.BackgroundTransparency = 1;
        Hitbox.BorderSizePixel = 0;
        Hitbox.AnchorPoint = Vector2.new(0.5, 0.5);
        Hitbox.Position = UDim2.new(0.5, 0, 0.5, 0);
        Hitbox.Size = UDim2.new(1, 5, 1, 5);
        Hitbox.Name = _PREFIX.."Hitbox";
        --Events
        DragEnd.Name = _PREFIX.."DragEnd";
        DragStart.Name = _PREFIX.."DragStart";
        ValueChanged.Name = _PREFIX.."ValueChanged";

        DragStart.Parent, ValueChanged.Parent = Main, Main;

        Fields.DragEnd = DragEnd.Event;
        Fields.DragStart = DragStart.Event;
        Fields.ValueChanged = ValueChanged.Event;
        --ChangedSignal
        Cs.Parent = Main;
        --Connections
        local IsDown = false;
        local function MoveMarkup()
            if IsDown then
                local X = Mouse.X - Bar.AbsolutePosition.X;
                Fields.Value = VLb_CVMath.Map(X, 0, Bar.AbsoluteSize.X, Fields.MinValue, Fields.MaxValue);
                if Fields.Value > Fields.MaxValue then
                    Fields.Value = Fields.MaxValue;
                elseif Fields.Value < Fields.MinValue then
                    Fields.Value = Fields.MinValue;
                end;
                if Fields.Step ~= 0 then
                    Fields.Value = VLb_CVMath.Round(Fields.Value/Fields.Step)*Fields.Step
                end
                ValueChanged:Fire(Fields.Value);
            end;

            if Fields.MetroStyle then
                TweenService:Create(
                    Markup,
                    Fields.MetroTweenInfo,
                    {
                        Position = UDim2.new(VLb_CVMath.Map(
                            Fields.Value, 
                            Fields.MinValue, 
                            Fields.MaxValue, 0, 1
                        ), 0, 0.5, 0)
                    }
                ):Play();
            else
                Proxy:RelocateMarkup();
            end;
        end;
        Hitbox.MouseButton1Down:Connect(function()
            IsDown = true;
            DragStart:Fire();
            MoveMarkup();
        end);
        Connections[0] = UserInputService.InputEnded:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton1 and IsDown then
                IsDown = false;
                DragEnd:Fire();
            end;
        end);
        Connections[1] = Mouse.Move:Connect(MoveMarkup);
        Hitbox.MouseMoved:Connect(function(X)
            
        end);
        --MetaData Setup
        Meta.___Instance = Main;
        Meta.___Base2D = Main;
        Meta.___Connection = Connections;
        
        Meta.Bar = Bar;
        Meta.LeftSide = LeftSide;
        Meta.RightSide = RightSide;
        Meta.Markup = Markup;
        Meta.Hitbox = Hitbox;
        --First Draw
        VIn_Data.Slider.Redraw(Proxy);

        return Proxy;
    end,
    function(self, Field, Value)
        --Setup
        local Meta = GetMeta(self);
        local Main = Meta.___Instance;
        local Fields = Meta.___Fields;
        
        local Bar = Meta.Bar;
        local LeftSide = Meta.LeftSide;
        local RightSide = Meta.RightSide;
        local Markup = Meta.Markup;
        local Hitbox = Meta.Hitbox;
        --SliderType | SlideSheet | MarkupImage
        if (Field == nil or Field == "SliderType" or Field == "SlideSheet" or Field == "MarkupImage") then
            local SideSheet = VCf_GetEnumLValue("SliderType", Fields.SliderType);
            if SideSheet == "" then
                LeftSide.Image = Fields.SideSheet;
                RightSide.Image = Fields.SideSheet;

                Markup.Image = Fields.MarkupImage;
            else
                LeftSide.Image = SideSheet;
                RightSide.Image = SideSheet;

                Markup.Image = SideSheet;
            end;
            if Field then return; end;
        end;
        --BarColor3
        if Field == nil or Field == "BarColor3" then
            Bar.BackgroundColor3 = Fields.BarColor3;
            LeftSide.ImageColor3 = Fields.BarColor3;
            RightSide.ImageColor3 = Fields.BarColor3;
            if Field then return; end;
        end;
        --BarTransparency
        if Field == nil or Field == "BarTransparency" then
            Bar.BackgroundTransparency = Fields.BarTransparency;
            LeftSide.ImageTransparency = Fields.BarTransparency;
            RightSide.ImageTransparency = Fields.BarTransparency;
            if Field then return; end;
        end;
        --BarThickness | Size | MarkupSize
        if Field == nil  or Field == "BarThickness" or Field == "Size"  then
            Main.Size = UDim2.new(
                Fields.Size.X,
                Fields.Size.Y,
                0,
                Fields.BarThickness
            );

            LeftSide.Size = UDim2.new(0, Fields.BarThickness/2, 1, 0);
            RightSide.Size = UDim2.new(0, Fields.BarThickness/2, 1, 0);
            Bar.Size = UDim2.new(
                1,
                -Fields.BarThickness,
                1,
                0
            );

            local Size = math.min(Bar.AbsoluteSize.X, Bar.AbsoluteSize.Y)*Fields.MarkupSize;
            Markup.Size = UDim2.new(0, Size, 0, Size);
            if Field then return; end;
            if Field then return; end;
        end;
        --MarkupColor3
        if Field == nil or Field == "MarkupColor3" then
            Markup.ImageColor3 = Fields.MarkupColor3;
            if Field then return; end;
        end;
        --MarkupTransparency
        if Field == nil or Field == "MarkupTransparency" then
            Markup.ImageTransparency = Fields.MarkupTransparency;
            if Field then return; end;
        end;
        self:RelocateMarkup();
    end,
    {
        RelocateMarkup = function(Proxy)
            local Meta = GetMeta(Proxy)
            local Fields = Meta.___Fields
            local Markup = Meta.Markup
            if Fields.Step ~= 0 then
                Fields.Value = VLb_CVMath.Round(Fields.Value/Fields.Step)*Fields.Step
            end
            if Fields.Value > Fields.MaxValue then
                Fields.Value = Fields.MaxValue
            end
            if Fields.Value < Fields.MinValue then
                Fields.Value = Fields.MinValue
            end
            Markup.Position = UDim2.new(VLb_CVMath.Map(
                Fields.Value, 
                Fields.MinValue, 
                Fields.MaxValue, 0, 1
            ), 0, 0.5, 0)
        end
    }
);

VIn_CreateClass("CheckBox",
    {
        --Main
        Parent = "\2\1\0",
        ClassName = "\3\0\1string",
        Checked = "\3\0\0boolean",
        Size = "\3\0\0number",
        LeftLabel = "\3\0\0boolean",
        LabelPadding = "\3\0\0number",

        --Box Appearance
        StartBoxColor3 = "\4\0\0Color3",
        EndBoxColor3 = "\4\0\0Color3",
        StartBoxTransparency = "\3\0\0number",
        EndBoxTransparency = "\3\0\0number",
        CheckBoxType = "\0\0\0CheckBoxType",
        CheckBoxImage = "\3\0\0string",
        CheckBoxFill = "\3\0\0boolean",

        --Check Appearance
        CheckImage = "\3\0\0string",
        StartCheckColor3 = "\4\0\0Color3",
        EndCheckColor3 = "\4\0\0Color3",
        StartCheckTransparency = "\3\0\0number",
        EndCheckTransparency = "\3\0\0number",
        StartCheckSize = "\3\0\0number",
        EndCheckSize = "\3\0\0number",

        --Metro Style
        MetroStyle = "\3\0\0boolean",
        MetroTweenInfo = "\4\0\0TweenInfo",

        --Events
        CheckChanged = "\4\0\1Instance",

        --Methods
        Redraw = "\4\0\1function",
        CreateLabel = "\4\0\1function",
        Check = "\4\0\1function"
    },
    {

    },
    function(Parent)
        local Proxy, Meta, Fields, Cs = VIn_CreateInstance(VIn_Data.CheckBox);
        --Proxy Setup
        Fields.ClassName = "VeraniumCheckBox";
        Fields.Parent = Parent;
        Fields.Checked = false;
        Fields.Size = 17;
        Fields.LeftLabel = false;
        Fields.LabelPadding = 2;

        Fields.StartBoxColor3 = VLb_Defaults.SecondaryColor;
        Fields.EndBoxColor3 = VLb_Defaults.SecondaryColor;
        Fields.StartBoxTransparency = 0;
        Fields.EndBoxTransparency = 0;
        Fields.CheckBoxType = VLb_Enums.CheckBoxType.Smooth;
        Fields.CheckBoxImage = "";
        Fields.CheckBoxFill = true;

        Fields.CheckImage = "";
        Fields.StartCheckColor3 = VLb_Defaults.HighlightColor;
        Fields.EndCheckColor3 = VLb_Defaults.HighlightColor;
        Fields.StartCheckTransparency = 1;
        Fields.EndCheckTransparency = 0;
        Fields.StartCheckSize = 0;
        Fields.EndCheckSize = 0.5;

        Fields.MetroStyle = true;
        Fields.MetroTweenInfo = TweenInfo.new(
            0.15,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.Out
        );
        --Methods Setup
        Fields.Redraw = VIn_Data.CheckBox.Redraw;
        Fields.Check = VIn_Data.CheckBox.Check;
        Fields.CreateLabel = VIn_Data.CheckBox.CreateLabel;
        --Elements Creation
        local Main = Instance.new("Frame", GetPInstance(Parent));
        local Box = Instance.new("ImageLabel", Main);
        local Check = Instance.new("ImageLabel", Box);
        local Hitbox = Instance.new("TextButton", Main);

        local CheckChanged = Instance.new("BindableEvent", Main);
        --Main Setup
        Main.BackgroundTransparency = 1;
        Main.BorderSizePixel = 0;
        Main.Name = "VeraniumCheckBox";
        Main.ZIndex = VLb_Defaults.ZIndex;
        Main.Size = UDim2.new(0, 17, 0, 17);
        --Box Setup
        Box.BackgroundTransparency = 1;
        Box.BorderSizePixel = 0;
        Box.Size = UDim2.new(1, 0, 1, 0);
        Box.Position = UDim2.new(0.5, 0, 0.5, 0);
        Box.AnchorPoint = Vector2.new(0.5, 0.5);
        Box.Name = _PREFIX.."Box";
        --Check Setup
        Check.BackgroundTransparency = 1;
        Check.BorderSizePixel = 0;
        Check.Position = UDim2.new(0.5, 0, 0.5, 0);
        Check.AnchorPoint = Vector2.new(0.5, 0.5);
        Check.Name = _PREFIX.."CheckMark"
        --Hitbox Setup
        Hitbox.BackgroundTransparency = 1;
        Hitbox.Text = "";
        Hitbox.AnchorPoint = Vector2.new(0.5, 0.5);
        Hitbox.Position = UDim2.new(0.5, 0, 0.5, 0);
        Hitbox.Size = UDim2.new(1, 5, 1, 5);
        Hitbox.Name = _PREFIX.."Hitbox";
        --Events
        CheckChanged.Name = _PREFIX.."CheckChanged";

        Fields.CheckChanged = CheckChanged.Event;
        --ChangedSignal
        Cs.Parent = Main;
        --Connections
        Hitbox.MouseButton1Down:Connect(function()
            Fields.Checked = not Fields.Checked;
            CheckChanged:Fire(true);
            Proxy:Check();
        end);
        --MetaData Setup
        Meta.___Instance = Main;
        Meta.___Base2D = Main;
        
        Meta.Box = Box;
        Meta.Check = Check;
        Meta.Hitbox = Hitbox;

        Meta.CheckChanged = CheckChanged;
        --First Draw
        Proxy:Check(false);
        VIn_Data.CheckBox.Redraw(Proxy);

        return Proxy;
    end,
    function(self, Field, Value)
        --Setup
        local Meta = GetMeta(self);
        local Main = Meta.___Instance;
        local Fields = Meta.___Fields;
        local Label = Meta.___TextRender;

        local Box = Meta.Box;
        local Check = Meta.Check;
        local Hitbox = Meta.Hitbox;

        local CheckChanged = Meta.CheckChanged;

        --Size
        if Field == nil or Field == "Size" then
            Main.Size = UDim2.new(0, Fields.Size, 0, Fields.Size);
        end;

        --Label | LeftLabel | LabelPadding
        if (Field == nil or Field == "Label"
        or Field == "LeftLabel" or Field == "LabelPadding") and Label then
            if Fields.LeftLabel then
                Label.AnchorPoint = Vector2.new(1, 0.5);
                Label.Position = UDim2.new(0, -Fields.LabelPadding, 0.5, 0);
                Label.TextXAlignment = Enum.TextXAlignment.Right;
            else
                Label.AnchorPoint = Vector2.new(0, 0.5);
                Label.Position = UDim2.new(1, Fields.LabelPadding, 0.5, 0);
                Label.TextXAlignment = Enum.TextXAlignment.Left;
            end;
        end;

        --Uhh... A lot...?
        if Field == nil or Field == "Checked"
        or Field == "StartBoxColor3" or Field == "EndBoxColor3"
        or Field == "StartBoxTransparency" or Field == "EndBoxTransparency"
        or Field == "StartCheckColor3" or Field == "EndCheckColor3"
        or Field == "StartCheckTransparency" or Field == "EndCheckTransparency"
        or Field == "StartCheckSize" or Field == "EndCheckSize" then
            if Field == "Checked" then
                CheckChanged:Fire(false);
            end;
            self:Check(false);
            if Field then return;end;
        end;

        --Once more, a lot.
        if Field == nil or Field == "CheckBoxType" or Field == "CheckImage"
        or Field == "CheckBoxImage" or Field == "CheckBoxFill" then
            local Offset = VCf_GetEnumLValue("CheckBoxType", Fields.CheckBoxType);
            if Offset == 4 then
                Box.Image = Fields.CheckBoxImage;
                Box.ImageRectSize = Vector2.new(0, 0);
                Box.ImageRectOffset = Vector2.new(0, 0);
            else
                Box.Image = "rbxassetid://4018402187";
                Box.ImageRectSize = Vector2.new(100, 100);
                if Fields.CheckBoxFill then
                    Box.ImageRectOffset = Vector2.new(Offset*100, 100);
                else
                    Box.ImageRectOffset = Vector2.new(Offset*100, 0);
                end;
            end;
            if Fields.CheckImage == "" then
                Check.Image = "rbxassetid://4018402187";
                Check.ImageRectSize = Vector2.new(100, 100);
                if Offset == 4 then
                    Check.ImageRectOffset = Vector2.new(0, 100);
                else
                    Check.ImageRectOffset = Vector2.new(Offset*100, 100);
                end
            else
                Check.Image = Fields.CheckImage;
                Check.ImageRectSize = Vector2.new(0, 0);
                Check.ImageRectOffset = Vector2.new(0, 0);
            end;
        end;
    end,
    {
        CreateLabel = function(self, Text)
            --Setup
            local Meta = GetMeta(self);
            local Main = Meta.___Instance;

            local Label = Instance.new("TextLabel", Main);
            Label.Text = Text;
            Label.Name = _PREFIX.."Label";
            Label.BackgroundTransparency = 1;
            Label.BorderSizePixel = 0;
            Label.Font = VLb_Defaults.Font;
            Label.TextColor3 = VLb_Defaults.TextColor;
            Label.TextTransparency = VLb_Defaults.TextTransparency;
            Label.TextYAlignment = Enum.TextYAlignment.Center;
            Label.Size = UDim2.new(0, 0, 1, 0);

            Meta.___TextRender = Label;

            self:Redraw("Label");
        end,
        Check = function(self, MetroStyle)
            --Setup
            local Meta = GetMeta(self);
            local Main = Meta.___Instance;
            local Fields = Meta.___Fields;

            if MetroStyle == nil then
                MetroStyle = Fields.MetroStyle;
            end;

            local Box = Meta.Box;
            local Check = Meta.Check;
            local BoxTarget, CheckTarget;

            if not Fields.Checked then
                BoxTarget = {
                    ImageColor3 = Fields.StartBoxColor3,
                    ImageTransparency = Fields.StartBoxTransparency
                };
                CheckTarget = {
                    ImageColor3 = Fields.StartCheckColor3,
                    ImageTransparency = Fields.StartCheckTransparency,
                    Size = UDim2.new(
                        Fields.StartCheckSize,
                        0,
                        Fields.StartCheckSize,
                        0
                    )
                };
            else
                BoxTarget = {
                    ImageColor3 = Fields.EndBoxColor3,
                    ImageTransparency = Fields.EndBoxTransparency
                };
                CheckTarget = {
                    ImageColor3 = Fields.EndCheckColor3,
                    ImageTransparency = Fields.EndCheckTransparency,
                    Size = UDim2.new(
                        Fields.EndCheckSize,
                        0,
                        Fields.EndCheckSize,
                        0
                    )
                };
            end;

            if MetroStyle then
                TweenService:Create(
                    Box,
                    Fields.MetroTweenInfo,
                    {
                        ImageColor3 = BoxTarget.ImageColor3,
                        ImageTransparency = BoxTarget.ImageTransparency
                    }
                ):Play();
                TweenService:Create(
                    Check,
                    Fields.MetroTweenInfo,
                    {
                        ImageColor3 = CheckTarget.ImageColor3,
                        ImageTransparency = CheckTarget.ImageTransparency,
                        Size = CheckTarget.Size
                    }
                ):Play();
            else
                Box.ImageColor3 = BoxTarget.ImageColor3;
                Box.ImageTransparency = BoxTarget.ImageTransparency;

                Check.ImageColor3 = CheckTarget.ImageColor3;
                Check.ImageTransparency = CheckTarget.ImageTransparency;
                Check.Size = CheckTarget.Size;
            end;
        end;
    }
);

VIn_CreateClass("FillBox",
    {
        --Main
        Parent = "\2\1\0",
        ClassName = "\3\0\1string",
        Checked = "\3\0\0boolean",
        Size = "\3\0\0number",
        LeftLabel = "\3\0\0boolean",
        LabelPadding = "\3\0\0number",
        
        --Appearance
        StartBoxColor3 = "\4\0\0Color3",
        EndBoxColor3 = "\4\0\0Color3",
        StartBoxTransparency = "\3\0\0number",
        EndBoxTransparency = "\3\0\0number",
        FillBoxType = "\0\0\0FillBoxType",

        --Events
        CheckChanged = "\4\0\1Instance",

        --Methods
        Check = "\4\0\1function",
        CreateLabel = "\4\0\1function",
        Redraw = "\4\0\1function"
    },
    {

    },
    function(Parent)
        local Proxy, Meta, Fields, Cs = VIn_CreateInstance(VIn_Data.FillBox);
        --Proxy Setup
        Fields.ClassName = "VeraniumFillBox";
        Fields.Parent = Parent;
        Fields.Checked = false;
        Fields.Size = 20;
        Fields.LeftLabel = false;
        Fields.LabelPadding = 2;

        Fields.StartBoxColor3 = VLb_Defaults.SecondaryColor;
        Fields.EndBoxColor3 = VLb_Defaults.HighlightColor;
        Fields.StartBoxTransparency = 0;
        Fields.EndBoxTransparency = 0;
        Fields.FillBoxType = VLb_Enums.FillBoxType.Smooth;
        --Methods Setup
        Fields.Redraw = VIn_Data.FillBox.Redraw;
        Fields.Check = VIn_Data.FillBox.Check;
        Fields.CreateLabel = VIn_Data.FillBox.CreateLabel;
        --Elements Creation
        local Main = Instance.new("Frame", GetPInstance(Parent));
        local Box = Instance.new("ImageButton", Main);

        local CheckChanged = Instance.new("BindableEvent", Main);
        --Main Setup
        Main.BackgroundTransparency = 1;
        Main.BorderSizePixel = 0;
        Main.Name = "VeraniumFillBox";
        Main.ZIndex = VLb_Defaults.ZIndex;
        Main.Size = UDim2.new(0, 17, 0, 17);
        --Box Setup
        Box.BackgroundTransparency = 1;
        Box.BorderSizePixel = 0;
        Box.Size = UDim2.new(1, 0, 1, 0);
        Box.Position = UDim2.new(0.5, 0, 0.5, 0);
        Box.AnchorPoint = Vector2.new(0.5, 0.5);
        Box.ImageRectSize = Vector2.new(50, 50);
        Box.Name = _PREFIX.."Box";
        --Events
        CheckChanged.Name = _PREFIX.."CheckChanged";
        Fields.CheckChanged = CheckChanged.Event;
        --Changed Signal
        Cs.Parent = Main;
        --Connections
        Box.MouseButton1Up:Connect(function()
            Fields.Checked = not Fields.Checked;
            CheckChanged:Fire(true);
            Proxy:Check(true, true);
        end);
        --MetaData Setup
        Meta.___Instance = Main;
        Meta.___Base2D = Main;

        Meta.Box = Box;
        Meta.CheckChanged = CheckChanged;
        --First Draw
        Proxy:Check(false, true);
        VIn_Data.FillBox.Redraw(Proxy);

        return Proxy;
    end,
    function(self, Field, Value)
        --Setup
        local Meta = GetMeta(self);
        local Main = Meta.___Instance;
        local Fields = Meta.___Fields;
        local Label = Meta.___TextRender;
        local Box = Meta.Box;
        local CheckChanged = Meta.CheckChanged;

        --Size
        if Field == nil or Field == "Size" then
            Main.Size = UDim2.new(0, Fields.Size, 0, Fields.Size);
            if Field then return; end;
        end;
        --FillBoxType
        if Field == nil or Field == "FillBoxType" then
            local Texture = VCf_GetEnumLValue("FillBoxType", Fields.FillBoxType);
            Box.Image = Texture;
            if Field then return; end;
        end;
        --Label | LeftLabel | LabelPadding
        if (Field == nil or Field == "Label"
        or Field == "LeftLabel" or Field == "LabelPadding") and Label then
        if Fields.LeftLabel then
            Label.AnchorPoint = Vector2.new(1, 0.5);
            Label.Position = UDim2.new(0, -Fields.LabelPadding, 0.5, 0);
            Label.TextXAlignment = Enum.TextXAlignment.Right;
        else
            Label.AnchorPoint = Vector2.new(0, 0.5);
            Label.Position = UDim2.new(1, Fields.LabelPadding, 0.5, 0);
            Label.TextXAlignment = Enum.TextXAlignment.Left;
        end;
    end;
        --Pretty much all appearance-related properties
        if Field == nil or Field == "StartBoxColor3"
        or Field == "EndBoxTransparency" or Field == "StartBoxTransparency"
        or Field == "EndBoxTransparency" or Field == "Checked" then
            if Field == "Checked" then
                CheckChanged:Fire(false);
            end;
            self:Check(true, true);
            if Field then return; end;
        end;
    end,
    {
        CreateLabel = function(self, Text)
            --Setup
            local Meta = GetMeta(self);
            local Main = Meta.___Instance;

            local Label = Instance.new("TextLabel", Main);
            Label.Name = _PREFIX.."Label";
            Label.Text = Text;
            Label.BackgroundTransparency = 1;
            Label.BorderSizePixel = 0;
            Label.Font = VLb_Defaults.Font;
            Label.TextColor3 = VLb_Defaults.TextColor;
            Label.TextTransparency = VLb_Defaults.TextTransparency;
            Label.TextYAlignment = Enum.TextYAlignment.Center;
            Label.Size = UDim2.new(0, 0, 1, 0);

            Meta.___TextRender = Label;

            self:Redraw("Label");
        end,
        Check = function(self, Tween, Yield)
            local Meta = GetMeta(self);
            local Main = Meta.___Instance;
            local Box = Meta.Box;
            local Fields = Meta.___Fields;
            
            if Tween == nil then
                Tween = true;
            end;
            if Yield == nil then
                Yield = true;
            end;

            local StartOffset, EndOffset, Step, SCol, ECol, St, Et =
            0, 700, 50, Fields.StartBoxColor3, Fields.EndBoxColor3,
            Fields.StartBoxTransparency, Fields.EndBoxTransparency;
            if not Fields.Checked then
                StartOffset, EndOffset, Step, SCol, ECol, St, Et =
                650, -50, -50, Fields.EndBoxColor3, Fields.StartBoxColor3,
                Fields.EndBoxTransparency, Fields.StartBoxTransparency;
            end;
            if math.floor(Box.ImageRectOffset.X) == math.floor(EndOffset-Step) and Tween then
                Box.ImageColor3 = ECol;
                Box.ImageTransparency = Et;
                return;
            end;
            local CVal = StartOffset;

            local function Animate()
                repeat RunService.Heartbeat:Wait();
                    Box.ImageRectOffset = Vector2.new(CVal, 0);
                    Box.ImageColor3 = VLb_CVMath.MapColor(SCol, ECol, StartOffset, EndOffset, CVal);
                    Box.ImageTransparency = VLb_CVMath.Map(CVal, StartOffset, EndOffset, St, Et);
                    CVal = CVal + Step;
                until math.floor(CVal) == math.floor(EndOffset); -- Because lua:tm: is very epic it switches integers to floats at random!
                Box.ImageColor3 = ECol;
                Box.ImageTransparency = Et;
            end;
            if Tween then
                if Yield then
                    spawn(Animate);
                else
                    Animate();
                end;
            else
                Box.ImageRectOffset = Vector2.new(EndOffset-Step);
                Box.ImageColor3 = ECol;
                Box.ImageTransparency = Et;
            end;
            Animate = nil;
        end;
    }
);

VIn_CreateClass("Counter",
    {
        --Main
        Parent = "\2\1\0",
        ClassName = "\3\0\1string",
        Padding = "\3\0\0number",

        --Functionality
        Value = "\3\0\0number",
        MinValue = "\3\0\0number",
        MaxValue = "\3\0\0number",
        Step = "\3\0\0number",

        --Appearance
        SubtractColor3 = "\4\0\0Color3",
        AddColor3 = "\4\0\0Color3",
        SubtractTransparency = "\3\0\0number",
        AddTransparency = "\3\0\0number",
        SubtractImage = "\3\0\0string",
        AddImage = "\3\0\0string",
        ButtonSize = "\3\0\0number",
        DisabledButtonColor3 = "\4\0\0Color3",

        --Events
        ValueChanged = "\4\0\1Instance",

        --Methods
        Redraw = "\3\0\1function"
    },
    {

    },
    function(Parent)
        local Proxy, Meta, Fields, Cs = VIn_CreateInstance(VIn_Data.Counter);
        --Proxy Setup
        Fields.ClassName = "VeraniumCounter";
        Fields.Parent = Parent;
        Fields.Padding = 3;

        Fields.Value = 1;
        Fields.MinValue = 0;
        Fields.MaxValue = 10;
        Fields.Step = 1;

        Fields.SubtractColor3 = VLb_Defaults.HighlightColor;
        Fields.AddColor3 = VLb_Defaults.HighlightColor;
        Fields.SubtractTransparency = 0;
        Fields.AddTransparency = 0;
        Fields.SubtractImage = "";
        Fields.AddImage = "";
        Fields.ButtonSize = 15;
        Fields.DisabledButtonColor3 = VLb_Defaults.SecondaryColor;
        --Methods Setup
        Fields.Redraw = VIn_Data.Counter.Redraw;
        --Elements Creation
        local Main = Instance.new("Frame", GetPInstance(Parent));
        local Background = VIn_Data.Background.Constructor(Main);
        local TextRender = Instance.new("TextLabel", Main);
        local Subtract = Instance.new("ImageButton", Main);
        local Add = Instance.new("ImageButton", Main);

        local ValueChanged = Instance.new("BindableEvent", Main);
        --Main Setup
        Main.BackgroundTransparency = 1;
        Main.BorderSizePixel = 0;
        Main.Name = "VeraniumCounter";
        Main.Size = UDim2.new(0, 60, 0, 20);
        Main.ZIndex = VLb_Defaults.ZIndex
        --TextRender Setup
        TextRender.BackgroundTransparency = 1;
        TextRender.BorderSizePixel = 0;
        TextRender.AnchorPoint = Vector2.new(0.5, 0.5);
        TextRender.Position = UDim2.new(0.5, 0, 0.5, 0);
        TextRender.Name = _PREFIX.."TextRender";
        --TextRender Defaults
        TextRender.TextColor3 = VLb_Defaults.TextColor;
        TextRender.TextTransparency = VLb_Defaults.TextTransparency;
        TextRender.Font = VLb_Defaults.Font;
        TextRender.TextStrokeColor3 = VLb_Defaults.TextStrokeColor;
        TextRender.TextStrokeTransparency = VLb_Defaults.TextStrokeTransparency;
        TextRender.TextXAlignment = VLb_Defaults.TextXAlignment;
        TextRender.TextYAlignment = VLb_Defaults.TextYAlignment;
        --Subtract Setup
        Subtract.BackgroundTransparency = 1;
        Subtract.BorderSizePixel = 0;
        Subtract.Position = UDim2.new(0, 0, 0.5, 0);
        Subtract.AnchorPoint = Vector2.new(0, 0.5);
        Subtract.Name = _PREFIX.."Subtract";
        --Add Setup
        Add.BackgroundTransparency = 1;
        Add.BorderSizePixel = 0;
        Add.Position = UDim2.new(1, 0, 0.5, 0);
        Add.AnchorPoint = Vector2.new(1, 0.5);
        Add.Name = _PREFIX.."Add";
        --Events
        ValueChanged.Name = _PREFIX.."ValueChanged";
        Fields.ValueChanged = ValueChanged.Event;
        --Changed Signal
        Cs.Parent = Main;
        --Connections
        Subtract.MouseButton1Up:Connect(function()
            if Fields.Value - Fields.Step < Fields.MinValue then
                Fields.Value = Fields.MinValue;
            else
                Fields.Value = Fields.Value - Fields.Step;
            end;
            TextRender.Text = tostring(Fields.Value);
            Proxy:Redraw("Value");
        end);
        Add.MouseButton1Up:Connect(function()
            if Fields.Value + Fields.Step > Fields.MaxValue then
                Fields.Value = Fields.MaxValue;
            else
                Fields.Value = Fields.Value + Fields.Step;
            end;
            TextRender.Text = tostring(Fields.Value);
            Proxy:Redraw("Value");
        end);
        --MetaData Setup
        Meta.___Instance = Main;
        Meta.___Base2D = Main;
        Meta.___TextRender = TextRender;

        Meta.Subtract = Subtract;
        Meta.Add = Add;
        Meta.ValueChanged = ValueChanged;
        --First Draw
        VIn_Data.Counter.Redraw(Proxy);

        return Proxy;
    end,
    function(self, Field, Value)
        --Setup
        local Meta = GetMeta(self);
        local Main = Meta.___Instance;
        local Fields = Meta.___Fields;
        local TextRender = Meta.___TextRender;
        local Subtract = Meta.Subtract;
        local Add = Meta.Add;
        local ValueChanged = Meta.ValueChanged;

        --Values
        if Field == nil or Field == "Value" or Field == "MinValue"
        or Field == "MaxValue" or Field == "Step"
        or Field == "DisabledButtonColor3" then
            if Fields.Value >= Fields.MaxValue then
                Fields.Value = Fields.MaxValue;
                Add.ImageColor3 = Fields.DisabledButtonColor3;
            else
                Add.ImageColor3 = Fields.AddColor3;
            end;
            if Fields.Value <= Fields.MinValue then
                Fields.Value = Fields.MinValue;
                Subtract.ImageColor3 = Fields.DisabledButtonColor3;
            else
                Subtract.ImageColor3 = Fields.SubtractColor3;
            end;
            TextRender.Text = tostring(Fields.Value);
            if Field then return; end;
        end;
        --Subtract Appearance
        if Field == nil or Field == "SubtractColor3"
        or Field == "SubtractTransparency" or Field == "SubtractImage" then
            Subtract.ImageColor3 = Fields.SubtractColor3
            Subtract.ImageTransparency = Fields.SubtractTransparency
            if Fields.SubtractImage == "" then
                Subtract.Image = "rbxassetid://4486615470";
            else
                Subtract.Image = Fields.SubtractImage
            end;
            if Field then return; end;
        end;
        --Add Appearance
        if Field == nil or Field == "AddColor3"
        or Field == "AddTransparency" or Field == "AddImage" then
            Add.ImageColor3 = Fields.AddColor3
            Add.ImageTransparency = Fields.AddTransparency
            if Fields.AddImage == "" then
                Add.Image = "rbxassetid://4486614839";
            else
                Add.Image = Fields.AddImage
            end;
            if Field then return; end;
        end;
        --ButtonSize
        if Field == nil or Field == "ButtonSize" or Field == "Padding" then
            Subtract.Size = UDim2.new(0, Fields.ButtonSize, 0, Fields.ButtonSize);
            Add.Size = Subtract.Size;
            Subtract.Position = UDim2.new(0, Fields.Padding, 0.5, 0);
            Add.Position = UDim2.new(1, -Fields.Padding, 0.5, 0);
            TextRender.Size = UDim2.new(1, -Fields.ButtonSize*2, 1, 0);
            if Field then return; end;
        end;
    end,
    {

    }
);

--DropdownBox is written by Uniqua, it should be a different style.
local function GetNdx(List, Idx)
    for Ndx, Val in pairs(List)do
        if Val.Idx == Idx then
            return Ndx-1;
        end;
    end;
end;
VIn_CreateClass("DropdownBox",
    {
        --Main
        Parent = "\2\1\0",
        ClassName = "\3\0\1string",
        Size = "\4\0\0Vector2",
        Enabled = "\3\0\0boolean",
        Padding = "\3\0\0Vector2",

        --Text
        Text = "\3\0\0string",
        Font = "\4\0\0EnumItem",
        TextSize = "\3\0\0number",
        TextColor3 = "\4\0\0Color3",

        --Utility
        Scroll = "\3\0\0number",
        IsOpen = "\3\0\1boolean",
        CanUnselect = "\3\0\0boolean",
        SelectedIndex = "\5\1\1", -- OwO I don't know if there is a VCf_IsA that accept 
        SelectedValue = "\5\1\1", -- every type of value passed, So \5 is my answer OwO !
        MaxDrop = "\3\0\0number", -- You can customize the max drop of the open :3
        ShowSelected = "\3\0\0boolean", -- If true and IsOpen true When you select an Item, the Button.Text will change to the index of the item selected
        UseIndex = "\3\0\0boolean", -- If true all Items will be named with their index, else all items will be named with their values

        --Appearance
        BoxColor3 = "\4\0\0Color3",
        BoxHoverColor3 = "\4\0\0Color3",
        BoxOpenedColor3 = "\4\0\0Color3",
        ArrowColor3 = "\4\0\0Color3",
        ArrowSize = "\3\0\0number",

        --Events
        Opened = "\4\0\1Instance",
        Closed = "\4\0\1Instance",
        ListChanged = "\4\0\1Instance",
        SelectionChanged = "\4\0\1Instance",

        --TweenInfo
        ExpandTweenInfo = "\4\0\0TweenInfo",
        SlideTweenInfo = "\4\0\0TweenInfo",
        ScrollTweenInfo = "\4\0\0TweenInfo",
        ElasticyTweenInfo = "\4\0\0TweenInfo",
        
        --ItemFields
        ItemHoverColor3 = "\4\0\0Color3",
        ItemHoverOffset = "\3\0\0number",
        ItemSelectedColor3 = "\4\0\0Color3",
        ItemSelectedOffset = "\3\0\0number",
        --Title
        TitleHoverColor3 = "\4\0\0Color3",

        --End/Start Animation
        BorderSizePixel = "\3\0\0number",
        HoverBorderSizePixel = "\3\0\0number",
        OpenBorderSizePixel = "\3\0\0number",
        EndArrowColor3 = "\4\0\0Color3",

        --Methods
        Redraw = "\4\0\1function",
        Reset = "\4\0\1function",
        Open = "\4\0\1function",
        Close = "\4\0\1function",
        Select = "\4\0\1function",
        Unselect = "\4\0\1function",
        RemoveItem = "\4\0\1function",
        AddItem = "\4\0\1function"
    },
    {
        TextColor = "TextColor3",
        ArrowColor = "ArrowColor3",
        BoxColor = "BoxColor3",
        TitleOverColor = "TitleOverColor3",
        SelectedColor = "ItemSelectedColor3",
    },
    function(Parent, List)
        local Proxy, Meta, Fields, Cs = VIn_CreateInstance(VIn_Data.DropdownBox);
        List = List or {};
        
        if typeof(List) ~= "table" then
            Proxy, Meta, Fields = nil;
            Cs:Remove();
            Cs:Destroy();
            return error("Expected a table or nil for List.");
        else
            local Items = {};
            for Idx, Val in pairs(List)do
                Items[Idx] = Val;
            end;
            List = Items;
            Items = nil;
        end;
        --Fields Setup
        Fields.ClassName = "VeraniumDropdownBox";
        Fields.Parent = Parent;
        Fields.Size = Vector2.new(115, 25);
        Fields.Enabled = true;
        Fields.Padding = Vector2.new(5, 0);

        Fields.Text = "DropdownBox";
        Fields.Font = VLb_Defaults.Font;
        Fields.TextColor3 = VLb_Defaults.TextColor;
        Fields.TextSize = 8;

        Fields.Scroll = 0;
        Fields.IsOpen = false;
        Fields.SelectedIndex = 0;
        Fields.SelectedValue = nil;
        Fields.MaxDrop = 3;
        Fields.ShowSelected = true;
        Fields.UseIndex = false;
        Fields.SelectedBox = nil;

        Fields.BoxColor3 = VLb_Defaults.BackgroundColor;
        Fields.BoxHoverColor3 = VLb_Defaults.BackgroundColor;
        Fields.BoxOpenedColor3 = VLb_Defaults.SecondaryColor;
        Fields.ArrowColor3 = VLb_ModernColors.Silver;
        Fields.ArrowSize = 10;

        Fields.ExpandTweenInfo = TweenInfo.new(
            0.5,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.Out
        );
        Fields.SlideTweenInfo = TweenInfo.new(
            0.25,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.Out
        );
        Fields.ScrollTweenInfo = TweenInfo.new(
            0.25,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out
        );
        Fields.ElasticyTweenInfo = TweenInfo.new(
            0.25,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.Out
        );

        Fields.ItemHoverColor3 = VLb_Defaults.HighlightColor;
        Fields.ItemHoverOffset = 10;
        Fields.ItemSelectedColor3 = VLb_Defaults.HighlightColor;
        Fields.ItemSelectedOffset = 5;

        Fields.TitleHoverColor3 = VLb_Defaults.TextColor;

        Fields.BorderSizePixel = VLb_Defaults.BorderSize;
        Fields.HoverBorderSizePixel = VLb_Defaults.BorderSize;
        Fields.OpenBorderSizePixel = VLb_Defaults.BorderSize;
        Fields.EndArrowColor3 = VLb_ModernColors.Silver;

        --Methods Setup
        Fields.AddItem = VIn_Data.DropdownBox.AddItem;
        Fields.RemoveItem = VIn_Data.DropdownBox.RemoveItem;
        Fields.Open = VIn_Data.DropdownBox.Open;
        Fields.Close = VIn_Data.DropdownBox.Close;
        Fields.Select = VIn_Data.DropdownBox.Select;
        Fields.Unselect = VIn_Data.DropdownBox.Unselect;
        Fields.Redraw = VIn_Data.DropdownBox.Redraw;

        --Elements Creation
        local Main = Instance.new("Frame", GetPInstance(Parent));
        local Background = VIn_Data.Background.Constructor(Main);
        Background:CreateBorder();
        local Arrow = Instance.new("ImageLabel", Main);
        local Title = Instance.new("TextButton", Main);
        local ElementCanvas = Instance.new("Frame", Main);
        local ElementContainer = Instance.new("Frame", ElementCanvas);

        local SelectionChanged = Instance.new("BindableEvent", Main);
        local Opened = Instance.new("BindableEvent", Main);
        local Closed = Instance.new("BindableEvent", Main);
        local ListChanged = Instance.new("BindableEvent", Main);

        --Main Setup
        Main.BackgroundTransparency = 1;
        Main.BorderSizePixel = 0;
        Main.Name = _PREFIX.."VeraniumDropdownBox";

        --Arrow Setup
        Arrow.Name = _PREFIX.."Arrow";
        Arrow.BackgroundTransparency = 1;
        Arrow.BorderSizePixel = 0;
        Arrow.Image = "rbxassetid://3931363707";
        Arrow.AnchorPoint = Vector2.new(1, 0.5);

        --Title Setup
        Title.Name = _PREFIX.."Title";
        Title.BackgroundTransparency = 1;
        Title.AnchorPoint = Vector2.new(0.5, 0);
        Title.TextXAlignment = Enum.TextXAlignment.Left;
        
        --ElementCanvas Setup
        ElementCanvas.Name = _PREFIX.."ElementCanvas";
        ElementCanvas.BackgroundTransparency = 1;
        ElementCanvas.BorderSizePixel = 0;
        ElementCanvas.AnchorPoint = Vector2.new(0.5, 1);
        ElementCanvas.Position = UDim2.new(0.5, 0, 1, 0);
        ElementCanvas.ClipsDescendants = true;

        --ElementContainer Setup
        ElementContainer.Name = _PREFIX.."ElementContainer";
        ElementContainer.BackgroundTransparency = 1;
        ElementContainer.BorderSizePixel = 0;
        ElementContainer.AnchorPoint = Vector2.new(0.5, 0);
        ElementContainer.Position = UDim2.new(0.5, 0, 0, 0);
        ElementContainer.Size = UDim2.new(1, 0, 0, 0);
        ElementContainer.ClipsDescendants = false;

        --Signal Setups
        ListChanged.Name = "ListChanged";
        Opened.Name = "Opened";
        Closed.Name = "Closed";
        SelectionChanged.Name = "SelectionChanged";

        Fields.SelectionChanged = SelectionChanged.Event;
        Fields.Opened = Opened.Event;
        Fields.Closed = Closed.Event;
        Fields.ListChanged = ListChanged.Event;

        --Connections
        local Layer = 0;
        Main.Changed:Connect(function(Field)
            if Field == "BackgroundColor3" then
                Background.BackgroundColor3 = Main.BackgroundColor3;
            end;
        end);
        Main.MouseEnter:Connect(function()
            if not Fields.IsOpen then
                Main.BackgroundColor3 = Fields.BoxHoverColor3;
            end;
        end);
        Main.MouseLeave:Connect(function()
            if not Fields.IsOpen then
                Main.BackgroundColor3 = Fields.BoxColor3;
            end;
        end);
        Title.MouseEnter:Connect(function()
            Title.TextColor3 = Fields.TitleHoverColor3;
        end);
        Title.MouseLeave:Connect(function()
            Title.TextColor3 = Fields.TextColor3;
        end);
        Title.MouseButton1Down:Connect(function()
            if not Fields.Enabled then return; end;
            Fields.IsOpen = not Fields.IsOpen;
            if Fields.IsOpen then
                Proxy:Open();
                Opened:Fire();
            else
                Proxy:Close();
                Closed:Fire();
            end;
        end);
        ElementCanvas.MouseWheelBackward:Connect(function()
            local List = Meta.List;
            local MaxDrop = math.min(Fields.MaxDrop-1, #List-1);
            Fields.Scroll = Fields.Scroll + 1;
            if Fields.Scroll > (#List - MaxDrop - 1) then
                Fields.Scroll = #List - MaxDrop - 1;--Elasticy Effect
                TweenService:Create(
                    ElementContainer,
                    Fields.ElasticyTweenInfo,
                    {
                        Position = UDim2.new(0.5, 0, 0,
                        (-Fields.Scroll - 0.25)*Fields.Size.Y)
                    }
                ):Play();
                Layer = Layer + 1;
                local LayerBackup = Layer;
                wait(Fields.ElasticyTweenInfo.Time);
                if LayerBackup ~= Layer then
                    return;
                else
                    Layer = 0;
                end;
            end;
            TweenService:Create(
                ElementContainer,
                Fields.ScrollTweenInfo,
                {
                    Position = UDim2.new(0.5, 0, 0,
                    (-Fields.Scroll)*Fields.Size.Y)
                }
            ):Play();
        end);
        ElementCanvas.MouseWheelForward:Connect(function()
            local List = Meta.List;
            Fields.Scroll = Fields.Scroll - 1;
            if Fields.Scroll < 0 then
                Fields.Scroll = 0;--Elasticy Effect
                TweenService:Create(
                    ElementContainer,
                    Fields.ElasticyTweenInfo,
                    {
                        Position = UDim2.new(0.5, 0, 0,
                        Fields.Size.Y*0.25)
                    }
                ):Play();
                Layer = Layer + 1;
                local LayerBackup = Layer;
                wait(Fields.ElasticyTweenInfo.Time);
                if LayerBackup ~= Layer then
                    return;
                else
                    Layer = 0;
                end;
            end;
            TweenService:Create(
                ElementContainer,
                Fields.ScrollTweenInfo,
                {
                    Position = UDim2.new(0.5, 0, 0,
                    (-Fields.Scroll)*Fields.Size.Y)
                }
            ):Play();
        end);
        --ChangedSignal Setup
        Cs.Parent = Main;
        --Meta Setup
        Meta.___Instance = Main;
        Meta.___Base2D = Main;
        Meta.___Background = Background;
        Meta.___TextRender = Title;

        Meta.ElementCanvas = ElementCanvas;
        Meta.ElementContainer = ElementContainer;
        Meta.Arrow = Arrow;
        Meta.Title = Title;

        Meta.List = {};
        Meta.MouseHover = false;

        Meta.ListChanged = ListChanged;
        Meta.SelectionChanged = SelectionChanged;
        Meta.Opened = Opened;
        Meta.Closed = Closed;

        --List Setup
        for Idx, Val in pairs(List) do
            Proxy:AddItem(Idx, Val);
        end;
        --First Draw
        VIn_Data.DropdownBox.Redraw(Proxy);

        return Proxy;
    end,
    function(self, Field, Value)
        local Meta = GetMeta(self);
        --Instances
        local Main = Meta.___Instance;
        local Background = Meta.___Background;
        local Title = Meta.___TextRender;
        local Arrow = Meta.Arrow;
        local ElementCanvas = Meta.ElementCanvas;
        --Utility
        local Items = Meta.Items;
        local List = Meta.List;
        --Fields
        local Fields = Meta.___Fields;

        --Padding/Size
        if Field == nil or Field == "Padding" or Field == "Size"
        or Field == "ArrowSize" then
            if not Fields.IsOpen then
                Main.Size = UDim2.new(0, Fields.Size.X, 0, Fields.Size.Y);
            else
                Main.Size = UDim2.new(0, Fields.Size.X,
                0, Fields.Size.Y * (Fields.MaxDrop + 1));
            end;
            Title.Position = UDim2.new(0.5, Fields.Padding.X, 0, 0);
            Title.Size = UDim2.new(1, -Fields.Padding.X, 0, Fields.Size.Y);
            Arrow.Position = UDim2.new(1, -Fields.Padding.X, 0, math.floor(Fields.Size.Y/2));
            Arrow.Size = UDim2.new(0, Fields.ArrowSize, 0, Fields.ArrowSize);
            ElementCanvas.Size = UDim2.new(1, 0, 1, - Fields.Size.Y);
            for Idx, Val in pairs(List)do
                local Item = Val.Item;
                Item.Position = UDim2.new(0, Fields.Padding.X, 0,
                Fields.Size.Y * (Idx-1));
                Item.Size = UDim2.new(1, 0, 0, Fields.Size.Y);
            end;
            if Field then return; end;
        end;

        --Text
        if Field == nil or Field == "Text" or Field == "Font"
        or Field == "TextSize" or Field == "TextColor3" then
            if Fields.ShowSelected then
                if Fields.UseIndex then
                    if Fields.SelectedIndex ~= nil then
                        Title.Text = tostring(Fields.SelectedIndex);
                    else
                        Title.Text = Fields.Text;
                    end;
                else
                    if Fields.SelectedValue ~= nil then
                        Title.Text = tostring(Fields.SelectedValue);
                    else
                        Title.Text = Fields.Text;
                    end;
                end;
            else
                Title.Text = Fields.Text;
            end;
            Title.Font = Fields.Font;
            Title.TextSize = Fields.TextSize;
            Title.TextColor3 = Fields.TextColor3;
            for Idx, Val in pairs(List)do
                local Item = Val.Item;
                Item.Font = Fields.Font;
                Item.TextSize = Fields.TextSize;
                Item.TextColor3 = Fields.TextColor3;
            end;
            if Field then return; end;
        end;

        --MaxDrop Scroll
        if (Field == nil or Field == "MaxDrop") and Fields.IsOpen or Field == "Scroll" then
            Main.Size = UDim2.new(0, Fields.Size.X,
            0, Fields.Size.Y * (Fields.MaxDrop + 1));
            if Fields.Scroll < 0 then
                Fields.Scroll = 0;
            end;
            if Fields.Scroll > (#List - Fields.MaxDrop - 1) then
                Fields.Scroll = #List - Fields.MaxDrop - 1;
            end;
            TweenService:Create(
                ElementContainer,
                Fields.ScrollTweenInfo,
                {
                    Position = UDim2.new(0.5, 0, 0,
                    (-Fields.Scroll)*Fields.Size.Y)
                }
            ):Play();
            if Field then return; end;
        end;

        --UseIndex
        if Field == nil or Field == "UseIndex" then
            for Idx, Val in pairs(List) do
                local Item = Val.Item;
                if Fields.UseIndex then
                    Item.Text = Val.Idx;
                else
                    Item.Text = Val.Val;
                end;
            end;
            if Field then return; end;
        end;

        --Box Appearance
        if Field == nil or Field == "BoxColor3"
        or Field == "BoxHoverColor3" or Field == "BoxOpenedColor3"
        or Field == "BorderSizePixel" or Field == "HoverBorderSizePixel"
        or Field == "OpenBorderSizePixel" then
            if Fields.IsOpen then
                Main.BackgroundColor3 = Fields.BoxOpenedColor3;
                Background.BorderSizePixel = Fields.OpenBorderSizePixel;
            elseif Meta.MouseHover then
                Main.BackgroundColor3 = Fields.BoxHoverColor3;
                Background.BorderSizePixel = Fields.HoverBorderSizePixel;
            else
                Main.BackgroundColor3 = Fields.BoxColor3;
                Background.BorderSizePixel = Fields.BorderSizePixel;
            end;
            if Field then return; end;
        end;

        --Arrow Appearance
        if Field == nil or Field == "ArrowColor3"
        or Field == "EndArrowColor3" then
            if Fields.IsOpen then
                Arrow.ImageColor3 = Fields.EndArrowColor3;
            else
                Arrow.ImageColor3 = Fields.ArrowColor3;
            end;
            if Field then return; end;
        end;
    end,
    {
        AddItem = function(self, Idx, Val)
            if Idx == nil or Val == nil then
                return error("Idx/Val cannot be nil.");
            end;
            local Meta = GetMeta(self);
            local ElementCanvas = Meta.ElementCanvas;
            local ElementContainer = Meta.ElementContainer;
            local List = Meta.List;
            local Fields = Meta.___Fields;
            local Padding = Fields.Padding;
            local ListChanged = Meta.ListChanged;
            local TextRender = Instance.new("TextButton", ElementContainer);
            TextRender.Name = _PREFIX..tostring(Idx);
            TextRender.BackgroundTransparency = 1;
            TextRender.BorderSizePixel = 0;
            TextRender.TextColor3 = Fields.TextColor3;
            TextRender.Font = Fields.Font;
            TextRender.TextSize = Fields.TextSize;
            TextRender.TextColor3 = Fields.TextColor3;
            TextRender.TextXAlignment = Enum.TextXAlignment.Left;
            if Fields.UseIndex then
                TextRender.Text = Idx;
            else
                TextRender.Text = Val;
            end;
            local Ndx = #List;
            TextRender.Position = UDim2.new(0, Fields.Padding.X, 0,
            Fields.Size.Y * (Ndx));
            TextRender.Size = UDim2.new(1, 0, 0, Fields.Size.Y);
            table.insert(List, {
                Idx = Idx,
                Val = Val,
                Item = TextRender
            });
            TextRender.MouseEnter:Connect(function()
                if Fields.SelectedIndex == Idx then return; end;
                Ndx = GetNdx(List, Idx);
                TweenService:Create(
                    TextRender,
                    Fields.SlideTweenInfo,
                    {
                        TextColor3 = Fields.ItemHoverColor3,
                        Position = UDim2.new(0, Fields.ItemHoverOffset, 0,
                        Fields.Size.Y * (Ndx));
                    }
                ):Play();
            end);
            TextRender.MouseLeave:Connect(function()
                if Fields.SelectedIndex == Idx then return; end;
                Ndx = GetNdx(List, Idx);
                TweenService:Create(
                    TextRender,
                    Fields.SlideTweenInfo,
                    {
                        TextColor3 = Fields.TextColor3,
                        Position = UDim2.new(0, Fields.Padding.X, 0,
                        Fields.Size.Y * (Ndx));
                    }
                ):Play();
            end);
            TextRender.MouseButton1Up:Connect(function()
                if Fields.SelectedIndex == Idx then
                    if Fields.CanUnselect then
                        self:Unselect();
                    end;
                else
                    self:Select(Idx);
                end;
            end);
            ListChanged:Fire(true, Idx);
            return TextRender;
        end,
        RemoveItem = function(self, Idx)
            local Meta = GetMeta(self);
            local List = Meta.List;
            local Fields = Meta.___Fields;
            local Padding = Fields.Padding;
            local ListChanged = Meta.ListChanged;
            local Tdx;
            for Ndx, Val in pairs(List) do
                if Val.Idx == Idx then
                    Tdx = Ndx;
                    break;
                end;
            end;
            for Ndx = Tdx+1, #List, 1 do
                local Item = List[Ndx].Item;
                Item.Position = UDim2.new(0, Fields.Padding.X, 0,
                Fields.Size.Y * (Ndx-2));
            end;
            Tdx = table.remove(List, Tdx);
            Tdx.Item:Remove();Tdx.Item:Destroy();
            Tdx = nil;
            ListChanged:Fire(false, Idx);
            return;
        end,
        Open = function(self)
            local Meta = GetMeta(self);
            local List = Meta.List;
            local Fields = Meta.___Fields;
            local Main = Meta.___Instance;
            local Arrow = Meta.Arrow;
            local MaxDrop = math.min(Fields.MaxDrop+1, #List+1);
            TweenService:Create(
                Main,
                Fields.ExpandTweenInfo,
                {
                    Size = UDim2.new(0, Fields.Size.X,
                    0, Fields.Size.Y*MaxDrop),
                    BackgroundColor3 = Fields.BoxOpenedColor3
                }
            ):Play();
            TweenService:Create(
                Arrow,
                Fields.ExpandTweenInfo,
                {
                    Rotation = 180
                }
            ):Play();
            Meta.Opened:Fire();
        end,
        Close = function(self)
            local Meta = GetMeta(self);
            local List = Meta.List;
            local Fields = Meta.___Fields;
            local Main = Meta.___Instance;
            local Arrow = Meta.Arrow;
            TweenService:Create(
                Main,
                Fields.ExpandTweenInfo,
                {
                    Size = UDim2.new(0, Fields.Size.X,
                    0, Fields.Size.Y),
                    BackgroundColor3 = Fields.BoxColor3
                }
            ):Play();
            TweenService:Create(
                Arrow,
                Fields.ExpandTweenInfo,
                {
                    Rotation = 0
                }
            ):Play();
            Meta.Closed:Fire();
        end,
        Select = function(self, Idx)
            local Meta = GetMeta(self);
            local Fields = Meta.___Fields;
            local List = Meta.List;
            local Item;
            for Ndx, Val in pairs(List)do
                if Val.Idx == Idx then
                    Item = Val;
                    break;
                end;
            end;
            Fields.SelectedIndex = Idx;
            Fields.SelectedValue = Item.Val;
            self:Redraw("Text");

            TweenService:Create(Item.Item,
                Fields.SlideTweenInfo,
                {
                    TextColor3 = Fields.ItemSelectedColor3,
                    Position = UDim2.new(0, Fields.ItemSelectedOffset, 0,
                    Item.Item.Position.Y.Offset)
                }
            ):Play();
            Meta.SelectionChanged:Fire(Idx, Item.Val);
        end,
        Unselect = function(self)
            local Meta = GetMeta(self);
            local Fields = Meta.___Fields;
            local List = Meta.List;
            local Item;
            for Ndx, Val in pairs(List)do
                if Val.Idx == Fields.SelectedIndex then
                    Item = Val;
                    break;
                end;
            end;
            Fields.SelectedIndex = nil;
            Fields.SelectedValue = nil;
            self:Redraw("Text");

            TweenService:Create(Item.Item,
                Fields.SlideTweenInfo,
                {
                    TextColor3 = Fields.ItemSelectedColor3,
                    Position = UDim2.new(0, Fields.Padding.X, 0,
                    Item.Item.Position.Y.Offset)
                }
            ):Play();
            Meta.SelectionChanged:Fire();
        end
    }
);

VIn_CreateClass("Expander",
    {
        --Main
        Parent = "\2\1\0",
        ClassName = "\3\0\1string",
        MinSize = "\4\0\0Vector2",
        MaxSize = "\4\0\0Vector2",
        Enabled = "\3\0\0boolean",
        Padding = "\3\0\0Vector2",

        --Utility
        IsOpen = "\3\0\1boolean",

        --Appearane
        ArrowColor3 = "\4\0\0Color3",
        ArrowSize = "\3\0\0number",

        --Events
        ExpandChanged = "\4\0\1Instance",

        --TweenInfo
        ExpandTweenInfo = "\4\0\0TweenInfo",

        --End/Start Animation
        EndArrowColor3 = "\4\0\0Color3",

        --Methods
        Redraw = "\4\0\1function",
        Expand = "\4\0\1function"
    },
    {
        Title = "Text",
        TitleColor = "TextColor3",
        TitleColor3 = "TextColor3"
    },
    function(Parent, List)
        local Proxy, Meta, Fields, Cs = VIn_CreateInstance(VIn_Data.Expander);
        --Fields Setup
        Fields.ClassName = "VeraniumExpander";
        Fields.Parent = Parent;
        Fields.MinSize = Vector2.new(115, 25);
        Fields.MaxSize = Vector2.new(115, 100);
        Fields.Enabled = true;
        Fields.Padding = Vector2.new(5, 0);

        Fields.IsOpen = false;

        Fields.ArrowColor3 = VLb_ModernColors.Silver;
        Fields.ArrowSize = 10;

        Fields.ExpandTweenInfo = TweenInfo.new(
            0.5,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.Out
        );

        Fields.EndArrowColor3 = VLb_ModernColors.Silver;

        --Methods Setup
        Fields.Expand = VIn_Data.Expander.Expand;
        Fields.Redraw = VIn_Data.Expander.Redraw;

        --Elements Creation
        local Main = Instance.new("Frame", GetPInstance(Parent));
        local Background = VIn_Data.Background.Constructor(Main);
        local Arrow = Instance.new("ImageLabel", Main);
        local Title = Instance.new("TextButton", Main);
        local ElementCanvas = Instance.new("Frame", Main);

        local ExpandChanged = Instance.new("BindableEvent", Main);

        --Main Setup
        Main.BackgroundTransparency = 1;
        Main.BorderSizePixel = 0;
        Main.Name = _PREFIX.."VeraniumExpander";

        --Arrow Setup
        Arrow.Name = _PREFIX.."Arrow";
        Arrow.BackgroundTransparency = 1;
        Arrow.BorderSizePixel = 0;
        Arrow.Image = "rbxassetid://3931363707";
        Arrow.AnchorPoint = Vector2.new(1, 0.5);

        --Title Setup
        Title.Name = _PREFIX.."Title";
        Title.Text = "Expander"
        Title.BackgroundTransparency = 1;
        Title.AnchorPoint = Vector2.new(0.5, 0);
        Title.TextXAlignment = Enum.TextXAlignment.Left;
        --Title Defaults
        Title.TextColor3 = VLb_Defaults.TextColor;
        Title.TextTransparency = VLb_Defaults.TextTransparency;
        Title.Font = VLb_Defaults.Font;

        Title.TextStrokeColor3 = VLb_Defaults.TextStrokeColor;
        Title.TextStrokeTransparency = VLb_Defaults.TextStrokeTransparency;
        
        --ElementCanvas Setup
        ElementCanvas.Name = _PREFIX.."ElementCanvas";
        ElementCanvas.BackgroundTransparency = 1;
        ElementCanvas.BorderSizePixel = 0;
        ElementCanvas.AnchorPoint = Vector2.new(0.5, 1);
        ElementCanvas.Position = UDim2.new(0.5, 0, 1, 0);
        ElementCanvas.ClipsDescendants = true;

        --Signal Setups
        ExpandChanged.Name = "ExpandChanged";
        Fields.ExpandChanged = ExpandChanged.Event;

        --Connections
        Title.MouseButton1Down:Connect(function()
            if not Fields.Enabled then return; end;
            Proxy:Expand();
        end);
        --ChangedSignal Setup
        Cs.Parent = Main;
        --Meta Setup
        Meta.___Instance = Main;
        Meta.___Base2D = Main;
        Meta.___Background = Background;
        Meta.___TextRender = Title;
        Meta.___Children = ElementCanvas;

        Meta.ElementCanvas = ElementCanvas;
        Meta.Arrow = Arrow;
        Meta.Title = Title;

        Meta.ExpandChanged = ExpandChanged;
        --First Draw
        VIn_Data.Expander.Redraw(Proxy);

        return Proxy;
    end,
    function(self, Field, Value)
        local Meta = GetMeta(self);
        --Instances
        local Main = Meta.___Instance;
        local Background = Meta.___Background;
        local Title = Meta.___TextRender;
        local Arrow = Meta.Arrow;
        local ElementCanvas = Meta.___Children;
        --Fields
        local Fields = Meta.___Fields;

        --Padding/Size
        if Field == nil or Field == "Padding" or Field == "MinSize" or Field == "MaxSize"
        or Field == "ArrowSize" then
            if not Fields.IsOpen then
                Main.Size = UDim2.new(0, Fields.MinSize.X, 0, Fields.MinSize.Y);
            else
                Main.Size = UDim2.new(0, Fields.MaxSize.X, 0, Fields.MaxSize.Y);
            end;
            Title.Position = UDim2.new(0.5, Fields.Padding.X, 0, 0);
            Title.Size = UDim2.new(1, -Fields.Padding.X, 0, Fields.MinSize.Y);
            Arrow.Position = UDim2.new(1, -Fields.Padding.X, 0, math.floor(Fields.MinSize.Y/2));
            Arrow.Size = UDim2.new(0, Fields.ArrowSize, 0, Fields.ArrowSize);
            ElementCanvas.Size = UDim2.new(1, 0, 1, - Fields.MinSize.Y);
            if Field then return; end;
        end;
        --Arrow Appearance
        if Field == nil or Field == "ArrowColor3"
        or Field == "EndArrowColor3" then
            if Fields.IsOpen then
                Arrow.ImageColor3 = Fields.EndArrowColor3;
            else
                Arrow.ImageColor3 = Fields.ArrowColor3;
            end;
            if Field then return; end;
        end;
    end,
    {
        Expand = function(self)
            local Meta = GetMeta(self);
            local Fields = Meta.___Fields;
            local Main = Meta.___Instance;
            local Arrow = Meta.Arrow;
            Fields.IsOpen = not Fields.IsOpen;
            if Fields.IsOpen then
                TweenService:Create(
                    Main,
                    Fields.ExpandTweenInfo,
                    {
                        Size = UDim2.new(0, Fields.MaxSize.X, 0, Fields.MaxSize.Y)
                    }
                ):Play();
                TweenService:Create(
                    Arrow,
                    Fields.ExpandTweenInfo,
                    {
                        Rotation = 180
                    }
                ):Play();
            else
                TweenService:Create(
                    Main,
                    Fields.ExpandTweenInfo,
                    {
                        Size = UDim2.new(0, Fields.MinSize.X, 0, Fields.MinSize.Y)
                    }
                ):Play();
                TweenService:Create(
                    Arrow,
                    Fields.ExpandTweenInfo,
                    {
                        Rotation = 0
                    }
                ):Play();
            end;
            Meta.ExpandChanged:Fire();
        end
    }
);

VIn_CreateClass("Switch", 
    {
        --Main
        Parent = "\2\1\0",
        ClassName = "\3\0\1string",
        Size = "\4\0\0Vector2",
        Enabled = "\3\0\0boolean",

        --Utility
        Value = "\3\0\1boolean",

        --Bar
        BarTransparency = "\3\0\0number",
        BarThickness = "\3\0\0number",
        MarkupImage = "\3\0\0string",
        MarkupColor3 = "\4\0\0Color3",
        MarkupTransparency = "\3\0\0number",

        --MISC
        MarkupSize = "\4\0\0number",
        SliderType = "\0\0\0SliderType",
        SideSheet = "\3\0\0string",

        --Appearance
        BarOnlineColor3 = "\4\0\0Color3", -- Bar Color when Value is false
        BarOfflineColor3 = "\4\0\0Color3", -- Bar Color when Value is true
        MarkupSizeOffset = "\4\0\0number",
        MarkupDistance = "\4\0\0number", -- Distance from Border
        ClickDarkness = "\4\0\0number", -- Color darkness after MouseButton1Down

        --TweenInfo
        TogleTweenInfo = "\4\0\0TweenInfo",

        --Event
        ValueChanged = "\4\0\1Instance",

        --Method
        Redraw = "\3\0\1function",
        Togle = "\3\0\1function"
    },
    {
        BarOnlineColor = "BarOnlineColor3",
        BarOfflineColor = "BarOfflineColor3",
        MarkupColor = "MarkupColor3",
    },
    function(Parent, Value)
        Proxy, Meta, Fields, Cs = VIn_CreateInstance(VIn_Data.Switch);
        if type(Value) ~= "boolean" then Value = false; end;
        --Main
        Fields.ClassName = "Switch";
        Fields.Parent = GetInstance(Parent);
        Fields.Size = Vector2.new(40, 20);
        Fields.Enabled = true;
        --Bar
        Fields.BarTransparency = 0;
        Fields.BarThickness = 18;
        Fields.MarkupSize = 0.8;
        Fields.MarkupColor3 = VLb_ModernColors.Cloud;
        Fields.MarkupTransparency = 0;
        --Utility
        Fields.Value = Value;
        --MISC
        Fields.SliderType = VLb_Enums.SliderType.Round;
        Fields.SideSheet = "";
        Fields.MarkupImage = "rbxassetid://3457843087";
        --Appearance
        Fields.BarOnlineColor3 = Color3.fromRGB(115, 135, 219);
        Fields.BarOfflineColor3 = Color3.fromRGB(112, 115, 124);
        Fields.MarkupSizeOffset = 4;
        Fields.MarkupDistance = 3;
        Fields.ClickDarkness = 20;
        --Creation
        local Main = Instance.new("Frame", Fields.Parent);
        local Bar = Instance.new("Frame", Main);
        local LeftSide = Instance.new("ImageLabel", Bar);
        local RightSide = Instance.new("ImageLabel", Bar);
        local Markup = Instance.new("ImageLabel", Bar);
        local Hitbox = Instance.new("TextButton", Main);
        local ValueChanged = Instance.new("BindableEvent", Main);

        --Instances Setup
        Main.Name = _PREFIX.."VeraniumSwitch";
        Main.BorderSizePixel = 0;
        Main.BackgroundTransparency = 1;
        --RightSide
        RightSide.BackgroundTransparency = 1;
        RightSide.BorderSizePixel = 0;
        RightSide.AnchorPoint = Vector2.new(0, 0.5);
        RightSide.Position = UDim2.new(1, 0, 0.5, 0);
        RightSide.ImageRectSize = Vector2.new(400, 800);
        RightSide.ImageRectOffset = Vector2.new(400, 0);
        RightSide.Name = _PREFIX.."RightSide";
        --LeftSide
        LeftSide.BackgroundTransparency = 1;
        LeftSide.BorderSizePixel = 0;
        LeftSide.AnchorPoint = Vector2.new(1, 0.5);
        LeftSide.Position = UDim2.new(0, 0, 0.5, 0);
        LeftSide.ImageRectSize = Vector2.new(400, 800);
        LeftSide.ImageRectOffset = Vector2.new(0, 0);
        LeftSide.Name = _PREFIX.."LeftSide";
        --Hitbox
        Hitbox.Text = "";
        Hitbox.Name = _PREFIX.."Hitbox";
        Hitbox.BorderSizePixel = 0;
        Hitbox.BackgroundTransparency = 1;
        Hitbox.Size = UDim2.new(1,0,1,0);
        Hitbox.AnchorPoint = Vector2.new(0.5, 0.5);
        Hitbox.Position = UDim2.new(0.5, 0, 0.5, 0);
        Hitbox.ZIndex = 2;
        --Bar
        Bar.BorderSizePixel = 0;
        Bar.AnchorPoint = Vector2.new(0.5, 0.5);
        Bar.Position = UDim2.new(0.5, 0, 0.5, 0);
        Bar.Name = _PREFIX.."Bar";
        --Markup
        Markup.Name = _PREFIX.."Markup";
        Markup.BorderSizePixel = 1;
        Markup.BackgroundTransparency = 1;
        Markup.Image = Fields.MarkupImage;
        
        ValueChanged.Name = "ValueChanged";

        --Event/Methods
        Fields.ValueChanged = ValueChanged.Event;
        Fields.Togle = VIn_Data.Switch.Togle;
        Fields.Redraw = VIn_Data.Switch.Redraw;

        --TweenInfo
        Fields.TogleTweenInfo = TweenInfo.new(
            0.5,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.Out
        );

        --Connections
        Main.Changed:Connect(function(Field)
            if Field == "BackgroundColor3" then
                LeftSide.ImageColor3 = Main.BackgroundColor3;
                RightSide.ImageColor3 = Main.BackgroundColor3;
                Bar.BackgroundColor3 = Main.BackgroundColor3;
            end;
        end);
        local MouseOver = false;
        local MouseDown = true;
        Hitbox.MouseEnter:Connect(function() MouseOver = true; end);
        Hitbox.MouseLeave:Connect(function() MouseOver = false; end);
        Hitbox.MouseButton1Down:Connect(function()
            MouseDown = true;
            if Fields.Enabled then
                local ActualColor;
                if Fields.Value then ActualColor = Fields.BarOnlineColor3 else ActualColor = Fields.BarOfflineColor3 end;
                H,S,V = Color3.toHSV(ActualColor);
                V = V - (Fields.ClickDarkness/100 * V); -- Hewww, efficent dark effect on different color!
                TweenService:Create(
                    Main,
                    Fields.TogleTweenInfo,
                    {
                        BackgroundColor3 = Color3.fromHSV(H, S, V);
                    }
                ):Play();
            end;
        end)
        --TogleSystem
        local Togle = function()
            if Fields.Enabled then
                if MouseOver and MouseDown then
                    Fields.Togle(Proxy);
                end;
            end;
            MouseDown = false;
        end;
        Hitbox.MouseButton1Up:Connect(Togle);
        Mouse.Button1Up:Connect(Togle);

        --Cs Setup
        Cs.Parent = Main;
        --Meta Setup
        Meta.___Instance = Main;
        Meta.___Base2D = Main;
        Meta.___CHitbox = Hitbox;
        Meta.___Background = Main;

        Meta.Bar = Bar;
        Meta.RightSide = RightSide;
        Meta.LeftSide = LeftSide;
        Meta.Markup = Markup;
        Meta.ValueChanged = ValueChanged;

        --First Draw
        Fields.Redraw(Proxy);
        Fields.Togle(Proxy, Fields.Value);
        return Proxy;
    end,
    function(self, Field, Value)
        local Meta = GetMeta(self);
        local Markup = Meta.Markup;
        local Main = Meta.___Instance;
        local LeftSide = Meta.LeftSide;
        local RightSide = Meta.RightSide;
        local Bar = Meta.Bar;
        local Fields = Meta.___Fields;

        if Field == nil or Field == "BarOnlineColor3" or Field == "BarOfflineColo3" then
            local ActualColor;
            if Fields.Value then ActualColor = Fields.BarOnlineColor3 else ActualColor = Fields.BarOfflineColor3 end;
            Bar.BackgroundColor3 = ActualColor;
            LeftSide.ImageColor3 = ActualColor;
            RightSide.ImageColor3 = ActualColor;
        end;
        if Field == nil or Field == "BarTransparency" then
            Bar.BackgroundTransparency = Fields.BarTransparency;
            LeftSide.ImageTransparency = Fields.BarTransparency;
            RightSide.ImageTransparency = Fields.BarTransparency;
            if Field then return; end;
        end;
        if Field == nil or Field == "MarkupSize" or Field == "MarkupColor3" or Field == "MarkupDistance" or Field == "MarkupTransparency" then
            Markup.ImageTransparency = Fields.MarkupTransparency;
            Markup.Size = UDim2.new(0, Fields.MarkupSize, 0, Fields.MarkupSize);
            Markup.ImageColor3 = Fields.MarkupColor3;
            self:Togle(Fields.Value);
            if Field then return; end;
        end;
        if (Field == nil or Field == "SliderType" or Field == "SlideSheet" or Field == "MarkupImage") then
            local SideSheet = VCf_GetEnumLValue("SliderType", Fields.SliderType);
            if SideSheet == "" then
                LeftSide.Image = Fields.SideSheet;
                RightSide.Image = Fields.SideSheet;

                Markup.Image = Fields.MarkupImage;
            else
                LeftSide.Image = SideSheet;
                RightSide.Image = SideSheet;

                Markup.Image = SideSheet;
            end;
        end;
        if Field == nil  or Field == "BarThickness" or Field == "Size"  then
            Main.Size = UDim2.new(
                0,
                Fields.Size.X,
                0,
                Fields.Size.Y
            );

            LeftSide.Size = UDim2.new(0, Fields.BarThickness/2, 1, 0);
            RightSide.Size = UDim2.new(0, Fields.BarThickness/2, 1, 0);
            Bar.Size = UDim2.new(
                1,
                -Fields.BarThickness,
                1,
                0
            );

            local Size = math.min(Bar.AbsoluteSize.X, Bar.AbsoluteSize.Y)*Fields.MarkupSize;
            Markup.Size = UDim2.new(0, Size, 0, Size);
            if Field then return; end;
        end;
    end,
    {
        Togle = function(self, Value)
            local Meta = GetMeta(self);
            local ValueChanged = Meta.ValueChanged;
            local Main = Meta.___Instance;
            local Markup = Meta.Markup;
            local Fields = Meta.___Fields;
            local MarkupDistance = Fields.MarkupDistance;
            local BarOnlineColor3 = Fields.BarOnlineColor3;
            local BarOfflineColor3 = Fields.BarOfflineColor3;
            if type(Value) ~= "boolean" then Value = not Fields.Value; end;
            if Value == false then
                --Markup Animation
                TweenService:Create(
                    Markup,
                    Fields.TogleTweenInfo,
                    {
                        Position = UDim2.new(0, MarkupDistance-Fields.BarThickness/2, 0.5, 0);
                        AnchorPoint = Vector2.new(0, 0.5);
                    }
                ):Play();
                --Background Animation
                TweenService:Create(
                    Main,
                    Fields.TogleTweenInfo,
                    {
                        BackgroundColor3 = BarOfflineColor3;
                    }
                ):Play();
                Fields.Value = false;
            elseif Value == true then
                --Markup Animation
                TweenService:Create(
                    Markup,
                    Fields.TogleTweenInfo,
                    {
                        Position = UDim2.new(1, Fields.BarThickness/2-MarkupDistance, 0.5, 0);
                        AnchorPoint = Vector2.new(1, 0.5);
                    }
                ):Play();
                --Background Animation
                TweenService:Create(
                    Main,
                    Fields.TogleTweenInfo,
                    {
                        BackgroundColor3 = BarOnlineColor3;
                    }
                ):Play();
                Fields.Value = true;
            end;
            ValueChanged:Fire(Fields.Value);
        end;
    }
);

VIn_CreateClass("Window",
    {
        --Main
        Parent = "\2\1\0",
        ClassName = "\3\0\1string",
        CornerSize = "\3\0\0number",
        CornerType = "\0\0\0CornerType",
        Padding = "\4\0\0Vector2",

        --Appearance:TopBar
        TopBarColor3 = "\4\0\0Color3",
        TopBarTransparency = "\3\0\0number",
        TopBarSize = "\3\0\0number",
        IconSize = "\3\0\0number",
        TopBarDraggable = "\3\0\0boolean",

        --Methods
        Redraw = "\3\0\1",
        PushButton = "\3\0\1",
        RemoveButton = "\3\0\1"
    },
    {
        TopBarColor = "TopBarColor3",
        TitleText = "Text",
        TitleColor3 = "TextColor3",
        TitleTextColor3 = "TextColor3",
        IconTexture = "Image",
        IconColor3 = "ImageColor3",
        WindowSize = "Size",
        WindowTransparency = "BackgroundTransparency",
        BoundarySize = "CornerSize",
        Type = "CornerType",
        BoundaryType = "CornerType",
    },
    function(Parent)
        local Proxy, Meta, Fields, Cs = VIn_CreateInstance(VIn_Data.Window);
        local Connections = {};
        local Buttons = {};
        --Fields Setup
        Fields.Parent = Parent;
        Fields.ClassName = "VeraniumWindow";
        Fields.CornerSize = VLb_Defaults.CornerSize;
        Fields.CornerType = VLb_Defaults.CornerType;
        Fields.Padding = Vector2.new(2, 0);

        Fields.TopBarColor3 = VLb_Defaults.SecondaryColor;
        Fields.TopBarTransparency = 0;
        Fields.TopBarSize = 16;
        Fields.IconSize = 0;

        Fields.TopBarDraggable = true;

        --Methods Setup
        Fields.Redraw = VIn_Data.Window.Redraw;
        Fields.PushButton = VIn_Data.Window.PushButton;
        Fields.RemoveButton = VIn_Data.Window.RemoveButton;

        --Elements Creation
        local Main = Instance.new("Frame", GetPInstance(Parent));
        local Window = VIn_Data.Background.Constructor(Main);
        local TopBar = Instance.new("Frame", Main);
        local TopBarBG = VIn_Data.Button.Constructor(TopBar);
        local Title = Instance.new("TextLabel", GetInstance(TopBar));
        local Icon = Instance.new("ImageLabel", GetInstance(TopBar));
        local ElementCanvas = Instance.new("Frame", Main);

        --Main Setup
        Main.BackgroundTransparency = 1;
        Main.BorderSizePixel = 0;
        Main.Name = "VeraniumWindow";
        Main.Size = UDim2.new(0, 250, 0, 125);
        
        --TopBar Setup
        TopBar.BackgroundTransparency = 1;
        TopBar.BorderSizePixel = 0;
        TopBar.Size = UDim2.new(1, 0, 0, 20);
        TopBar.Position = UDim2.new(0.5, 0, 0, 0);
        TopBar.AnchorPoint = Vector2.new(0.5, 0);
        TopBar.Name = _PREFIX.."TopBar";
        --TopBarBG Setup
        TopBarBG.BackgroundColor3 = VLb_Defaults.SecondaryColor;
        TopBarBG.Text = "";
        TopBarBG.Size = UDim2.new(1, 0, 1, 0);
        TopBarBG.BottomLeft.Type = VLb_Enums.CornerType.Sharp;
        TopBarBG.BottomRight.Type = VLb_Enums.CornerType.Sharp;
        TopBarBG.MetroStyle = false;
        TopBarBG.Name = _PREFIX.."TopBarBG";
        
        --Title
        Title.BackgroundTransparency = 1;
        Title.Name = _PREFIX.."Title";
        Title.BorderSizePixel = 0;
        Title.Text = "Vera Window";
        Title.AnchorPoint = Vector2.new(0, 0.5);
        Title.Size = UDim2.new(0, 0, 1, 0);
        Title.TextXAlignment = Enum.TextXAlignment.Left;
        --Title Defaults
        Title.TextColor3 = VLb_Defaults.TextColor;
        Title.TextTransparency = VLb_Defaults.TextTransparency;
        Title.Font = VLb_Defaults.Font;

        Title.TextStrokeColor3 = VLb_Defaults.TextStrokeColor;
        Title.TextStrokeTransparency = VLb_Defaults.TextStrokeTransparency;
        
        --Icon Setup
        Icon.BackgroundTransparency = 1;
        Icon.BorderSizePixel = 0;
        Icon.Name = _PREFIX.."Icon";
        Icon.AnchorPoint = Vector2.new(0, 0.5);
        Icon.ImageColor3 = VLb_Defaults.HighlightColor;
        
        --ElementCanvas Setup
        ElementCanvas.Name = _PREFIX.."ElementCanvas";
        ElementCanvas.BackgroundTransparency = 1;
        ElementCanvas.BorderSizePixel = 0;
        ElementCanvas.AnchorPoint = Vector2.new(0.5, 1);
        ElementCanvas.Position = UDim2.new(0.5, 0, 1, 0);
        ElementCanvas.ClipsDescendants = true;
        --Draggability
        local DownPos;
        TopBarBG.MouseButton1Down:Connect(function()
            DownPos = Vector2.new(
                Mouse.X - Main.AbsolutePosition.X,
                Mouse.Y - Main.AbsolutePosition.Y
            );
        end);
        TopBarBG.MouseButton1Up:Connect(function()
            DownPos = nil;
        end);
        Connections[0] = Mouse.Button1Up:Connect(function()
            DownPos = nil;
        end);
        Connections[1] = Mouse.Move:Connect(function()
            if DownPos and Fields.TopBarDraggable then
                Main.AnchorPoint = Vector2.new(0, 0);
                Main.Position = UDim2.new(
                    0,
                    Mouse.X - DownPos.X,
                    0,
                    Mouse.Y - DownPos.Y
                );
            end;
        end);
        --ChangedSignal Setup
        Cs.Parent = Main;
        --Meta Setup
        Meta.___Instance = Main;
        Meta.___Base2D = Main;
        Meta.___Children = ElementCanvas;
        Meta.___Background = Window;
        Meta.___TextRender = Title;
        Meta.___ImageRender = Icon;
        Meta.___Connection = Connections;

        Meta.TopBar = TopBar;
        Meta.TopBarBG = TopBarBG;
        Meta.Buttons = Buttons;
        --First Draw
        VIn_Data.Window.Redraw(Proxy);

        return Proxy;
    end,
    function(self, Field, Value)
        local Meta = GetMeta(self);
        local Main = Meta.___Instance;
        local ElementCanvas = Meta.___Children;
        local Window = Meta.___Background;
        local Title = Meta.___TextRender;
        local Icon = Meta.___ImageRender;
        local TopBar = Meta.TopBar;
        local TopBarBG = Meta.TopBarBG;

        local Fields = Meta.___Fields;
        local Buttons = Meta.Buttons;
        --Padding
        if Field == nil or Field == "Padding" then
            Icon.Position = UDim2.new(0, Fields.Padding.X, 0.5, 0);
            Title.Position = UDim2.new(0, Fields.IconSize + (Fields.Padding.X*2), 0.5, 0);
            local ButtonOffset = -Fields.Padding.X;
            for Idx, Val in pairs(Buttons)do
                local Button = Val.Button;
                Button.Position = UDim2.new(1, ButtonOffset, 0.5, 0);
                ButtonOffset = ButtonOffset - Btn.Button.AbsoluteSize.X - Fields.Padding.X;
            end;
            if Field then return; end;
        end;
        --CornerSize
        if Field == nil or Field == "CornerSize" or Field == "CornerType" then
            Window.CornerSize = Fields.CornerSize;
            TopBarBG.CornerSize = Fields.CornerSize;

            Window.CornerType = Fields.CornerType;
            TopBarBG.TopLeft.Type = Fields.CornerType;
            TopBarBG.TopRight.Type = Fields.CornerType;
            if Field then return; end;
        end;
        --TopBar Appearance
        if Field == nil or Field == "TopBarColor3" or Field == "TopBarTransparency" then
            TopBarBG.BackgroundColor3 = Fields.TopBarColor3;
            TopBarBG.BackgroundTransparency = Fields.TopBarTransparency;
            if Field then return; end;
        end;
        --TopBarSize
        if Field == nil or Field == "TopBarSize" then
            TopBar.Size = UDim2.new(1, 0, 0, Fields.TopBarSize);
            ElementCanvas.Size = UDim2.new(1, 0, 1, -Fields.TopBarSize);
            if Field then return; end;
        end;
        --IconSize
        if Field == nil or Field == "IconSize" then
            Icon.Size = UDim2.new(0, Fields.IconSize, 0, Fields.IconSize);
            Icon.Position = UDim2.new(0, Fields.Padding.X, 0.5, 0);
            Title.Position = UDim2.new(0, Fields.IconSize + (Fields.Padding.X*2), 0.5, 0);
            if Field then return; end;
        end;
    end,
    {
        PushButton = function(self, Bdx, ButtonSize, ButtonColor, ButtonTexture, ClickFunction)
            local Meta = GetMeta(self);
            local TopBar = Meta.TopBar;
            local Fields = Meta.___Fields;
            local Buttons = Meta.Buttons;

            ButtonSize = ButtonSize or 18;
            ButtonColor = ButtonColor or Color3.new(1, 1, 1);
            ButtonTexture = ButtonTexture or "";
            if type(Bdx) ~= "string" and type(Bdx) ~= "number" then
                error("Arg#1 must be a string or a number.");
            end;
            if Buttons[Bdx] then
                error("A button already exists with the index \""..tostring(Bdx).."\".");
            end;

            local Button = Instance.new("ImageButton", GetInstance(TopBar));
            Button.Name = _PREFIX..tostring(Bdx);
            local Connection = Button.AncestryChanged:Connect(function()
                RunService.Heartbeat:Wait();
                if not Button:IsDescendantOf(TopBar) and VCf_IsVera(self) then
                    self:RemoveButton(Bdx);
                end;
            end);
            Button.BackgroundTransparency = 1;
            Button.BorderSizePixel = 0;
            Button.Size = UDim2.new(0, ButtonSize, 0, ButtonSize);
            Button.Image = ButtonTexture;
            Button.AnchorPoint = Vector2.new(1, 0.5);
            local ButtonOffset = -Fields.Padding.X;
            for Idx, Btn in pairs(Buttons) do
                ButtonOffset = ButtonOffset - Btn.Button.AbsoluteSize.X - Fields.Padding.X;
            end;
            Button.Position = UDim2.new(1, ButtonOffset, 0.5, 0);
            Button.ImageColor3 = ButtonColor;
            if type(ClickFunction) == "function" then
                Buttons[Bdx] = {
                    Button = Button,
                    ClickFunction = ClickFunction,
                    Connection = Button.MouseButton1Click:Connect(ClickFunction),
                    AncestryChanged = Connection
                }
            else
                Buttons[Bdx] = {
                    Button = Button,
                    ClickFunction = ClickFunction
                }
            end;
            return Button;
        end,
        RemoveButton = function(self, Bdx)
            local Meta = GetMeta(self);
            local TopBar = Meta.TopBar;
            local Fields = Meta.___Fields;
            local Buttons = Meta.Buttons;
            local Target = Buttons[Bdx];
            if Target and Target.Button then
                Target.Button:Remove();
                Target.Button:Destroy();
                Target.AncestryChanged:Disconnect();
                Target.Button = nil;
                Target.ClickFunction = nil;
                Buttons[Bdx] = nil;
            else
                return false;
            end;
            return true;
        end
    }
);

VIn_CreateClass("TabControl",
    {
        --Main
        Parent = "\2\1\0",
        ClassName = "\3\0\1string",
        ScreenSize = "\4\0\0UDim2",
        PanelSize = "\4\0\0Vector2",
        CornerSize = "\3\0\0number",
        CornerType = "\4\0\0CornerType",

        --TextAppearance
        TextColor3 = "\4\0\0Color3",
        TextTransparency = "\3\0\0number",
        Font = "\4\0\0EnumItem",
        TextSize = "\3\0\0number",

        --Appearance
        BackgroundColor3 = "\4\0\0Color3",
        TabPanelColor3 = "\4\0\0Color3",
        TabColor3 = "\4\0\0Color3",
        SelectedTabColor3 = "\4\0\0Color3",
        HoveredTabColor3 = "\4\0\0Color3",
        TabControlType = "\0\0\0TabControlType",
        CloseIconColor3 = "\4\0\0Color3",
        CloseBackColor3 = "\4\0\0Color3",
        CloseIconHoverColor3 = "\4\0\0Color3",
        CloseBackHoverColor3 = "\4\0\0Color3",
        CloseIconTransparency = "\3\0\0number",
        CloseIconHoverTransparency = "\3\0\0number",
        CloseBackTransparency = "\3\0\0number",
        CloseBackHoverTransparency = "\3\0\0number",
        UnderlineColor3 = "\4\0\0Color3",
        UnderlineTransparency = "\3\0\0number",
        UnderlineSize = "\3\0\0number",
        
        --Utility
        TabUnselectable = "\3\0\0boolean",
        TabRemovable = "\3\0\0boolean",
        TabMovable = "\3\0\0boolean",
        TabUnderline = "\3\0\0boolean",

        --Events
        TabCreated = "\3\0\1Instance",
        TabRemoved = "\3\0\1Instance",
        TabSelected = "\3\0\1Instance",
        TabUnselected = "\3\0\1Instance",

        --Methods
        CreateTab = "\3\0\1",
        RemoveTab = "\3\0\1",
        SelectTab = "\3\0\1",
        Unselect = "\3\0\1",
        GetTabs = "\3\0\1"
    },
    {
        BackgroundColor = "BackgroundColor3",
        TabPanelColor3 = "TabPanelColor",
        TabColor3 = "TabColor",
        SelectedTabColor3 = "SelectedTabColor",
        HoveredTabColor3 = "HoveredTabColor",
        CloseIconColor3 = "CloseIconColor",
        CloseBackColor3 = "CloseBackColor",
        CloseIconHoverColor3 = "CloseIconHoverColor",
        CloseBackHoverColor3 = "CloseBackHoverColor",
        UnderlineColor3 = "UnderlineColor"
    },
    function(Parent)
        local Proxy, Meta, Fields, Cs = VIn_CreateInstance(VIn_Data.TabControl);
        local Connections = {};
        local Buttons = {};
        --Fields Setup
        Fields.Parent = Parent;
        Fields.ClassName = "TabControl";
        Fields.ScreenSize = UDim2.new(0, 200, 0, 150);
        Fields.PanelSize = 20;
        Fields.CornerSize = VLb_Defaults.CornerSize;
        Fields.CornerType = VLb_Defaults.CornerType;

        Fields.TextColor3 = VLb_Defaults.TextColor;
        Fields.TextTransparency = VLb_Defaults.TextTransparency;
        Fields.Font = VLb_Defaults.Font;
        Fields.TextSize = 8;
        
        Fields.BackgroundColor3 = VLb_Defaults.BackgroundColor;
        Fields.TabPanelColor3 = VLb_Defaults.SecondaryColor;
        Fields.TabColor3 = VLb_Defaults.SecondaryColor;
        Fields.SelectedTabColor3 = VLb_Defaults.BackgroundColor;
        Fields.HoveredTabColor3 = VLb_Defaults.BackgroundColor;
        Fields.TabControlType = VLb_Enums.TabControlType.Top;
        Fields.CloseIconColor3 = VLb_Defaults.TextColor3;
        Fields.CloseBackColor3 = VLb_Defaults.SecondaryColor;
        Fields.CloseIconHoverColor3 = VLb_Defaults.HighlightColor;
        Fields.CloseBackHoverColor3 = VLb_ModernColors.Ruby;
        Fields.CloseIconTransparency = 0;
        Fields.CloseIconHoverTransparency = 0.25;
        Fields.CloseBackTransparency = 1;
        Fields.CloseBackHoverTransparency = 0;
        Fields.UnderlineColor3 = VLb_Defaults.HighlightColor;
        Fields.UnderlineTransparency = 0;
        Fields.UnderlineSize = 4;

        Fields.TabUnselectable = false;
        Fields.TabRemovable = false;
        Fields.TabMovable = false;
        Fields.TabUnderline = true;

        
    end,
    function(self, Field, Value)

    end,
    {

    }
);

VIn_CreateClass("2DParticleEmmitter",
    {
        --Main
        Parent = "\2\1\0",
        Adornee = "\2\1\0",
        ClassName = "\3\0\1string",

        --Appearance
        StartSize = "\3\0\0number",
        EndSize = "\3\0\0number",
        StartColor3 = "\4\0\0Color3",
        EndColor3 = "\4\0\0Color3",
        StartTransparency = "\3\0\0number",
        EndTransparency = "\3\0\0number",
        Texture = "\3\0\0string",

        --Movement
        DirectionRange = "\4\0\0Vector2",
        Lifetime = "\4\0\0Vector2",
        Speed = "\4\0\0Vector2",
        RotationSpeed = "\3\0\0Vector2",
    },
    {

    },
    function(Parent)

    end,
    function()
    end,
    {
        
    }
);

--[[Instance List:                  [12/18]
    Core Instances:                 [2/2]
    [1]:  Boundary                  [Done]
    [2]:  Background                [Done]

    Basic Instances:                [3/3]
    [3]:  Label                     [Done]
    [4]:  Button                    [Done]
    [5]:  TextBox                   [Done]
    [6]:  ScrollingFrame

    Standard Instances:             [5/7]
    [6]:  Slider                    [Done]
    [7]:  CheckBox                  [Done]
    [8]:  FillBox                   [Done]
    [9]:  Swicth                    
    [10]: TabControl
    [11]: Counter                   [Done]
    [12]: DropdownBox               [Done]
    
    Complex Instances:              [2/6]
    [13]: Window                    [Done]
    [14]: Expander                  [Done]
    [15]: 2DParticleEmmitter
    [16]: GifPlayer
    [17]: DisplayList
    [18]: StackDisplay

    Note:
    "Veranium" is a UIL that follows the same rules that RLua does.
    "Vera" is a sub-library that follows the traditional UIL system.
    Veranium can work alone. Vera however, needs Veranium to work.
    
    Veranium: {Boundary, Background, Label, Button, ScrollBG, Slider, CheckBox
    FillBox, TabControl, Counter, DropdownBox, Expander, 2DParticleEmmitter}
    Vera: {Window, GifPlayer, DisplayList}
]]

local VLb_CTweenService, VCt_BaseData, VCt_Methods, VCt_Meta;
VCt_BaseData = {};
VCt_Methods = {
    Play = function(self, DisposeAfterPlay)
        local Meta = VCt_BaseData[self];
        
        if not Meta then return error("Unable to get tween meta, It might be destroyed."); end;
        local VeraniumInstance = Meta.Instance;
        local Tween = Meta[_PREFIX.."Tween"];
        local Properties = Meta[_PREFIX.."Properties"];
        local Base = Meta[_PREFIX.."Base"];
        local MapValue = VLb_CTweenService.MapValue;
        local StartProperties = {};
        local VTweens = VCt_BaseData[Meta.Instance];
        for Idx, Val in pairs(Properties) do
            StartProperties[Idx] = VeraniumInstance[Idx];
        end;
        for Idx, Val in pairs(VTweens)do
            if Val ~= self then
                local VMeta = VCt_BaseData[Val];
                for Property, Val0 in pairs(VMeta[_PREFIX.."Properties"]) do
                    for Property0, Val1 in pairs(Properties)do
                        if Property == Property0 then
                            VMeta[_PREFIX.."Properties"][Property] = nil;
                            break;
                        end;
                    end;
                end;
            end;
        end;

        local function Update()
            local Markup = Base.Value;
            for Idx, Val in pairs(Properties) do
                if not VCf_IsVera(VeraniumInstance) then
                    return;
                end;
                VeraniumInstance[Idx] = MapValue(
                    StartProperties[Idx],
                    Properties[Idx],
                    Markup
                );
            end;
        end;

        local LValue = 0;
        local Connection = RunService.Heartbeat:Connect(function()
            if (Base.Value - LValue) < 0.001 then return; end;
            LValue = Base.Value;
            Update();
        end);
        Tween:Play();

        spawn(function()
            repeat RunService.Heartbeat:Wait();
            until Tween.PlaybackState == Enum.PlaybackState.Completed
            or Tween.PlaybackState == Enum.PlaybackState.Cancelled;
            RunService.Heartbeat:Wait();
            Connection:Disconnect();
            Update();
            Update = nil;
            if Tween.PlaybackState == Enum.PlaybackState.Completed then
                Base.Value = 0;
            end;
            if DisposeAfterPlay then
                self:Remove();
            end;
        end);
        return self;
    end,
    Pause = function(self)
        local Meta = VCt_BaseData[self];
        if not Meta then return error("Unable to get tween meta, It might be destroyed."); end;
        local Tween = Meta[_PREFIX.."Tween"];
        Tween:Pause();
        return self;
    end,
    Cancel = function(self)
        local Meta = VCt_BaseData[self];
        if not Meta then return error("Unable to get tween meta, It might be destroyed."); end;
        local Tween = Meta[_PREFIX.."Tween"];
        Tween:Cancel();
        return self;
    end,
    Destructor = function(self)
        local Meta = VCt_BaseData[self];
        if Meta then
            if type(VCt_BaseData[Meta.Instance]) == "table" then
                for Idx, Val in pairs(VCt_BaseData[Meta.Instance]) do
                    if Val == self then
                        table.remove(VCt_BaseData[Meta.Instance], Idx);
                    end;
                end;
                if #VCt_BaseData[Meta.Instance] == 0 then
                    VCt_BaseData[Meta.Instance] = nil;
                end;
            end;
            VCt_BaseData[self] = nil;
            Meta.Instance = nil;
            Meta.TweenInfo = nil;
            Meta.Cancel = nil;
            Meta.Play = nil;
            Meta.Pause = nil;
            Meta[_PREFIX.."Properties"] = nil;
            Meta[_PREFIX.."Base"]:Destroy();
            Meta[_PREFIX.."Base"] = nil;
            Meta[_PREFIX.."Tween"]:Destroy();
            Meta[_PREFIX.."Tween"] = nil;
            Meta[_PREFIX.."Meta"] = nil;
            Meta = nil;
            
            return true;
        else
            return false;
        end;
    end
};
VCt_Methods.Destroy = VCt_Methods.Destructor;
VCt_Methods.Remove = VCt_Methods.Destructor;

VCt_Meta = {
    __tostring = function(self)
        if VCt_BaseData[self] then
            return "VeraniumTween";
        else
            return "";
        end;
    end,
    __index = function(self, Field)
        if Field == nil then
            return error("Field can't be nil.");
        end;
        Field = tostring(Field);
        local Meta = VCt_BaseData[self];
        if not Meta then return error("Unable to get tween meta, It might be destroyed."); end;
        if VCt_Methods[Field] then
            return VCt_Methods[Field];
        end;
        if Meta[Field] ~= nil then
            return Meta[Field]
        else
            return Meta[_PREFIX.."Tween"][Field];
        end;
    end,
    __newindex = function(self, Field, Value)
        if Field == nil then
            return error("Field can't be nil.");
        end;
        Field = tostring(Field);
        local Meta = VCt_BaseData[self];
        if not Meta then return error("Unable to get tween meta, It might be destroyed."); end;
        Meta[_PREFIX.."Tween"][Field] = Value;
    end,
    __metatable = "Ara Ara~ What are you doing, User-kun?"--No Context x3
};
VLb_CTweenService = {
    Create = function(self, VeraniumInstance, TInfo, Properties)
        local Base = Instance.new("NumberValue");
        Base.Name = _PREFIX.."TweenBase";
        Base.Value = 0;
        
        local Tween = TweenService:Create(Base, TInfo, {Value = 1});
        Base.Parent = Tween;

        local Proxy = newproxy(true);
        local Meta = getmetatable(Proxy);
        Meta.__index = VCt_Meta.__index;
        Meta.__newindex = VCt_Meta.__newindex;
        Meta.__tostring = VCt_Meta.__tostring;
        Meta.__metatable = VCt_Meta.__metatable;

        local Fields = {};
        for Idx, Val in pairs(Properties)do
            if type(Idx) == "string" and typeof(VeraniumInstance[Idx]) == typeof(Val) then
                Fields[Idx] = Val;
            else
                return error("Invalid setting for "..tostring(Idx)..".");
            end;
        end;
        Properties = Fields;
        Fields = nil;

        VCt_BaseData[Proxy] = {
            Instance = VeraniumInstance,
            TweenInfo = TInfo,

            Cancel = VCt_Methods.Cancel,
            Play = VCt_Methods.Play,
            Pause = VCt_Methods.Pause,

            [_PREFIX.."Properties"] = Properties,
            [_PREFIX.."Base"] = Base,
            [_PREFIX.."Tween"] = Tween,
            [_PREFIX.."Meta"] = Meta
        };
        if type(VCt_BaseData[VeraniumInstance]) == "table" then
            table.insert(VCt_BaseData[VeraniumInstance], Proxy);
        else
            VCt_BaseData[VeraniumInstance] = {Proxy};
        end;
        
        Tween.Parent = GetMeta(VeraniumInstance).___Instance;

        return Proxy;
    end,
    MapValue = function(StartValue, EndValue, Markup)
        if typeof(StartValue) ~= typeof(EndValue) then
            return;
        end;
        if type(StartValue) == "number" then
            local Difference = EndValue - StartValue;
            return StartValue + (Difference*Markup);
        elseif type(StartValue) == "string" then
            local TargetLenght = math.floor((#EndValue)*Markup);
            if Markup == 1 then
                return EndValue;
            end;
            return EndValue:sub(1, TargetLenght)..StartValue:sub(TargetLenght+1, -1);
        elseif typeof(StartValue) == "Color3" then
            local R, G, B;
            R = EndValue.r - StartValue.r;
            G = EndValue.g - StartValue.g;
            B = EndValue.b - StartValue.b;

            R = StartValue.r + (R*Markup);
            G = StartValue.g + (G*Markup);
            B = StartValue.b + (B*Markup);

            return Color3.new(R, G, B);
        elseif typeof(StartValue) == "Vector2" then
            local X, Y;
            X = EndValue.X - StartValue.X;
            Y = EndValue.Y - StartValue.Y;

            X = StartValue.X + (X*Markup);
            Y = StartValue.Y + (Y*Markup);

            return Vector2.new(X, Y);
        elseif typeof(StartValue) == "UDim2" then
            local X0, X1, Y0, Y1;

            X0 = EndValue.X.Scale - StartValue.X.Scale;
            X1 = EndValue.X.Offset - StartValue.X.Offset;
            Y0 = EndValue.Y.Scale - StartValue.Y.Scale;
            Y1 = EndValue.Y.Offset - StartValue.Y.Offset;

            X0 = StartValue.X.Scale + (X0*Markup);
            X1 = StartValue.X.Offset + (X1*Markup);
            Y0 = StartValue.Y.Scale + (Y0*Markup);
            Y1 = StartValue.Y.Offset + (Y1*Markup);

            return UDim2.new(X0, X1, Y0, Y1);
        else
            if Markup >= 0.5 then
                return EndValue;
            else
                return StartValue;
            end;
        end;
    end
};
VIn_Methods.Tween = function(self, ...)
    return VLb_CTweenService:Create(self, ...);
end;

VIn_Methods.Fade = function(self, Time, Transparency, EasingStyle, EasingDirection)
    --Defaults
    VCf_AssertIsVera(self);
    Time = Time or 1;
    Transparency = Transparency or 1;
    EasingStyle = EasingStyle or Enum.EasingStyle.Sine;
    EasingDirection = EasingDirection or Enum.EasingDirection.Out;

    --Tween Create
    local Layer = VIn_SReg.TransparencyLayer[self.ClassName];
    if not Layer then
        return warn("This Class doesn't have a fade method.");
    end;
    local Properties = {};
    for Idx, Val in pairs(Layer)do
        Properties[Val] = Transparency;
    end;

    local Tween = self:Tween(TweenInfo.new(
        Time,
        EasingStyle,
        EasingDirection
    ), Properties):Play();
    Tween.Name = _PREFIX.."FadeTween";

    spawn(function()
        wait(Time);
        Tween:Destroy();
    end);

    return;
end;

--Bridge Library
--NotificationService
local function VLb_NotificationService()
    local NotificationDefaults;
    local function UpdateDefaults()
        NotificationDefaults = {
            --Background:Corners
            CornerSize = VLb_Defaults.CornerSize,
            CornerType = VLb_Defaults.CornerType,
            --Background:Border
            BorderSize = VLb_Defaults.BorderSize,
            BorderTransparency = VLb_Defaults.BorderTransparency,
            BorderColor3 = VLb_Defaults.BorderColor,
            --Backgroun:self
            BackgroundColor3 = VLb_Defaults.BackgroundColor,
            BackgroundTransparency = VLb_Defaults.BackgroundTransparency,
            --Text Properties
            TextColor3 = VLb_Defaults.TextColor,
            TextTransparency = VLb_Defaults.TextTransparency,
            Font =  VLb_Defaults.Font,
            --Text:Stroke
            TextStrokeColor3 = VLb_Defaults.TextStrokeColor,
            TextStrokeTransparency = VLb_Defaults.TextStrokeTransparency,
    
            IconColor = VLb_Defaults.TextColor,
            IconSize = 12,
            Padding = 4
        };
    end;
    UpdateDefaults();
    local function ApplyNotificationProperties(Notification, Properties)
        for Idx, Val in pairs(NotificationDefaults) do
            Val = Properties[Idx] or Val;
            if Idx ~= "IconColor" and Idx ~= "Padding" and Idx ~= "IconSize" then
                Notification[Idx] = Val;
            end;
        end;
        local Val = Properties.SideColor;
        if Val then
            Notification.TopLeft.BackgroundColor3 = Val;
            Notification.LeftBorder.BackgroundColor3 = Val;
            Notification.BottomLeft.BackgroundColor3 = Val;
        end;
    end;

    local Notifications = {};
    local NotificationFrame = Instance.new("Frame", VeraniumSpace);
    NotificationFrame.Name = "NotificationFrame";
    NotificationFrame.BackgroundTransparency = 1;
    NotificationFrame.BorderSizePixel = 0;
    NotificationFrame.Size = UDim2.new(1, 0, 0.3, 0);
    NotificationFrame.Position = UDim2.new(0.5, 0, 1, 0);
    NotificationFrame.AnchorPoint = Vector2.new(0.5, 1);

    local function Pop(Ndx, Pixels)
        for Idx, Notification in pairs(Notifications)do
            local AbsolutePosition;
            if VCf_IsVera(Notification) then
                AbsolutePosition = Notification.Abs;
            end;
            if Notification and VCf_IsVera(Notification) and AbsolutePosition.Value < Ndx then
                AbsolutePosition.Value = AbsolutePosition.Value + Pixels;
                Notification:Tween(
                    TweenInfo.new(
                        0.5,
                        Enum.EasingStyle.Sine,
                        Enum.EasingDirection.Out
                    ),
                    {
                        Position = UDim2.new(
                            0.5,
                            Notification.Position.X.Offset,
                            0.5,
                            AbsolutePosition.Value
                        )
                    }
                ):Play(true);
            end;
        end;
    end;

    local function Push(Pixels)
        for Idx, Notification in pairs(Notifications) do if VCf_IsVera(Notification) then
            local AbsolutePosition = Notification.Abs;
            AbsolutePosition.Value = AbsolutePosition.Value - Pixels;
            Notification:Tween(
                TweenInfo.new(
                    0.5,
                    Enum.EasingStyle.Sine,
                    Enum.EasingDirection.Out
                ),
                {
                    Position = UDim2.new(
                        0.5,
                        Notification.Position.X.Offset,
                        0.5,
                        AbsolutePosition.Value
                    )
                }
            ):Play(true);
        end; end;
    end;

    local function ToastNotification(Text, NotificationType, Properties, Duration, ClickFunction)
        --Defaults
        Text = Text or "Veranium ToastNotification";
        if type(NotificationType) ~= "string" then
            NotificationType = NotificationType or VLb_Enums.NotificationType.None;
            NotificationType = VCf_GetEnumLValue("NotificationType", NotificationType);
        end;
        Properties = Properties or  {};
        Duration = Duration or (#Text/20);

        local IconSize = Properties.IconSize or NotificationDefaults.IconSize;
        local IconColor = Properties.IconColor or NotificationDefaults.IconColor;
        local Padding = Properties.Padding or NotificationDefaults.Padding;
        local CornerSize = Properties.CornerSize or NotificationDefaults.CornerSize;

        local NotificationBg = VCn_Main("Label", NotificationFrame);
        local Notification = VCn_Main("Button", NotificationBg);
        local AbsolutePosition = Instance.new("NumberValue", NotificationBg:GetInstance());
        AbsolutePosition.Name = "Abs";
        AbsolutePosition.Value = 0;
        NotificationBg.Name = "ToastNotification";
        NotificationBg.Text = "";
        Notification.Name = "Text";
        Notification.Text = Text;
        Notification.Size = UDim2.new(1, 0, 1, 0);
        Notification.AnchorPoint = Vector2.new(0.5, 0.5);
        Notification.Position = UDim2.new(0.5, 0, 0.5, 0);
        Notification.TextXAlignment = Enum.TextXAlignment.Center;
        Notification.TextYAlignment = Enum.TextYAlignment.Center;
        local Icon = Instance.new("ImageLabel", Notification:GetInstance());
        if NotificationType ~= "" then
            Icon.Name = "Icon";
            Icon.BackgroundTransparency = 1;
            Icon.BorderSizePixel = 0;
            Icon.Image = NotificationType;
            Icon.Size = UDim2.new(0, IconSize, 0, IconSize);
            Icon.Name = "Icon";
            Icon.Position = UDim2.new(0, Padding, 0.5, 0);
            Icon.AnchorPoint = Vector2.new(1, 0.5);
            Icon.ImageColor3 = IconColor;
        else
            Icon:Remove();
            Icon:Destroy();
        end;
        ApplyNotificationProperties(Notification, Properties);
        Notification.BackgroundTransparency = 1;
        Notification.BorderTransparency = 1;
        ApplyNotificationProperties(NotificationBg, Properties);
        if NotificationType == "" then
            NotificationBg.Size = UDim2.new(
                0,
                Notification.TextBounds.X+CornerSize+Padding,
                0,
                Notification.TextBounds.Y+Padding
            );
        else
            NotificationBg.Size = UDim2.new(
                0,
                Notification.TextBounds.X+CornerSize+Padding+IconSize,
                0,
                math.max(IconSize, Notification.TextBounds.Y)+Padding
            );
            Notification.Position = UDim2.new(
                0,
                IconSize,
                0.5,
                0
            );
            Notification.Size = UDim2.new(
                1,
                -IconSize,
                0.5,
                0
            );
            Notification.AnchorPoint = Vector2.new(0, 0.5);
        end;
        NotificationBg.Position = UDim2.new(0.5, 0, 1, 0);
        NotificationBg.AnchorPoint = Vector2.new(0.5, 0);
        if type(ClickFunction) == "function" then
            Notification.MouseButton1Click:Connect(ClickFunction);
        end;

        Push(Notification.TextBounds.Y+Padding);
        NotificationBg:Tween(
            TweenInfo.new(
                0.5,
                Enum.EasingStyle.Sine,
                Enum.EasingDirection.Out
            ),
            {
                Position = UDim2.new(0.5, 0, 0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0.5)
            }
        ):Play(true);
        local Ndx = #Notifications;
        spawn(function()
            Notifications[Ndx+1] = NotificationBg;
            wait(0.6);
            wait(Duration);
            NotificationBg:Fade(0.5);
            Notification:Fade(0.5);
            TweenService:Create(
                Icon,
                TweenInfo.new(
                    0.5,
                    Enum.EasingStyle.Sine,
                    Enum.EasingDirection.Out
                ),
                {
                    ImageTransparency = 1
                }
            ):Play();
            wait(0.5);
            table.remove(Notifications, Ndx+1);
            Pop(AbsolutePosition.Value, Notification.TextBounds.Y+(Padding*2));
            wait(0.1);
            NotificationBg:Remove();
            Notification:Remove();
            Icon:Remove();
            Icon:Destroy();
            NotificationBg = nil;
            Notification = nil;
            Icon = nil;
        end);
        return NotificationBg;
    end;

    return ToastNotification, NotificationDefaults, UpdateDefaults;
end;
--Tooltip
local function VLb_Tooltip()
    local Tooltip = VCn_Main("Label", VeraniumSpace);
    local TooltipConnections = {};
    Tooltip.Name = "Tooltip";
    Tooltip.ZIndex = 9e5;
    Tooltip.Visible = false;
    Tooltip:CreateBorder();
    local Tooltip_Defaults = {
        --Background:Corners
        CornerSize = 8,
        CornerType = VLb_Enums.CornerType.Smooth,
        --Background:Self
        BackgroundColor3 = VLb_ModernColors.DimMidnightBlue,
        BackgroundTransparency = 0.5,
        --Background:Borders
        BorderSize = 0,
        BorderColor3 = Color3.new(0, 0, 0),
        BorderTransparency = 1,
        --Text Properties
        TextColor3 = VLb_ModernColors.Silver,
        TextSize = 8,
        TextTransparency = 0,
        Font = Enum.Font.Legacy,
        --Text:Stroke
        TextStrokeColor3 = VLb_ModernColors.Abestos,
        TextStrokeTransparency = 1,

        Padding = 8;
    };
    local function ApplyTooltipProperties(Properties)
        for Idx, Val in pairs(Tooltip_Defaults) do
            if Properties[Idx] and Idx ~= "Padding" then
                Tooltip[Idx] = Properties[Idx];
            elseif Idx ~= "Padding" then
                Tooltip[Idx] = Val;
            end;
        end;
    end;

    local HoveredElement;
    --Update
    RunService.Heartbeat:Connect(function()
        local Object = GetInstance(HoveredElement);
        local Connections = TooltipConnections[HoveredElement];
        if typeof(Object) == "Instance" and type(Connections) == "table" then
            Tooltip.Visible = true;
            local APos, ASz, X, Y = Object.AbsolutePosition, Object.AbsoluteSize, Mouse.X, Mouse.Y;
            local Range = APos + ASz;
            if not (APos.X-10 < X and Range.X+10 > X and APos.Y-10 < Y and Range.Y+10 > Y) then
                HoveredElement = nil;
                return;
            end;
            ApplyTooltipProperties(Connections.Properties);
            local Padding = Connections.Properties.Padding or Tooltip_Defaults.Padding;
            Tooltip.Text = Connections.Text;
            Tooltip.Size = UDim2.new(
                0,
                Tooltip.TextBounds.X + Padding,
                0,
                Tooltip.TextBounds.Y + Padding
            );
            local XPos, YPos = 1, 1;
            APos, ASz = Vector2.new(X + 20, Y + 20), Tooltip.AbsoluteSize;
            Range = APos + ASz;
            --X Check
            if (Range.X) > VeraniumSpace.AbsoluteSize.X then
                XPos = 0;
            end;
            --Y Check
            if (Range.Y) > VeraniumSpace.AbsoluteSize.Y then
                YPos = 0;
            end;

            Tooltip.Position = UDim2.new(
                0,
                X + (20*XPos),
                0,
                Y + (20*YPos)
            );
            Tooltip.AnchorPoint = Vector2.new(math.abs(XPos-1), math.abs(YPos-1));
        else
            Tooltip.Visible = false;
        end;
    end);

    local function LinkTooltip(self, Text, Properties)
        VCf_AssertIsVera(self);
        Text = Text or "";
        Properties = Properties or {};

        if Text == "" then
            local Connections = TooltipConnections[self];
            if Connections then
                Connections.MouseEnter:Disconnect();
                Connections.MouseLeave:Disconnect();
                Connections.MouseLeave = nil;
                Connections.MouseEnter = nil;
                TooltipConnections[self] = nil;
                Connections = nil;
                return false;
            else
                return false;
            end;
        end;
        local Connections = TooltipConnections[self];
        if Connections then
            local Fields = {};
            for Idx, Field in pairs(Properties)do
                Fields[Idx] = Field;
            end;
            Properties, Fields = Fields;

            Connections.Text = Text;
            Connections.Properties = Properties;

            return false;
        end;

        local Object = self:GetInstance();
        Connections = {};
        local Fields = {};
        for Idx, Field in pairs(Properties)do
            Fields[Idx] = Field;
        end;
        Properties, Fields = Fields;
        Connections.MouseEnter = Object.MouseEnter:Connect(function()
            HoveredElement = self;
        end);
        Connections.Text = Text;
        Connections.Properties = Properties;
        TooltipConnections[self] = Connections;
        return true;
    end;

    return TooltipConnections, Tooltip_Defaults, LinkTooltip, Tooltip;
end;

local TooltipConnections, Tooltip_Defaults, LinkTooltip;
local ToastNotification, NotificationDefaults, UpdateDefaults;

--VCf_Destructor Assignment
VCf_Destructor = function(self)
    --Tooltip Removal
    if TooltipConnections[self] then
        LinkTooltip(self);
    end;
    --Setup
    local Meta = GetMeta(self);
    if type(Meta) ~= "table" then
        return false;
    end;
    if Meta.___Instance then
        VIn_ParseD[Meta.___Instance] = nil;
    end;
    local Connections = Meta.___Connection;
    
    if type(Connections) == "table" then
        for Idx, Val in pairs(Connections) do
            Val:Disconnect();
            Connections[Idx] = nil;
        end;
    end;

    for Idx, Val in pairs(Meta) do
        if typeof(Val) == "Instance" or VCf_IsA(Val, "\2\0\0") then
            Val:Remove();
            Val:Destroy();
            Val = nil;
            Meta[Idx] = nil;
        end;
    end;

    Meta.___Fields = nil;
    Meta.___MetaData = nil;
    Meta.___Connection = nil;
    VIn_References[self] = nil;
    self, Meta, Connections = nil;

    return true;
end;
--VCf_IsA Assignment
VCf_IsA = function(Value, ClassName)
    local Instruction = ClassName:sub(1, 1);
    local Nullable = ClassName:sub(2, 2);
    ClassName = ClassName:sub(4, -1);
    if Instruction == "\0" then--VEnum IsA
        local EnumLibrary = VEn_Data[ClassName];
        if EnumLibrary[Value] ~= nil then
            return true;
        elseif VEn_References[Value] ~= nil then
            return VEn_References[Value].___SubLib == ClassName;
        elseif Nullable == "\1" and Value == nil then
            return true;
        else
            return false;
        end;
    elseif Instruction == "\1" then--VCv IsA
        local VCv = (VCv_Data[Value] ~= nil);
        if VCv then
            return true;
        elseif Nullable == "\1" then
            return (Value == nil);
        end;
    elseif Instruction == "\2" then--BaseInstance IsA
        local BaseInstance = (typeof(Value) == "Instance" or VIn_References[Value] ~= nil);
        if BaseInstance then
            return true;
        elseif Nullable == "\1" then
            return (Value == nil);
        end;
    elseif Instruction == "\3" then--type() IsA
        if Nullable == "\0" then
            return (type(Value) == ClassName);
        else
            return ((Value == nil) or (type(Value) == ClassName));
        end;
    elseif Instruction == "\4" then--typeof IsA
        if Nullable == "\0" then
            return (typeof(Value) == ClassName);
        elseif Nullable == "\1" then
            return ((Value == nil) or (typeof(Value) == ClassName));
        end;
    elseif Instruction == "\5" then
        if Nullable == "\0" then
            return (Value ~= nil);
        else
            return true;
        end;
    end;
end;

--Setting up Libraries that use Veranium's VIn.
TooltipConnections, Tooltip_Defaults, LinkTooltip = VLb_Tooltip();
VLb_Tooltip = {
    Defaults = Tooltip_Defaults,
    LinkTooltip = LinkTooltip
};

ToastNotification, NotificationDefaults, UpdateDefaults = VLb_NotificationService();
VLb_NotificationService = {
    Defaults = NotificationDefaults,
    ToastNotification = ToastNotification,
    UpdateDefaults = UpdateDefaults
};

--VIn_Methods Setup
VIn_Methods.Destructor = VCf_Destructor;
VIn_Methods.Destroy = VCf_Destructor;
VIn_Methods.Remove = VCf_Destructor;
VIn_Methods.GetInstance = GetInstance;
VIn_Methods.GetPInstance = GetPInstance;
VIn_Methods.LinkTooltip = LinkTooltip;

Veranium = {
    Create = VCn_Main,
    Enum = VLb_Enums,
    ModernColors = VLb_ModernColors,
    Defaults = VLb_Defaults,
    References = VIn_References,
    CVMath = VLb_CVMath,
    ColorVariant = VLb_ColorVariants,
    TweenService = VLb_CTweenService,
    TooltipService = VLb_Tooltip,
    NotificationService = VLb_NotificationService,
    Core = {
        Prefix = _PREFIX,
        InstancesData = VIn_Data,
        CreateInstance = VIn_CreateInstance,
        CreateClass = VIn_CreateClass,
        VeraniumSpace = VeraniumSpace
    }
};
return Veranium;
