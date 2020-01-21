package = "game-tools"
version = "0.1.0-1"
source = {
   url = "git+https://github.com/DeybisMelendez/game-tools"
}
description = {
   homepage = "https://github.com/DeybisMelendez/game-tools",
   license = "MIT"
}
dependencies = {}
build = {
   type = "builtin",
   modules = {
       ["game-tools.vector"] = "vector.lua"
   }
}
