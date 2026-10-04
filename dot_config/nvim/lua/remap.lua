-- use default bindings for https://github.com/kylechui/nvim-surround/
--
-- Keybinds for blink (completion):
-- C-space: Open menu
-- C-n/C-p or Up/Down: Select next/previous item
-- C-e: Hide menu
-- C-k: Toggle signature help
-- Tab: accept
-- C-b: scroll documentation up
-- C-f: scroll documentation down

local keymap = vim.keymap

keymap.set({ 'n', 'v' }, "<Space>", "<Nop>", { silent = true })

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("i", "<C-v>", '<Esc>"+pa')

keymap.set("i", "<C-Space>", function() vim.lsp.completion.get() end)

keymap.set("t", "<esc>", "<C-\\><C-N>")

keymap.set("n", "yA", "mAgg0\"+yG'A", { desc = "Copy the entierty of the current buffer to the system clipboard" })

keymap.set("n", "<leader>x", ":!chmod +x %<CR><CR>", { desc = "chmod +x file" })

if vim.g.neovide then
    keymap.set({ 'n', 'i', 'v', 't' }, "<f11>", function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end)
end

keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "Find [f]iles" })
keymap.set("n", "<leader>sa", require("telescope.builtin").live_grep, { desc = "Live grep in [a]ll files" })
keymap.set("n", "<leader>sb", require("telescope.builtin").buffers, { desc = "Open [b]uffers" })
keymap.set("n", "<leader>sq", require("telescope.builtin").quickfix, { desc = "[q]uickfix" })
keymap.set("n", "<leader>sc", require("telescope.builtin").current_buffer_fuzzy_find, { desc = "[c]urrent buffer" })
keymap.set("n", "<leader>sn", require("telescope").extensions.notify.notify, { desc = "[n]otify" })

local function settabs(n)
    local opt = vim.opt
    opt.tabstop = n
    opt.softtabstop = 0
    -- 0 makes it use tabstop
    opt.shiftwidth = 0
    opt.expandtab=false
    vim.cmd("retab")
end

local function setspaces(n)
    local opt = vim.opt
    opt.tabstop = n
    opt.softtabstop = n
    -- 0 makes it use tabstop
    opt.shiftwidth = 0
    -- Makes tab use spaces instead when in insert mode
    opt.expandtab = true
    vim.cmd("retab")
end

keymap.set("n", "<leader>vnr", function() vim.cmd("set relativenumber!") end,
    { desc = "Toggle line number [r]elativity" })
keymap.set("n", "<leader>vnt", function() vim.cmd("set number!") end, { desc = "[T]oggle line numbers" })
keymap.set("n", "<leader>vi", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
    { desc = "Toggle [i]nlay hints" })
keymap.set("n", "<leader>vw", function() vim.cmd("set wrap!") end, { desc = "Toggle [w]rap" })
for i=1,9 do
    keymap.set("n", "<leader>vs"..i, function() setspaces(i) end)
    keymap.set("n", "<leader>vt"..i, function() settabs(i) end)
end

-- "Smart dd" from Reddit. Only yanks the line if not empty
keymap.set("n", "dd", function()
    if vim.fn.getline(".") == "" then return '"_dd' end
    return "dd"
end, { expr = true })

local function open_terminal()
    local opened_terminal = false

    -- iterate through buffers
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        -- if this isn't here, it will error sometimes. why am i given an invalid buffer? idk
        if vim.api.nvim_buf_is_valid(buf) then
            local buffer_name = vim.api.nvim_buf_get_name(buf);
            if string.sub(buffer_name, 1, 5) == "term:" then
                vim.cmd.buffer(buffer_name)
                opened_terminal = true
                break
            end
        end
    end
    if not opened_terminal then
        vim.cmd.terminal()
    end
end

keymap.set("n", "<leader>tv", function()
    vim.cmd.vsplit()
    open_terminal()
end, { desc = "[v]ertical split" }
)
keymap.set("n", "<leader>th", function()
    vim.cmd.split()
    open_terminal()
end, { desc = "[h]orizontal split" }
)
keymap.set("n", "<leader>tc", function()
    open_terminal()
end, { desc = "[c]urrent buffer" }
)
keymap.set("n", "<leader>tf", function()
    open_terminal()
    vim.cmd.only()
end, { desc = "[f]ullscreen" }
)

keymap.set('n', "<leader>u", "<CMD>UndotreeToggle<CR>", { desc = "[u]ndotree" })

keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, { desc = "[c]ode action" })
keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, { desc = "re[n]ame" })
keymap.set("n", "<leader>lrf", vim.lsp.buf.references, { desc = "re[f]erences" })
keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { desc = "[i]mplementation" })
keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "[h]over" })
keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "[f]ormat" })
keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "[d]efinition" })
keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "[d]iagnostics" })

keymap.set("n", "<leader>o", ":Oil<CR>", { desc = "[o]il" })

local trouble = require("trouble")
keymap.set("n", "<leader>ec", trouble.close, { desc = "[c]lose" })
keymap.set("n", "<leader>er", trouble.refresh, { desc = "[r]efresh" })
keymap.set("n", "<leader>eod", function() trouble.open("diagnostics") end, { desc = "[d]iagnostics" })
keymap.set("n", "<leader>eoq", function() trouble.open("quickfix") end, { desc = "[q]uickfix" })
keymap.set("n", "<leader>eolc", function() trouble.open("lsp_declarations") end, { desc = "de[c]larations" })
keymap.set("n", "<leader>eolf", function() trouble.open("lsp_definitions") end, { desc = "de[f]initions" })
keymap.set("n", "<leader>eols", function() trouble.open("lsp_document_symbols") end, { desc = "[s]ymbols" })
keymap.set("n", "<leader>eolm", function() trouble.open("lsp_implementations") end, { desc = "i[m]plementations" })
keymap.set("n", "<leader>eoli", function() trouble.open("lsp_incoming_calls") end, { desc = "[i]ncoming calls" })
keymap.set("n", "<leader>eolo", function() trouble.open("lsp_outgoing_calls") end, { desc = "[o]utgoing calls" })
keymap.set("n", "<leader>eolr", function() trouble.open("lsp_references") end, { desc = "[r]eferences" })
keymap.set("n", "<leader>eolt", function() trouble.open("lsp_type_definitions") end, { desc = "[t]ype definitions" })

keymap.set('n', "<leader>gl", "<CMD>Gitsigns toggle_linehl<CR>", { desc = "Toggle [l]ine highlight" })
keymap.set('n', "<leader>gw", "<CMD>Gitsigns toggle_word_diff<CR>", { desc = "Toggle [w]ord diff" })

local flash = require("flash")
keymap.set('n', "<leader>ff", function() flash.jump() end, { desc = "[f]ind" })
keymap.set('n', "<leader>fc", function() flash.jump({ continue = true }) end, { desc = "[c]ontinue last search" })

require("which-key").add {
    { "<leader>s",   group = "Tele[s]cope" },
    { "<leader>v",   group = "[v]anilla vim" },
    { "<leader>vn",  group = "[n]umbers" },
    { "<leader>vs",  group = "[s]paces" },
    { "<leader>vt",  group = "[t]abs" },
    { "<leader>e",   group = "troubl[e]" },
    { "<leader>eo",  group = "[o]pen" },
    { "<leader>eol", group = "[l]sp" },
    { "<leader>t",   group = "[t]erminal" },
    { "<leader>g",   group = "[g]itsigns" },
    { "<leader>f",   group = "[f]lash (find)" },
    { "<leader>l",   group = "[L]SP" },
    { "<leader>lr",  group = "[r]e" }
}
