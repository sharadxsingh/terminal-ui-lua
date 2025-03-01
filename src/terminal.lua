local terminal = {}
local stack = require("stack")
io.stdout:setvbuf("no")

-- Change text color
function terminal.setColor(color)
    stack.push({ color = color })  -- Save previous state
    io.write("\27[" .. color .. "m")  -- Apply color change
end

-- Restore previous color (or reset if stack is empty)
function terminal.resetColor()
    local lastState = stack.pop()
    if lastState then
        io.write("\27[" .. lastState.color .. "m")
    else
        io.write("\27[0m")  
    end
    io.flush() 
end


-- Save cursor position
function terminal.saveCursor()
    stack.push({ cursor = true })
    io.write("\27[s") -- Save cursor position
    io.flush()
    print("Cursor saved") 
end

-- Restore cursor position
function terminal.restoreCursor()
    local lastState = stack.pop()
    if lastState and lastState.cursor then
        io.write("\27[u") -- Restore last cursor position
        io.flush()
        print("Cursor restored") 
    else
        print("No cursor state to restore") 
    end
end

-- Move cursor to a specific row and column
function terminal.moveCursor(row, col)
    local command = string.format("\27[%d;%dH", row, col) -- Generate ANSI escape code
    io.write(command)  -- Move cursor
    io.flush()  
    print(string.format("Cursor moved to row %d, column %d", row, col)) 
end


function terminal.write(text)
    io.write(text)
    io.flush()  
    --print(string.format( text)) 
end

return terminal