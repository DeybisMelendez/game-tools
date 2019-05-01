local vector = {}
local vecMt = { -- Metatable of vector value
    __tostring = function(self)
        return self:string()
    end,
    __add = function(a, b)
        vector.checkError("math","add: ", a) vector.checkError("math","add: ", b)
        if type(a) == "number" then return vector(a + b.x, a + b.y) end
        if type(b) == "number" then return vector(a.x + b, a.y + b) end
        vector.checkError("type","add: ", a) vector.checkError("type","add: ", b)
        return vector(a.x + b.x, a.y + b.y)
    end,
    __sub = function(a, b)
        vector.checkError("math","sub: ", a) vector.checkError("math","sub: ", b)
        if type(a) == "number" then return vector(a - b.x, a - b.y) end
        if type(b) == "number" then return vector(a.x - b, a.y - b) end
        vector.checkError("type","sub: ", a) vector.checkError("type","sub: ", b)
        return vector(a.x - b.x, a.y - b.y)
    end,
    __mul = function(a, b)
        vector.checkError("math","mul: ", a) vector.checkError("math","mul: ", b)
        if type(a) == "number" then return vector(a * b.x, a * b.y) end
        if type(b) == "number" then return vector(a.x * b, a.y * b) end
        vector.checkError("type","mul: ", a) vector.checkError("type","mul: ", b)
        return vector(a.x * b.x, a.y * b.y)
    end,
    __div = function(a, b)
        vector.checkError("math","div: ", a) vector.checkError("math","div: ", b)
        if type(a) == "number" then return vector(a / b.x, a / b.y) end
        if type(b) == "number" then return vector(a.x / b, a.y / b) end
        vector.checkError("type","div: ", a) vector.checkError("type","div: ", b)
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
            vector.checkError("type","distance_to: ", vector)
            local x1, y1 = self.x, self.y
            local x2, y2 = vector.x, vector.y
            return ((x2 - x1)^2 + (y2 - y1)^2)^0.5
        end
        function vec:dot(vector)
            vector.checkError("type","dot: ", vector)
            return self.x * vector.x + self.y * vector.y
        end
        function vec:abs()
            return vector(math.abs(self.x), math.abs(self.y))
        end
        function vec:round(numDecimalPlaces)
            numDecimalPlaces = numDecimalPlaces or 0
            vector.checkError("math", "round: ", numDecimalPlaces)
            local mult = 10^(numDecimalPlaces)
            local x, y = 0, 0
            if self.x >= 0 then x = math.floor(self.x * mult + 0.5) / mult
            else x = math.ceil(self.x * mult - 0.5) / mult end
            if self.y >= 0 then y = math.floor(self.y * mult + 0.5) / mult
            else y = math.ceil(self.y * mult - 0.5) / mult end
            return vector(x, y)
        end
        setmetatable(vec, vecMt)
        return vec
    end
}

-- Error control

function vector.checkError(case, func, a)
    if case == "math" then
        assert(type(a) == "table" or type(a) == "number", func .. "Attempt to perform arithmetic on ".. tostring(a) .." (a ".. type(a) .." value)")
    elseif case == "type" then
        assert(vecMt == getmetatable(a), func .. tostring(a) .. " is not a vector (a " .. type(a) .. " value)")
    end
end

setmetatable(vector, mt)

-- CONSTANTS

vector.DOWN = vector(0, 1)
vector.UP = vector(0, -1)
vector.LEFT = vector(-1, 0)
vector.RIGHT = vector(1, 0)
vector.ZERO = vector(0, 0)
vector.ONE = vector(1, 1)

return vector
