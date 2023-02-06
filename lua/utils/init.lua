local M = {}

---@class palette
---@field rosewater string
---@field flamingo string
---@field mauve string
---@field pink string
---@field red string
---@field maroon string
---@field peach string
---@field yellow string
---@field green string
---@field sapphire string
---@field blue string
---@field sky string
---@field teal string
---@field lavender string
---@field text string
---@field subtext1 string
---@field subtext0 string
---@field overlay2 string
---@field overlay1 string
---@field overlay0 string
---@field surface2 string
---@field surface1 string
---@field surface0 string
---@field base string
---@field mantle string
---@field crust string
---@field none "NONE"

---@type palette
local palette = nil

---Initialize the palette
---@return palette
local init_palette = function()
  if not palette then
    palette = vim.g.colors_name == "catppuccin" and require("catppuccin.palettes").get_palette()
      or {
        rosewater = "#DC8A78",
        flamingo = "#DD7878",
        mauve = "#CBA6F7",
        pink = "#F5C2E7",
        red = "#E95678",
        maroon = "#B33076",
        peach = "#FF8700",
        yellow = "#F7BB3B",
        green = "#AFD700",
        sapphire = "#36D0E0",
        blue = "#61AFEF",
        sky = "#04A5E5",
        teal = "#B5E8E0",
        lavender = "#7287FD",

        text = "#F2F2BF",
        subtext1 = "#BAC2DE",
        subtext0 = "#A6ADC8",
        overlay2 = "#C3BAC6",
        overlay1 = "#988BA2",
        overlay0 = "#6E6B6B",
        surface2 = "#6E6C7E",
        surface1 = "#575268",
        surface0 = "#302D41",

        base = "#1D1536",
        mantle = "#1C1C19",
        crust = "#161320",
      }

    palette = vim.tbl_extend("force", { none = "NONE" }, palette, require("editor").palette_overwrite)
  end

  return palette
end

---Generate universal highlight groups
---@param overwrite palette? @The color to be overwritten | highest priority
---@return palette
M.get_palette = function(overwrite)
  if not overwrite then
    return init_palette()
  else
    return vim.tbl_extend("force", init_palette(), overwrite)
  end
end

---@param c string @The color in hexadecimal.
local hexToRgb = function(c)
  c = string.lower(c)
  return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

---Parse the `style` string into nvim_set_hl options
---@param style string @The style config
---@return table
local function parse_style(style)
  if not style or style == "NONE" then
    return {}
  end

  local result = {}
  for field in string.gmatch(style, "([^,]+)") do
    result[field] = true
  end

  return result
end

---Wrapper function for nvim_get_hl_by_name
---@param hl_group string @Highlight group name
---@return table
local get_highlight = function(hl_group)
  local hl = vim.api.nvim_get_hl_by_name(hl_group, true)
  if hl.link then
    return get_highlight(hl.link)
  end

  local result = parse_style(hl.style)
  result.fg = hl.foreground and string.format("#%06x", hl.foreground)
  result.bg = hl.background and string.format("#%06x", hl.background)
  result.sp = hl.special and string.format("#%06x", hl.special)
  for attr, val in pairs(hl) do
    if type(attr) == "string" and attr ~= "foreground" and attr ~= "background" and attr ~= "special" then
      result[attr] = val
    end
  end

  return result
end

---Blend foreground with background
---@param foreground string @The foreground color
---@param background string @The background color to blend with
---@param alpha number|string @Number between 0 and 1 for blending amount.
M.blend = function(foreground, background, alpha)
  alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
  local bg = hexToRgb(background)
  local fg = hexToRgb(foreground)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

---Get RGB highlight by highlight group
---@param hl_group string @Highlight group name
---@param use_bg boolean @Returns background or not
---@param fallback_hl? string @Fallback value if the hl group is not defined
---@return string
M.hl_to_rgb = function(hl_group, use_bg, fallback_hl)
  local hex = fallback_hl or "#000000"
  local hlexists = pcall(vim.api.nvim_get_hl_by_name, hl_group, true)

  if hlexists then
    local result = get_highlight(hl_group)
    if use_bg then
      hex = result.bg and result.bg or "NONE"
    else
      hex = result.fg and result.fg or "NONE"
    end
  end

  return hex
