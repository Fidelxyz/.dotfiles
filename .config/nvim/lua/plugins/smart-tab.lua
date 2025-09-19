return {
    "boltlessengineer/smart-tab.nvim",

    event = "InsertCharPre",

    keys = {
        {
            "<S-CR>",
            function()
                require("smart-tab").smart_tab()
            end,
            mode = "i",
        },
    },

    opts = {
        mapping = false,
    },
}
