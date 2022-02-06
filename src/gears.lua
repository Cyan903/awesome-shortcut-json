local tbl = require "awesome-shortcut-json.src.validate"

local function toAwesome(jsonTbl)
    local shortcuts = {}

    for k, short in pairs(jsonTbl) do
        shortcuts = gears.table.join(shortcuts, awful.key(gears.table.join({ AWESOME_MODKEY }, short.keys.primary), short.keys.main, function(e)
            awful.spawn.with_shell(short.callback)
        end, {
            description = short.info.description,
            group = short.info.group
        }))
    end

    return shortcuts
end

return toAwesome(tbl)
