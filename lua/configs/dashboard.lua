local icon = require "utils.icons"
local prayer = require "utils.prayers"
table.insert(icon, 1, '')
table.insert(icon, '')
table.insert(prayer, 1, '')
table.insert(prayer, 1, '')

local config = {
  require('dashboard').setup {
    theme = 'hyper',
    shortcut_type = 'number',
    change_to_vcs_root = true,
    disable_move = true,
    hide = {
      tabline = true,
      winbar  = true,
    },
    config = {
      header = icon,
      packages = { enable = false },
      disable_move = false,
      week_header = {
        enable = false,
        concat = "",
        append = {""},
      },
      shortcut = {
        -- https://fontawesome.com/search?o=r&m=free
        -- :so $VIMRUNTIME/syntax/hitest.vim
        { desc = ' Lazy', group = 'DashboardProjectTitle', action = 'Lazy', key = 'L' },
        { desc = ' Session', group = 'DashboardOption', action = 'SessionManager load_last_session', key = 's' },
        { desc = ' File', group = 'DashboardOption', action = 'Telescope find_files',  key = 'f', },
        { desc = ' Word', group = 'DashboardOption', action = 'Telescope live_grep',  key = 'w', },
        { desc = ' Git', group = 'DashboardOption', action = 'Telescope git_status',  key = 'g', },
        { desc = ' Quit', group = 'DashboardError', action = 'q!',  key = 'q', },
      },
      project = { enable = true, limit = 3, },
      mru = { limit = 5, },
      footer = prayer
    }
  }
}

return config
