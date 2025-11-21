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
        event = "VeryLazy",

        opts = {
            ensure_installed = {
                -- defined in language-specific configs
            },
            auto_update = true,
        },
        opts_extend = { "ensure_installed" },

        config = function(_, opts)
            require("mason-tool-installer").setup(opts)
            vim.api.nvim_command("MasonToolsInstall")
        end,
    },
}
