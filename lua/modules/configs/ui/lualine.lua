return function()
  local icons = {
    diagnostics = require("utils.icons").get("diagnostics", true),
    misc = require("utils.icons").get("misc", true),
    ui = require("utils.icons").get("ui", true),
  }

  local escape_status = function()
    local ok, m = pcall(require, "better_escape")
    return ok and m.waiting and icons.misc.EscapeST or ""
  end

  local _cache = { context = "", bufnr = -1 }
  local lspsaga_symbols = function()
    local exclude = {
      ["terminal"] = true,
      ["toggleterm"] = true,
      ["prompt"] = true,
      ["NvimTree"] = true,
      ["help"] = true,
    }
    if vim.api.nvim_win_get_config(0).zindex or exclude[vim.bo.filetype] then
      return "" -- Excluded filetypes
    else
      local currbuf = vim.api.nvim_get_current_buf()
      local ok, lspsaga = pcall(require, "lspsaga.symbolwinbar")
      if ok and lspsaga:get_winbar() ~= nil then
        _cache.context = lspsaga:get_winbar()
        _cache.bufnr = currbuf
      elseif _cache.bufnr ~= currbuf then
        _cache.context = "" -- Reset [invalid] cache (usually from another buffer)
      end

      return _cache.context
    end
  end

  local diff_source = function()
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
    local home = os.getenv("HOME")
    if cwd:find(home, 1, true) == 1 then
      cwd = "~" .. cwd:sub(#home + 1)
    end
    return icons.ui.RootFolderOpened .. cwd
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

  local python_venv = function()
    local function env_cleanup(venv)
      if string.find(venv, "/") then
        local final_venv = venv
        for w in venv:gmatch("([^/]+)") do
          final_venv = w
        end
        venv = final_venv
      end
      return venv
    end

    if vim.bo.filetype == "python" then
      local venv = os.getenv("CONDA_DEFAULT_ENV")
      if venv then
        return string.format("%s", env_cleanup(venv))
      end
      venv = os.getenv("VIRTUAL_ENV")
      if venv then
        return string.format("%s", env_cleanup(venv))
      end
    end
    return ""
  end

  require("lualine").setup({
    options = {
      icons_enabled = true,
      theme = "catppuccin",
      disabled_filetypes = {},
      component_separators = "|",
      section_separators = { left = " ", right = " " },
    },
    sections = {
      lualine_a = { { "mode" } },
      lualine_b = { { "branch" }, { "diff", source = diff_source } },
      lualine_c = { lspsaga_symbols },
      lualine_x = {
        { escape_status },
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warning,
            info = icons.diagnostics.Information,
          },
        },
        { get_cwd },
      },
      lualine_y = {
        { "filetype", colored = true, icon_only = true },
        { python_venv },
        { "encoding" },
        {
          "fileformat",
          icons_enabled = true,
          symbols = {
            unix = "LF",
            dos = "CRLF",
            mac = "CR",
          },
        },
      },
      lualine_z = { "progress", "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {
      "quickfix",
      "nvim-tree",
      "nvim-dap-ui",
      "toggleterm",
      "fugitive",
      outline,
      diffview,
    },
  })

  -- Properly set background color for lspsaga
  local winbar_bg = require("utils").hl_to_rgb("StatusLine", true, "#000000")
  for _, hlGroup in pairs(require("lspsaga.lspkind").get_kind()) do
    require("utils").extend_hl("LspSagaWinbar" .. hlGroup[1], { bg = winbar_bg })
  end
  require("utils").extend_hl("LspSagaWinbarSep", { bg = winbar_bg })
end