end

---Extend a highlight group
---@param name string @Target highlight group name
---@param def table @Attributes to be extended
M.extend_hl = function(name, def)
  local hlexists = pcall(vim.api.nvim_get_hl_by_name, name, true)
  if not hlexists then
    -- Do nothing if highlight group not found
    return
  end
  local current_def = get_highlight(name)
  local combined_def = vim.tbl_deep_extend("force", current_def, def)

  vim.api.nvim_set_hl(0, name, combined_def)
end

---Convert number (0/1) to boolean
---@param value number @The value to check
---@return boolean|nil @Returns nil if failed
M.tobool = function(value)
  if value == 0 then
    return false
  elseif value == 1 then
    return true
  else
    vim.notify(
      "Attempt to convert data of type '" .. type(value) .. "' [other than 0 or 1] to boolean",
      vim.log.levels.ERROR,
      { title = "[utils] Runtime error" }
    )
    return nil
  end
end

M.get_binary_path = function(binary)
  local path = nil
  if __editor_global.is_mac or __editor_global.is_linux then
    path = vim.fn.trim(vim.fn.system("which " .. binary))
  elseif __editor_global.is_windows then
    path = vim.fn.trim(vim.fn.system("where " .. binary))
  end
  if vim.v.shell_error ~= 0 then
    path = nil
  end
  return path
end

