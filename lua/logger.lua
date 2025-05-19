local M = {}

local colors = {
    default = "\27[0m",
    red = "\27[1;31m",
    yellow = "\27[1;33m",
    blue = "\27[1;34m",
}

function M.log(level, message)
    local color = colors.default
    
    if level == "INFO" then
        color = colors.blue
    elseif level == "WARN" then
        color = colors.yellow
    elseif level == "ERROR" then
        color = colors.red
    end

    print(string.format("%s[ %s ] %s%s", color, level, colors.default, message))
end

return M