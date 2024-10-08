return {
  { "nvim-tree/nvim-tree.lua", cmd = { "NvimTreeToggle", "NvimTreeFocus" }, opts = function() return require "configs.tree" end },
  { "nvim-pack/nvim-spectre", cmd = "Spectre" },
  { "folke/which-key.nvim", config = function() return require "custom.configs.which-key" end },
  { "lukas-reineke/indent-blankline.nvim", config = function() return require "configs.indent-blankline" end },
  { "lewis6991/gitsigns.nvim", opts = function() return require "configs.gitsigns" end },
  { "tpope/vim-surround", event = "VeryLazy" },
  { "towolf/vim-helm", ft = { "helm", "gotmpl" }}, -- TODO: fix helm/yaml file diff
  { "kdheepak/lazygit.nvim", event = "VeryLazy", dependencies = {"nvim-lua/plenary.nvim"} },
  { "neovim/nvim-lspconfig", config = function() require("nvchad.configs.lspconfig").defaults(); require "configs.lspconfig" end },
  { "jose-elias-alvarez/null-ls.nvim", event = "VeryLazy", opts = function() return require "configs.null-ls" end },
  {
    "nvimdev/dashboard-nvim", event = "VimEnter", cmd = "Dashboard",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      return require "configs.dashboard"
    end,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      return require "configs.conform"
    end,
  },
  {
    "Shatur/neovim-session-manager", lazy = false,
    config = function()
      local config = require('session_manager.config')
      require('session_manager').setup({
        autoload_mode = config.AutoloadMode.Disabled, -- What to do when started without arguments [Disabled, CurrentDir, LastSession].
      })
    end,
  },
  {
    "folke/flash.nvim",
    keys = {
      { "s", mode = { "n" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "mg979/vim-visual-multi", branch = "master", event = "VeryLazy",
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",
        ["Find Subword Under"] = "<C-d>",
        ["Visual All"] = "<C-a>",
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "yaml-language-server", "prettier",
        "terraform-ls", "tflint", "helm-ls",
        "gopls", "golines", "gofumpt", "goimports-reviser",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "dockerfile", "bash", "terraform",
        "yaml", "json",
      },
    },
  },
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    config = function()
      dofile(vim.g.base46_cache .. "whichkey")
      require("configs.which-key")
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    event = "InsertEnter",
    cmd = "Copilot",
    build = ":Copilot auth",
    config = function()
      local copilot = require("copilot")
      copilot.setup(copilot.opts)
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "copilot", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path", group_index = 2 },
      },
    },
  },
}
