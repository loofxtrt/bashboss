#!/usr/bin/env lua
HOME = os.getenv("HOME")

local included_paths = {
    appsflatpak = HOME .. "/.local/share/flatpak/exports"
}

local function pathfor(argument)
    local path = included_paths[argument]
    if path then
        print(path)
    else
        print("Path not included in pathfor")
    end
end

local argument = arg[1]
pathfor(argument)