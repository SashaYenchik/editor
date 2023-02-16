local data = {
	kind = {
		Class = "ﴯ",
		Color = "",
		Constant = "",
		Constructor = "",
		Enum = "",
		EnumMember = "",
		Event = "",
		Field = "",
		File = "",
		Folder = "",
		Function = "",
		Interface = "",
		Keyword = "",
		Method = "",
		Module = "",
		Namespace = "",
		Number = "",
		Operator = "",
		Package = "",
		Property = "ﰠ",
		Reference = "",
		Snippet = "",
		Struct = "",
		Text = "",
		TypeParameter = "",
		Unit = "",
		Value = "",
		Variable = "",
		-- ccls-specific icons.
		TypeAlias = "",
		Parameter = "",
		StaticMethod = "",
		Macro = "",
	},
	type = {
		Array = "",
		Boolean = "",
		Null = "ﳠ",
		Number = "",
		Object = "",
		String = "",
	},
	documents = {
		Default = "",
		File = "",
		Files = "",
		FileTree = "פּ",
		Import = "",
		Symlink = "",
	},
	git = {
		Add = "",
		Branch = "",
		Diff = "",
		Git = "",
		Ignore = "",
		Mod = "M",
		ModHolo = "",
		Remove = "",
		Rename = "",
		Repo = "",
		Unmerged = "שׂ",
		Untracked = "ﲉ",
		Unstaged = "",
		Staged = "",
		Conflict = "",
	},
	ui = {
		ArrowClosed = "",
		ArrowOpen = "",
		BigCircle = "",
		BigUnfilledCircle = "",
		BookMark = "",
		Bug = "",
		Calendar = "",
		Check = "",
		ChevronRight = "",
		Circle = "",
		Close = "",
		CloseHolo = "",
		CloudDownload = "",
		Comment = "",
		CodeAction = "",
		Dashboard = "",
		Emoji = "",
		EmptyFolder = "",
		EmptyFolderOpen = "",
		File = "",
		Fire = "",
		Folder = "",
		FolderOpen = "",
		Gear = "",
		History = "",
		Incoming = "",
		Indicator = "",
		Keyboard = "",
		Left = "",
		List = "",
		Square = "",
		SymlinkFolder = "",
		Lock = "",
		Modified = "✥",
		ModifiedHolo = "",
		NewFile = "",
		Newspaper = "",
		Note = "",
		Outgoing = "",
		Package = "",
		Pencil = "",
		Perf = "",
		Play = "",
		Project = "",
		Right = "",
		RootFolderOpened = "",
		Search = "",
		Separator = "",
		DoubleSeparator = "",
		SignIn = "",
		SignOut = "",
		Sort = "",
		Spell = "暈",
		Symlink = "",
		Table = "",
		Telescope = "",
	},
	diagnostics = {
		Error = "",
		Warning = "",
		Information = "",
		Question = "",
		Hint = "",
		-- Holo version
		ErrorHolo = "",
		WarningHolo = "",
		InformationHolo = "",
		QuestionHolo = "",
		HintHolo = "",
	},
	misc = {
		Campass = "",
		Code = "",
		EscapeST = "✺",
		Gavel = "",
		Glass = "",
		PyEnv = "",
		Squirrel = "",
		Tag = "",
		Tree = "",
		Watch = "",
		Lego = "",
		Vbar = "│",
		Add = "+",
		Added = "",
		Ghost = "",
		ManUp = "",
		Vim = "",
		SimpleVim = "",
		SingleWheel = "",
		MultipleWheels = "",
		FindFile = "",
		WordFind = "",
		Rocket = "",
		BentoBox = "🍱",
	},
	cmp = {
		Copilot = "",
		CopilotHolo = "",
		nvim_lsp = "",
		nvim_lua = "",
		path = "",
		buffer = "",
		spell = "暈",
		luasnip = "",
		treesitter = "",
	},
	dap = {
		Breakpoint = "",
		BreakpointCondition = "ﳁ",
		BreakpointRejected = "",
		LogPoint = "",
		Pause = "",
		Play = "",
		RunLast = "↻",
		StepBack = "",
		StepInto = "",
		StepOut = "",
		StepOver = "",
		Stopped = "",
		Terminate = "ﱢ",
	},
}

local icons = {}

for key, table in pairs(data) do
	icons[key] = setmetatable({}, {
		__index = function(_, k) return table[k] end,
	})
	icons[key .. "_space"] = setmetatable({}, {
		__index = function(_, k) return table[k] .. " " end,
	})
end

local M = {
	adapters = {},
	servers = {},
}

for package, table in pairs(M) do
	setmetatable(table, {
		__index = function(t, k)
			local ok, builtin = pcall(require, string.format("zox.%s.%s", package, k))
			if not ok then
				vim.notify(
					string.format(
						"Failed to load '%s' for '%s'; make sure '%s' is available.",
						k,
						package,
						k
					),
					vim.log.levels.DEBUG,
					{ title = "zox: configuration" }
				)
				return
			end
			rawset(t, k, builtin)
			return builtin
		end,
	})
end

return setmetatable(M, {
	__index = function(t, k)
		if vim.tbl_contains(vim.tbl_keys(icons), k) then
			return icons[k]
		else
			if not rawget(t, k) then
				vim.notify(
					string.format(
						"Failed to load builtin table for package '%s'; make sure '%s' is available in zox.",
						k,
						k
					),
					vim.log.levels.WARN,
					{ title = "zox: configuration" }
				)
			end
			return rawget(t, k)
		end
	end,
})
