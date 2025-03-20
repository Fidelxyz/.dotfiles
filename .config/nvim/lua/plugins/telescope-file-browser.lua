return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },

    keys = {
        {
            "<leader>e",
            function()
                require("telescope").extensions.file_browser.file_browser()
            end,
            desc = "Telescope File Browser",
        },
    },
}
