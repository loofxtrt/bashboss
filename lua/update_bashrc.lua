BASHRC = require("lua.paths.bash_files").BASHRC
BASH_DIR = require("lua.paths.directories").BASH

-- escrever o método pra ler todos os arquivos de um diretório específico no .bashrc apenas caso essas linhas já não existam
local sourcer = string.format([[
for script in %s/*.sh; do
    [ -r $script ] && source "$script"
done
]], BASH_DIR) -- o string format transforma em ~/.bashrc/*.sh, percorrendo todo arquivo que termina em .sh

local function does_sourcer_already_exists()
    -- abrir e ler o arquivo
    local file = io.open(BASHRC, "r")
    if not file then print(".bashrc not found at " .. BASHRC); return nil; end

    local content = file:read("*a") -- lê o arquivo inteiro
    file:close()

    -- se o arquivo não tiver conteúdo nenhum, o bloco não existe
    if not content then return false; end

    -- e se tiver conteúdo, e o bloco estiver lá, existe. caso contrário, não
    if string.find(content, sourcer, 1, true) then
        return true
    else
        return false
    end
end

local function run_update()
    -- verificar se o bloco já existe ou não no .bashrc
    local sourcer_exists = does_sourcer_already_exists()
    if sourcer_exists then print("Sourcer at " .. BASHRC .. " already exists"); return; end

    -- abrir o arquivo
    local file = io.open(BASHRC, "a")
    if not file then print("Can't open " .. BASHRC); return; end
    
    -- escrever e fechar o arquivo de volta
    file:write(sourcer)
    file:close()

    print("Sourcer added in " .. BASHRC)
end

run_update()