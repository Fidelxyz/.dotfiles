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
            desc = "Smart Tab: Escape",
        },
    },

    opts = {
        mapping = false,
    },
}
