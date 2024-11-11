return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'olimorris/onedarkpro.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      local helpers = require 'onedarkpro.helpers'
      local colors = helpers.get_preloaded_colors 'onedark_dark'
      require('onedarkpro').setup {
        colors = {
          brightgreen = '#00FF00',
        },
        highlights = {
          DashboardHeader = { fg = colors.green },
          NeoTreeGitUntracked = { fg = colors.comment },
          NeoTreeModified = { fg = colors.green },
          NeoTreeFloatTitle = { fg = colors.black, bg = colors.green },
          NeoTreeDirectoryIcon = { fg = colors.green },
          NeoTreeTitleBar = { fg = colors.black, bg = colors.green },

          BufferLineSeparator = { fg = colors.float_bg },
          BufferLineSeparatorVisible = { fg = colors.float_bg },
        },
        options = {
          transparency = true,
        },
      }
      vim.cmd.colorscheme 'onedark_dark'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
