return function()
	local disabled_workspaces = require("editor").config.disabled_workspaces
	local format_on_save = require("editor").config.format_on_save

	-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins
	local f = require("null-ls").builtins.formatting
	local d = require("null-ls").builtins.diagnostics
	local ca = require("null-ls").builtins.code_actions

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	require("null-ls").setup {
		debug = false,
		update_in_insert = false,
		diagnostics_format = "[#{c}] #{m} (#{s})",
		sources = {
			-- NOTE: formatting
			f.prettierd.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } },
			f.shfmt.with { extra_args = { "-i", 4, "-ci", "-sr" } },
			f.black,
			f.ruff,
			f.isort,
			f.stylua,
			f.markdownlint,
			f.cbfmt,
			f.beautysh,
			f.yamlfmt,
			f.rustfmt,
			f.jq,
			f.buf,
			f.buildifier,

			-- NOTE: diagnostics
			d.eslint_d,
			d.ruff,
			d.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
			d.selene,
			d.markdownlint.with { extra_args = { "--disable MD033" } },
			d.zsh,
			d.buf,
			d.buildifier,
			d.yamllint,
			d.vulture,
			d.vale,
			d.vint,

			-- NOTE: code actions
			ca.gitrebase,
			ca.gitsigns, -- retrieve code actions from lewis6991/gitsigns.nvim
			ca.shellcheck,
		},
		on_attach = function(client, bufnr)
			local cwd = vim.fn.getcwd()
			for i = 1, #disabled_workspaces do
				if cwd.find(cwd, disabled_workspaces[i]) ~= nil then return end
			end
			if client.supports_method "textDocument/formatting" and format_on_save then
				vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format {
							bufnr = bufnr,
							name = "null-ls",
						}
						vim.notify(
							string.format("[%s] Format successfully!", client.name),
							vim.log.levels.INFO,
							{ title = "LspFormat" }
						)
					end,
				})
			end
		end,
	}
end
