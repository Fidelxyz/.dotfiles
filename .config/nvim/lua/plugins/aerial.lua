return {
    "stevearc/aerial.nvim",
    -- Optional dependencies
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },

    keys = {
        { "<leader>o", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial" },
    },

    opts = {
        on_attach = function(bufnr)
            -- Jump forwards/backwards with '{' and '}'
            vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr, desc = "Jump to previous symbol" })
            vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr, desc = "Jump to next symbol" })
        end,
    },
}
