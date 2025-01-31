return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  -- nvim test

  {
    "nvim-neotest/neotest", 
    config = function()
      require("configs.neotest")
    end,
    dependencies = {
      "nvim-neotest/nvim-nio", 
      "nvim-lua/plenary.nvim", 
      "antoinemadec/FixCursorHold.nvim", 
      "nvim-treesitter/nvim-treesitter"
    },
  },
  { "nvim-neotest/neotest-plenary" },
  { "nvim-neotest/neotest-python" },
  { "nvim-neotest/neotest-vim-test" },





  {
  "NeogitOrg/neogit",
    config = function()
      require "configs.neogit"
    end,
  },
{
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
    "echasnovski/mini.pick",         -- optional
  },
config = function()
  require("lualine").setup({
    options = {
      theme = "auto", -- Sesuaikan tema lualine
    },
    sections = {
      lualine_c = {
        { "filename", path = 1 }, -- Tampilkan full path file
      },
    },
  })
end
},


{
    "andweeb/presence.nvim",
    lazy = false, -- Ensure it loads immediately
    config = function()
        local status_ok, presence_config = pcall(require, "configs.presence")
        if status_ok then
            presence_config.setup()
        else
            vim.notify("Failed to load presence.nvim configuration", vim.log.levels.ERROR)
        end
    end,
},



  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "json-lsp",
        "yaml-language-server",
        "tsserver",
        "eslint",
        "bash-language-server",
        "dockerfile-language-server",
        "graphql-lsp",
        "pyright",
      },
    },
  },


  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.chunk"
      --
    end,
  },

  {
    "wakatime/vim-wakatime",
    lazy = false,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    enabled = false,
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.inline-diagnostics"
    end,
  },

  { "nvchad/volt",     lazy = true },
  {
    "nvchad/minty",
    lazy = true,
    config = function()
      require "configs.minty"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "supermaven-inc/supermaven-nvim",
        opts = {},
      },
    },

    opts = function (_, opts)
      opts.sources[1].trigger_chars = {"-"}
      table.insert(opts.sources, 1, {name = "supermaven"})
    end
  },

  { "nvchad/menu",     lazy = true },

  { "nvchad/showkeys", cmd = "ShowkeysToggle", opts = { position = "top-center" } },

  { "nvchad/timerly",  cmd = "TimerlyToggle" }

  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
