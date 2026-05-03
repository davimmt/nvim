return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { "markdown" },
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('render-markdown').setup({
      completions = { lsp = { enabled = true } },
      heading = {
        render_modes = true,
      },
      bullet = {
        render_modes = true,
        icons = { '●', '○', '•', '◦' },
      },
    })
  end

  -- "delphinus/md-render.nvim",
  -- version = "*",
  -- ft = { "markdown" },
  -- dependencies = {
  --   { "nvim-tree/nvim-web-devicons", version = "*" }, -- optional: file type icons in code blocks
  --   -- { "delphinus/budoux.lua", version = "*" }, -- optional: CJK phrase-level line breaking
  -- },
  -- keys = {
  --   { "<leader>mp", "<Plug>(md-render-preview)",     desc = "Markdown preview (toggle)" },
  --   { "<leader>mt", "<Plug>(md-render-preview-tab)", desc = "Markdown preview in tab (toggle)" },
  --   { "<leader>md", "<Plug>(md-render-demo)",        desc = "Markdown render demo" },
  -- },
  --
  -- 'OXY2DEV/markview.nvim',
  -- dependencies = {
  --   'nvim-treesitter/nvim-treesitter',
  --   'nvim-tree/nvim-web-devicons'
  -- },
  --
  -- lazy = false,
  -- ft = { "markdown" },
  -- opts = {
  --   preview = {
  --     icon_provider = "devicons"
  --   }
  -- },
  -- config = function()
  --   local preset = require("markview.presets").headings;
  --
  --   require("markview").setup({
  --     markdown = {
  --       headings = {
  --         org_indent  = true
  --       }
  --     }
  --   });
  -- end
}
