local M = {}

-- essas funções só escrevem a string do comando, não executam ele
function M.CD(path)
    return "cd " .. path
end

function M.SOURCE(path)
    return "source " .. path
end

return M