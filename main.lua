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

write_cd_aliases()
write_source_aliases()