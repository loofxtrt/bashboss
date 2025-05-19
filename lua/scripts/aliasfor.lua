#!/usr/bin/env lua

ALIASES = require("paths.bash_files").ALIASES
LOG = require("logger").log

local function read_existing_aliases()
    local file = io.open(ALIASES, "r")
    if not file then
        LOG(string.format("ERROR", "Error while trying to read aliases file at %s", file))
        return
    end

    local content = file:read("*a")
    file:close()
    return content
end

local function aliasfor()
    local content = read_existing_aliases()
    print(content)
end

aliasfor()