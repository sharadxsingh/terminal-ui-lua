local stack = {}

-- Stack to store terminal states
stack.stateStack = {}

-- Push current terminal state (e.g., color, cursor position)
function stack.push(state)
    table.insert(stack.stateStack, state)
end

-- Pop and restore last state
function stack.pop()
    local lastState = table.remove(stack.stateStack)
    return lastState
end

return stack
