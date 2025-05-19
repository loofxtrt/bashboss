#!/usr/bin/env lua

local function truncate(text, limit)
    -- corta strings depois de um limite x e adiciona '...' no final
    if #text > limit then
      return string.sub(text, 4, limit) .. "..."
    else
      return text
    end
end

local function pad_right(text, width)
    -- adiciona espaços à direita até que todas as strings tenham a mesma largura
    return string.format("%-" .. width .. "s", text)
end

local function aliasfor()
    local file = io.open("/media/luan/seagate/workspace/coding/projects/scripts/bashboss/bash/aliases.sh", "r")
    if not file then return; end

    -- variável pra decidir se a linha vai ou não ter um fundo contrastane
    -- com base nela ser ou não um par. assim, criando um efeito zebrado mais legível
    local is_line_pair = 0

    for line in file:lines() do
        line = truncate(line, 70) -- truncar a string
        line = pad_right(line, 70) -- completar com espaços à direita até 70 caracteres

        -- imprimir cada linha com um ícone na frente e com ou sem fundo        
        if is_line_pair %2 == 0 then
            print(string.format("\27[7m %s\27[0m", line))
        else
            print(string.format(" %s", line))
        end

        -- fazer a próxima ter o fundo oposto da linha anterior
        is_line_pair = is_line_pair + 1
    end

    file:close()
end

aliasfor()