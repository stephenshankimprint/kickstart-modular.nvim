return {
  'tpope/vim-fugitive',
  dependencies = {
    'tpope/vim-rhubarb',
  },
  keys = {
    { 'gh', ':GBrowse<CR>', desc = 'Open on GitHub', silent = true },
    { 'gH', ':.GBrowse<CR>', desc = 'Open line on GitHub', silent = true },
  },
}
