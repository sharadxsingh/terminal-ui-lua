local stack = require("src/stack")
local busted = require("busted")

describe("Stack Module", function()
    it("should push and pop terminal states correctly", function()
        stack.push({ color = "31" })  -- Push red color
        stack.push({ color = "32" })  -- Push green color

        assert.are.same({ color = "32" }, stack.pop())  -- pop green first
        assert.are.same({ color = "31" }, stack.pop())  -- Then red
    end)

    it("should return nil when popping an empty stack", function()
        assert.is_nil(stack.pop())  -- Stack empty now
    end)

    it("should correctly store and restore cursor positions", function()
        stack.push({ cursor = true })
        local lastState = stack.pop()
        assert.are.same({ cursor = true }, lastState)
    end)
end)
