return {
  'nvim-lualine/lualine.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'catppuccin',
        component_separators = { left = ' ', right = ' ' },
        section_separators = { left = ' ', right = ' ' },
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          { 'mode', fmt = function(str) return str:sub(1, 1) end }
        },
        lualine_b = { 'branch' },
        lualine_c = {
          {
            'buffers',
            show_filename_only = true,
            show_modified_status = true,
            mode = 0,
            max_length = vim.o.columns * 2 / 3,
            filetype_names = {
              TelescopePrompt = 'Telescope',
              dashboard = 'Dashboard',
              alpha = 'Alpha'
            },
            use_mode_colors = false,
            symbols = {
              modified = ' ●',
              alternate_file = '', 
              directory =  '',
            },
          }
        },
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
