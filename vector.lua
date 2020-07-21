local vector = {_VERSION = "v0.8.0", _TYPE = "module", _NAME = "vector"}
local newVectorMt = {
    __tostring = function(s)
        return "vector(" .. s.x .. ", " .. s.y ..")"
    end,
    __add = function(a, b)
        if type(a) == "number" then return vector(a + b.x, a + b.y)
        elseif type(b) == "number" then return vector(a.x + b, a.y + b) end
        return vector(a.x + b.x, a.y + b.y)
    end,
    __sub = function(a, b)
        if type(a) == "number" then return vector(a - b.x, a - b.y)
        elseif type(b) == "number" then return vector(a.x - b, a.y - b) end
        return vector(a.x - b.x, a.y - b.y)
    end,
    __mul = function(a, b)
        if type(a) == "number" then return vector(a * b.x, a * b.y)
        elseif type(b) == "number" then return vector(a.x * b, a.y * b) end
        return vector(a.x * b.x, a.y * b.y)
    end,
    __div = function(a, b)
        if type(a) == "number" then return vector(a / b.x, a / b.y)
        elseif type(b) == "number" then return vector(a.x / b, a.y / b) end
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
        if type(a) == "string" then return a .. tostring(b) end
        if type(b) == "string" then return tostring(a) .. b end
        return tostring(a) .. tostring(b)
    end
}
local mt = {
    __call = function(_, x, y)
        local vec = {x = x or 0, y = y or 0}
        setmetatable(vec, newVectorMt)
        return vec
    end
}

function vector.angle(v)
    return math.atan2(v.y, v.x)
end

function vector.normalized(v)
    local m = (v.x^2 + v.y^2)^0.5 --magnitude
    if v.x/m ~= v.x/m then v.x = 0 else v.x = v.x/m end
    if v.y/m ~= v.y/m then v.y = 0 else v.y = v.y/m end
end

function vector.round(v, dec)
    dec = dec or 0
    local mult = 10^(dec)
    local nx, ny
    if v.x >= 0 then nx = math.floor(v.x * mult + 0.5) / mult
    else nx = math.ceil(v.x * mult - 0.5) / mult end
    if v.y >= 0 then ny = math.floor(v.y * mult + 0.5) / mult
    else ny = math.ceil(v.y * mult - 0.5) / mult end
    v.x, v.y = nx, ny
    return v
end

function vector.distanceSquaredTo(s, v)
    local x1, y1 = s.x, s.y
    local x2, y2 = v.x, v.y
    return (x2 - x1)^2 + (y2 - y1)^2
end

function vector.distanceTo(s, v)
    return vector.distanceSquaredTo(s, v)^0.5
end

function vector.distanceSquared(v)
    return v.x^2 + v.y^2
end

function vector.distance(v)
    return (vector.distanceSquared(v))^0.5
end

function vector.dot(s, v)
    return s.x * v.x + s.y * v.y
end

function vector.perpDot(s, v)
    return s.x * v.x - s.y * v.y
end

function vector.abs(v)
    v.x, v.y = math.abs(v.x), math.abs(v.y)
    return v
end

function vector.toPolar(v, angle, len)
    len = len or 1
    v.x, v.y = math.cos(angle) * len, math.sin(angle) * len
    return v
end

function vector.rotated(v, phi)
    v.x = math.cos(phi) * v.x - math.sin(phi) * v.y
    v.y = math.sin(phi) * v.x + math.cos(phi) * v.y
    return v
end

function vector.cross(s, v)
    return s.x * v.y - s.y * v.x
end

function vector.perpendicular(v)
    local px, py = v.x, v.y
    v.x, v.y = -py, px
    return v
end

function vector.lerp(s, v, t)
    local i = 1 - t
    s.x, s.y = s.x * i + v.x * t, s.y * i + v.y * t
    return s
end

function vector.unpack(v)
    return v.x, v.y
end

setmetatable(vector, mt)
vector.DOWN = vector(0, 1)
vector.UP = vector(0, -1)
vector.LEFT = vector(-1, 0)
vector.RIGHT = vector(1, 0)
vector.ZERO = vector(0, 0)
vector.ONE = vector(1, 1)
return vector
