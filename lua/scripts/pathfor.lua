#!/usr/bin/env lua
HOME = os.getenv("HOME")

local included_paths = {
    appsflatpak = HOME .. "/.local/share/flatpak/exports",
    appsappimages = "/usr/local/bin",
}

local function print_included_lines()
    -- imprimir cada nome e path de cada item da tabela
    for key, value in pairs(included_paths) do
        print("  " .. key .. "      " .. value)
    end
end

local function pathfor(reference)
    local path = included_paths[reference]
    if path then
        -- imprimir o path caso a referência exista na tabela
        print(path)
    else
        -- não fazer nada se a referência não existir, só printar as opções existentes
        print("Path not included in pathfor. Try:")
        print_included_lines()
    end
end

-- quando um script lua é executado em linha de comando, a variável global 'arg' é criada
-- o arg[0] é o comando em si, e o resto são os outros argumentos
local reference = arg[1]
pathfor(reference)