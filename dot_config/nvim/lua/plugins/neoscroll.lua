return {
    "karb94/neoscroll.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    cond = not vim.g.neovide
}
