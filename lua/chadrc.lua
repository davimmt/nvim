-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  transparency = true,
  theme = 'chadracula-evondev',
  theme_toggle = {'catppuccin', 'chadracula-evondev'},

  telescope = { style = "bordered" },

  hl_add = {
    DashboardHeader = { fg = "#40ffff" },
    DashboardOption = { fg = "#ffd24d" },
    DashboardError = { fg = "#ff8282" },
    DashboardProjectTitle = { fg = "#40ffff" },
    DashboardProjectIcon = { fg = "#ffa0a0" },
    DashboardMruTitle = { fg = "#40ffff" },
    DashboardShotCutIcon = { fg = "#40ffff" },
    DashboardFooter = { fg = "#40ffff" },
  },

  hl_override = {
    NvimTreeGitNew = { fg = "green" },
    NvimTreeGitDirty = { fg = "orange" },
  },

  statusline = {
    theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow (separators work only for "default" statusline theme;
    -- round and block will work for the minimal theme only)
    separator_style = "default",
  },
}

M.term = {
  winopts = { winhl = "Normal:term,WinSeparator:WinSeparator" },
  sizes = { sp = 0.27, vsp = 0.32, ["bo sp"] = 0.2, ["bo vsp"] = 0.2 },
  float = {
    relative = "editor",
    row = 0.021,
    col = 0.05,
    width = 0.9,
    height = 0.85,
    border = "single",
  },
}

return M
