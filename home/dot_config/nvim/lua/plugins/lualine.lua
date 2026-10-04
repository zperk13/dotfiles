return {
    "nvim-lualine/lualine.nvim",
    opts = {
        theme = "gruvbox_dark",
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff" },
            lualine_c = {
                {
                    "filename",
                    symbols = {
                        modified = "[Modified]",  -- Text to show when the file is modified.
                        readonly = "[Read Only]", -- Text to show when the file is non-modifiable or readonly.
                        unnamed = "[Unnamed]",    -- Text to show for unnamed buffers.
                        newfile = "[New File]",   -- Text to show for newly created file before first write
                    }
                },
                {
                    "diagnostics",
                    symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
                    update_in_insert = true
                }
            },
            lualine_x = { "venv-selector", "encoding", "filesize" },
            lualine_y = { "progress" },
            lualine_z = { "location" }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {}
        }
    }
}
