local gmt, rmt = getrawmetatable(game), getrawmetatable(Ray.new(Vector3.new(), Vector3.new()))
setreadonly(gmt, false) setreadonly(rmt, false)
local goldin = gmt.__index
local goldnc = gmt.__namecall
local roldin = rmt.__index
local rayn;

local players = game:GetService('Players')
local camera = workspace.CurrentCamera
local mouse = players.LocalPlayer:GetMouse()
local log = {
	hit = true,
	target = true,
	x = true,
	y = true
}

local function isNearPlayer(pos)
	if not players.LocalPlayer.Character or not players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then return false end
	return (players.LocalPlayer.Character.HumanoidRootPart.Position - pos).magnitude < 10
end

local function getClosestPlayer()
    local plr, vect;
    local pdist, mdist = math.huge, math.huge
    for i,v in pairs(players:GetPlayers())do
        if v ~= players.LocalPlayer and (v.Team ~= players.LocalPlayer.Team or v.Team == nil) and v.Character and v.Character:FindFirstChild('HumanoidRootPart') then
            local pPos = v.Character.HumanoidRootPart.Position
            local vector, visible = workspace.CurrentCamera:WorldToScreenPoint(pPos)
            local mDistance = (Vector2.new(goldin(mouse, 'X'), goldin(mouse, 'Y')) - Vector2.new(vector.X, vector.Y)).magnitude
            if visible and vector.Z > 0 and mDistance < mdist then
                plr = v
                vect = vector
                mdist = mDistance
            end
        end
    end
    return {plr, vect}
end

local function createWhitelist()
	local succ, data = pcall(getClosestPlayer)
	if not succ or not data[1] then return ret end

	local whitelist = {}
	for i,v in pairs(data[1].Character:GetDescendants())do
		if v:IsA('BasePart') then
			table.insert(whitelist, v)
		end
	end
	return whitelist
end

local raycasting = {FindPartOnRay = true, FindPartOnRayWithIgnoreList = true, FindPartOnRayWithWhitelist = true}
gmt.__namecall = function(self, ...)
	local method = getnamecallmethod()
	local args = {...}
	if raycasting[method] and getfenv(2).script ~= script and getfenv(2).script.Name ~= 'Popper' then
		local target = mouse.Target
		if target then return target, mouse.Hit.p, target.Material end
	end
	return goldnc(self, ...)
end

gmt.__index = function(self, key)
	local ret = goldin(self, key)
	if (self == mouse or goldin(self, 'Parent') == nil) and log[key:lower()] then 
		local succ, data = pcall(getClosestPlayer)
		if not succ or not data[1] then return ret end

		local closestPlayer, vector = unpack(data)
		local head = closestPlayer.Character.Head
		local hroot = closestPlayer.Character.HumanoidRootPart
		if key:lower() == 'target' then 
			return head
		elseif key:lower() == 'hit' then 
			return head.CFrame
		else
			return vector[key:lower()]
		end
	end
	return ret
end

rmt.__index = function(self, key)
	local origin = roldin(self, 'Origin')
	local direction = (mouse.Hit.p - origin).unit * 999
	if key:lower() == 'unit' then
		return roldin(rayn(origin, direction), 'Unit')
	elseif key:lower() == 'direction' then
		return direction
	end
	return roldin(self, key)
end

rayn = hookfunction(Ray.new, function(org, dir)
	if (isNearPlayer(org) and getfenv(2).script.Name ~= 'CameraModule') or getfenv(2).script == script then
		return rayn(org, (mouse.Hit.p - org).unit * 999)
	end
	return rayn(org, dir)
end)
