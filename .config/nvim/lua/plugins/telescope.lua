return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },

    keys = {
        { "<C-Space>", require("telescope.builtin").find_files, desc = "Telescope find files" },
        { "<leader>ff", require("telescope.builtin").find_files, desc = "Telescope find files" },
        { "<leader>fg", require("telescope.builtin").live_grep, desc = "Telescope live grep" },
        { "<leader>fb", require("telescope.builtin").buffers, desc = "Telescope buffers" },
        { "<leader>fh", require("telescope.builtin").help_tags, desc = "telescope help tags" },
    },
}
