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

local function write_cd_aliases()
    local aliases = {
        seagate = CD(SEAGATE),
        coding = CD(CODING),
        godot = CD(GODOT)
    }

    INOUT.write_aliases(aliases)
end

local function write_source_aliases()
    local aliases = {
        actenv = SOURCE("env/bin/activate"),
        actvenv = SOURCE("venv/bin/activate"),
    }

    INOUT.write_aliases(aliases)
end

local function write_software_aliases()
    local aliases = {
        hyfetch = "USER=luna hyfetch",
        nvconf = CD("~/.config/nvim/"),
        nvtree = "tree ~/.config/nvim/"
    }

    INOUT.write_aliases(aliases)
end

local function write_run_aliases()
    local aliases = {
        confortavel = CD("/media/luan/seagate/workspace/coding/projects/bots/confortavel") .. " && " .. SOURCE("/media/luan/seagate/workspace/coding/projects/bots/confortavel/env/bin/activate && /media/luan/seagate/workspace/coding/projects/bots/confortavel/env/bin/python /media/luan/seagate/workspace/coding/projects/bots/confortavel/main.py")
    }

    INOUT.write_aliases(aliases)
end

local function main()
    write_cd_aliases()
    write_source_aliases()
    write_software_aliases()
    write_run_aliases()
end

main()