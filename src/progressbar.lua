-- Define the spinner frames
local spinner_frames = {  "🌑", "🌒", "🌓", "🌔", "🌕", "🌖", "🌗", "🌘" }

-- Function to create a spinner
local function start_spinner()
    local i = 1
    return function()
        io.write("\r" .. spinner_frames[i] .. " Processing...")
        i = (i % #spinner_frames) + 1
    end
end

-- Function to draw a progress bar
local function draw_progress_bar(progress)
    local width = 20
    local filled = math.floor(progress * width)
    local bar = "[" .. string.rep("=", filled) .. string.rep(" ", width - filled) .. "]"
    io.write("\r" .. bar .. " " .. math.floor(progress * 100) .. "%")
end


local spinner = start_spinner()
for i = 1, 100 do
    draw_progress_bar(i / 100)
    spinner()
    

   
    os.execute("sleep 0.1") -- Adjust the delay to control speed
end
io.write("\r" .. string.rep(" ", 50) .. "\r") 
print("Download complete!")