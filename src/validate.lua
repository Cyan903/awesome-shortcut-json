local awesomeData = require "awesome-shortcut-json.src.parse"
local os = require "os"
local errors = {}

local function throwError(msg)
   errors[#errors+1] = "'"..msg.."'"

   return false
end

local function logErrors()
    for v in pairs(errors) do
        os.execute("notify-send -u critical "..errors[v])
    end
end

local validate = {
    keys = function(keys, num)
        if type(keys.primary) ~= "table" then
            return throwError("keys.primary in object #"..num.." is invalid.")
        end

        if type(keys.main) ~= "string" or keys.main == "" then
            return throwError("keys.main in object #"..num.." is invalid.")
        end

        return true
    end,

    info = function(info, num)
        if type(info.description) ~= "string" or info.description == "" then
            return throwError("info.description in object #"..num.." is invalid.")
        end

        if type(info.group) ~= "string" or info.group == "" then
            return throwError("info.group in object #"..num.." is invalid.")
        end

        return true
    end,

    callback = function(callback, num)
        if type(callback) ~= "string" or callback == "" then
            return throwError("calback in object #"..num.." is invalid.")
        end

        return true
    end
}

for i in pairs(awesomeData) do
    validate.keys(awesomeData[i].keys, tostring(i))
    validate.info(awesomeData[i].info, tostring(i))
    validate.callback(awesomeData[i].callback, tostring(i))
end

if #errors ~= 0 then
    logErrors()
    return {}
end

return awesomeData
