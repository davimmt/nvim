require("ibl").setup {
  exclude = {
    filetypes = {
      "dashboard",
      "alpha",
      "help",
      "NvimTree",
      "Trouble",
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
