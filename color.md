# game-tools.color

Color tool for Lua.
## How to use

### Require

```lua
local color = require "game-tools.color"
```

### Create a color

```lua
local myColor = color(r,g,b,a) -- values from 0 to 1
```

## Properties

<table>
  <tr>
    <td>float (0-1)</td>
    <td>r</td>
  </tr>
  <tr>
    <td>float (0-1)</td>
    <td>g</td>
  </tr>
  <tr>
    <td>float (0-1)</td>
    <td>b</td>
  </tr>
  <tr>
    <td>float (0-1)</td>
    <td>a</td>
  </tr>
</table>

## Create a color

Example:
```lua
local color = require"color"

local red = color(1,0,0) --r,g,b from 0 to 1
local blue = color(0,1,0)
local yellow = red + blue -- blend colors
local aqua = blue + color(0,0,1) -- blue+green
local aquaDarken = aqua * 0.5
print(red) -- prints -> color(1, 0, 0, 1)
local pink = red
pink.g, pink.b = 0.5,0.5
local chocolate = color.hexcode("d2691e")
local purple = color.rgb(128,0,128) --r,g,b from 0 to 255

love.graphics.setBackgroundColor( color.unpack(pink) )
```

## Functions

```lua
color.grayscale(yourColor) -- color()
```
Returns the color's grayscale representation using Weighted method or luminosity method.

```lua
color.unpack(yourColor) -- color()
```
Returns r,g,b,a values of color.

```lua
color.hexcode(yourColor) -- string
```
Returns the color's hexcode, example: "ff0000" (rgb) or "ff000011" (rgba)

```lua
color.rgb(r,g,b) -- values from 0 to 255
```
Returns the color from decimal color code.

```lua
color.rgba(r,g,b,a) -- values from 0 to 255
```
Returns the color from decimal color code with alpha.

## Color Math

### Addition

```lua
this = color(ra,ga,ba) + color(rb,gb,bb) --> vector(ra+rb, ga+gb, ba+bb)
this = color(r,g,b) + a --> vector(r+a, g+a, b+a)
```

### Substraction

```lua
this = color(ra,ga,ba) - color(rb,gb,bb) --> vector(ra-rb, ga-gb, ba-bb)
this = color(r,g,b) - a --> vector(r-a, g-a, b-a)
```

### Multiplication

```lua
this = color(ra,ga,ba) + color(rb,gb,bb) --> vector(ra*rb, ga*gb, ba*bb)
this = color(r,g,b) * a --> vector(r*a, g*a, b*a)
```

### Division

```lua
this = color(ra,ga,ba) / color(rb,gb,bb) --> vector(ra/rb, ga/gb, ba/bb)
this = color(r,g,b) / a --> vector(r/a, g/a, b/a)
```
### Exponetiation

```lua
this = color(r,g,b) ^ a --> vector(r^a, g^a, b^a)
```

### Concatenation

```lua
this = color() .. color() --> "color(1, 1, 1, 1)color(1, 1, 1, 1)"
```
