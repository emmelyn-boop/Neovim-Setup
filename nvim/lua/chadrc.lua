-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})


M.base46 = {
  theme = "everblush",
  integrations = { "dap" },
}

M.ui = {
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
  ident = {
    enable = true,
  },
  hl_override = {
    NvimTreeNormal = { bg = "#141b1e" },
    NvimTreeNormalNC = { bg = "#141b1e" },
    NvimTreeWinSeparator = { bg = "#141b1e", fg = "#141b1e" },
    WinSeparator = { bg = "#141b1e" },
    NavicSeparator = { bg = "#ffffff" },
    BufferLineSeparator = { bg = "#141b1e" },
    WhichKeySeparator = { bg = "#141b1e" },
    BufferLineSeparatorVisible = { bg = "#141b1e" },
    BufferLineSeparatorSelected = { bg = "#141b1e" },
    LineNr = { bg = "#141b1e" },
    NvimTreeOpenedFolderName = { bg = "#141b1e" },
    DapUILineNumber = { bg = "#141b1e" },
    BufferLineBackground = { bg = "#141b1e" },
    BufferLineBufferSelected = { bg = "#141b1e" },
    BufferLineBufferVisible = { bg = "#141b1e" },
    BufferLineCloseButton = { bg = "#141b1e" },
    BufferLineCloseButtonSelected = { bg = "#141b1e" },
  },
  nvdash = {
    load_on_startup = true,
  },

  tabufline = {
    enabled = false,
    show_numbers = true,
  },
  cmp = {
    style = "atom",
    abbr_maxwidth = 50,
    completion = {
      keyword_length = 2,
      completeopt = "menu,menuone,noselect",
      autocomplete = true,
    },
  },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

return M
