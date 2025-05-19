local M = {}

BASHRC = require("lua.paths.bash_files").BASHRC
BASH_DIR = require("lua.paths.directories").BASH

LOG = require("lua.logger").log

-- escrever o método pra ler todos os arquivos de um diretório específico no .bashrc apenas caso essas linhas já não existam
local loader = string.format([[
for script in %s/*.sh; do
    [ -r $script ] && source "$script"
done
]], BASH_DIR) -- o string format transforma em bashboss/bash/*.sh, percorrendo todos os arquivos que terminam em .sh

local function does_loader_already_exists()
    -- abrir e ler o arquivo
    local file = io.open(BASHRC, "r")
    if not file then print(".bashrc not found at " .. BASHRC); return nil; end

    local content = file:read("*a") -- lê o arquivo inteiro
    file:close()

    -- se o arquivo não tiver conteúdo nenhum, o bloco não existe
    if not content then return false; end

    -- e se tiver conteúdo, e o bloco estiver lá, existe. caso contrário, não
    if string.find(content, loader, 1, true) then
        return true
    else
        return false
    end
end

function M.add_loader()
    -- verificar se o bloco já existe ou não no .bashrc
    local loader_exists = does_loader_already_exists()
    if loader_exists then LOG("INFO", "Loader at " .. BASHRC .. " already exists"); return; end

    -- abrir o arquivo
    local file = io.open(BASHRC, "a")
    if not file then print("Can't open " .. BASHRC); return; end
    
    -- escrever e fechar o arquivo de volta
    file:write(loader)
    file:close()

    print("loader added at " .. BASHRC)
end

return M