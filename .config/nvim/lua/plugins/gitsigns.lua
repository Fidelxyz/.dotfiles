return {
    "lewis6991/gitsigns.nvim",

    event = "VeryLazy",

    keys = {
        -- Navigation
        {
            "]c",
            function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    require("gitsigns").nav_hunk("next")
                end
            end,
            desc = "Gitsigns: Next Hunk",
        },
        {
            "[c",
            function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    require("gitsigns").nav_hunk("prev")
                end
            end,
            desc = "Gitsigns: Previous Hunk",
        },

        -- Actions
        {
            "<leader>hs",
            function()
                require("gitsigns").stage_hunk()
            end,
            desc = "Gitsigns: Stage Hunk",
        },
        {
            "<leader>hr",
            function()
                require("gitsigns").reset_hunk()
            end,
            desc = "Gitsigns: Reset Hunk",
        },
        {
            "<leader>hs",
            function()
                require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end,
            mode = "v",
            desc = "Gitsigns: Stage Hunk (Visual)",
        },
        {
            "<leader>hr",
            function()
                require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end,
            mode = "v",
            desc = "Gitsigns: Reset Hunk (Visual)",
        },
        {
            "<leader>hS",
            function()
                require("gitsigns").stage_buffer()
            end,
            desc = "Gitsigns: Stage Buffer",
        },
        {
            "<leader>hR",
            function()
                require("gitsigns").reset_buffer()
            end,
            desc = "Gitsigns: Reset Buffer",
        },
        {
            "<leader>hp",
            function()
                require("gitsigns").preview_hunk()
            end,
            desc = "Gitsigns: Preview Hunk",
        },
        {
            "<leader>hi",
            function()
                require("gitsigns").preview_hunk_inline()
            end,
            desc = "Gitsigns: Preview Hunk Inline",
        },

        {
            "<leader>hb",
            function()
                require("gitsigns").blame_line({ full = true })
            end,
            desc = "Gitsigns: Blame Line",
        },
        {
            "<leader>hd",
            function()
                require("gitsigns").diffthis()
            end,
            desc = "Gitsigns: Diff This",
        },
        {
            "<leader>hD",
            function()
                require("gitsigns").diffthis("~")
            end,
            desc = "Gitsigns: Diff This (Against Index)",
        },

        -- Text object
        {
            "ih",
            function()
                require("gitsigns").select_hunk()
            end,
            mode = { "o", "x" },
            desc = "Gitsigns: Select Hunk",
        },
    },

    opts = {},
}
