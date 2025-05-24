#!/usr/bin/env lua

HOME = os.getenv("HOME")

local included_paths = {
	appsflatpak = HOME .. "/.local/share/flatpak/exports",
	appsappimages = "/usr/local/bin",
	fonts = HOME .. "/.local/share/fonts",
	dotdesktop = HOME .. "/.local/share/applications",
}

local function print_included_lines()
	-- calcular quantidade de espaços necessário pra alinhas as colunas
	local max_key_length = 0
	for key, _ in pairs(included_paths) do
		if #key > max_key_length then
			max_key_length = #key
		end
	end

	-- imprimir cada nome e path de cada item da tabela
	for key, value in pairs(included_paths) do
		local pad_size = 6
		local padding = string.rep(" ", max_key_length - #key + pad_size)
		print(string.format("  %s %s %s", key, padding, value))
	end
end

local function pathfor(reference)
	local path = included_paths[reference]
	if path then
		-- imprimir o path caso a referência exista na tabela
		print(path)
	else
		-- não fazer nada se a referência não existir, só printar um textto com fundo contrastante
		-- e logo depois as opções existentes
		print("\27[7m Path not provided or not included in pathfor. Try: \27[0m")
		print_included_lines()
	end
end

-- quando um script lua é executado em linha de comando, a variável global 'arg' é criada
-- o arg[0] é o comando em si, e o resto são os outros argumentos
local reference = arg[1]
pathfor(reference)

