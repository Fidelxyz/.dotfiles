local mason_packages = vim.fn.stdpath("data") .. "/mason/packages"
local volar_path = mason_packages .. "/vue-language-server/node_modules/@vue/language-server"

return {
    "neovim/nvim-lspconfig",
    version = "*",
    dependencies = { "saghen/blink.cmp" },
    cond = require("utils").is_not_vscode,

    event = { "BufReadPre", "BufNewFile" },

    keys = {
        {
            "<C-CR>",
            function() vim.lsp.buf.code_action() end,
            desc = "Code action",
        },
    },

    config = function()
        -- C / C++
        vim.lsp.enable("clangd")
        vim.lsp.config("clangd", {
            cmd = {
                "clangd",
                "--clang-tidy",
            },
        })

        -- Python
        vim.lsp.enable("ruff")
        vim.lsp.enable("basedpyright")

        -- Lua
        vim.lsp.enable("lua_ls")
        vim.lsp.config("lua_ls", {
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                        path ~= vim.fn.stdpath("config")
                        and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
                    then
                        return
                    end
                end

                client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most
                        -- likely LuaJIT in the case of Neovim)
                        version = "LuaJIT",
                        -- Tell the language server how to find Lua modules same way as Neovim
                        -- (see `:h lua-module-load`)
                        path = {
                            "lua/?.lua",
                            "lua/?/init.lua",
                        },
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                            -- Depending on the usage, you might want to add additional paths
                            -- here.
                            -- '${3rd}/luv/library'
                            -- '${3rd}/busted/library'
                        },
                        -- Or pull in all of 'runtimepath'.
                        -- NOTE: this is a lot slower and will cause issues when working on
                        -- your own configuration.
                        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                        -- library = {
                        --   vim.api.nvim_get_runtime_file('', true),
                        -- }
                    },
                })
            end,
            settings = {
                Lua = {},
            },
        })

        -- Rust
        vim.lsp.enable("rust_analyzer")
        vim.lsp.config("rust_analyzer", {
            settings = {
                ["rust-analyzer"] = {
                    check = { command = "clippy" },
                },
            },
        })

        -- Typescript
        vim.lsp.enable("ts_ls")
        vim.lsp.config("ts_ls", {
            init_options = {
                plugins = {
                    {
                        name = "@vue/typescript-plugin",
                        location = volar_path,
                        languages = { "vue" },
                    },
                },
            },
            settings = {
                typescript = {
                    inlayHints = {
                        includeInlayParameterNameHints = "all",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    },
                },
                javascript = {
                    inlayHints = {
                        includeInlayParameterNameHints = "all",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    },
                },
            },
        })
        vim.lsp.enable("biome")

        -- Vue
        vim.lsp.enable("vue_ls")
        vim.lsp.config("vue_ls", {
            init_options = {
                vue = { hybridMode = false },
            },
            settings = {
                typescript = {
                    inlayHints = {
                        enumMemberValues = { enabled = true },
                        functionLikeReturnTypes = { enabled = true },
                        propertyDeclarationTypes = { enabled = true },
                        parameterTypes = {
                            enabled = true,
                            suppressWhenArgumentMatchesName = true,
                        },
                        variableTypes = { enabled = true },
                    },
                },
                javascript = {
                    inlayHints = {
                        enumMemberValues = { enabled = true },
                        functionLikeReturnTypes = { enabled = true },
                        propertyDeclarationTypes = { enabled = true },
                        parameterTypes = {
                            enabled = true,
                            suppressWhenArgumentMatchesName = true,
                        },
                        variableTypes = { enabled = true },
                    },
                },
                vue = {
                    inlayHints = {
                        destructuredProps = true,
                        missingProps = true,
                        inlineHandlerLeading = true,
                        optionsWrapper = true,
                        vBindShorthand = true,
                    },
                },
            },
        })
        vim.lsp.enable("tailwindcss")
    end,
}
