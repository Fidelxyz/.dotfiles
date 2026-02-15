return {
    "folke/flash.nvim",

    ---@type Flash.Config
    opts = {
        search = {
            exclude = {
                "toggleterm",
            },
        },
        modes = {
            char = {
                enabled = false,
            },
        },
    },
    opts_extend = {
        "search.exclude",
    },

    keys = {
        {
            "s",
            mode = { "n", "x", "o" },
            function()
                require("flash").jump()
            end,
            desc = "Flash",
        },
        {
            "S",
            mode = { "n", "x", "o" },
            function()
                require("flash").treesitter()
            end,
            desc = "Flash: Treesitter",
        },
        {
            "r",
            mode = "o",
            function()
                require("flash").remote()
            end,
            desc = "Flash: Remate",
        },

        {
            "v",
            mode = { "n", "x", "o" },
            function()
                require("flash").treesitter({
                    actions = {
                        ["v"] = "next",
                        ["V"] = "prev",
                    },
                })
            end,
            desc = "Flash: Treesitter incremental selection",
        },
    },
}
