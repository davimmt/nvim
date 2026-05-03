return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("ibl").setup {
      exclude = {
        filetypes = {
          "dashboard",
          "alpha",
          "help",
          "NvimTree",
          "Trouble",
          "markdown",
        },

        buftypes = {
          "terminal",
          "nofile",
        },
      },

      indent = {
        char = "▏",
      },

      scope = {
        enabled = true,
        -- char = "▎",
      },
    }
  end,
}
