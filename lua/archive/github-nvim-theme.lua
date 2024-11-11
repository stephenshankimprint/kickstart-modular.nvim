return {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('github-theme').setup {
      options = {
        transparent = true,
        styles = {
          comments = 'italic',
          constants = 'italic,bold',
        },
        inverse = {
          match_paren = true,
          visual = true,
          search = false,
        },
        darken = {
          sidebars = {
            enable = false,
          },
        },
        module_default = true,
        modules = {},
      },
      group = {
        all = {
          DashboardHeader = { fg = '#00ff00' },
        },
      },
    }

    vim.cmd 'colorscheme github_dark_default'
  end,
}
