return {
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        optional = true,
        opts = {
            ensure_installed = {
                "biome", -- for biome-organize-imports
                "vtsls",
                "vue_ls",
                "tailwindcss",
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        optional = true,
        opts = {
            ensure_installed = { "css", "html", "javascript", "jsdoc", "typescript", "vue" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        optional = true,
        opts = function()
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
    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters_by_ft = {
                javascript = { "prettier", "biome-organize-imports" },
                typescript = { "prettier", "biome-organize-imports" },
                vue = { "prettier", "biome-organize-imports" },
            },
        },
    },

    -- Extra plugins
    {
        "windwp/nvim-ts-autotag",
        event = { "BufReadPre", "BufNewFile" },

        opts = {
            enable_close_on_slash = true,
        },
    },
}
