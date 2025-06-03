return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    event = { "BufRead", "BufNewFile" },

    opts = {

        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                node_incremental = "v",
                node_decremental = "V",
            },
        },
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "diff",
            "html",
            "javascript",
            "jsdoc",
            "json",
            "jsonc",
            "lua",
            "luadoc",
            "luap",
            "markdown",
            "markdown_inline",
            "printf",
            "python",
            "query",
            "regex",
            "rust",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "vue",
            "xml",
            "yaml",
        },
    },

    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)

        -- Folding
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.opt.foldlevel = 99
    end,
}
