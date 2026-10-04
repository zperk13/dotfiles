vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = '*',
    callback = vim.snippet.stop,
})
