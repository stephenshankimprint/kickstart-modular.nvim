-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true,
      open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf', 'Avante', 'AvanteInput' },
      sort_case_insensitive = true,
      default_component_configs = {
        modified = {
          symbol = '',
          highlight = 'NeoTreeModified',
        },
        name = {
          trailing_slash = true,
        },
        diagnostics = {
          symbols = {
            hint = '',
            info = '',
            warn = '',
            error = '',
          },
        },
      },
      source_selector = {
        winbar = true,
        sources = { -- table
          {
            source = 'filesystem', -- string
            display_name = ' 󰉓 Files ', -- string | nil
          },
          {
            source = 'buffers', -- string
            display_name = ' 󰈚 Buffers ', -- string | nil
          },
          {
            source = 'git_status', -- string
            display_name = ' 󰊢 Git ', -- string | nil
          },
          {
            source = 'document_symbols',
            display_name = '  Symbols',
            follow_cursor = true,
          },
        },
      },
      filesystem = {
        filtered_items = {
          visible = false,
          always_show = {
            '.gitignore',
            '.github',
          },
          never_show = {
            '.DS_Store',
            'thumbs.db',
          },
        },
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
      },
    }
    -- Copied from astronvim https://github.com/AstroNvim/AstroNvim/blob/fabf81a3f180c022c8dd5b899fadbb191b8b91ba/lua/astronvim/plugins/neo-tree.lua#L21
    --   vim.api.nvim_create_augroup('neotree', {})
    --   vim.api.nvim_create_autocmd('BufEnter', {
    --     desc = 'Open Neotree on startup with a directory',
    --     group = 'neotree',
    --     callback = function()
    --       if package.loaded['neo-tree'] then
    --         return true
    --       else
    --         local stats = vim.uv.fs_stat(vim.api.nvim_buf_get_name(0))
    --         if stats and (stats.type == 'directory' or stats.type == 'file') then
    --           require('lazy').load { plugins = { 'neo-tree.nvim' } }
    --           return true
    --         end
    --       end
    --     end,
    --   })
  end,
}
