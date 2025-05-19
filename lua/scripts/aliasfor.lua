#!/usr/bin/env lua

local function read_existing_aliases()
    local file = io.open("/media/luan/seagate/workspace/coding/projects/scripts/bashboss/bash/aliases.sh", "r")
    if not file then return; end

    local content = file:read("*a")
    file:close()
    return content
end

local function aliasfor()
    local content = read_existing_aliases()
    print(content)
end

aliasfor()