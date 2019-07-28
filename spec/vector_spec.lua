local vector = require "vector"

describe("vector", function()
  local vec = vector(2,3)
  local vec2 = vector(3,4)
  it("atributes", function() assert.equal(5, vec.x + vec.y) end)
  it("add", function() assert.equal(5, (vec + vec2).x) end)
end)
