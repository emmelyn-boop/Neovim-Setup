-- Neotest configuration
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
    require("neotest-plenary"),
    require("neotest-vim-test")({
      ignore_file_types = { "python", "vim", "lua" },
    }),
  },
})

-- Example calls to Neotest functions
vim.api.nvim_set_keymap("n", "<leader>tr", ":lua require('neotest').run.run()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tt", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ts", ":lua require('neotest').run.stop()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ta", ":lua require('neotest').run.attach()<CR>", { noremap = true })
