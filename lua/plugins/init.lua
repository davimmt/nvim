--[[
Plugin Loading Order and Descriptions:

Dependencies and core plugins:
  001-devicons     - nvim-web-devicons - Icon support

LSP and completion:
  002-lspconfig    - LSP configuration
  003-mason        - LSP server management
  004-cmp          - Completion engine
  005-copilot      - GitHub Copilot

UI and interface:
  006-dashboard    - Dashboard
  007-tree         - File tree
  008-which-key    - Key mapping hints
  009-indent-blankline - Indentation guides
  010-gitsigns     - Git signs

Navigation and editing:
  011-flash        - Fast navigation
  012-visual-multi - Multiple cursors
  013-surround     - Surround text objects
  020-visimatch    - Match highlighting

File management and search:
  014-spectre      - Search and replace
  015-session-manager - Session management

Language support:
  016-treesitter   - Syntax highlighting
  017-conform      - Code formatting
  018-helm         - Helm support

Git and version control:
  019-lazygit      - Git UI
--]]

-- Automatically load all plugin files in order
local plugins = {}
local files = {}
local current_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h")

for name, type in vim.fs.dir(current_dir) do
  if type == "file" and name:match "^d{3}-.*.lua$" then
    table.insert(files, name)
  end
end
table.sort(files)

for _, filename in ipairs(files) do
  local module_name = filename:gsub("%.lua$", "")
  local plugin_config = require("plugins." .. module_name)

  if type(plugin_config) == "table" then
    if plugin_config[1] then
      for _, plugin in ipairs(plugin_config) do
        table.insert(plugins, plugin)
      end
    else
      table.insert(plugins, plugin_config)
    end
  end
end

return plugins
