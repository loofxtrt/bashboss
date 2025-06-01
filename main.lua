package.path = "./lua/?.lua;./lua/?/init.lua;" .. package.path

-- utils
INOUT = require("inout")
LOADER = require("loader")

-- comandos pra serem escritos no arquivo .sh
COMMANDS = require("commands")
CD = COMMANDS.cd
SOURCE = COMMANDS.source
EXPORT_PATH = COMMANDS.export_path

-- caminhos de diretórios
DIRECTORIES = require("paths.directories")
SEAGATE = DIRECTORIES.SEAGATE
WORKSPACE = DIRECTORIES.WORKSPACE
CODING = DIRECTORIES.CODING
GODOT = DIRECTORIES.GODOT

-- caminhos de arquivos
BASH_FILES = require("paths.bash_files")

local function write_all_aliases()
    local cd_aliases = {
        seagate = CD(SEAGATE),
        coding = CD(CODING),
        godot = CD(GODOT)
    }

    local source_aliases = {
        actenv = SOURCE("env/bin/activate"),
        actvenv = SOURCE("venv/bin/activate")
    }

    local software_aliases = {
        hyfetch = "USER=luna hyfetch",
        nvconf = CD("~/.config/nvim/"),
        nvtree = "tree ~/.config/nvim/",
        kswitcher = SOURCE("kswitcher"),
        recall = "bash /mnt/seagate/workspace/coding/projects/scripts/recall-writer/recall-writer.sh",
        worder = "cd /mnt/seagate/workspace/coding/projects/scripts/worder && echo python3 main.py"
    }

    local run_aliases = {
        confortavel = CD("/mnt/seagate/workspace/coding/projects/bots/confortavel") .. " && " .. SOURCE("/mnt/seagate/workspace/coding/projects/bots/confortavel/env/bin/activate && /mnt/seagate/workspace/coding/projects/bots/confortavel/env/bin/python /mnt/seagate/workspace/coding/projects/bots/confortavel/main.py")
    }

    -- adicionar todos os grupos numa table
    local all_aliases = { cd_aliases, source_aliases, software_aliases, run_aliases }

    -- pra cada grupo da table, entrar na tabela, formatar o conteúdo dela e enviar pro write_at_end
    for _, aliases_groups in ipairs(all_aliases) do
        for key, value in pairs(aliases_groups) do
            local formatted_alias = string.format("alias %s='%s'", key, value)
            INOUT.write_at_end("aliases", formatted_alias, BASH_FILES.ALIASES)
        end 
    end
end

local function write_all_export_paths()
    local exports = {
        default_path = EXPORT_PATH("/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"),
        yabridge = EXPORT_PATH("/$HOME/.local/share/yabridge"),
        scripts = EXPORT_PATH("/usr/local/bin/scripts/"),
        bashboss = EXPORT_PATH("/mnt/seagate/workspace/coding/projects/scripts/bashboss")
    }

    -- adicionar os valores que as funções EXPORT_PATH retornam ao script .sh de paths
    for key, value in pairs(exports) do
        INOUT.write_at_end("exports", value, BASH_FILES.EXPORT_PATH)
    end
end

-- escrever/atualizar todas as categorias
local function main()
    LOADER.add_loader() -- loader no .bashrc que carrega todos os outros scripts
    write_all_aliases()
    write_all_export_paths()
end

main()