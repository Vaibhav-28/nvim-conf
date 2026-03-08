return {
  "nvzone/floaterm",
  dependencies = "nvzone/volt",
  opts = {},
  cmd = "FloatermToggle",
  config = function()
    require('floaterm').setup()
    vim.keymap.set("n", "<A-t>", "<cmd>FloatermToggle<CR>", { desc = "Toggle Floaterm" })
    vim.keymap.set("t", "<A-t>", "<cmd>FloatermToggle<CR>", { desc = "Toggle Floaterm" })
  end
}
