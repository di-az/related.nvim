local M = {}

local function exists(path)
	return vim.fn.filereadable(path) == 1
end

local function is_test_file(path)
	return path:match("_test%.go$")
end

local function related_go_file(path)
	if is_test_file(path) then
		return path:gsub("_test%.go$", ".go")
	end

	return path:gsub("%.go$", "_test.go")
end

function M.open()
	local filepath = vim.api.nvim_buf_get_name(0)

	local related = related_go_file(filepath)
	local related_name = vim.fn.fnamemodify(related, ":t")

	if exists(related) then
		vim.cmd.edit(related)
		-- local message = string.format("File: %s", related_name)
		-- print(message)
	else
		vim.notify("Related file not found", vim.log.levels.INFO)
		-- local message = string.format("Missing %s", related_name)
		-- print(message)
	end
end

return M
