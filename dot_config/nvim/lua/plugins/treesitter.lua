-- :TSInstall <language> to improve syntax highlighting for language
-- You also may need to do `cargo install --locked tree-sitter-cli`
return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
}
