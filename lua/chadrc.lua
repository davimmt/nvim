-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "onedark",

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

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
