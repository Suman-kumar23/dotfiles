vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("sumangroup", {}),
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})
