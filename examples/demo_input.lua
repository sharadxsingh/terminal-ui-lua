local system = require("system")

local startTime = system.gettime()
local timeoutDuration = 3 -- seconds

-- set io.stdin to non-blocking mode
local old_setting = system.getnonblock(io.stdin)
system.setnonblock(io.stdin, true)
print("Press any key (timeout: 3 seconds)...")

local key, typ
while system.gettime() - startTime < timeoutDuration do
  key, typ = system.readkey(0.3)
  if key then
    print("You pressed:", key, "(type:", typ, ")")
    break
  end
end

if not key then
  print("No key pressed within timeout.")
end

-- restore old setting
system.setnonblock(io.stdin, old_setting)
