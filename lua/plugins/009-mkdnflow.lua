return {
  'jakewvincent/mkdnflow.nvim',
  ft = { 'markdown' },
  config = function()
    require('mkdnflow').setup({
      modules = {
        bib = false,
        buffers = false,
        conceal = false,
        cursor = false,
        folds = true,
        foldtext = true,
        links = false,
        lists = false,
        maps = false,
        paths = false,
        tables = false,
        templates = false,
        to_do = false,
        yaml = false,
        completion = false,
      },
    })
  end,
  keys = {
    {
      '<A-F>',
      function()
        local line = vim.api.nvim_get_current_line()
        local foldclosed = vim.fn.foldclosed('.')
        require('mkdnflow').setup()

        if foldclosed == -1 then
          vim.cmd('MkdnFoldSection')
        else
          vim.cmd('MkdnUnfoldSection')
        end
      end,
      ft = 'markdown',
      desc = 'Toggle markdown section fold',
    },
    {
      '<CR>',
      function()
        local line = vim.api.nvim_get_current_line()
        local found = false

        for url in line:gmatch("https?://[%w%-%._~:/%?#%[%]@!$&'()*+,;=]+") do
          found = true
          vim.fn.jobstart({ "cmd.exe", "/C", "start", "", url }, { detach = true })
        end
      end,
      ft = 'markdown',
      desc = 'Open link under cursor',
    },
  },
}
