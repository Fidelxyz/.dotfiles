return {
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        optional = true,
        opts = {
            ensure_installed = {
                "rust_analyzer",
            },
        },
    },
    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters_by_ft = {
                rust = { "rustfmt" },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        optional = true,
        opts = function()
            vim.lsp.config("rust_analyzer", {
                settings = {
                    ["rust-analyzer"] = {
                        check = { command = "clippy" },
                    },
                },
            })
            vim.lsp.enable("rust_analyzer")
        end,
    },
}
