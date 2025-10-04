-- Highlighting and syntax
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "vim",
      "lua",
      "vimdoc",
      "dockerfile",
      "go",
      "bash",
      "terraform",
      "yaml",
      "json",
    },
  },
}
