local sys = require("system")

local input = {}

-- Non-blocking read using system.readansi
function input.readKey(timeout)
  timeout = timeout or 0.1  -- default timeout if not provided
  local key, typ, err, partial = sys.readansi(timeout)
  if err == "timeout" then
    return nil  
  else
    return key, typ  
  end
end

return input
