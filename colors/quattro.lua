vim.cmd "hi clear"

if 1 == vim.fn.exists "syntax_on" then vim.cmd "syntax reset" end

vim.g.colors_name = "quattro"
vim.opt.termguicolors = true

local variants = {
	l = { "#faf4ed", "#fffaf3", "#575279", "#286983" },
	d = { "#191724", "#1f1d2e", "#e0def4", "#31748f" },
}

-- Match palette to vim background
local p = vim.o.background == "light" and variants.l or variants.d

local h = function(group, color) return vim.api.nvim_set_hl(0, group, color) end

-- Interface
h("Normal", { fg = p[3], bg = p[1] })
h("SignColumn", { bg = p[1] })
h("StatusLine", { fg = p[1], bg = p[4] })
h("StatusLineNC", { fg = p[3], bg = p[2] })

-- Syntax
h("Boolean", { fg = p[3] })
h("Character", { fg = p[3] })
h("Comment", { fg = p[3], italic = true })
h("Conditional", { fg = p[3] })
h("Constant", { fg = p[3] })
h("Debug", { fg = p[3] })
h("Define", { fg = p[3] })
h("Exception", { fg = p[3] })
h("Float", { fg = p[3] })
h("Function", { fg = p[3] })
h("Include", { fg = p[3] })
h("Keyword", { fg = p[3] })
h("Label", { fg = p[3] })
h("Macro", { fg = p[3] })
h("Number", { fg = p[3] })
h("Operator", { fg = p[4] })
h("PreProc", { fg = p[3] })
h("StorageClass", { fg = p[3] })
h("String", { fg = p[3] })
h("Structure", { fg = p[3] })
h("Tag", { fg = p[3] })
h("Title", { fg = p[3] })
h("Todo", { fg = p[4] })
h("Type", { fg = p[3] })
h("Typedef", { fg = p[3] })
h("Underlined", { fg = p[3], underline = true })

h("@boolean", { link = "Boolean" })
h("@character", { link = "Character" })
h("@character.special", { link = "@character" })
h("@class", { fg = p[3] })
h("@comment", { link = "Comment" })
h("@conditional", { link = "Conditional" })
h("@constant", { link = "Constant" })
h("@constant.builtin", { link = "@constant" })
h("@constant.macro", { link = "@constant" })
h("@constructor", { fg = p[3] })
h("@debug", { link = "Debug" })
h("@decorator", { fg = p[3] })
h("@define", { link = "Define" })
h("@enum", { fg = p[3] })
h("@enumMember", { fg = p[3] })
h("@event", { fg = p[3] })
h("@exception", { link = "Exception" })
h("@field", { fg = p[3] })
h("@float", { link = "Float" })
h("@function", { link = "Function" })
h("@function.builtin", { link = "@function" })
h("@function.macro", { link = "@function" })
h("@include", { link = "Include" })
h("@interface", { fg = p[3] })
h("@keyword", { link = "Keyword" })
h("@label", { link = "Label" })
h("@macro", { link = "Macro" })
h("@method", { fg = p[3] })
h("@modifier", { fg = p[3] })
h("@namespace", { fg = p[3] })
h("@number", { link = "Number" })
h("@operator", { link = "Operator" })
h("@parameter", { fg = p[3] })
h("@preproc", { link = "PreProc" })
h("@property", { fg = p[3] })
h("@punctuation", { fg = p[3] })
h("@regexp", { fg = p[3] })
h("@repeat", { fg = p[3] })
h("@storageclass", { link = "StorageClass" })
h("@string", { link = "String" })
h("@string.escape", { link = "@string" })
h("@string.special", { link = "@string" })
h("@struct", { link = "Structure" })
h("@tag", { link = "Tag" })
h("@tag.delimiter", { fg = p[3] })
h("@text", { fg = p[3] })
h("@text.literal", { link = "@text" })
h("@text.reference", { link = "@text" })
h("@text.title", { link = "Title" })
h("@text.todo", { link = "Todo" })
h("@text.underline", { link = "Underlined" })
h("@text.uri", { link = "@text" })
h("@type", { link = "Type" })
h("@type.definition", { link = "Typedef" })
h("@typeParameter", { fg = p[3] })
h("@variable", { fg = p[3] })
