INOUT = require("lua.inout")

COMMANDS = require("lua.commands")
CD = COMMANDS.CD
SOURCE = COMMANDS.SOURCE

DIRECTORIES = require("lua.paths.directories")
SEAGATE = DIRECTORIES.SEAGATE
WORKSPACE = DIRECTORIES.WORKSPACE
CODING = DIRECTORIES.CODING
GODOT = DIRECTORIES.GODOT

BASH_FILES = require("lua.paths.bash_files")
ALIASES = BASH_FILES.ALIASES

local function write_all_aliases()
    local cd_aliases = {
        seagate = CD(SEAGATE),
        coding = CD(CODING),
        godot = CD(GODOT)
    }

    local source_aliases = {
        actenv = SOURCE("env/bin/activate"),
        actvenv = SOURCE("venv/bin/activate"),
    }

    local software_aliases = {
        hyfetch = "USER=luna hyfetch",
        nvconf = CD("~/.config/nvim/"),
        nvtree = "tree ~/.config/nvim/"
    }

    local run_aliases = {
        confortavel = CD("/media/luan/seagate/workspace/coding/projects/bots/confortavel") .. " && " .. SOURCE("/media/luan/seagate/workspace/coding/projects/bots/confortavel/env/bin/activate && /media/luan/seagate/workspace/coding/projects/bots/confortavel/env/bin/python /media/luan/seagate/workspace/coding/projects/bots/confortavel/main.py")
    }

    local all_aliases = { cd_aliases, source_aliases, software_aliases, run_aliases }
    for _, alias_group in ipairs(all_aliases) do
        INOUT.write_aliases(alias_group)
    end
end

local function main()
    write_all_aliases()
end

main()