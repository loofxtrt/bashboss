DIRECTORIES = require("lua.paths.directories")
BASH_DIRECTORY = DIRECTORIES.BASH

local bash_files = {
    aliases = BASH_DIRECTORY .. "/aliases.sh"
}

return bash_files