local vector = require "vector"

describe("vector", function() 
  local vec = vector(2,3)
  it("Adds", function() assert.equal(5, vec.x + vec.y) end)
end)
