return function()
	vim.defer_fn(function()
		require("copilot").setup {
			panel = {
				enabled = true,
				auto_refresh = true,
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
			},
			filetypes = {
				help = false,
				terraform = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["TelescopePrompt"] = false,
				["dap-repl"] = false,
				["big_file_disabled_ft"] = false,
				markdown = true, -- overrides default
			},
		}
	end, 100)
end
