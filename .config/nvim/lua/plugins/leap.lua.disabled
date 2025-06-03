return {
    "ggandor/leap.nvim",
    dependencies = {
        "tpope/vim-repeat",
    },
    event = { "BufRead", "BufNewFile" },

    config = function()
        vim.keymap.set({ "n", "x" }, "s", "<Plug>(leap)")
        vim.keymap.set("n", "S", "<Plug>(leap-from-window)")
        vim.keymap.set("o", "s", "<Plug>(leap-forward)")
        vim.keymap.set("o", "S", "<Plug>(leap-backward)")
    end,
}
