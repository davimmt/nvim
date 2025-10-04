-- Open last opened file and position
return {
  "Shatur/neovim-session-manager",
  lazy = false,
  config = function()
    local config = require "session_manager.config"
    require("session_manager").setup {
      autoload_mode = config.AutoloadMode.Disabled, -- What to do when started without arguments [Disabled, CurrentDir, LastSession].
    }
  end,
}
