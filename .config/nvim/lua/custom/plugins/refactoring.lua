return {
  'ThePrimeagen/refactoring.nvim',
  dependecies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('refactoring').setup {}
  end,
}
