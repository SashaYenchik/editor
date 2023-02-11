return function()
	require("mason-tool-installer").setup {

		-- a list of all tools you want to ensure are installed upon
		-- start; they should be the names Mason uses for each tool
		ensure_installed = {
			-- NOTE: Formatter
			"stylua",
			"prettierd",
			"black",
			"shfmt",
			"isort",
			"buf", -- proto
			"buildifier", -- bazel
			"markdownlint", -- style checker for markdownj
			"cbfmt", -- format codeblocks in markdown
			"beautysh", -- bash formatter
			"yamlfmt",
			"rustfmt",
			"jq",

			-- NOTE: Linters
			"selene",
			"eslint_d",
			"shellcheck",
			"flake8",
			"tflint",
			"yamllint",
			"vulture",
			"vale",
			"vint",
		},
	}
	vim.api.nvim_create_autocmd("User", {
		pattern = "MasonToolsUpdateCompleted",
		callback = function()
			vim.schedule(function()
				print "mason-tool-installer has finished"
				vim.notify(
					"mason-tool-installer has finished!",
					vim.log.levels.DEBUG,
					{ title = "MasonToolsInstaller" }
				)
			end)
		end,
	})
end
