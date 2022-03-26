local ui = {}
local conf = require("modules.ui.config")

ui["folke/which-key.nvim"] = {
  opt = true,
  event = "BufEnter",
  config = function()
    require("which-key").setup()
  end,
}
ui["SmiteshP/nvim-gps"] = {
  opt = true,
  after = "nvim-treesitter",
  config = conf.nvim_gps,
}
ui["nvim-lualine/lualine.nvim"] = {
  opt = true,
  after = "nvim-gps",
  config = conf.lualine,
}
ui["j-hui/fidget.nvim"] = {
  opt = true,
  config = function()
    require("fidget").setup({})
  end,
  after = "nvim-gps",
}
ui["kyazdani42/nvim-tree.lua"] = {
  opt = true,
  cmd = { "NvimTreeToggle", "NvimTreeOpen" },
  config = conf.nvim_tree,
}
ui["lukas-reineke/indent-blankline.nvim"] = {
  opt = true,
  event = "BufRead",
  config = conf.indent_blankline,
}
ui["lewis6991/gitsigns.nvim"] = {
  opt = true,
  event = { "BufRead", "BufNewFile" },
  config = conf.gitsigns,
  requires = { "nvim-lua/plenary.nvim", opt = true },
}
ui["lukas-reineke/indent-blankline.nvim"] = {
  opt = true,
  event = "BufRead",
  config = conf.indent_blankline,
}
ui["akinsho/nvim-bufferline.lua"] = {
  opt = true,
  event = "BufRead",
  config = conf.nvim_bufferline,
}

return ui
