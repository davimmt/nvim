return {
  "neovim/nvim-lspconfig",
  config = function()
    require("nvchad.configs.lspconfig").defaults()

    local on_attach = require("nvchad.configs.lspconfig").on_attach
    local on_init = require("nvchad.configs.lspconfig").on_init
    local capabilities = require("nvchad.configs.lspconfig").capabilities

    local lspconfig = require "lspconfig"
    local servers = { "yamlls", "bashls" }

    -- lsps with default config
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
      }
    end

    local util = require "lspconfig/util"

    -- Go
    lspconfig.gopls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "gopls" },
      filetypes = { "go", "gomod", "gowork", "gotmpl" },
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      },
    }

    -- Terrraform
    -- lspconfig.terraform_lsp.setup {
    --   root_dir = require("lspconfig.util").root_pattern("*.tf*", ".terraform", ".git", ".tflint.hcl"),
    -- }

    require("lspconfig").terraformls.setup {
      on_attach = function(client)
        if client.name == "terraformls" then
          -- Disable LSP semantic highlighting, leave TS at it
          client.server_capabilities.semanticTokensProvider = nil
        end
      end,
    }

    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      pattern = { "*.tf", "*.tfvars" },
      callback = function()
        vim.lsp.buf.format()
      end,
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.hcl",
      callback = function()
        local filepath = vim.fn.expand "%:p"
        vim.fn.jobstart({ "terragrunt", "hcl", "fmt", filepath }, {
          stdout_buffered = true,
          on_exit = function()
            vim.cmd "edit!"
          end,
        })
      end,
    })

    lspconfig.tflint.setup {
      root_dir = require("lspconfig.util").root_pattern("*.tf*", ".terraform", ".git", ".tflint.hcl"),
    }

    -- Helm
    lspconfig.helm_ls.setup {
      settings = {
        ["helm-ls"] = {
          yamlls = {
            path = "yaml-language-server",
          },
        },
      },
    }
  end,
}
