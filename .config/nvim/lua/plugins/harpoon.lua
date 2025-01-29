return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    keys = {
        { "<Tab>" },
        { "<leader>a" },
        { "1" },
        { "2" },
        { "3" },
        { "4" },
        { "5" },
        { "6" },
        { "7" },
        { "8" },
        { "9" },
        { "[" },
        { "]" },
    },

    opts = {
        settings = {
            save_on_toggle = true,
            sync_on_ui_close = true,
        },
    },

    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup()
        -- REQUIRED

        vim.keymap.set("n", "<Tab>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end)

        vim.keymap.set("n", "1", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set("n", "2", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set("n", "3", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set("n", "4", function()
            harpoon:list():select(4)
        end)
        vim.keymap.set("n", "5", function()
            harpoon:list():select(5)
        end)
        vim.keymap.set("n", "6", function()
            harpoon:list():select(6)
        end)
        vim.keymap.set("n", "7", function()
            harpoon:list():select(7)
        end)
        vim.keymap.set("n", "8", function()
            harpoon:list():select(8)
        end)
        vim.keymap.set("n", "9", function()
            harpoon:list():select(9)
        end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "[", function()
            harpoon:list():prev()
        end)
        vim.keymap.set("n", "]", function()
            harpoon:list():next()
        end)
    end,
}
