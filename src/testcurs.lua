local t = require("terminal")

print("Normal text")  -- Default position

t.saveCursor()  -- Save cursor position
t.moveCursor(5, 10)  -- Move cursor to row 5, column 10

t.write("Moved text")  

t.restoreCursor()  -- Restore cursor position
t.write("\nBack to original position")  -- Should appear where "Normal text" was