#!/usr/bin/env lua

local function aliasfor()
    local file = io.open("/media/luan/seagate/workspace/coding/projects/scripts/bashboss/bash/aliases.sh", "r")
    if not file then return; end

    -- imprimir cada linha com um ícone na frente
    for line in file:lines() do
        print(string.format(" %s", line))
    end

    file:close()
end

aliasfor()