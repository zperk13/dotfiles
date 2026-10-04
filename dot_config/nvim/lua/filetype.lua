local add = vim.filetype.add
add({
    extension = {
        mcfunction = "mcfunction"
    },
    pattern = {
        -- fallback
        ['.*'] = {
            function (path, bufnr)
                local ls = vim.api.nvim_buf_get_lines(bufnr, 0, 2, false)
                if vim.regex("^#!.\\{-}nix-shell"):match_str(ls[1]) and vim.regex("^#!\\s\\{-}nix-shell -i bash"):match_str(ls[2]) then
                    return "bash"
                end
            end,
            { priority = -math.huge }
        }
    }
})
