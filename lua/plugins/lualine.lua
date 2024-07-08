return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      globalstatus = true,
    },
    winbar = {
      -- lualine_a = { "fileformat" },
      -- lualine_b = { "filename" },
      lualine_c = {
        {
          "filetype",
          colored = true,             -- Displays filetype icon in color if set to true
          icon_only = true,           -- Display only an icon for filetype
          icon = { align = 'right' }, -- Display filetype icon on the right hand side
          -- icon =    {'X', align='right'}
          -- Icon string ^ in table is ignored in filetype component
          separator = " ",
        },
        {
          "filename",
          file_status = true,
          separator = " ",
          symbols = {
            modified = '[󱩽]',  -- Text to show when the file is modified.
            readonly = '[]',  -- Text to show when the file is non-modifiable or readonly.
            unnamed = '[No Name]', -- Text to show for unnamed buffers.
            newfile = '[New File 󱩽]', -- Text to show for newly created file before first write
          }
        }
      },
    },
    inactive_winbar = {
      lualine_c = {
        {
          "filetype",
          colored = true,             -- Displays filetype icon in color if set to true
          icon_only = true,           -- Display only an icon for filetype
          icon = { align = 'right' }, -- Display filetype icon on the right hand side
          -- icon =    {'X', align='right'}
          -- Icon string ^ in table is ignored in filetype component
          separator = " ",
        },
        {
          "filename",
          file_status = true,
          separator = " ",
          symbols = {
            modified = '[󱩽]',  -- Text to show when the file is modified.
            readonly = '[]',  -- Text to show when the file is non-modifiable or readonly.
            unnamed = '[No Name]', -- Text to show for unnamed buffers.
            newfile = '[New File 󱩽]', -- Text to show for newly created file before first write
          }
        }
      },
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', },
      lualine_c = {  { 'filename', file_status = true, path = 1, } },
      lualine_x = { 'diagnostics', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
  },
}
