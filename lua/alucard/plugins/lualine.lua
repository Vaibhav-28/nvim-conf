return {
  'nvim-lualine/lualine.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'catppuccin',
        component_separators = { left = ' ', right = ' ' }, -- Remove dividers between components
        section_separators = { left = ' ', right = ' ' },   -- Remove the "arrow" blocks
        globalstatus = true,                                -- Single bar at the bottom for all windows
      },
      sections = {
        lualine_a = {
          { 'mode', fmt = function(str) return str:sub(1, 1) end } -- Only show the first letter of the mode
        },
        lualine_b = { 'branch' },
        lualine_c = { { 'filename', file_status = true, path = 1 } }, -- Path = 1 shows relative path
        lualine_x = { 'diagnostics', 'diff' },
        lualine_y = { 'filetype' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
    })
  end
}
