local vector = {}
local vecMt = { -- Metatable of vector value
    __tostring = function(self)
        return self:string()
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
    end
}
local mt = { -- Metatable of vector
    __call = function(self, x, y)
        local vec = {x = x, y = y}
        function vec:string()
            return "vector(" .. self.x .. ", " .. self.y ..")"
        end
        function vec:angle() -- Radians
            return math.atan2(self.y, self.x)
        end
        function vec:normalized()
            local m = (self.x^2 + self.y^2)^0.5 --magnitude
            return vector(self.x / m, self.y / m)
        end
        function vec:distanceSquaredTo(v)
            local x1, y1 = self.x, self.y
            local x2, y2 = v.x, v.y
            return (x2 - x1)^2 + (y2 - y1)^2
        end
        function vec:distanceTo(v)
            return self:distanceSquaredTo(v)^0.5
        end
        function vec:distanceSquared()
            return self.x^2 + self.y^2
        end
        function vec:distance()
            return (self:distanceSquared())^0.5
        end
        function vec:dot(v)
            return self.x * v.x + self.y * v.y
        end
        function vec:perpDot(v)
            return self.x * v.x - self.y * v.y
        end
        function vec:abs()
            return vector(math.abs(self.x), math.abs(self.y))
        end
        function vec:round(dec)
            dec = dec or 0
            local mult = 10^(dec)
            local x, y = 0, 0
            if self.x >= 0 then x = math.floor(self.x * mult + 0.5) / mult
            else x = math.ceil(self.x * mult - 0.5) / mult end
            if self.y >= 0 then y = math.floor(self.y * mult + 0.5) / mult
            else y = math.ceil(self.y * mult - 0.5) / mult end
            return vector(x, y)
        end
        function vec:toPolar(angle, len)
            len = len or 1
            return vector(math.cos(angle) * len, math.sin(angle) * len)
        end
        function vec:rotated(phi)
            return vector(math.cos(phi) * self.x - math.sin(phi) * self.y, math.sin(phi) * self.x + math.cos(phi) * self.y)
        end
        function vec:cross(v)
            return vector(self.x * v.y - self.y * v.x)
        end
        function vec:perpendicular()
            return vector(-self.y, self.x)
        end
        function vec:lerpTo(v, t)
            local i = 1 - t
            return vector(self.x * i + v.x * t, self.y * i + v.y * t)
        end
        function vec:unpack()
            return self.x, self.y
        end
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
