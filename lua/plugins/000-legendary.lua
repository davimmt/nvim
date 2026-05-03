return {
  -- TODO: make it also display all commands
  "mrjones2014/legendary.nvim",
  lazy = false,
  priority = 1000,
  dependencies = {
    "stevearc/dressing.nvim",
  },
  keys = {{'<leader>ll', "<cmd>Legendary<cr>", desc = 'Legendary'}},
  config = function()
    require("legendary").setup({
      extensions = {
        lazy_nvim = true,
        which_key = {
          auto_register = true,
        },
        nvim_tree = true,
        smart_splits = false,
        op_nvim = false,
        diffview = true,
      },
    })
  end,
}
