return {
    "stevearc/oil.nvim",
    opts = {
        default_file_explorer = true,
        columns = {
            "icon",
            "permissions",
            "size",
            "mtime"
        },
        delete_to_trash = true,
        constrain_cursor = "name",
        watch_for_changes = true,
        view_options = {
            show_hidden = true,
        }
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
