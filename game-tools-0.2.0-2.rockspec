package = "game-tools"
version = "0.2.0-2"
source = {
   url = "git+https://github.com/DeybisMelendez/game-tools"
}
description = {
   summary = "Game tools for Love2D",
   detailed = [[Include:

- Vector 2D.
- Lovepad - A gamepad for multitouch devices.]],
   homepage = "https://github.com/DeybisMelendez/game-tools",
   license = "MIT"
}
dependencies = {}
build = {
   type = "builtin",
   modules = {
       ["game-tools.vector"] = "vector.lua",
       ["game-tools.lovepad"] = "lovepad.lua"
   }
}
