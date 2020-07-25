local color = {_VERSION = "v0.1.0", _TYPE = "module", _NAME = "vector"}
local newColorMt = {
    __tostring = function(s)
        return "color(" .. s.r .. ", " .. s.g .. ", " .. s.b .. ", " .. s.a ..")"
    end,
    __add = function(a, b)
        if type(a) == "number" then return color(a + b.r, a + b.g, a + b.b, a + b.a)
        elseif type(b) == "number" then return color(a.r + b, a.g + b, a.b + b, a.a + b) end
        --assert(a.r and b.r and a.g and b.g and a.a and b.a,"error adding color")
        return color(a.r + b.r, a.g + b.g, a.b + b.b, a.a + b.a)
    end,
    __sub = function(a, b)
        if type(a) == "number" then return color(a - b.r, a - b.g, a - b.b, a - b.a)
        elseif type(b) == "number" then return color(a.r - b, a.g - b, a.b - b, a.a - b) end
        return color(a.r - b.r, a.g - b.g, a.b - b.b, a.a - b.a)
    end,
    __mul = function(a, b)
        if type(a) == "number" then return color(a * b.r, a * b.g, a * b.b, a * b.a)
        elseif type(b) == "number" then return color(a.r * b, a.g * b, a.b * b, a.a * b) end
        return color(a.r * b.r, a.g * b.g, a.b * b.b, a.a * b.a)
    end,
    __div = function(a, b)
        if type(a) == "number" then return color(a / b.r, a / b.g, a / b.b, a / b.a)
        elseif type(b) == "number" then return color(a.r / b, a.g / b, a.b / b, a.a / b) end
        return color(a.r / b.r, a.g / b.g, a.b / b.b, a.a / b.a)
    end,
    __unm = function(t)
        return color(-t.r,-t.g,-t.b,-t.a)
    end,
    __eq = function(a, b)
        return a.r == b.r and a.g == b.g and a.b == b.b and a.a == b.a
    end,
    __pow = function(col, value)
        return color(col.r ^ value, col.g ^ value, col.b ^ value, col.a ^ value)
    end,
    __concat = function(a, b)
        if type(a) == "string" then return a .. tostring(b) end
        if type(b) == "string" then return tostring(a) .. b end
        return tostring(a) .. tostring(b)
    end
}

local function clamp(n, low, high) return math.min(math.max(n, low), high) end

local mt = {
    __call = function(_, r,g,b,a)
        local col = {r = r or 1.0, g = g or 1.0, b = b or 1.0, a = a or 1.0}
        col.r = clamp(col.r, 0.0,1.0)
        col.g = clamp(col.g, 0.0,1.0)
        col.b = clamp(col.b, 0.0,1.0)
        col.a = clamp(col.a, 0.0,1.0)
        setmetatable(col, newColorMt)
        return col
    end
}

function color.grayscale(c)
    -- Weighted method or luminosity method
    local r,g,b,a = c.r*.3,c.g*.59,c.b*.11,c.a
    local gray = r+g+b
    return color(gray,gray,gray,a)
end

function color.unpack(c)
    return c.r,c.g,c.b,c.a
end

function color.hexcode(str)
    if #str == 6 then
        local r,g,b = tonumber(str:sub(1,2),16), tonumber(str:sub(3,4),16), tonumber(str:sub(5,6),16)
        return color(r,g,b)
    elseif #str == 8 then
        local r,g,b = tonumber(str:sub(1,2),16), tonumber(str:sub(3,4),16), tonumber(str:sub(5,6),16)
        local a = tonumber(str:sub(7,8),16)
        return color(r,g,b,a)
    end
end

function color.inverted(c)
    return color(1-c.r,1-c.g,1-c.b,c.a)
end

function color.blend(c1,c2)
    local r,g,b,a = c1.r+c2.r, c1.g+c2.g,c1.b+c2.b,c1.a+c2.a
    return color(r/2,g/2,b/2,a/2)
end

setmetatable(color, mt)
return color
