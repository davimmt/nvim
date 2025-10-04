-- Install and manage LSP servers, formatters
return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "lua-language-server",
      "stylua",
      "yaml-language-server",
      "prettier",
      "tflint",
      "terraform-ls",
      "bash-language-server",
      "shellcheck",
      "helm-ls",
      "hclfmt",
      "gopls",
      "golines",
      "gofumpt",
      "goimports-reviser",
    },
  },
}
