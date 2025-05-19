#!/usr/bin/env lua

local function truncate(text, limit)
    -- corta strings depois de um limite x e adiciona '...' no final
    if #text > limit then
      return string.sub(text, 1, limit - 3) .. "..." -- -3 pro espaço das reticências
    else
      return text
    end
end

local function aliasfor()
    local file = io.open("/media/luan/seagate/workspace/coding/projects/scripts/bashboss/bash/aliases.sh", "r")
    if not file then return; end

    for line in file:lines() do
        line = truncate(line, 70) -- truncar as linhas que forem muito grandes
        print("󰿨  " .. line) -- imprimar cada uma
    end

    file:close()
end

aliasfor()