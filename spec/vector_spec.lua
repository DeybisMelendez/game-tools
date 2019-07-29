local vector = require "vector"

describe("vector", function()
    describe("new vector", function()
		it("sets the vector",
		function()
			local x, y = 1, 2
			local vec = vector(x, y)
			assert.is_equal(x, vec.x)
			assert.is_equal(y, vec.y)
			assert.is_equal(vec, vector(x, y))
			assert.is_equal(vec.x + vec.y, x+y)
		end)
end)
