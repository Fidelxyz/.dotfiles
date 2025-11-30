return {
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        optional = true,
        opts = {
            ensure_installed = {
                "ruff",
                "basedpyright",
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        optional = true,
        opts = {
            ensure_installed = { "python" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        optional = true,
        opts = function()
            vim.lsp.enable("ruff")
            vim.lsp.config("basedpyright", {
                settings = {
                    basedpyright = {
                        analysis = {
                            typeCheckingMode = "standard",
                        },
                    },
                },
            })
            vim.lsp.enable("basedpyright")
        end,
    },
    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters_by_ft = {
                python = { "ruff_format", "ruff_organize_imports", "ruff_fix" },
            },
        },
    },
}
