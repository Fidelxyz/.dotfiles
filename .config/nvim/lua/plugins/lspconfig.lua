return {
    {
        "mason-org/mason.nvim",
        lazy = true,
        opts = {},
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },
        cond = require("utils").is_not_vscode,
        event = "VeryLazy",

        opts = {
            ensure_installed = {
                -- C / C++
                "clangd",
                "clang-format",
                -- Python
                "ruff",
                "basedpyright",
                -- Lua
                "lua_ls",
                -- Rust
                "rust_analyzer",
                -- Javascript, Typescript & Vue
                "biome", -- for biome-organize-imports
                "vtsls",
                "vue_ls",
                "tailwindcss",
            },
            auto_update = true,
        },

        config = function(_, opts)
            require("mason-tool-installer").setup(opts)
            vim.api.nvim_command("MasonToolsInstall")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
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
            vim.lsp.config("clangd", {
                cmd = { "clangd", "--clang-tidy" },
            })
            vim.lsp.enable("clangd")

            -- Python
            vim.lsp.enable("ruff")
            vim.lsp.enable("basedpyright")

            -- Lua
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
            vim.lsp.enable("lua_ls")

            -- Rust
            vim.lsp.config("rust_analyzer", {
                settings = {
                    ["rust-analyzer"] = {
                        check = { command = "clippy" },
                    },
                },
            })
            vim.lsp.enable("rust_analyzer")

            -- Vue
            local vue_language_server_path = vim.fn.stdpath("data")
                .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
            local vue_plugin = {
                name = "@vue/typescript-plugin",
                location = vue_language_server_path,
                languages = { "vue" },
                configNamespace = "typescript",
            }
            vim.lsp.config("vtsls", {
                settings = {
                    vtsls = {
                        tsserver = {
                            globalPlugins = {
                                vue_plugin,
                            },
                        },
                    },
                    typescript = {
                        inlayHints = {
                            parameterNames = { enabled = "all" },
                            parameterTypes = { enabled = true },
                            variableTypes = { enabled = true },
                            propertyDeclarationTypes = { enabled = true },
                            functionLikeReturnTypes = { enabled = true },
                            enumMemberValues = { enabled = true },
                        },
                    },
                },
                filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
            })
            vim.lsp.config("vue_ls", {
                on_init = function(client)
                    client.handlers["tsserver/request"] = function(_, result, context)
                        local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
                        if #clients == 0 then
                            vim.notify(
                                "Could not found `vtsls` lsp client, vue_lsp would not work without it.",
                                vim.log.levels.ERROR
                            )
                            return
                        end
                        local ts_client = clients[1]

                        local param = unpack(result)
                        local id, command, payload = unpack(param)
                        ts_client:exec_cmd({
                            title = "vue_request_forward", -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
                            command = "typescript.tsserverRequest",
                            arguments = {
                                command,
                                payload,
                            },
                        }, { bufnr = context.bufnr }, function(_, r)
                            local response_data = { { id, r.body } }
                            ---@diagnostic disable-next-line: param-type-mismatch
                            client:notify("tsserver/response", response_data)
                        end)
                    end
                end,
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
            vim.lsp.enable({ "vtsls", "vue_ls" })
            vim.lsp.enable("tailwindcss")
        end,
    },
}
