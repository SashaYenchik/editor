return {
	{
		"nathom/filetype.nvim",
		lazy = true,
		event = "BufReadPost",
		opts = {
			overrides = {
				extension = {
					conf = "conf",
					mdx = "markdown",
					mjml = "html",
					sh = "bash",
				},
				complex = {
					[".*%.env.*"] = "sh",
					["ignore$"] = "conf",
					["*.rc"] = "conf",
					["yup.lock"] = "yaml",
					["WORKSPACE"] = "bzl",
					["BUILD"] = "bzl",
				},
				shebang = { dash = "sh" },
			},
		},
	},
	{
		dir = vim.fn.stdpath "config" .. "/rose-pine",
		lazy = false,
		branch = "canary",
		priority = 1000,
		opts = {
			disable_italics = true,
			disable_float_background = true,
			highlight_groups = {
				Comment = { fg = "muted", italic = true },
				StatusLine = { fg = "rose", bg = "iris", blend = 10 },
				StatusLineNC = { fg = "subtle", bg = "surface" },
			},
		},
	},
	{ "stevearc/dressing.nvim", event = "BufReadPost", opts = { input = { insert_only = false } } },
	{
		"folke/noice.nvim",
		lazy = true,
		event = "BufReadPost",
		dependencies = { { "MunifTanjim/nui.nvim", lazy = true } },
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = { command_palette = true, lsp_doc_border = true },
			routes = {
				{ view = "mini", filter = { event = "msg_showmode" } },
				{
					filter = { event = "msg_show", kind = "", find = "written" },
					opts = { skip = true },
				},
				{
					filter = { event = "msg_show", kind = "search_count" },
					opts = { skip = true },
				},
			},
		},
	},
	{
		"zbirenbaum/neodim",
		lazy = true,
		event = "LspAttach",
		opts = {
			blend_color = require("zox.utils").hl_to_rgb("Normal", true),
			update_in_insert = { delay = 100 },
		},
	},
	{
		"folke/todo-comments.nvim",
		lazy = true,
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = "BufReadPost",
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true,
		event = "BufReadPost",
		opts = {
			show_first_indent_level = true,
			buftype_exclude = { "terminal", "nofile" },
			show_trailing_blankline_indent = false,
			show_current_context = true,
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = { "CursorHoldI", "CursorHold" },
		opts = {
			numhl = true,
			word_diff = false,
			current_line_blame = false,
			current_line_blame_opts = { virtual_text_pos = "eol" },
			diff_opts = { internal = true },
			on_attach = function(bufnr)
				local k = require "zox.keybind"

				local ok, _ = require "gitsigns"
				if not ok then return end

				k.nvim_register_mapping {
					["n|]g"] = k.callback(function()
						if vim.wo.diff then return "]g" end
						vim.schedule(function() require("gitsigns.actions").next_hunk() end)
						return "<Ignore>"
					end)
						:with_buffer(bufnr)
						:with_expr()
						:with_desc "git: Goto next hunk",
					["n|[g"] = k.callback(function()
						if vim.wo.diff then return "[g" end
						vim.schedule(function() require("gitsigns.actions").prev_hunk() end)
						return "<Ignore>"
					end)
						:with_buffer(bufnr)
						:with_expr()
						:with_desc "git: Goto prev hunk",
					["n|<Leader>hs"] = k.callback(
						function() require("gitsigns.actions").stage_hunk() end
					)
						:with_buffer(bufnr)
						:with_desc "git: Stage hunk",
					["v|<Leader>hs"] = k.callback(
						function()
							require("gitsigns.actions").stage_hunk {
								vim.fn.line ".",
								vim.fn.line "v",
							}
						end
					)
						:with_buffer(bufnr)
						:with_desc "git: undo stage hunk",
					["n|<Leader>hu"] = k.callback(
						function() require("gitsigns.actions").undo_stage_hunk() end
					)
						:with_buffer(bufnr)
						:with_desc "git: Undo stage hunk",
					["n|<Leader>hr"] = k.callback(
						function() require("gitsigns.actions").reset_hunk() end
					)
						:with_buffer(bufnr)
						:with_desc "git: Reset hunk",
					["v|<Leader>hr"] = k.callback(
						function()
							require("gitsigns.actions").reset_hunk {
								vim.fn.line ".",
								vim.fn.line "v",
							}
						end
					)
						:with_buffer(bufnr)
						:with_desc "git: Reset hunk",
					["n|<Leader>hR"] = k.callback(
						function() require("gitsigns.actions").reset_buffer() end
					)
						:with_buffer(bufnr)
						:with_desc "git: Reset buffer",
					["n|<Leader>hp"] = k.callback(
						function() require("gitsigns.actions").preview_hunk() end
					)
						:with_buffer(bufnr)
						:with_desc "git: Preview hunk",
					["n|<Leader>hb"] = k.callback(
						function() require("gitsigns.actions").blame_line { full = true } end
					)
						:with_buffer(bufnr)
						:with_desc "git: Blame line",
					-- Text objects
					["o|ih"] = k.callback(function() require("gitsigns.actions").text_object() end)
						:with_buffer(bufnr),
					["x|ih"] = k.callback(function() require("gitsigns.actions").text_object() end)
						:with_buffer(bufnr),
				}
			end,
		},
	},
	{
		"folke/trouble.nvim",
		lazy = true,
		cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
		event = "BufReadPost",
		keys = {
			{ "gt", "<cmd>TroubleToggle<cr>", desc = "lsp: Toggle trouble list" },
			{ "gR", "<cmd>TroubleToggle lsp_references<cr>", desc = "lsp: Show lsp references" },
		},
		config = true,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufReadPost",
		lazy = true,
		dependencies = {
			{ "romgrk/nvim-treesitter-context" },
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
			{
				"andymass/vim-matchup",
				event = "BufReadPost",
				config = function()
					vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
				end,
			},
			{
				"NvChad/nvim-colorizer.lua",
				opts = {
					filetypes = { "*", "!lazy" },
					buftype = { "*", "!prompt", "!nofile" },
					user_default_options = {
						RGB = true, -- #RGB hex codes
						RRGGBB = true, -- #RRGGBB hex codes
						names = false, -- "Name" codes like Blue
						RRGGBBAA = true, -- #RRGGBBAA hex codes
						AARRGGBB = false, -- 0xAARRGGBB hex codes
						rgb_fn = true, -- CSS rgb() and rgba() functions
						hsl_fn = true, -- CSS hsl() and hsla() functions
						css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
						css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
						mode = "background", -- `mode`: foreground, background,  virtualtext
					},
				},
			},
		},
		keys = { { "<LocalLeader>Ts", vim.treesitter.show_tree, desc = "treesitter: show tree" } },
		opts = {
			ensure_installed = "all",
			ignore_install = { "phpdoc", "gitcommit" },
			indent = { enable = false },
			highlight = { enable = true },
			context_commentstring = { enable = true, enable_autocmd = false },
			matchup = { enable = true },
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@conditional.outer",
						["ic"] = "@conditional.inner",
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
						["aS"] = "@statement.outer",
						["aC"] = "@class.outer",
						["iC"] = "@class.inner",
						["al"] = "@loop.outer",
						["il"] = "@loop.inner",
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>Pa"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>PA"] = "@parameter.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]]"] = "@function.outer",
						["]c"] = "@class.outer",
					},
					goto_next_end = {
						["]["] = "@function.outer",
						["]C"] = "@class.outer",
					},
					goto_previous_start = {
						["[["] = "@function.outer",
						["[c"] = "@class.outer",
					},
					goto_previous_end = {
						["[]"] = "@function.outer",
						["[C"] = "@class.outer",
					},
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
			-- Use treesitter markdown parser for Octo buffer
			local ok, _ = pcall(require, "octo")
			if ok then
				require("nvim-treesitter.parsers").filetype_to_parsername.octo = "markdown"
			end
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		event = "BufReadPost",
		opts = {
			override = {
				zsh = {
					icon = "",
					color = "#428850",
					cterm_color = "65",
					name = "Zsh",
				},
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		event = "BufRead",
		cmd = "Telescope",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{
				"ahmedkhalf/project.nvim",
				lazy = true,
				event = "BufReadPost",
				opts = {
					ignore_lsp = { "null-ls", "copilot" },
					show_hidden = true,
					silent_chdir = true,
					scope_chdir = "win",
				},
				config = function(_, opts) require("project_nvim").setup(opts) end,
			},
		},
		keys = {
			{
				"<leader>f",
				"<cmd>Telescope find_files find_command=fd,-t,f,-H,-E,.git,--strip-cwd-prefix theme=dropdown previewer=false<cr>",
				desc = "find: file in project",
			},
			{
				"<leader>r",
				"<cmd>Telescope git_files find_command=fd,-t,f,-H,-E,.git,--strip-cwd-prefix theme=dropdown previewer=false<cr>",
				desc = "find: recent files",
			},
			{
				"<leader>w",
				"",
				desc = "find: text",
				callback = function()
					require("telescope").extensions.live_grep_args.live_grep_args()
				end,
			},
			{
				"<leader>/",
				"<cmd>Telescope grep_string<cr>",
				desc = "find: Current word",
			},
			{
				"<leader>b",
				"<cmd>Telescope buffers previewer=false<cr>",
				desc = "find: Buffer opened",
			},
			{
				"<leader>n",
				"<C-u>enew<CR>",
				desc = "buffer: New",
			},
			{
				"<leader>\\",
				function()
					require("telescope").extensions.projects.projects { promp_title = "Projects" }
				end,
				desc = "find: Projects",
			},
			{
				"<C-p>",
				"",
				desc = "tools: Show keymap legends",
				callback = function()
					require("telescope.builtin").keymaps {
						lhs_filter = function(lhs) return not string.find(lhs, "Þ") end,
						layout_config = {
							width = 0.6,
							height = 0.6,
							prompt_position = "top",
						},
					}
				end,
			},
		},
		config = function()
			require("telescope").setup {
				defaults = {
					prompt_prefix = " " .. require("zox").ui_space.Telescope .. " ",
					selection_caret = require("zox").ui_space.DoubleSeparator,
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
					},
					file_ignore_patterns = { ".git", "%.egg-info" },
					mappings = {
						i = {
							["<C-a>"] = { "<esc>0i", type = "command" },
							["<Esc>"] = require("telescope.actions").close,
						},
						n = { ["q"] = require("telescope.actions").close },
					},
					layout_strategy = "horizontal",
					layout_config = { width = 0.6, height = 0.6, prompt_position = "top" },
				},
				extensions = {
					live_grep_args = {
						auto_quoting = false,
						mappings = {
							i = {
								["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
								["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt {
									postfix = " --iglob ",
								},
							},
						},
					},
				},
				pickers = {
					find_files = { hidden = true },
					live_grep = {
						on_input_filter_cb = function(prompt)
							-- AND operator for live_grep like how fzf handles spaces with wildcards in rg
							return { prompt = prompt:gsub("%s", ".*") }
						end,
						attach_mappings = function(_)
							require("telescope.actions.set").select:enhance {
								post = function() vim.cmd ":normal! zx" end,
							}
							return true
						end,
					},
				},
			}
			for _, v in ipairs { "live_grep_args", "projects", "fzf" } do
				require("telescope").load_extension(v)
			end
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		cmd = {
			"NvimTreeToggle",
			"NvimTreeOpen",
			"NvimTreeFindFile",
			"NvimTreeFindFileToggle",
			"NvimTreeRefresh",
		},
		keys = {
			{
				"<C-n>",
				"<cmd>NvimTreeFindFileToggle<cr>",
				desc = "Toggle file tree",
			},
		},
		opts = {
			actions = { open_file = { quit_on_open = true } },
			reload_on_bufenter = true,
			sync_root_with_cwd = true,
			update_focused_file = { enable = true, update_root = true },
			git = { ignore = false },
			filters = { custom = { "^.git$", ".DS_Store", "__pycache__", "lazy-lock.json" } },
			renderer = {
				group_empty = true,
				highlight_opened_files = "none",
				indent_markers = { enable = true },
				root_folder_label = ":.:s?.*?/..?",
				root_folder_modifier = ":e",
				icons = { symlink_arrow = "  " },
			},
			trash = {
				cmd = require("zox.utils").get_binary_path "rip",
				require_confirm = true,
			},
			view = { adaptive_size = false, side = "right" },
		},
	},
	{
		"nvim-pack/nvim-spectre",
		lazy = true,
		build = "./build.sh nvim_oxi",
		module = "spectre",
		event = { "CursorHold", "CursorHoldI" },
		keys = function()
			local k = require "zox.keybind"

			return k.to_lazy_mapping {
				["v|<Leader>sv"] = k.callback(function() require("spectre").open_visual() end)
					:with_defaults "replace: Open visual replace",
				["n|<Leader>so"] = k.callback(function() require("spectre").open() end)
					:with_defaults "replace: Open panel",
				["n|<Leader>sw"] = k.callback(
					function() require("spectre").open_visual { select_word = true } end
				):with_defaults "replace: Replace word under cursor",
				["n|<Leader>sp"] = k.callback(function() require("spectre").open_file_search() end)
					:with_defaults "replace: Replace word under file search",
			}
		end,
		opts = {
			live_update = true,
			mapping = {
				["change_replace_sed"] = {
					map = "<LocalLeader>trs",
					cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
					desc = "replace: Using sed",
				},
				["change_replace_oxi"] = {
					map = "<LocalLeader>tro",
					cmd = "<cmd>lua require('spectre').change_engine_replace('oxi')<CR>",
					desc = "replace: Using oxi",
				},
				["toggle_live_update"] = {
					map = "<LocalLeader>tu",
					cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
					desc = "replace: update live changes",
				},
				-- only work if the find_engine following have that option
				["toggle_ignore_case"] = {
					map = "<LocalLeader>ti",
					cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
					desc = "replace: toggle ignore case",
				},
				["toggle_ignore_hidden"] = {
					map = "<LocalLeader>th",
					cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
					desc = "replace: toggle search hidden",
				},
			},
		},
	},
	{
		"akinsho/toggleterm.nvim",
		lazy = true,
		event = { "CursorHold", "CursorHoldI" },
		opts = {
			-- size can be a number or function which is passed the current terminal
			size = function(term)
				local factor = 0.3
				if term.direction == "horizontal" then
					return vim.o.lines * factor
				elseif term.direction == "vertical" then
					return vim.o.columns * factor
				end
			end,
			open_mapping = "<C-t>", -- default mapping
			shade_terminals = false,
		},
	},
	--- NOTE: bufferline
	{
		"akinsho/nvim-bufferline.lua",
		lazy = true,
		branch = "main",
		event = { "BufReadPost", "BufRead" },
		keys = function()
			local k = require "zox.keybind"

			return k.to_lazy_mapping {
				["n|<LocalLeader>p"] = k.cr("BufferLinePick"):with_defaults "buffer: Pick",
				["n|<LocalLeader>c"] = k.cr("BufferLinePickClose"):with_defaults "buffer: Close",
				["n|<Leader>."] = k.cr("BufferLineCycleNext")
					:with_defaults "buffer: Cycle to next buffer",
				["n|<Leader>,"] = k.cr("BufferLineCyclePrev")
					:with_defaults "buffer: Cycle to previous buffer",
				["n|<Leader>1"] = k.cr("BufferLineGoToBuffer 1")
					:with_defaults "buffer: Goto buffer 1",
				["n|<Leader>2"] = k.cr("BufferLineGoToBuffer 2")
					:with_defaults "buffer: Goto buffer 2",
				["n|<Leader>3"] = k.cr("BufferLineGoToBuffer 3")
					:with_defaults "buffer: Goto buffer 3",
				["n|<Leader>4"] = k.cr("BufferLineGoToBuffer 4")
					:with_defaults "buffer: Goto buffer 4",
				["n|<Leader>5"] = k.cr("BufferLineGoToBuffer 5")
					:with_defaults "buffer: Goto buffer 5",
				["n|<Leader>6"] = k.cr("BufferLineGoToBuffer 6")
					:with_defaults "buffer: Goto buffer 6",
				["n|<Leader>7"] = k.cr("BufferLineGoToBuffer 7")
					:with_defaults "buffer: Goto buffer 7",
				["n|<Leader>8"] = k.cr("BufferLineGoToBuffer 8")
					:with_defaults "buffer: Goto buffer 8",
				["n|<Leader>9"] = k.cr("BufferLineGoToBuffer 9")
					:with_defaults "buffer: Goto buffer 9",
			}
		end,
		opts = {
			options = {
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "center",
						padding = 1,
					},
				},
			},
		},
	},
	--- NOTE: lualine
	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
		event = "BufReadPost",
		config = function()
			local escape_status = function()
				local ok, m = pcall(require, "better_escape")
				return ok and m.waiting and require("zox").misc_space.EscapeST or ""
			end

			local _cache = { context = "", bufnr = -1 }
			local lspsaga_symbols = function()
				if
					vim.api.nvim_win_get_config(0).zindex
					or vim.tbl_contains({
						"terminal",
						"toggleterm",
						"prompt",
						"alpha",
						"dashboard",
						"help",
						"TelescopePrompt",
					}, vim.bo.filetype)
				then
					return "" -- Excluded filetypes
				else
					local currbuf = vim.api.nvim_get_current_buf()
					local ok, lspsaga = pcall(require, "lspsaga.symbolwinbar")
					if ok and lspsaga:get_winbar() ~= nil then
						_cache.context = lspsaga:get_winbar()
						_cache.bufnr = currbuf
					elseif _cache.bufnr ~= currbuf then
						_cache.context = "" -- NOTE: Reset [invalid] cache (usually from another buffer)
					end

					return _cache.context
				end
			end

			local diff_source = function()
				---@diagnostic disable-next-line: undefined-field
				local gitsigns = vim.b.gitsigns_status_dict
				if gitsigns then
					return {
						added = gitsigns.added,
						modified = gitsigns.changed,
						removed = gitsigns.removed,
					}
				end
			end

			local get_cwd = function()
				local cwd = vim.fn.getcwd()
				if vim.loop.os_uname().sysname ~= "Windows_NT" then
					local home = os.getenv "HOME"
					if home and cwd:find(home, 1, true) == 1 then
						cwd = "~" .. cwd:sub(#home + 1)
					end
				end
				return require("zox").ui_space.RootFolderOpened .. cwd
			end

			local mini_sections = {
				lualine_a = { "filetype" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			}
			local outline = {
				sections = mini_sections,
				filetypes = { "lspsagaoutline" },
			}
			local diffview = {
				sections = mini_sections,
				filetypes = { "DiffviewFiles" },
			}

			require("lualine").setup {
				options = {
					theme = "auto",
					disabled_filetypes = {
						statusline = {
							"alpha",
							"dashboard",
							"NvimTree",
							"prompt",
							"toggleterm",
							"terminal",
							"help",
							"lspsagaoutine",
							"DiffviewFiles",
							"TelescopePrompt",
							"nofile",
							"",
						},
					},
					component_separators = "|",
					section_separators = { left = "", right = "" },
					globalstatus = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						{ "branch", icons_enabled = true, icon = require("zox").git.Branch },
						{ "diff", source = diff_source },
					},
					lualine_c = { lspsaga_symbols },
					lualine_x = {
						{ escape_status },
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
							symbols = {
								error = require("zox").diagnostics_space.Error,
								warn = require("zox").diagnostics_space.Warning,
								info = require("zox").diagnostics_space.Information,
							},
						},
						{ get_cwd },
					},
					lualine_y = {},
					lualine_z = { "progress", "location" },
				},
				inactive_sections = {},
				tabline = {},
				extensions = {
					"quickfix",
					"nvim-tree",
					"toggleterm",
					"fugitive",
					outline,
					diffview,
				},
			}

			-- Properly set background color for lspsaga
			for _, hlGroup in pairs(require("lspsaga.lspkind").get_kind()) do
				require("zox.utils").extend_hl("LspSagaWinbar" .. hlGroup[1])
			end
			require("zox.utils").extend_hl "LspSagaWinbarSep"
		end,
	},
}
