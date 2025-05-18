SEAGATE = "/media/luan/seagate"
WORKSPACE = SEAGATE .. "/workspace"

CODING = WORKSPACE .. "/coding/projects"
GODOT = WORKSPACE .. "/godot/projects"

TEMP = "/media/luan/seagate/workspace/coding/projects/scripts/bashboss/bashrc"

function CD(path)
    return "cd " .. path
end

local function read_existing_data(path)
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

local function write_aliases()
    -- definir quais aliases vão existir
    local aliases = {
        seagate = CD(SEAGATE),
        coding = CD(CODING),
        godot = CD(GODOT)
    }

    -- ler quais são as linhas que já existem no arquivo
    local already_written_lines = read_existing_data(TEMP)

    -- abrir o arquivo em que os aliases vão ser escritos
    local file = io.open(TEMP, "a")
    if not file then print("Error while trying to open aliases file"); os.exit(1) end

    -- escrever uma linha no final do arquivo com cada alias da tabela (no formato: alias ='path/aqui')
    for key, value in pairs(aliases) do
        local formatted_alias = string.format("alias %s='%s'", key, value)

        -- só realmente escrever se ela já não existir no arquivo. se não existir, escreve e quebra pra próxima linha
        if not already_written_lines[formatted_alias] then
            file:write(formatted_alias .. "\n")
        end
    end

    -- finalizar e fechar o arquivo
    file:close()
end

write_aliases()