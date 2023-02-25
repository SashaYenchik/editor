local api = vim.api

-- disable laststatus on non-file buffers
api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function(event)
		local real_file = vim.fn.filereadable(event.file) == 1
		local no_name = event.file == "" and vim.bo[event.buf].buftype == ""
		if not real_file and not no_name then return end
		vim.opt.laststatus = 0
	end,
})
api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function() vim.opt.laststatus = 3 end,
})

-- auto close NvimTree
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
	pattern = "NvimTree_*",
	callback = function()
		local layout = vim.api.nvim_call_function("winlayout", {})
		if
			layout[1] == "leaf"
			and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree"
			and layout[3] == nil
		then
			vim.api.nvim_command [[confirm quit]]
		end
	end,
})

-- close some filetypes with <q>
api.nvim_create_autocmd("FileType", {
	pattern = {
		"qf",
		"help",
		"man",
		"prompt",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neorepl",
		"alpha",
		"toggleterm",
		"health",
		"PlenaryTestPopup",
		"nofile",
		"",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.api.nvim_buf_set_keymap(event.buf, "n", "q", "<CMD>close<CR>", { silent = true })
	end,
})

-- Makes switching between buffer and termmode feels like normal mode
api.nvim_create_autocmd("TermOpen", {
	pattern = "term://*",
	callback = function()
		local opts = { noremap = true, silent = true }
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

-- no comments on new line
vim.api.nvim_create_autocmd({ "BufWinEnter", "BufRead", "BufNewFile" }, {
	command = "setlocal formatoptions-=c",
})

-- Check if we need to reload the file when it changed
api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	pattern = "*",
	command = "checktime",
})
vim.api.nvim_create_autocmd("VimResized", { command = "tabdo wincmd =" })

local bufs_id = api.nvim_create_augroup("EditorBufs", { clear = true })
-- source vimrc on save
api.nvim_create_autocmd("BufWritePost", {
	group = bufs_id,
	pattern = "$VIM_PATH/{*.vim,*.yaml,vimrc}",
	command = "source $MYVIMRC | redraw",
	nested = true,
})
-- Reload Vim script automatically if setlocal autoread
api.nvim_create_autocmd({ "BufWritePost", "FileWritePost" }, {
	group = bufs_id,
	pattern = "*.vim",
	command = "if &l:autoread > 0 | source <afile> | echo 'source ' . bufname('%') | endif",
	nested = true,
})
-- Set noundofile for temporary files
api.nvim_create_autocmd("BufWritePre", {
	group = bufs_id,
	pattern = { "/tmp/*", "*.tmp", "*.bak" },
	command = "setlocal noundofile",
})
-- set filetype for header files
api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	group = bufs_id,
	pattern = { "*.h", "*.hpp", "*.hxx", "*.hh" },
	command = "setlocal filetype=c",
})

local ft_id = api.nvim_create_augroup("EditorFt", { clear = true })
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

local yank_id = api.nvim_create_augroup("yank", { clear = true })
-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
	group = yank_id,
	pattern = "*",
	callback = function(_) vim.highlight.on_yank { higroup = "IncSearch", timeout = 300 } end,
})
