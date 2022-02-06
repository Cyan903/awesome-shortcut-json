local JSON = require "awesome-shortcut-json.lib.json"
local open = io.open

local function readFile(path)
    local file = open(path, "rb")
    local content = file:read("*a")

    file:close()
    return content
end

return JSON.decode(readFile(
    AWESOME_SHORTPATH
))
