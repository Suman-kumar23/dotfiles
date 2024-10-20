return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
  },

  config = function()
    local fb_actions = require 'telescope._extensions.file_browser.actions'
    local function telescope_buffer_dir()
      return vim.fn.expand '%:p:h'
    end
    require('telescope').setup {
      extensions = {
        file_browser = {
          path = '%:p:h',
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = false,
          initial_mode = 'normal',
          layout_config = { height = 20 },
          theme = 'dropdown',
          hijack_netrw = true,
          mappings = {
            ['i'] = {},
            ['n'] = {
              ['/'] = function()
                vim.cmd 'startinsert'
              end,
              ['n'] = fb_actions.create,
              ['r'] = fb_actions.rename,
              ['d'] = fb_actions.remove,
              ['c'] = fb_actions.copy,
            },
          },
        },
      },
    }
    vim.keymap.set('n', '<leader>e', function()
      require('telescope').extensions.file_browser.file_browser()
    end, { desc = 'Open File browser' })
  end,
}
