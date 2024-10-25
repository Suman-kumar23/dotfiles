return {
  -- messages, cmdline and the popupmenu
  {
    'folke/noice.nvim',
    config = function()
      local focused = true
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function(event)
          vim.schedule(function()
            require('noice.text.markdown').keys(event.buf)
          end)
        end,
      })
      vim.api.nvim_create_autocmd('FocusGained', {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd('FocusLost', {
        callback = function()
          focused = false
        end,
      })

      require('noice').setup {
        routes = {
          {
            filter = {
              event = 'notify',
              find = 'No information available',
            },
            opts = { skip = true },
          },
          {
            filter = {
              cond = function()
                return not focused
              end,
            },
            view = 'notify_send',
            opts = { stop = false },
          },
        },
        commands = {
          all = {
            view = 'split',
            opts = { enter = true, format = 'details' },
            filter = {},
          },
        },
        presets = {
          lsp_doc_border = true,
        },
      }
    end,
  },

  {
    'rcarriga/nvim-notify',
    opts = {
      timeout = 1000,
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
}
