# game-tools.scene

Scenes for Lua games.
## How to use

### Require

```lua
scene = require "game-tools.scene"
```

### Create scenes

```lua
-- myScene.lua

local myScene = {}

function myScene.foo()
    -- code
end

return myScene

-- myOtherScene.lua
local myOtherScene = {}

function myOtherScene.foo()
    -- code
end

return myOtherScene
```

### Set the scene

```lua
-- main.lua
scene = require "game-tools.scene"
scene:setScene("myScene") -- Works with require()
scene.foo()
scene:setScene("myOtherScene")
scene.foo()
```

### Working with Love2D

```lua
-- myScene.lua
local myScene = {}
function myScene.draw()
    -- code
end
function myScene.update(dt)
    -- code
end
return myScene

-- main.lua
scene = require "game-tools.scene" -- with global you can call scene functions from your scenes
scene:setScene("myScene")
function love.draw()
    scene.draw()
end
function love.update(dt)
    scene.update(dt)
end
```

### Reload scene

```lua
scene:reload()
```

### Other methods

#### myScene.onLoad()

This method is called once when the scene is loaded.

#### myScene.onExit()

This method is called once when the scene is exited.
