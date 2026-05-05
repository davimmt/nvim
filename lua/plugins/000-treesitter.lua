-- Highlighting and syntax
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  branch = "master",
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
