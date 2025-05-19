local M = {}

LOG = require("logger").log

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

function M.write_at_end(category_name, content, target_file)
    local existing_lines = M.read_existing_data(target_file) -- ler quais são as linhas que já existem no arquivo

    -- abrir o arquivo em que os conteúdos vão ser escritos (ex: aliases.sh)
    local file = io.open(target_file, "a")
    if not file then
        LOG("ERROR", string.format("Error while trying to open %s file\nPath: %s", category_name, target_file))
        os.exit(1)
    end

    -- escrever uma linha no final do arquivo com cada conteúdo da tabela formatado 
    -- (ex, no formato: "alias ='comando aqui'")
    -- e só realmente escrever se ela já não existir no arquivo. se não existir, escreve e quebra pra próxima linha
    if not existing_lines[content] then
        file:write(content .. "\n")
    end

    -- finalizar e fechar o arquivo
    LOG("SUCCESS", string.format("Successfully written %s contents at %s", category_name, target_file))
    file:close()
end

return M