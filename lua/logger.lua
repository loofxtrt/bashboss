local M = {}

-- valores com '1;', além de serem coloridos, são bold
local colors = {
    default = "\27[0m",
    red = "\27[1;31m",
    yellow = "\27[1;33m",
    green = "\27[1;32m",
    blue = "\27[1;34m",
}

function M.log(level, message)
    local color = colors.default
    
    if level == "INFO" then
        color = colors.blue
    elseif level == "SUCCESS" then
        color = colors.green
    elseif level == "WARN" then
        color = colors.yellow
    elseif level == "ERROR" then
        color = colors.red
    end

    -- formata com o level entre colchetes tendo a cor e o resto da mensagem sendo normal
    print(string.format("%s[ %s ] %s%s", color, level, colors.default, message))
end

return M