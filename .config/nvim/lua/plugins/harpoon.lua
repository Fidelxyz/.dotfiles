return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    keys = {
        {
            "<Tab>",
            function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            desc = "Harpoon",
        },
        {
            "<leader>a",
            function()
                require("harpoon"):list():add()
            end,
            desc = "Add to Harpoon list",
        },
        {
            "1",
            function()
                require("harpoon"):list():select(1)
            end,
            desc = "Select Harpoon list item 1",
        },
        {
            "2",
            function()
                require("harpoon"):list():select(2)
            end,
            desc = "Select Harpoon list item 2",
        },
        {
            "3",
            function()
                require("harpoon"):list():select(3)
            end,
            desc = "Select Harpoon list item 3",
        },
        {
            "4",
            function()
                require("harpoon"):list():select(4)
            end,
            desc = "Select Harpoon list item 4",
        },
        {
            "5",
            function()
                require("harpoon"):list():select(5)
            end,
            desc = "Select Harpoon list item 5",
        },
        {
            "6",
            function()
                require("harpoon"):list():select(6)
            end,
            desc = "Select Harpoon list item 6",
        },
        {
            "7",
            function()
                require("harpoon"):list():select(7)
            end,
            desc = "Select Harpoon list item 7",
        },
        {
            "8",
            function()
                require("harpoon"):list():select(8)
            end,
            desc = "Select Harpoon list item 8",
        },
        {
            "9",
            function()
                require("harpoon"):list():select(9)
            end,
            desc = "Select Harpoon list item 9",
        },
        {
            "<leader>]",
            function()
                require("harpoon"):list():next()
            end,
            desc = "Next Harpoon list item",
        },
        {
            "<leader>[",
            function()
                require("harpoon"):list():prev()
            end,
            desc = "Previous Harpoon list item",
        },
    },

    opts = {
        settings = {
            save_on_toggle = true,
            sync_on_ui_close = true,
        },
    },
}
