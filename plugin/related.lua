vim.api.nvim_create_user_command("Related", function()
	require("related").open()
end, {})

vim.api.nvim_create_user_command("RelatedCreate", function()
	require("related").create()
end, {})
