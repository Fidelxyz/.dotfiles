return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    cond = require("utils").is_not_vscode,

    cmd = "Telescope",
    keys = {
        {
            "<C-Space>",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Telescope find files",
        },
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Telescope find files",
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Telescope live grep",
        },
        {
            "<leader>fb",
            function()
                require("telescope.builtin").buffers()
            end,
            desc = "Telescope buffers",
        },
        {
            "<leader>fh",
            function()
                require("telescope.builtin").help_tags()
            end,
            desc = "Telescope help tags",
        },
        {
            "<leader>fr",
            function()
                require("telescope.builtin").lsp_references()
            end,
            desc = "Telescope LSP references",
        },
        {
            "<leader>fs",
            function()
                require("telescope.builtin").lsp_workspace_symbols()
            end,
            desc = "Telescope LSP symbols",
        },
        {
            "<leader>fk",
            function()
                require("telescope.builtin").keymaps()
            end,
            desc = "Telescope keymaps",
        },
    },
}
