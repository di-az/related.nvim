local M = {}

local function exists(path)
	return vim.fn.filereadable(path) == 1
end

local function is_test_file(path)
	return path:match("_test%.go$")
end

local function related_file(path)
	if is_test_file(path) then
		return path:gsub("_test%.go$", ".go")
	end

	return path:gsub("%.go$", "_test.go")
end

function M.open()
	local current = vim.api.nvim_buf_get_name(0)
	local target = related_file(current)

	if exists(target) then
		vim.cmd.edit(target)
		-- local message = string.format("File: %s", related_name)
		-- print(message)
	else
		vim.notify("Related file not found", vim.log.levels.INFO)
		-- local message = string.format("Missing %s", related_name)
		-- print(message)
	end
end

function M.create()
	local current = vim.api.nvim_buf_get_name(0)
	local target = related_file(current)

	if is_test_file(current) then
		vim.notify("Already in test file", vim.log.levels.INFO)
	else
		vim.cmd.edit(target)
	end
end

return M
