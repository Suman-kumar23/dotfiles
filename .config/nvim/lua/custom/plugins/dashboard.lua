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
          { icon = '  ', desc = 'New file', action = 'enew' },
          { icon = '  ', desc = 'Find file               ', key = 'Space + f', action = 'Telescope find_files' },
          { icon = '  ', desc = 'Recent files            ', key = 'Space + h', action = 'Telescope oldfiles' },
          { icon = '  ', desc = 'Find Word               ', key = 'Space + g', action = 'Telescope live_grep' },
        },
        footer = {}, --your footer
      },
      hide = {
        statusline = false,
        tabline = false,
        winbar = false,
      },
    }
  end,

  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
