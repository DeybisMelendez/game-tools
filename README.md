# lua-vector

Vector 2d for Love2d and Lua. Inspired on Vector2() of Godot Engine.

## How-to-use

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
Get vector as string

```lua
vector:getAngle()
```
Get angle of vector in radians.

```lua
vector:normalized(vector)
```
Normalizing a vector means reducing its length to 1 while preserving its direction. Get a vector normalized.

```lua
vector:distance_to(vector)
```
Get the distance between 2 vectors.

## Vector Math

### Add

```lua
this = vector(a, b) + vector(c, d) --> vector(a+c, b+d)
```

### Substract

```lua
this = vector(a, b) - vector(c, d) --> vector(a-c, b-d)
```

### Multiply

```lua
this = vector(a, b) * vector(c, d) --> vector(a*c, b*d)
```

### Divide

```lua
this = vector(a, b) / vector(c, d) --> vector(a/c, b/d)
```
