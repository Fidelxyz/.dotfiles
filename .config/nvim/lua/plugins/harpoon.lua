return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    -- stylua: ignore
    keys = {
        {
            "<Tab>",
            function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            desc = "Harpoon",
        },
        { "<leader>a", function() require("harpoon"):list():add() end,     desc = "Harpoon: Add to list" },
        { "1",         function() require("harpoon"):list():select(1) end, desc = "Harpoon: Select list item 1" },
        { "2",         function() require("harpoon"):list():select(2) end, desc = "Harpoon: Select list item 2" },
        { "3",         function() require("harpoon"):list():select(3) end, desc = "Harpoon: Select list item 3" },
        { "4",         function() require("harpoon"):list():select(4) end, desc = "Harpoon: Select list item 4" },
        { "5",         function() require("harpoon"):list():select(5) end, desc = "Harpoon: Select list item 5" },
        { "6",         function() require("harpoon"):list():select(6) end, desc = "Harpoon: Select list item 6" },
        { "7",         function() require("harpoon"):list():select(7) end, desc = "Harpoon: Select list item 7" },
        { "8",         function() require("harpoon"):list():select(8) end, desc = "Harpoon: Select list item 8" },
        { "9",         function() require("harpoon"):list():select(9) end, desc = "Harpoon: Select list item 9" },
        { "<leader>]", function() require("harpoon"):list():next() end,    desc = "Harpoon: Next list item" },
        { "<leader>[", function() require("harpoon"):list():prev() end,    desc = "Harpoon: Previous list item" },
    },

    opts = {
        settings = {
            save_on_toggle = true,
            sync_on_ui_close = true,
        },
    },
}
