# lovepad
Virtual gamepad for love2d

[![Build Status](https://travis-ci.org/DeybisMelendez/lovepad.svg?branch=master)](https://travis-ci.org/DeybisMelendez/lovepad)
[![License](http://img.shields.io/badge/License-MIT-brightgreen.svg)](LICENSE)

## How to use

Download `lovepad.lua` and write in your `main.lua`:
```lua
lovepad = require "lovepad"
```

Note: Read or test `main.lua` as example.

## Creating a button

```lua
lovepad:new{
text = "name",
x = 20,
y = 50,
radius = 50,
-- ...
}
```
Note: The button is instanced in `lovepad.buttons`.

## Creating a simple gamepad

```lua
lovepad:setGamePad()
```

## Screenshot, read main.lua

![screenshot](https://raw.githubusercontent.com/DeybisMelendez/lovepad/master/screenshot.png)

## Button Properties

| Property | Type   |
|-----------|:------:|
|     x     | number |
|     y     | number |
|   radius  | number |
|    text   | string |
|   font    | Font   |
|fontColor  | table {r, g, b, a} |
|normalColor| table {r, g, b, a} |
|pressedColor| table {r, g, b, a} |
|    mode     | string ("fill" or "line") |

## Functions

```lua
lovepad:draw()
```
Draws the buttons.

```lua
lovepad:update()
```
Updates the buttons.

```lua
lovepad:setGamePad([radius, dirButton, abButton, xyButton, font])
```
Create a simple gamepad.

`radius` [number] sets the button radius.
`dirButton` [boolean] create directional buttons.
`abButton` [boolean] create additional buttons (a, b)
`xyButton` [boolean] create additional buttons (x, y).
`font` [Font] sets the font to text buttons.

```lua
lovepad:isDown(id)
```
Returns `true` if the button `id` (text value) is pressed.

```lua
lovepad:isPressed(id)
```
Returns `true` if the button `id` (text value) is pressed once.

```lua
lovepad:isReleased(id)
```
Returns `true` if the button `id` (text value) is released.

```lua
lovepad:remove(id)
```
Removes the button `id` (text value)
