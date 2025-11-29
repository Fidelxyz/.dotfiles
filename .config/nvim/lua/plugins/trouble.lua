return {
    "folke/trouble.nvim",

    opts = {},
    cmd = "Trouble",

    keys = {
        {
            "<leader>xx",
            function()
                require("trouble").toggle("diagnostics")
            end,
            desc = "Diagnostics: Toggle",
        },
        {
            "<leader>xX",
            function()
                ---@diagnostic disable-next-line: missing-fields
                require("trouble").toggle({ mode = "diagnostics", filter = { buf = 0 } })
            end,
            desc = "Diagnostics: Toggle (Current Buffer)",
        },
        {
            "<leader>cs",
            function()
                ---@diagnostic disable-next-line: missing-fields
                require("trouble").toggle({ mode = "symbols", focus = false })
            end,
            desc = "Trouble: Symbols",
        },
        ---@diagnostic disable-next-line: missing-fields
        {
            "<leader>cl",
            function()
                ---@diagnostic disable-next-line: missing-fields
                require("trouble").toggle({ mode = "lsp", focus = false, win = { position = "right" } })
            end,
            desc = "Trouble: LSP Definitions / references / ...",
        },
        {
            "<leader>xL",
            function()
                require("trouble").toggle("loclist")
            end,
            desc = "Trouble: Location List",
        },
        {
            "<leader>xQ",
            function()
                require("trouble").toggle("qflist")
            end,
            desc = "Trouble: Quickfix List",
        },
    },
}
