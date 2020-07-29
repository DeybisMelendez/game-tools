# lovepad

Virtual gamepad texture for love2d

## How to use

### Require

```lua
local texturelovepad = require "game-tools.texturelovepad"
```


## Creating a button

```lua
texturelovepad:new{
id = "name",
x = 20,
y = 50,
width = 128,
height = 72,
buttonPressed = love.graphics.newImage("buttonPressed.png"),
buttonNormal = love.graphics.newImage("buttonNormal.png")
-- ...
}
```
Note: The button is instanced in `texturelovepad.buttons`.

## Button Properties

| Property | Type   |
|-----------|:------:|
|    id   | string |
|     x     | number |
|     y     | number |
|   width  | number |
|   height  | number |
|    buttonPressed   | love.graphics.newImage |
|    buttonNormal   | love.graphics.newImage |
|   sx  | number |
|   sy  | number |
|   r  | number |
|   ox  | number |
|   oy  | number |
|   kx  | number |
|   ky  | number |

## Functions

```lua
texturelovepad:draw()
```
Draws the buttons.

```lua
texturelovepad:update()
```
Updates the buttons.

```lua
texturelovepad:isDown(id)
```
Returns `true` if the button `id` (text value) is pressed.

```lua
texturelovepad:isPressed(id)
```
Returns `true` if the button `id` (text value) is pressed once.

```lua
texturelovepad:isReleased(id)
```
Returns `true` if the button `id` (text value) is released.

```lua
texturelovepad:remove(id)
```
Removes the button `id` (text value)
