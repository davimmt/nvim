return {
  "greggh/claude-code.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {{'\\', "<cmd>ClaudeCode<cr>", desc = 'Toggle Claude Code'}},
  config = function()
    require("claude-code").setup({
      command = "SHELL=zsh flox activate -d ~/.dotfiles -c 'c'", -- "/mnt/c/Users/davi.tavares/.local/bin/claude.exe"

      window = {
        split_ratio = 0.3,
        position = "rightbelow vsplit",
        -- position = "float",
        -- float = {
        --   width = "90%",
        --   height = "90%",
        --   row = "center",
        --   col = "center",
        --   border = "double",
        -- },
      },
    })
  end,
}
