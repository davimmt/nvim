local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports", "gofmt" },
    sh = { "shellcheck" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    terraform = { "terraform_fmt" },
    hcl = { "hcl" },
    terragrunt = { "terragrunt_hclfmt" },
  },

  -- Use the "*" filetype to run formatters on all filetypes.
  -- ["*"] = { "codespell" },
  -- Use the "_" filetype to run formatters on filetypes that don't
  -- have other formatters configured.
  ["*"] = { "trim_whitespace", "trim_newlines" },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
