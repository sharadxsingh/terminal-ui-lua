local t = require("terminal")

print("Normal text")
t.setColor("31")  -- Set text to red
print("This should be red")
t.resetColor()    -- Restore previous color
print("\27[0m\nBack to normal")
