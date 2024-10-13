return {

  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    local banners = require 'custom.banners'
    local name = 'majora'

    local bg = vim.o.background
    local banner = banners[name .. '_' .. bg] or banners[name]
    local result = vim.split(banner, '\n', {})

    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = result,
        center = {
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Find File           ',
            desc_hl = 'String',
            key = 'b',
            keymap = 'SPC f f',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'Telescope find_files',
          },
          {
            icon = ' ',
            desc = 'Find Dotfiles',
            key = 'f',
            keymap = 'SPC f d',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'lua print(3)',
          },
        },
        footer = {}, --your footer
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
