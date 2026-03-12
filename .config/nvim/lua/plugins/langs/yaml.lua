return {
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        optional = true,
        opts = {
            ensure_installed = {
                "yamlfmt",
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        optional = true,
        opts = function()
            require("nvim-treesitter").install({ "yaml" })
        end,
    },
    {
        "stevearc/conform.nvim",
        optional = true,
        opts = {
            formatters_by_ft = {
                yaml = { "yamlfmt" },
            },
        },
    },
}
