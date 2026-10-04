local opt = vim.opt
local o = vim.o
local g = vim.g

-- Shows line numbers on the left
opt.number = true
-- Makes the line numbers relative
opt.relativenumber = true

-- make tabs look like they're 4 spaces wide (default: 8)
opt.tabstop = 4
-- make the tab button insert 4 spaces in editing operations (default: 0, an actual tab character)
opt.softtabstop = 4
-- The number of spaces to use when indenting. 0 makes it use tabstop. (default: 8)
opt.shiftwidth = 0
-- Makes tab use spaces instead when in insert mode
opt.expandtab = true

-- Automatically indent when making a new line if it makes sense to, such as after a {
opt.smartindent = true

-- Makes / searching update live instead of having to type the whole search query first
opt.incsearch = true

-- 24-bit RGB
opt.termguicolors = true

-- Makes it so there will always be at least 8 lines visible above and below your cursor (unless you're at the start/end of a file) (default: 0)
opt.scrolloff = 8

-- Disables the mouse
opt.mouse = ""

-- Highlights the current line the cursor is on
opt.cursorline = true

opt.linebreak = false

opt.updatetime = 1000
opt.timeoutlen = 1000
opt.timeout = true

opt.hlsearch = false

opt.titlestring = "Neovim"
opt.title = true

opt.splitright = true

vim.api.nvim_create_user_command("W", "w", {})
vim.api.nvim_create_user_command("Q", "q", {})
vim.api.nvim_create_user_command("Wq", "wq", {})
vim.api.nvim_create_user_command("WQ", "wq", {})
vim.api.nvim_create_user_command("Qa", "qa", {})
vim.api.nvim_create_user_command("QA", "qa", {})
vim.api.nvim_create_user_command("Wqa", "wqa", {})
vim.api.nvim_create_user_command("WQa", "wqa", {})
vim.api.nvim_create_user_command("WQA", "wqa", {})

-- Spell checking
opt.spell = true
opt.spelllang = "en_us"

-- Disables the default mode indicator since lualine has it
opt.showmode = false

-- opt.foldmethod = "expr"
-- opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- opt.foldenable = true
-- opt.foldlevel = 99
-- opt.foldlevelstart = 2
-- opt.foldnestmax = 4

-- virtual_text is inlay hints
vim.diagnostic.config({ virtual_text = true })

-- opt.completeopt = { "menuone", "noselect", "popup" }
