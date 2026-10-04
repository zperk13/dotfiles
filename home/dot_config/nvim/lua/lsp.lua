-- Extra configs coming from nvim-lspconfig plugin
-- To get nvim to recognize stuff installed by pipx, cargo, ghcup, and pnpm, I had to replace `export PATH` in /etc/profile with `export PATH="$PATH:/home/<USERNAME>/.cargo/bin:/home/<USERNAME>/.local/bin:/home/<USERNAME>/.ghcup/bin:/home/<USERNAME>/.local/share/pnpm"` and you need to use the full username path, ~ won't work
local packages = {
    -- Python LSP
    -- pipx install basedpyright
    basedpyright = {
        settings = {
            basedpyright = {
                analysis = {
                    diagnosticSeverityOverrides = {
                        reportAny = false,                   -- Sometimes any can't be avoided in python, especially when using libraries
                        reportImplicitRelativeImport = false -- This thing just seems to be wrong when working with scripts
                    }
                },
            },
        },
    },

    -- Bash LSP
    -- pacman -S bash-language-server
    bashls = {},


    -- Emmet LSP
    -- pnpm i -g @olrtg/emmet-language-server
    -- emmet_language_server = {},

    -- Installation instructions for hls on Arch Linux:
    -- 1. Install https://aur.archlinux.org/packages/ghcup-hs-bin
    -- 2. ghcup install hls
    -- 3. ghcup install ghc
    -- 4. cd ~/.ghcup/bin
    -- 5. ln -s 9.6.7 ghc
    --     5a. Replace 9.6.7 with whatever the version you have it
    -- 6. Ensure ~/.ghcup/bin is in $PATH. Refer to top of file for that.
    hls = {}, -- https://aur.archlinux.org/packages/ghcup-hs-bin ; ghcup install hls ; ghcup install ghc ;

    -- Lua LSP
    -- pacman -S lua-language-server
    lua_ls = {
        settings = {
            Lua = {}
        }
    },


    -- JavaScript/TypeScript formatter
    -- oxfmt = {
    --     cmd = { "oxfmt", "--lsp" },
    --     filetypes = {
    --         "javascript", "javascriptreact", "typescript", "typescriptreact",
    --         "json", "jsonc", "html", "css", "markdown"
    --     },
    --     root_markers = {
    --         ".oxfmtrc.json",
    --         "package.json",
    --         ".git"
    --     }
    -- },
    -- JavaScript/TypeScript linter
    -- pnpm i -g oxlint
    -- oxlint = {
    --     root_markers = { "oxlint.json", "package.json", "package-lock.json", ".git" }
    -- },

    -- Python linter + formatter
    -- pacman -S ruff
    ruff = {},

    -- Rust LSP
    -- pacman -S rustup ; rustup update
    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = true,
                check = {
                    command = "clippy"
                },
                cargo = {
                    allFeatures = true,
                },
                -- completion = {
                --     autoimport = false,
                --     callable = {
                --         snippets = "none"
                --     }
                -- },
                inlayHints = {
                    enabled = true,
                    typeHints = {
                        enable = true
                    }
                }
            }
        }
    },

    -- Minecraft Datapack LSP
    -- pnpm i -g @spyglassmc/language-server
    -- spyglassmc_language_server = {},

    -- cargo install taplo-cli --locked
    -- For TOML
    -- taplo = {},

    -- Typst LSP
    -- pacman -S tinymist
    tinymist = {
        settings = {
            formatterMode = "typstyle",
            lint = {
                enabled = true
            },
        }
    },

    -- pnpm i -g typescript@rc
    -- tsgo = {
    --     cmd = { "tsc", "--lsp", "--stdio" },
    --     root_markers = {
    --         "tsconfig.json",
    --         "package.json",
    --         "package-lock.json",
    --         ".git"
    --     },
    -- },

    -- https://aur.archlinux.org/packages/wgsl-analyzer
    -- or alternatively
    -- https://aur.archlinux.org/packages/wgsl-analyzer-bin
    wgsl_analyzer = {}

    -- vscode-langservers-extracted contains multiple LSPs.
    -- Everything in this table below this comment is for those.
    -- I'm not using the ESLint one, since I was having issues with it,
    -- and I have oxlint.
    -- pnpm i -g vscode-langservers-extracted
    -- cssls = {},
    -- jsonls = {},
    -- html = {},
}

for package_name, package_config in pairs(packages) do
    if package_config then
        vim.lsp.config(package_name, package_config)
    end
    vim.lsp.enable(package_name)
end
