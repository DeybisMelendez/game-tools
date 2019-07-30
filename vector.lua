--[[
Lua vector
Developer: Deybis Melendez
Web: https://github.com/DeybisMelendez/lua-vector

MIT License

Copyright (c) 2019 Deybis Melendez

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]

local vector = {_VERSION = "v0.7.0", _TYPE = "module", _NAME = "vector"}
local vecMt = {
    __tostring = function(s)
        return "vector(" .. s.x .. ", " .. s.y ..")"
    end,
    __add = function(a, b)
        if type(a) == "number" then return vector(a + b.x, a + b.y) end
        if type(b) == "number" then return vector(a.x + b, a.y + b) end
        return vector(a.x + b.x, a.y + b.y)
    end,
    __sub = function(a, b)
        if type(a) == "number" then return vector(a - b.x, a - b.y) end
        if type(b) == "number" then return vector(a.x - b, a.y - b) end
        return vector(a.x - b.x, a.y - b.y)
    end,
    __mul = function(a, b)
        if type(a) == "number" then return vector(a * b.x, a * b.y) end
        if type(b) == "number" then return vector(a.x * b, a.y * b) end
        return vector(a.x * b.x, a.y * b.y)
    end,
    __div = function(a, b)
        if type(a) == "number" then return vector(a / b.x, a / b.y) end
        if type(b) == "number" then return vector(a.x / b, a.y / b) end
        return vector(a.x / b.x, a.y / b.y)
    end,
    __unm = function(t)
        return vector(-t.x, -t.y)
    end,
    __eq = function(a, b)
        return a.x == b.x and a.y == b.y
    end,
    __pow = function(vec, value)
        return vector(vec.x ^ value, vec.y ^ value)
    end,
    __concat = function(a, b)
        if type(a) == "string" then return a .. b:string() end
        if type(b) == "string" then return a:string() .. b end
        return a:string() .. b:string()
    end,
	angle = function(s) return math.atan2(s.y, s.x) end,
	normalized = function(s)
		local m = (s.x^2 + s.y^2)^0.5 --magnitude
		if s.x/m ~= s.x/m then s.x = 0 else s.x = s.x/m end
		if s.y/m ~= s.y/m then s.y = 0 else s.y = s.y/m end
	end,
	distanceSquaredTo = function(s, v)
		local x1, y1 = s.x, s.y
		local x2, y2 = v.x, v.y
		return (x2 - x1)^2 + (y2 - y1)^2
	end,
	distanceTo = function(s, v)
		return s:distanceSquaredTo(v)^0.5
	end,
	distanceSquared = function(s)
		return s.x^2 + s.y^2
	end,
	distance = function(s)
		return (s:distanceSquared())^0.5
	end,
	dot = function(s, v)
		return s.x * v.x + s.y * v.y
	end,
	perpDot = function(s, v)
		return s.x * v.x - s.y * v.y
	end,
	abs = function(s)
		s.x, s.y = math.abs(s.x), math.abs(s.y)
	end,
	round = function(s, dec)
		dec = dec or 0
		local mult = 10^(dec)
		local nx, ny
		if s.x >= 0 then nx = math.floor(s.x * mult + 0.5) / mult
		else nx = math.ceil(s.x * mult - 0.5) / mult end
		if s.y >= 0 then ny = math.floor(s.y * mult + 0.5) / mult
		else ny = math.ceil(s.y * mult - 0.5) / mult end
		s.x, s.y = nx, ny
	end,
	toPolar = function(s, angle, len)
		len = len or 1
		s.x, s.y = math.cos(angle) * len, math.sin(angle) * len
	end,
	rotated = function(s, phi)
		s.x = math.cos(phi) * s.x - math.sin(phi) * s.y
		s.y = math.sin(phi) * s.x + math.cos(phi) * s.y
	end,
	cross = function(s, v)
		return s.x * v.y - s.y * v.x
	end,
	perpendicular = function(s)
		local px, py = s.x, s.y
		s.x, s.y = -py, px
	end,
	lerpTo = function(s, v, t)
		local i = 1 - t
		s.x, s.y = s.x * i + v.x * t, s.y * i + v.y * t
	end,
	unpack = function(s)
		return s.x, s.y
	end
}
vecMt.__index = vecMt
local mt = { -- Metatable of vector
    __call = function(_, x, y)
        local vec = {x = x or 0, y = y or 0}
		--vecMt.__index = vecMt
        setmetatable(vec, vecMt)
        return vec
    end
}

setmetatable(vector, mt)

-- CONSTANTS

vector.DOWN = vector(0, 1)
vector.UP = vector(0, -1)
vector.LEFT = vector(-1, 0)
vector.RIGHT = vector(1, 0)
vector.ZERO = vector(0, 0)
vector.ONE = vector(1, 1)

return vector
