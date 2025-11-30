return {
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        optional = true,
        opts = {
            ensure_installed = {
                "clang-format",
                "glsl_analyzer",
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        optional = true,
        opts = {
            ensure_installed = { "glsl" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        optional = true,
        opts = function()
            vim.lsp.enable("glsl_analyzer")
        end,
    },
    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters_by_ft = {
                glsl = { "clang-format" },
            },
        },
    },
}
