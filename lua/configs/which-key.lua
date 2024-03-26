local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        presets = {
            windows = false, -- default bindings on <c-w>
        },
    },
}

local mappings = {
    ["<leader>"] = {
      c = { name = " NvChad" },
      f = { name = "󰈞 Files/Telescope" },
      g = { name = " Git" },
      l = { name = " LSP" },
      n = { name = " NVim" },
      t = { name = " Terminal" },
      w = { name = "󰦄 Which Key" },
    },
}

which_key.setup(setup)
which_key.register(mappings)
