local M = {}

BASH_FILES = require("lua.paths.bash_files")

function M.read_existing_data(path)
    local existing_lines = {}
    
    -- abrir e começar a ler o arquivo
    local file = io.open(path, "r")
    if not file then return existing_lines end -- retornar a tabela vazia se nenhuma linha for encontrada

    -- passar por todas as linhas do arquivo, checando quais existem e marcando todas como existentes
    for line in file:lines() do
        existing_lines[line] = true
    end

    -- finalizar e retornar as linhas encontradas
    file:close()
    return existing_lines
end

function M.write_aliases(aliases_table)
    -- importar o caminho do aliases.sh
    local aliases_file = BASH_FILES.ALIASES

    -- ler quais são as linhas que já existem no arquivo
    local existing_lines = M.read_existing_data(aliases_file)

    -- abrir o arquivo em que os aliases vão ser escritos (ex: aliases.sh)
    local file = io.open(aliases_file, "a")
    if not file then print("Error while trying to open aliases file\nPath: " .. aliases_file); os.exit(1); end

    -- escrever uma linha no final do arquivo com cada alias da tabela (no formato: alias ='comando aqui')
    for key, value in pairs(aliases_table) do
        local formatted_alias = string.format("alias %s='%s'", key, value)

        -- só realmente escrever se ela já não existir no arquivo. se não existir, escreve e quebra pra próxima linha
        if not existing_lines[formatted_alias] then
            file:write(formatted_alias .. "\n")
        end
    end

    -- finalizar e fechar o arquivo
    file:close()
end

return M