vim.keymap.set("n", "<leader>h", ":noh<CR>")
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- with tab and shift tab you can tab your selection in and out 

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<c-j>", "<c-d>zz")
vim.keymap.set("n", "<c-k>", "<c-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- if you replace something the clipboard stays the same
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<c-s>", ":w<CR>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>s", "/")

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>R", ":s/\\%V\\<\\>/R/g<Left><Left><Left><Left><Left><Left>")
vim.keymap.set("v", "<leader>r", ":s/\\%V/R/g<Left><Left><Left><Left>")

-- you can switch to other screens in split view
vim.keymap.set("n", "<Tab>", "<c-w>w")

-- close a tab
vim.keymap.set("n", "<leader>q", ":tabc<CR>")

vim.keymap.set("n", "E", "$")
vim.keymap.set("v", "E", "$h")
vim.keymap.set("n", "B", "0")
vim.keymap.set("v", "B", "0")

-- switch to normal mode while in terminal
vim.keymap.set('t', '<c-n>', '<c-\\><c-N>')

vim.keymap.set("n", "<leader>cmd", ":belowright 15split | terminal<CR>")

vim.keymap.set("n", ".", "@@")

vim.keymap.set('n', 'f<leader>', ":call search(\"[][\\\"'(){}<>]\", \"W\")<CR>")
vim.keymap.set('n', 'F<leader>', ":call search(\"[][\\\"'(){}<>]\", \"bW\")<CR>")
vim.keymap.set('v', 'f<leader>', "omao<c-c>:call search(\"[][\\\"'(){}<>]\", \"W\")<CR>mb`av`b")
vim.keymap.set('v', 'F<leader>', "omao<c-c>:call search(\"[][\\\"'(){}<>]\", \"bW\")<CR>mb`av`b")

vim.keymap.set("n", "<leader><leader>", "%")
vim.keymap.set("v", "<leader><leader>", "%")

vim.opt.clipboard = "unnamedplus"
