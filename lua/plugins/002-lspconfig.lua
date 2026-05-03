return {
  "neovim/nvim-lspconfig",

  config = function()
    -- NvChad defaults (keep this)
    require("nvchad.configs.lspconfig").defaults()

    local on_attach = require("nvchad.configs.lspconfig").on_attach
    local on_init = require("nvchad.configs.lspconfig").on_init
    local capabilities = require("nvchad.configs.lspconfig").capabilities

    local util = require("lspconfig/util")

    -- helper for compatibility with NvChad callbacks
    local function setup(server, opts)
      opts = vim.tbl_deep_extend("force", {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
      }, opts or {})

      vim.lsp.config(server, opts)
      vim.lsp.enable(server)
    end

    -- =========================
    -- BASIC SERVERS
    -- =========================
    for _, lsp in ipairs({ "yamlls", "bashls" }) do
      setup(lsp)
    end

    -- =========================
    -- GOPLS
    -- =========================
    setup("gopls", {
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
    })

    -- =========================
    -- TERRAFORM LSP
    -- =========================
    setup("terraformls", {
      on_attach = function(client, bufnr)
        if client.name == "terraformls" then
          client.server_capabilities.semanticTokensProvider = nil
        end
      end,
    })

    -- format terraform files
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.tf", "*.tfvars" },
      callback = function()
        vim.lsp.buf.format()
      end,
    })

    -- terraform fmt via terragrunt (unchanged logic)
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.hcl",
      callback = function()
        local filepath = vim.fn.expand("%:p")
        vim.fn.jobstart({ "terragrunt", "hcl", "fmt", filepath }, {
          stdout_buffered = true,
          on_exit = function()
            vim.cmd("edit!")
          end,
        })
      end,
    })

    -- =========================
    -- TFLINT
    -- =========================
    setup("tflint", {
      root_dir = util.root_pattern("*.tf*", ".terraform", ".git", ".tflint.hcl"),
    })

    -- =========================
    -- HELM
    -- =========================
    setup("helm_ls", {
      settings = {
        ["helm-ls"] = {
          yamlls = {
            path = "yaml-language-server",
          },
        },
      },
    })
  end,
}
