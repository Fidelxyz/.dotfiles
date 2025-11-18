return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },

        cmd = "Telescope",

        -- stylua: ignore
        keys = {
            { "<C-Space>", function() require("telescope.builtin").find_files() end, desc = "Telescope find files" },
            { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Telescope find files" },
            { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Telescope live grep" },
            { "<leader>fb", function() require("telescope.builtin").buffers({ initial_mode = "normal" }) end, desc = "Telescope buffers" },
            { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Telescope help tags" },
            { "<leader>fr", function() require("telescope.builtin").lsp_references({ initial_mode = "normal" }) end, desc = "Telescope LSP references" },
            { "<leader>fs", function() require("telescope.builtin").lsp_workspace_symbols() end, desc = "Telescope LSP symbols" },
            { "<leader>fd", function() require("telescope.builtin").lsp_document_symbols() end, desc = "Telescope LSP document symbols" },
            { "<leader>fk", function() require("telescope.builtin").keymaps() end, desc = "Telescope keymaps" },
        },
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        event = { "BufReadPre", "BufNewFile" },

        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
