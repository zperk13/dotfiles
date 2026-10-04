return {
    "saghen/blink.cmp",

    event = "InsertEnter",

    dependencies = {
        {
            "folke/lazydev.nvim",
        }
    },

    version = '1.*',

    opts = {
        completion = {
            documentation = { auto_show = true },
            menu = {
                draw = {
                    -- Default is { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } }
                    columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name", gap = 1 } }
                }
            }
        },
        keymap = { preset = "super-tab" },
        signature = { enabled = true },
        sources = {
            -- default for default is { 'lsp', 'path', 'snippets', 'buffer' }
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            -- Everything in the below table is copied and pasted from lazydev.nvim's README.md
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
                path = {
                    opts = {
                        show_hidden_files_by_default = true,
                    }
                }
            }
        }
    },
}
