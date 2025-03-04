function enable_echo(enable)
    if enable then
        io.write("\27[12l") -- Restore echo (POSIX)
    else
        io.write("\27[12h") -- Disable echo (POSIX)
    end
end
function read_password()
    enable_echo(false)
    local password = ""
    io.write("Password: ")
    while true do
        local char = io.read(1)
        if char == "\n" then break end
        password = password .. char
        io.write("*")
    end
    enable_echo(true)
    return password
end
local pw = read_password()
print("\nYou entered: " .. pw)