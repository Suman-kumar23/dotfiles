return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        'nvim-telescope/telescope-file-browser.nvim',

        build = 'make',

        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      local fb_actions = require 'telescope._extensions.file_browser.actions'
      local function telescope_buffer_dir()
        return vim.fn.expand '%:p:h'
      end
      require('telescope').setup {
        extensions = {
          ui_select = {
            require('telescope.themes').get_dropdown(),
          },

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

      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', ';f', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', ';t', builtin.help_tags, { desc = 'Lists available help tags and opens a new window with the relevant help info on <cr>' })
      vim.keymap.set('n', ';sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', ';e', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', ';;', builtin.resume, { desc = 'Resume the previous telescope picker' })
      vim.keymap.set('n', '\\\\', builtin.buffers, { desc = 'Lists open buffers' })
      vim.keymap.set(
        'n',
        ';r',
        builtin.live_grep,
        { desc = 'Search for a string in your current working directory and get results live as you type, respects .gitignore' }
      )
      vim.keymap.set('n', ';k', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })

      vim.keymap.set('n', '<leader>e', function()
        require('telescope').extensions.file_browser.file_browser()
      end, { desc = 'Open File browser' })
    end,
  },
}
