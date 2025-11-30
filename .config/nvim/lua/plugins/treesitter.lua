return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    event = "VeryLazy",

    opts = {
        highlight = {
            enable = true,
            disable = { "typst" },
        },
        indent = { enable = false },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = false,
                node_incremental = "v",
                node_decremental = "V",
                scope_incremental = false,
            },
        },
        ensure_installed = {
            -- Defined in language-specific configs
            "bash",
            "diff",
            "markdown",
            "markdown_inline",
            "printf",
            "query",
            "regex",
            "toml",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
        },
    },
    opts_extend = { "ensure_installed" },

    config = function(_, opts)
        if vim.g.vscode then
            opts.highlight.enable = false
        end

        require("nvim-treesitter.configs").setup(opts)

        -- Folding
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.opt.foldlevel = 99
    end,
}
