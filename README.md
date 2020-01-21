# lua-vector

Vector 2d for Love2d and Lua. Inspired on Vector2() of Godot Engine.

[![Build Status](https://travis-ci.org/DeybisMelendez/lua-vector.svg?branch=master)](https://travis-ci.org/DeybisMelendez/lua-vector)
[![License](http://img.shields.io/badge/License-MIT-brightgreen.svg)](LICENSE)

## How to use

Download vector.lua and write on main.lua

```lua
vector = require "vector"
```

## Propierties

<table>
  <tr>
    <td>number</td>
    <td>x</td>
  </tr>
  <tr>
    <td>number</td>
    <td>y</td>
  </tr>
</table>

## Create a vector

Example:
```lua
a = vector(5, 4)
print(a) --> vector(5, 4) or print(tostring(a))
b = vector(3, 2)
if a.x > b.x then print(a .. b) end --> vector(5, 4)vector(3, 2)
c = a + b
print(c) --> vector(8, 6) or print(tostring(c))
b = -b --> vector(-3, -2)
```

## Constants

<table>
  <tr>
    <th>Constant</th>
    <th>Value</th>
  </tr>
  <tr>
    <td>vector.UP</td>
    <td>vector(0,-1)</td>
  </tr>
  <tr>
    <td>vector.DOWN</td>
    <td>vector(0,1)</td>
  </tr>
  <tr>
    <td>vector.LEFT</td>
    <td>vector(-1, 0)</td>
  </tr>
  <tr>
    <td>vector.RIGHT</td>
    <td>vector(1, 0)</td>
  </tr>
  <tr>
    <td>vector.ZERO</td>
    <td>vector(0,0)</td>
  </tr>
   <tr>
    <td>vector.ONE</td>
    <td>vector(1,1)</td>
  </tr>
</table>

## Functions

```lua
vector.angle(vector)
```
Returns the angle of vector in radians.

```lua
vector.normalized(vector)
```
Set the vector normalized. Normalizing a vector means reducing its length to 1 while preserving its direction.

```lua
vector.distanceTo(vector1, vector2)
```
Returns the distance between 2 vectors.

```lua
vector.distanceSquaredTo(vector1, vector2)
```
Returns the distance squared between 2 vectors.

```lua
vector.distance(vector)
```
Returns the distance of the vector.

```lua
vector.distanceSquared(vector)
```
Returns the distance squared of the vector.

```lua
vector.dot(vector1, vector2)
```
Returns the [dot product](https://en.wikipedia.org/wiki/Dot_product) of 2 vectors.

```lua
vector.perpDot(vector1, vector2)
```
Returns the [Perp Dot Product](http://mathworld.wolfram.com/PerpDotProduct.html) of 2 vectors.

```lua
vector.toPolar(vector, angle, lenght)
```
Set the vector to the polar coordinate.

```lua
vector.abs(vector)
```
Set the absolute value of the vector.

```lua
vector.round(vector, decimals)
```
Set the vector with `decimals`, 0 or ignore for integer number. Example: `vector(2.5, 3.4):round() --> vector(3, 3)`

```lua
vector.rotated(vector, phi)
```
Set the vector rotated by `phi`radians.

```lua
vector.cross(vector1, vector2)
```
Returns the 2 dimensional analog of the cross product with the given vector.

```lua
vector.perpendicular(vector)
```
Set the vector rotated 90°.

```lua
vector.lerpTo(vector1, vector2, time)
```
Set the result of the linear interpolation between this vector and `vector` by amount `time`. `time` is in the range of 0.0 - 1.0, representing the amount of interpolation.

```lua
vector.unpack(vector)
```
Returns `x, y` value of the vector.

## Vector Math

### Addition

```lua
this = vector(a, b) + vector(c, d) --> vector(a+c, b+d)
```

### Substraction

```lua
this = vector(a, b) - vector(c, d) --> vector(a-c, b-d)
```

### Multiplication

```lua
this = vector(a, b) * vector(c, d) --> vector(a*c, b*d)
```

### Division

```lua
this = vector(a, b) / vector(c, d) --> vector(a/c, b/d)
```
### Exponetiation

```lua
this = vector(a, b) ^ c --> vector(a^c, b^c)
```

### Concatenation

```lua
this = vector(a, b) .. vector(c, d) --> "vector(a, b)vector(c, d)"
```
