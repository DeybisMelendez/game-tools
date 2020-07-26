local texturelovepad = {_VERSION = "v0.1.0", _TYPE= "module", _NAME = "texturelovepad", buttons = {}}
local mt = {x = 0, y = 0, width=64, height=64, r=0, sx=1, sy=1, ox=0, oy=0, kx=0, ky=0,
id = "button",isDown = false, _lastIsDown = false, texturePressed=false, textureNormal=false}
function texturelovepad:new(o)
    o = o or {}
    setmetatable(o, {__index = mt})
    self.buttons[o.id] = o
end

function texturelovepad:draw()
    for _, button in pairs(self.buttons) do
        if button.isDown then
            if button.texturePressed then
                love.graphics.draw(button.texturePressed,
                        button.x,
                        button.y,
                        button.r,
                        button.sx,
                        button.sy,
                        button.ox,
                        button.oy,
                        button.kx,
                        button.ky)
            end
        else
            if button.textureNormal then
                love.graphics.draw(button.textureNormal,
                        button.x,
                        button.y,
                        button.r,
                        button.sx,
                        button.sy,
                        button.ox,
                        button.oy,
                        button.kx,
                        button.ky)
            end
        end
    end
end

function texturelovepad:update()
    local touches = love.touch.getTouches()
    for _, button in pairs(self.buttons) do
        button._lastIsDown = button.isDown
        button.isDown = false
        for _, touch in ipairs(touches) do
            local xt, yt = love.touch.getPosition(touch)
            if xt > button.x and xt < button.x + button.width and
                    yt > button.y and yt < button.y + button.height then
                button.isDown = true
            end
        end
    end
end

function texturelovepad:isDown(id)
    return self.buttons[id].isDown
end

function texturelovepad:isPressed(id)
    return self.buttons[id].isDown and not self.buttons[id]._lastIsDown
end

function texturelovepad:isReleased(id)
    return not self.buttons[id].isDown and self.buttons[id]._lastIsDown
end

function texturelovepad:remove(id)
    table.remove(self.buttons, id)
end

-- function texturelovepad:setGamePad(radius, dir, ab, xy, font)
--     local width = love.graphics.getWidth()
--     local height = love.graphics.getHeight()
--     radius = radius or width/24
--     dir = dir or true
--     ab = ab or true
--     xy = xy or false
--     font = font or love.graphics.getFont()
--     if dir then
--         self:new{
--             text = 'Down',
--             radius = radius,
--             x = radius * 3,
--             y = height - radius * 1.25,
--             normalColor = {0.8,0.8,0.8,0.5},
--             pressedColor = {0.4,0.4,0.4,0.5},
--             font = font
--         }
--         self:new{
--             text = 'Up',
--             radius = radius,
--             x = radius * 3,
--             y = height - radius * 4.5,
--             normalColor = {0.8,0.8,0.8,0.5},
--             pressedColor = {0.4,0.4,0.4,0.5},
--             font = font
--         }
--         self:new{
--             text = 'Left',
--             radius = radius,
--             x = radius * 1.25,
--             y = height - radius * 2.75,
--             normalColor = {0.8,0.8,0.8,0.5},
--             pressedColor = {0.4,0.4,0.4,0.5},
--             font = font
--         }
--         self:new{
--             text = 'Right',
--             radius = radius,
--             x = radius * 4.75,
--             y = height - radius * 2.75,
--             normalColor = {0.8,0.8,0.8,0.5},
--             pressedColor = {0.4,0.4,0.4,0.5},
--             font = font
--         }
--     end
--     if ab then
--         self:new{
--             text = 'A',
--             radius = radius,
--             x = width - radius * 1.25,
--             y = height - radius * 2.75,
--             normalColor = {0.9,0.1,0.1,0.5},
--             pressedColor = {0.4,0,0,0.5},
--             font = font
--         }
--         self:new{
--             text = 'B',
--             radius = radius,
--             x = width - radius * 3,
--             y = height - radius * 1.25,
--             normalColor = {0,0.9,0,0.5},
--             pressedColor = {0,0.4,0,0.5},
--             font = font
--         }
--     end
--     if xy then
--         self:new{
--             text = 'X',
--             radius = radius,
--             x = width - radius * 3,
--             y = height - radius * 4.5,
--             normalColor = {0.9,0.9,0,0.5},
--             pressedColor = {0.4,0.4,0,0.5},
--             font = font
--         }
--         self:new{
--             text = 'Y',
--             radius = radius,
--             x = width - radius * 4.75,
--             y = height - radius * 2.75,
--             normalColor = {0,0,0.9,0.5},
--             pressedColor = {0,0,0.4,0.5},
--             font = font
--         }
--     end
-- end
return texturelovepad
