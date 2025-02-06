return {
  {
    "ThePrimeagen/refactoring.nvim",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup({})
    end,
  },
  {
    -- incremental rename
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    keys = {
      {
        "<leader>rn",
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        desc = "incremental rename",
        mode = "n",
        noremap = true,
        expr = true,
      },
    },
    config = true,
  },
}
