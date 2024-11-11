return {
  'akinsho/bufferline.nvim',
  event = 'VimEnter',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    { '[b', ':BufferLineCycleNext<CR>', desc = 'Go to next buffer', silent = true },
    { ']b', ':BufferLineCyclePrev<CR>', desc = 'Go to prev buffer', silent = true },
    { '<leader>mb', ':BufferLineMoveNext<CR>', desc = 'Move current buffer next', silent = true },
    { '<leader>mB', ':BufferLineMovePrev<CR>', desc = 'Move current buffer prev', silent = true },
    { '<leader>mp', ':lua require"bufferline".move_to(1)<CR>', desc = 'Move current buffer to 1st', silent = true },
    { '<leader>mP', ':lua require"bufferline".move_to(-1)<CR>', desc = 'Move current buffer to last', silent = true },
  },
  opts = {
    options = {
      themable = true,
      modified_icon = ' ',
      diagnostics = 'nvim_lsp',
      diagnostics_indicator = function(_, _, diagnostics_dict, context) -- omitted 'count', 'level'
        if context.buffer:current() then
          return ''
        end
        local s = ' '
        for e, n in pairs(diagnostics_dict) do
          local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or '')
          s = s .. n .. sym
        end
        return s
      end,
      separator_style = 'slope',
      offsets = {
        {
          filetype = 'neo-tree',
          text = '󱏓 File Explorer',
          text_align = 'center',
          separator = true,
        },
      },
    },
  },
}
