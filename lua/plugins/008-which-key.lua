return {
  "folke/which-key.nvim",
  keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
  cmd = "WhichKey",
  event = "VeryLazy",
  config = function()
    dofile(vim.g.base46_cache .. "whichkey")

    local status_ok, which_key = pcall(require, "which-key")
    if not status_ok then
      return
    end

    local setup = {
      preset = "helix", -- "classic" | "modern" | "helix"

      icons = {
        -- set to false to disable all mapping icons,
        -- both those explicitly added in a mapping
        -- and those from rules
        mappings = false,
      },

      plugins = {
        presets = {
          -- TODO(1): change this default binding, so that <C-w> can be used to close buffers
          windows = true, -- default bindings on <c-w>
        },
      },
    }

    local mappings = {
      { "<leader>c", group = " NvChad" },
      { "<leader>f", group = "󰈞 Files/Telescope" },
      { "<leader>g", group = " Git" },
      { "<leader>l", group = " LSP" },
      { "<leader>n", group = " Nvim" },
      { "<leader>t", group = " Terminal" },
      { "<leader>w", group = "󰦄 Which Key" },
    }

    which_key.setup(setup)
    which_key.add(mappings)
  end,
}
