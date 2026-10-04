return {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
        enabled = function(dir)
            if not dir then return false end
            return string.find(dir, "nvim") ~= nil
        end,
    },
    config = true
}
