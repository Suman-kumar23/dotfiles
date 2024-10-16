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
  end,
}
