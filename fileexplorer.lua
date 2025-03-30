--from (https://github.com/sharadxsingh/lua-file-explorer.git)
local lfs = require("lfs")

local function list_files(path)
    local files = {}
    for file in lfs.dir(path) do
        if file ~= "." and file ~= ".." then
            local attr = lfs.attributes(path .. "/" .. file)
            table.insert(files, { name = file, mode = attr.mode })
        end
    end
    return files
end

local function display_files(files, selected_index, path)
    os.execute("clear") -- Clears terminal screen (Unix)
    print("Terminal File Explorer - Navigate with W/S, Open with o, Exit with Q")
    print("Current Path: " .. path)
    for i, file in ipairs(files) do
        local prefix = file.mode == "directory" and "[D] " or "[F] "
        if i == selected_index then
            print("\27[1;32m--> " .. prefix .. file.name .. "\27[0m") -- Green highlight
        else
            print("    " .. prefix .. file.name)
        end
    end
end

local function read_key()
    os.execute("stty raw -echo") -- Set terminal to raw mode (Unix)
    local key = io.read(1)
    os.execute("stty -raw echo") -- Reset terminal mode
    return key
end

local function open_file(path)
    print("Opening file: " .. path) -- Debug message
    local success = false
    if os.execute("xdg-open " .. path .. " > /dev/null 2>&1") == 0 then
        success = true
    elseif os.execute("open " .. path .. " > /dev/null 2>&1") == 0 then
        success = true
    elseif os.execute("start " .. path .. " >nul 2>&1") == 0 then
        success = true
    end
    if not success then
        print("Failed to open file. No valid opener found.")
    end
end

local function file_explorer(path)
    local files = list_files(path)
    local index = 1
    while true do
        display_files(files, index, path)
        local key = read_key()
        if key == "q" then
            break
        elseif key == "w" then
            index = math.max(1, index - 1)
        elseif key == "s" then
            index = math.min(#files, index + 1)
        elseif key == "o" then -- ENTER key
            local selected = files[index]
            if selected.mode == "directory" then
                path = path .. "/" .. selected.name
                files = list_files(path)
                index = 1
            else
                open_file(path .. "/" .. selected.name)
            end
        end
    end
end

file_explorer(".")