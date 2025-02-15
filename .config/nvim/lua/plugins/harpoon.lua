return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    cond = function()
        return not vim.g.vscode
    end,

    keys = { "<Tab>", "<leader>a", "1", "2", "3", "4", "5", "6", "7", "8", "9", "[", "]" },

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
        end, { desc = "Harpoon" })

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "Add to Harpoon list" })

        vim.keymap.set("n", "1", function()
            harpoon:list():select(1)
        end, { desc = "Select Harpoon list item 1" })
        vim.keymap.set("n", "2", function()
            harpoon:list():select(2)
        end, { desc = "Select Harpoon list item 2" })
        vim.keymap.set("n", "3", function()
            harpoon:list():select(3)
        end, { desc = "Select Harpoon list item 3" })
        vim.keymap.set("n", "4", function()
            harpoon:list():select(4)
        end, { desc = "Select Harpoon list item 4" })
        vim.keymap.set("n", "5", function()
            harpoon:list():select(5)
        end, { desc = "Select Harpoon list item 5" })
        vim.keymap.set("n", "6", function()
            harpoon:list():select(6)
        end, { desc = "Select Harpoon list item 6" })
        vim.keymap.set("n", "7", function()
            harpoon:list():select(7)
        end, { desc = "Select Harpoon list item 7" })
        vim.keymap.set("n", "8", function()
            harpoon:list():select(8)
        end, { desc = "Select Harpoon list item 8" })
        vim.keymap.set("n", "9", function()
            harpoon:list():select(9)
        end, { desc = "Select Harpoon list item 9" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "[", function()
            harpoon:list():prev()
        end, { desc = "Previous Harpoon list item" })
        vim.keymap.set("n", "]", function()
            harpoon:list():next()
        end, { desc = "Next Harpoon list item" })
    end,
}
