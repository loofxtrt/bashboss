DIRECTORIES = require("paths.directories")
BASH_DIRECTORY = DIRECTORIES.BASH

local bash_files = {
    BASHRC = os.getenv("HOME") .. "/.bashrc", -- ~/.bashrc
    ALIASES = BASH_DIRECTORY .. "/aliases.sh",
    EXPORT_PATH = BASH_DIRECTORY .. "/export_path.sh"
}

return bash_files