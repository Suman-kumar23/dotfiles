local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Increment / decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

--  jk for escape in insert mode
keymap.set("i", "jk", "<ESC>")
keymap.set("i", "kj", "<ESC>")

keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>")

--select all
keymap.set("n", "<C-a>", "gg<S-v>G")

--save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":quit<Return>", opts)
keymap.set("n", "<Leader>Q", ":qa<Return>", opts)

-- File explorer with nvimTree
keymap.set("n", "<Leader>t", ":NvimTreeToggle<Return>", opts)
keymap.set("n", "<Leader>f", ":NvimTreeFindFile<Return>", opts)

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", "<cmd>tabnext<cr>")
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<cr>", opts)

-- split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-S-h>", "<C-w><")
keymap.set("n", "<C-S-l>", "<C-w>>")
keymap.set("n", "<C-S-k>", "<C-w>+")
keymap.set("n", "<C-S-j>", "<C-w>-")

-- Diagnostics
-- keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
-- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end)

--  theprimeagen keymaps

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("x", "<Leader>p", [["_dP]])

keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")

keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode." })
