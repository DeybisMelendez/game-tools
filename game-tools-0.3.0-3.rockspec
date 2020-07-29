package = "game-tools"
version = "0.3.0-3"
source = {
   url = "git+https://github.com/DeybisMelendez/game-tools"
}
description = {
   summary = "Game tools for Love2D",
   detailed = [[Include:

- Vector 2D.
- Lovepad - Create buttons for multitouch devices.
- Texturelovepad - Create texture buttons for multitouch devices.
- Color - Color math and utilities]],
   homepage = "https://github.com/DeybisMelendez/game-tools",
   license = "MIT"
}
dependencies = {}
build = {
   type = "builtin",
   modules = {
       ["game-tools.vector"] = "vector.lua",
       ["game-tools.lovepad"] = "lovepad.lua",
       ["game-tools.texturelovepad"] = "texturelovepad.lua",
       ["game-tools.color"] = "color.lua"
   }
}
