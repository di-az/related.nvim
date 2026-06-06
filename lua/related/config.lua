local M = {}

M.options = {
	keymap = nil,
}

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", M.options, opts or {})

	if M.options.keymap then
		vim.keymap.set("n", M.options.keymap, require("related").open, { desc = "Open related file" })
	end
end

return M
