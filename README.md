# lua-vector

Vector 2d for Love2d and Lua. Inspired on Vector2() of Godot Engine.

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
myVector = vector(5, 4)
print(myVector:string()) --> vector(5, 4)
other = vector(3, 2)
if myVector.x > other.x then print(other.y) --> 2
this = myVector + other
print(this:string()) --> vector(8, 6)
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
vector:string()
```
Returns the vector as string, also, `tostring(vector)` works.

```lua
vector:angle()
```
Returns the angle of vector in radians.

```lua
vector:normalized(vector)
```
Returns the vector normalized. Normalizing a vector means reducing its length to 1 while preserving its direction.

```lua
vector:distanceTo(vector)
```
Returns the distance between 2 vectors.

```lua
vector:distanceSquaredTo(vector)
```
Returns the distance squared between 2 vectors.

```lua
vector:distance()
```
Returns the distance of the vector.

```lua
vector:distanceSquared()
```
Returns the distance squared of the vector.

```lua
vector:dot(vector)
```
Returns the [dot product](https://en.wikipedia.org/wiki/Dot_product) of 2 vectors.

```lua
vector:perpDot(vector)
```
Returns the [Perp Dot Product](http://mathworld.wolfram.com/PerpDotProduct.html) of 2 vectors.

```lua
vector:toPolar(angle, lenght)
```
Returns the polar coordinate of the vector.

```lua
vector:abs()
```
Returns the absolute value of the vector.

```lua
vector:round(decimals)
```
Returns the vector with `decimals`, 0 or ignore for integer number. Example: `vector(2.5, 3.4):round() --> vector(3, 3)`

```lua
vector:rotated(phi)
```
Returns the vector rotated by `phi`radians.

```lua
vector:cross(vector)
```
Returns the 2 dimensional analog of the cross product with the given vector.

```lua
vector:perpendicular()
```
Returns a vector rotated 90°.

```lua
vector:lerpTo(vector, time)
```
Returns the result of the linear interpolation between this vector and `vector` by amount `time`. `time` is in the range of 0.0 - 1.0, representing the amount of interpolation.

```lua
vector:unpack()
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
