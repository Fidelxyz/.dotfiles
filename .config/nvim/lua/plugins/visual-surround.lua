return {
    "NStefan002/visual-surround.nvim",

    event = "BufEnter",

    keys = {
        {
            "<C-b>",
            mode = "v",
            function()
                require("visual-surround").surround("*")
            end,
        },
    },

    opts = {
        surround_chars = { "{", "}", "[", "]", "(", ")", "'", '"', "`" },
        enable_wrapped_deletion = true,
    },
}
