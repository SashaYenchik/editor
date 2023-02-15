local api = vim.api

-- default options
local misc_id = api.nvim_create_augroup("MiscBufs", { clear = true })

-- close some filetypes with <q>
api.nvim_create_autocmd("FileType", {
	group = misc_id,
	pattern = {
		"qf",
		"help",
		"man",
		"notify",
		"lspinfo",
		"terminal",
		"prompt",
		"toggleterm",
		"copilot",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"PlenaryTestPopup",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.api.nvim_buf_set_keymap(event.buf, "n", "q", "<CMD>close<CR>", { silent = true })
	end,
})

-- register lazy command keymap
api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	group = misc_id,
	pattern = "*",
	callback = function(_)
		local k = require "zox.keybind"
		k.nvim_register_mapping {
			["n|<Leader>lh"] = k.cr("Lazy"):with_nowait():with_defaults "package: Show",
			["n|<Leader>ls"] = k.cr("Lazy sync"):with_nowait():with_defaults "package: Sync",
			["n|<Leader>lu"] = k.cr("Lazy update"):with_nowait():with_defaults "package: Update",
			["n|<Leader>li"] = k.cr("Lazy install"):with_nowait():with_defaults "package: Install",
			["n|<Leader>ll"] = k.cr("Lazy log"):with_nowait():with_defaults "package: Log",
			["n|<Leader>lc"] = k.cr("Lazy check"):with_nowait():with_defaults "package: Check",
			["n|<Leader>ld"] = k.cr("Lazy debug"):with_nowait():with_defaults "package: Debug",
			["n|<Leader>lp"] = k.cr("Lazy profile"):with_nowait():with_defaults "package: Profile",
			["n|<Leader>lr"] = k.cr("Lazy restore"):with_nowait():with_defaults "package: Restore",
			["n|<Leader>lx"] = k.cr("Lazy clean"):with_nowait():with_defaults "package: Clean",
		}
	end,
})

-- Makes switching between buffer and termmode feels like normal mode
api.nvim_create_autocmd("TermOpen", {
	group = misc_id,
	pattern = "term://*",
	callback = function()
		local opts = { noremap = true, silent = true }
		api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
		api.nvim_buf_set_keymap(0, "t", "kk", [[<C-\><C-n>]], opts)
		api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
		api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
		api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
		api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
	end,
})
-- Fix fold issue of files opened by telescope
vim.api.nvim_create_autocmd("BufRead", {
	callback = function()
		vim.api.nvim_create_autocmd("BufWinEnter", {
			once = true,
			command = "normal! zx",
		})
	end,
})

local bufs_id = api.nvim_create_augroup("EditorBufs", { clear = true })
-- Set noundofile for temporary files
api.nvim_create_autocmd("BufWritePre", {
	group = bufs_id,
	pattern = { "/tmp/*", "*.tmp", "*.bak" },
	command = "setlocal noundofile",
})
-- auto change directory
-- auto place to last edit
api.nvim_create_autocmd("BufReadPost", {
	group = bufs_id,
	pattern = "*",
	command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif]],
})
-- set filetype for header files
api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = bufs_id,
	pattern = { "*.h", "*.hpp", "*.hxx", "*.hh" },
	command = "setlocal filetype=c",
})

local wins_id = api.nvim_create_augroup("EditorWins", { clear = true })
-- Force write shada on leaving nvim
api.nvim_create_autocmd("VimLeave", {
	group = wins_id,
	pattern = "*",
	callback = function(_)
		if vim.fn.has "nvim" == 1 then
			api.nvim_command [[wshada!]]
		else
			api.nvim_command [[wviminfo!]]
		end
	end,
})
-- Check if we need to reload the file when it changed
api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = wins_id,
	pattern = "*",
	command = "checktime",
})
-- Equalize window dimensions when resizing vim window
api.nvim_create_autocmd("VimResized", {
	group = wins_id,
	pattern = "*",
	command = "tabdo wincmd =",
})

local ft_id = api.nvim_create_augroup("EditorFt", { clear = true })
api.nvim_create_autocmd("FileType", {
	group = ft_id,
	pattern = "markdown",
	command = "set wrap",
})
api.nvim_create_autocmd("FileType", {
	group = ft_id,
	pattern = "dap-repl",
	callback = function(_) require("dap.ext.autocompl").attach() end,
})
-- Set mapping for switching header and source file
api.nvim_create_autocmd("FileType", {
	group = ft_id,
	pattern = "c,cpp",
	callback = function(event)
		api.nvim_buf_set_keymap(
			event.buf,
			"n",
			"<Leader><Leader>h",
			":ClangdSwitchSourceHeaderVSplit<CR>",
			{ noremap = true }
		)
		api.nvim_buf_set_keymap(
			event.buf,
			"n",
			"<Leader><Leader>v",
			":ClangdSwitchSourceHeaderSplit<CR>",
			{ noremap = true }
		)
		api.nvim_buf_set_keymap(
			event.buf,
			"n",
			"<Leader><Leader>oh",
			":ClangdSwitchSourceHeader<CR>",
			{ noremap = true }
		)
	end,
})
-- set filetype for bazel files
api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = ft_id,
	pattern = { "*.bazel", "WORKSPACE", "BUILD", "*.bzlmod" },
	command = "setf bzl",
})
-- set filetype for docker files
api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = ft_id,
	pattern = { "Dockerfile-*", "Dockerfile.{tpl,template,tmpl}", "*.{Dockerfile,dockerfile}" },
	command = "setf dockerfile",
})
api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = ft_id,
	pattern = { "*.{tpl,template,tmpl,j2,jinja}" },
	command = "setf html",
})
-- set shiftwidth and tabstop for lua and nix files
api.nvim_create_autocmd("FileType", {
	group = ft_id,
	pattern = { "lua", "nix" },
	command = "set noexpandtab shiftwidth=2 tabstop=2",
})
vim.api.nvim_create_autocmd("FileType", {
	group = ft_id,
	pattern = { "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	group = ft_id,
	pattern = { "make" },
	callback = function()
		vim.opt_local.expandtab = false
		vim.opt_local.shiftwidth = 8
		vim.opt_local.softtabstop = 0
	end,
})

local yank_id = api.nvim_create_augroup("yank", { clear = true })
-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
	group = yank_id,
	pattern = "*",
	callback = function(_) vim.highlight.on_yank { higroup = "IncSearch", timeout = 300 } end,
})