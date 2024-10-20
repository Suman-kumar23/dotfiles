return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {}
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      direction = 'float',
      float_opts = {
        border = 'curved',
      },
      hidden = true,
    }

    function _lazygit_toggle()
      lazygit:toggle()
    end
  end,
}
