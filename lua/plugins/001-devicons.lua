return {
  "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  opts = {
    -- strict = true, -- Enforce strict matching for extensions
    override_by_extension = {
      ["toml"] = {
        icon = "⚙️",
        name = "toml",
      },
      ["astro"] = {
        icon = "🚀",
        color = "#EF8547",
        name = "Astro",
      },
    },
  },
}
