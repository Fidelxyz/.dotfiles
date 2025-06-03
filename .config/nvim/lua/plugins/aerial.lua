return {
    "stevearc/aerial.nvim",
    -- Optional dependencies
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },

    keys = {
        { "<leader>o", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial" },
        { "{", "<cmd>AerialPrev<CR>", desc = "Jump to previous symbol" },
        { "}", "<cmd>AerialNext<CR>", desc = "Jump to next symbol" },
    },

    opts = {},
}
