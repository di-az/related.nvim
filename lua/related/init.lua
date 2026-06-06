local M = {}

local config = require("related.config")
local go = require("related.go")

function M.setup(opts)
	config.setup(opts)
end

function M.open()
	go.open()
end

function M.create()
	go.create()
end

return M
