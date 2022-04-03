local editor = {}
local config = require("modules.editor.config")

editor["tpope/vim-fugitive"] = { opt = true, cmd = { "Git", "G", "Ggrep", "GBrowse" } }

editor["junegunn/vim-easy-align"] = { opt = true, cmd = "EasyAlign" }

editor["alexghergh/nvim-tmux-navigation"] = {
  opt = true,
  config = function()
    require("nvim-tmux-navigation").setup({
      disable_when_zoomed = true, -- defaults to false
    })
  end,
  cond = function()
    return vim.api.nvim_eval('exists("$TMUX")') ~= 0
  end,
}

editor["simrat39/symbols-outline.nvim"] = {
  opt = true,
  cmd = { "SymbolsOutline", "SymbolsOutlineOpen" },
  config = config.symbols_outline,
}

editor["nvim-treesitter/nvim-treesitter"] = {
  opt = true,
  run = ":TSUpdate",
  event = "BufRead",
  config = config.nvim_treesitter,
}
editor["nvim-treesitter/nvim-treesitter-textobjects"] = {
  opt = true,
  after = "nvim-treesitter",
}
editor["romgrk/nvim-treesitter-context"] = {
  opt = true,
  after = "nvim-treesitter",
}
editor["JoosepAlviste/nvim-ts-context-commentstring"] = {
  opt = true,
  after = "nvim-treesitter",
}
editor["mfussenegger/nvim-ts-hint-textobject"] = {
  opt = true,
  after = "nvim-treesitter",
}
editor["windwp/nvim-ts-autotag"] = {
  opt = true,
  ft = { "html", "xml" },
  after = "nvim-treesitter",
  config = config.autotag,
}
editor["folke/twilight.nvim"] = {
  opt = true,
  config = function()
    require("twilight").setup({
      {
        dimming = {
          alpha = 0.5, -- amount of dimming
          -- we try to get the foreground from the highlight groups or fallback color
          color = { "Normal", "#ffffff" },
          inactive = true, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
        },
        context = 50, -- amount of lines we will try to show around the current line
        treesitter = true, -- use treesitter when available for the filetype
        -- treesitter is used to automatically expand the visible text,
        -- but you can further control the types of nodes that should always be fully expanded
        expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
          "function",
          "method",
          "table",
          "if_statement",
        },
        exclude = { ".git*" }, -- exclude these filetypes
      },
    })
  end,
}
editor["folke/zen-mode.nvim"] = {
  opt = true,
  after = "nvim-treesitter",
  requires = {
    "folke/twilight.nvim",
  },
  config = function()
    require("zen-mode").setup({})
  end,
}
editor["andymass/vim-matchup"] = {
  opt = true,
  after = "nvim-treesitter",
  config = config.matchup,
}
editor["akinsho/nvim-toggleterm.lua"] = {
  opt = true,
  event = "BufRead",
  config = config.toggleterm,
}
editor["norcalli/nvim-colorizer.lua"] = {
  opt = true,
  event = "BufRead",
  config = config.nvim_colorizer,
}
editor["untitled-ai/jupyter_ascending.vim"] = {
  opt = true,
  ft = "ipynb",
  cmd = { "JupyterExecute", "JupyterExecuteAll" },
}

return editor
