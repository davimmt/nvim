require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local autocmd = vim.api.nvim_create_autocmd

-- Automatically check for file changes
vim.opt.autoread = true

-- terminal tab name
vim.o.title = true
vim.o.titlestring = "vi %{fnamemodify(expand('%:p'), ':~')}"

-- fix terraform and hcl comment string
autocmd("FileType", {
  group = vim.api.nvim_create_augroup("FixTerraformCommentString", { clear = true }),
  callback = function(ev)
    vim.bo[ev.buf].commentstring = "# %s"
  end,
  pattern = { "terraform", "hcl" },
})

-- default to hybrid line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- markview headers colors
vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { fg = "#a6e3a1", bg = "#1e2e1e", bold = false })
vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { fg = "#94e2d5", bg = "#1b2d2b", bold = false })
vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { fg = "#89b4fa", bg = "#1a2332", bold = false })
vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { fg = "#f9e2af", bg = "#2f2a1f", bold = false })
vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { fg = "#f38ba8", bg = "#2f1f25", bold = false })
vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { fg = "#cba6f7", bg = "#2a2232", bold = false })

--
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"
vim.cmd.highlight "IblScope guifg=#b3b3b3"

-- dynamic terminal padding
-- autocmd("VimEnter", {
--   command = ":silent !kitty @ set-spacing padding=0 margin=0",
-- })
--
-- autocmd("VimLeavePre", {
--   command = ":silent !kitty @ set-spacing padding=20 margin=10",
-- })

-- restore cursor position on file open
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

-- real slow:
-- clipboard in WSL without xclip
-- vim.g.clipboard = {
--   name = 'WslClipboard',
--   copy = {
--     ['+'] = 'clip.exe',
--     ['*'] = 'clip.exe',
--   },
--   paste = {
--     ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--   },
--   cache_enabled = 0,
-- }

-- show dash when all buffers are closed
-- autocmd("BufDelete", {
--   callback = function()
--     local bufs = vim.t.bufs
--     if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
--       -- vim.cmd "Nvdash"
--       vim.cmd "Dashboard"
--     end
--   end,
-- })
