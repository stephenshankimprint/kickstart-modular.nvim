return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    local neovim = require 'custom.ascii.text.neovim'
    local tables = {
      neovim.larry_3d,
      neovim.ansi_shadow,
      neovim.isometric,
      neovim.sharp,
      neovim.slant_relief,
      neovim.elite,
      neovim.banner3,
      neovim.def_leppard,
      neovim.dos_rebel,
      neovim.bloody,
    }
    math.randomseed(os.time())

    require('dashboard').setup {
      theme = 'hyper',
      shortcut_type = 'number',
      config = {
        header = tables[math.random(#tables)],
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
