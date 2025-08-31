-- Load theme palette from nix
local theme = require("theme").palette

-- Bootstrap lazy.nvim (plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "nvim-lualine/lualine.nvim" },
  { "folke/tokyonight.nvim" }, -- fallback colorscheme
})

-- UI
vim.o.termguicolors = true
vim.cmd.colorscheme("tokyonight") -- can override with our palette later

-- Treesitter overrides
vim.api.nvim_set_hl(0, "@function", { fg = theme.accent })
vim.api.nvim_set_hl(0, "@keyword",  { fg = theme.accent2 })
vim.api.nvim_set_hl(0, "@string",   { fg = theme.success })
vim.api.nvim_set_hl(0, "@number",   { fg = theme.info })


-- Apply highlights
vim.api.nvim_set_hl(0, "Normal",      { fg = theme.text, bg = theme.base })
vim.api.nvim_set_hl(0, "Comment",     { fg = theme.subtext, italic = true })
vim.api.nvim_set_hl(0, "Visual",      { bg = theme.overlay })
vim.api.nvim_set_hl(0, "LineNr",      { fg = theme.subtext })
vim.api.nvim_set_hl(0, "CursorLineNr",{ fg = theme.accent })
vim.api.nvim_set_hl(0, "Search",      { fg = theme.base, bg = theme.accent })
vim.api.nvim_set_hl(0, "IncSearch",   { fg = theme.base, bg = theme.accent2 })

-- Diagnostics
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = theme.error })
vim.api.nvim_set_hl(0, "DiagnosticWarn",  { fg = theme.warning })
vim.api.nvim_set_hl(0, "DiagnosticInfo",  { fg = theme.info })
vim.api.nvim_set_hl(0, "DiagnosticHint",  { fg = theme.success })

-- Example: lualine using Nix theme
require("lualine").setup({
  options = {
    theme = {
      normal = { c = { fg = theme.text, bg = theme.base } },
      insert = { c = { fg = theme.accent, bg = theme.surface } },
      visual = { c = { fg = theme.accent2, bg = theme.surface } },
      replace = { c = { fg = theme.error, bg = theme.surface } },
    }
  }
})

-- init.lua
vim.opt.clipboard = "unnamedplus"

