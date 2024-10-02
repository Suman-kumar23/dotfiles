return {
  'craftzdog/solarized-osaka.nvim',
  lazy = false,
  priority = 1000,
  opts = function()
    return {
      transparent = true,
    }
  end,
  config = function()
    local solar = require 'solarized-osaka'
    solar.setup {}
    vim.cmd [[colorscheme solarized-osaka]]
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  end,
}
