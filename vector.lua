local vector = {}
local vecMt = { -- Metatable of vector value
    __tostring = function(self)
        return self:string()
    end,
    __add = function(a, b)
        return vector(a.x + b.x, a.y + b.y)
    end,
    __sub = function(a, b)
        return vector(a.x - b.x, a.y - b.y)
    end,
    __mul = function(a, b)
        return vector(a.x * b.x, a.y * b.y)
    end,
    __div = function(a, b)
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
        function vec:getAngle() -- Radians
            return math.atan2(self.y, self.x)
        end
        function vec:normalized()
            local m = (self.x^2 + self.y^2)^0.5 --magnitude
            return vector(self.x / m, self.y / m)
        end
        function vec:distance_to(vector)
            local x1, y1 = self.x, self.y
            local x2, y2 = vector.x, vector.y
            return ((x2 - x1)^2 + (y2 - y1)^2)^0.5
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
