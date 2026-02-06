return {
  'nvim-mini/mini.files',
  dependencies = { {
    'nvim-mini/mini.icons',
    config = function()
      require('mini.icons').setup()
    end
  } },
  config = function()
    require('mini.files').setup()
    vim.keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })
  end

}
