require('lualine').setup {
    options = {
        theme = "catppuccin"
    },
            winbar = {
                lualine_a = {
                    { "filename", file_status = false, path = 1 },
                },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
        }