M.annotate_mapping = function()
  ok, _ = pcall(require, "which-key")
  if ok then
    -- sync with mappings.lua
    require("which-key").register({
      ["<Space>"] = {
        -- bufferline.nvim
        x = "buffer: Close current buffer",
        b = {
          name = "Bufferline commands",
          d = "buffer: Sort by directory",
          e = "buffer: Sort by extension",
          c = "buffer: Pick buffer to close",
          p = "buffer: Switch to pick buffer",
        },
        -- lazy.nvim
        p = {
          name = "Lazy commands",
          s = "Lazy: sync plugins",
          c = "Lazy: clean plugins",
          u = "Lazy: update plugins",
          cc = "Lazy: check for updates plugins",
          h = "Lazy: open home panel",
        },
        -- gitsigns.nvim
        h = { name = "Gitsigns commands" },
      },
      -- Lspsaga and nvim-lsp
      ["g"] = {
        a = "lsp: Code action",
        d = "lsp: Preview definition",
        D = "lsp: Goto definition",
        h = "lsp: Show reference",
        o = "lsp: Toggle outline",
        r = "lsp: Rename in file range",
        R = "lsp: Rename in project range",
        t = "lsp: Toggle trouble list",
        ["["] = "lsp: Goto prev diagnostic",
        ["]"] = "lsp: Goto next diagnostic",
        b = "buffer: Buffer pick",
      },
      K = "lsp: Show documentation",
      ["<LocalLeader>"] = {
        l = {
          name = "LSP commands",
          i = "lsp: LSP Info",
          r = "lsp: LSP Restart",
        },
        sc = "lsp: Show cursor disgnostics",
        sl = "lsp: Show line disgnostics",
        ci = "lsp: Incoming calls",
        co = "lsp: Outgoing calls",
        -- vim-fugitive
        G = "git: Show fugitive",
        g = {
          name = "git commands",
          aa = "git: Add .",
          cm = "git: Commit",
          p = {
            s = "git: Push",
            l = "git: Pull",
          },
        },
        -- copilot.lua
        cp = "copilot: Open panel",
        -- nvim-dap
        d = {
          name = "Dap commands",
          b = "debug: Set breakpoint with condition",
          c = "debug: Run to cursor",
          l = "debug: Run last",
          o = "debug: Open repl",
        },
        -- octo.nvim
        oc = {
          name = "Octo commands",
          pr = "octo: Pull request",
        },
        -- trouble.nvim
        t = {
          name = "Trouble commands",
          d = "lsp: Show document diagnostics",
          w = "lsp: Show workspace diagnostics",
          q = "lsp: Show quickfix list",
          l = "lsp: Show loclist",
          r = "lsp: Show lsp references",
        },
        -- telescope.nvim
        f = {
          name = "Telescope commands",
          e = "find: File by history",
          c = "ui: Change color scheme",
          f = "find: File under current git directory",
          w = "find: Word with regex",
          u = "edit: Show undo history",
          z = "edit: Change current directory by zoxide",
          n = "edit: New file",
        },
        -- refactoring.nvim
        r = {
          name = "Refactoring commands",
          e = "refactor: Extract function",
          f = "refactor: Extract function to file",
          v = "refactor: Extract variable",
          i = "refactor: Inline variable",
          b = "refactor: Extract block",
          bf = "refactor: Extract block to file",
        },
        -- cheatsheet.nvim
        km = "cheatsheet: Show panel",
        -- hop.nvim
        w = "jump: Goto word",
        j = "jump: Goto line",
        k = "jump: Goto line",
        c = "jump: Goto one char",
        cc = "jump: Goto two char",
        -- general vim motion
        ["]"] = "windows: resize right 10px",
        ["["] = "windows: resize left 10px",
        ["-"] = "windows: resize up 5px",
        ["="] = "windows: resize down 5px",
        lcd = "edit: Change to current directory",
      },
      ["<Leader>"] = {
        o = "editor: set local for spell checker",
        I = "editor: set list",
        vs = "windows: Split vertical",
        hs = "windows: Split horizontal",
        p = "edit: remove last search words",
        i = "edit: indent current buffer",
        l = "editor: toggle list",
        t = "editor: remove trailing whitespaces",
        r = "tool: Code snip run",
        -- nvim-tree.lua
        n = {
          name = "NvimTree commands",
          f = "filetree: NvimTree find file",
          r = "filetree: NvimTree refresh",
        },
        -- nvim-spectre and nvim-treesitter
        s = {
          o = "replace: Open panel",
          w = "replace: Replace word under cursor",
          p = "replace: Replace word under file search",
          d = "jump: Goto outer function definition",
          D = "jump: Goto outer class definition",
        },
        -- crates.nvim
        c = {
          name = "Crates commands",
          t = "crates: toggle",
          r = "crates: reload",
          v = "crates: show versions popup",
          f = "crates: show features popup",
          d = "crates: show dependencies popup",
          u = "crates: update crates",
          a = "crates: update all crates",
          U = "crates: upgrade crates",
          A = "crates: upgrade all crates",
          H = "crates: show homepage",
          R = "crates: show repository",
          D = "crates: show documentation",
          C = "crates: open crates.io",
        },
      },
      ["<C-n>"] = "filetree: NvimTree open",
      f = {
        o = "find: Old files",
        r = "find: File by frecency",
        b = "find: Buffer opened",
        p = "find: Project",
        w = "find: Word",
        f = "find: File under current work directory",
        t = "buffer: Format toggle",
      },
      [";"] = "mode: enter command mode",
      ["<C-h>"] = "navigation: Move to left buffer",
      ["<C-l>"] = "navigation: Move to right buffer",
      ["<C-j>"] = "navigation: Move to down buffer",
      ["<C-k>"] = "navigation: Move to up buffer",
      ["<"] = "edit: outdent 1 step",
      [">"] = "edit: indent 1 step",
      ["\\"] = "edit: clean hightlight",
      Y = "edit: Yank to eol",
      D = "edit: Delete to eol",
      ["<C-s>"] = "edit: Save file",
      -- toggleterm.nvim
      ["<C-t>"] = "term: Create vertical terminal",
      ["<C-\\>"] = "term: Create horizontal terminal",
      -- zen-mode.nvim
      zm = "zenmode: Toggle",
      -- markdown-preview.nvim
      mpt = "markdown: preview",
      -- vim-easy-align
      gea = "easy-align: Align by char",
      slg = "git: Show lazygit",
      ["<F6>"] = "debug: Run/Continue",
      ["<F7>"] = "debug: Terminate debug session",
      ["<F8>"] = "debug: Toggle breakpoint",
      ["<F9>"] = "debug: Step into",
      ["<F10>"] = "debug: Step out",
      ["<F11>"] = "debug: Step over",
    })
  end
end

return M
