local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "scroll half page down and center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "scroll half page up and center cursor" })

vim.keymap.set("n", "n", "nzzzv", { desc = "next search result and center cursor" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "previous search result and center cursor" })

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("i", "jk", "<Esc>", { desc = "exit insert mode" })

vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "delete without copying to register" })

vim.keymap.set("n", "<leader>s", [[ :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left> ]],
  { desc = "Replace word cursor is on globally" })

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "open new tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close current tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "go to next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "go to previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "open current file in new tab" })

vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Prev buffer' })
vim.keymap.set('n', '<leader>q', function()
    local bufnr = vim.api.nvim_get_current_buf()
    if vim.api.nvim_get_option_value("modified", { buf = bufnr }) then
        vim.notify("Buffer is modified! Save it or use <leader>Q to force close.", vim.log.levels.WARN)
        return
    end
    vim.cmd("bprevious")
    vim.cmd("confirm bdelete " .. bufnr)
end, { desc = 'Gracefully Close Buffer' })
vim.keymap.set('n', '<leader>Q', function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.cmd("bprevious")
    vim.cmd("bdelete! " .. bufnr)
end, { desc = 'FORCE Close Buffer (Discard changes)' })

vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "make splits equal size" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "close current split" })

vim.keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~")
  vim.fn.setreg("+", filePath)
  print("File path copied to clipboard: " .. filePath)
end, { desc = "copy file path to clipboard" })
