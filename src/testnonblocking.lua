-- Define the input buffer
local input_buffer = ""

-- Function to read input 
local function non_blocking_read()
    while true do
        local char = io.read(1) -- Read 1 character
        if char then
            input_buffer = input_buffer .. char -- Append to buffer
            coroutine.yield(char) -- Yield control with the character
        else
            coroutine.yield(nil) -- Yield control if no input
        end
    end
end

--coroutine
local input_co = coroutine.create(non_blocking_read)

-- Function to resume the coroutine and get input
local function get_input()
    local status, char = coroutine.resume(input_co)
    if char then
        return char
    end
    return nil
end

-- Main loop 
io.write("Type something (press 'q' to quit): ")
while true do
    local char = get_input() 
    if char then
        if char == "q" then -- Exit condition
            break
        end
        io.write(char) -- Echo the character
    end
    
    os.execute("sleep 0.01") -- Small delay
end