local scene = {}
scene.state = {}
function scene:exit()
    if self.state.onExit then self.state:onExit() end
end

function scene:load()
    if self.state.onLoad then self.state:onLoad() end
end

function scene:setScene(s)
    self:exit()
    self.state = nil
    collectgarbage("collect")
    self.state = require(s)
    self.lib = s
    self:load()
end

function scene:reload()
    self:exit()
    self.state = nil
    collectgarbage("collect")
    self.state = require(self.lib)
    self:load()
end
return scene
