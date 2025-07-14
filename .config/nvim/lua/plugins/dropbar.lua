return {
    "Bekaboo/dropbar.nvim",

    event = { "BufRead", "BufNewFile" },

    opts = {
        bar = {
            enable = function(buf, win, _)
                if
                    not vim.api.nvim_buf_is_valid(buf)
                    or not vim.api.nvim_win_is_valid(win)
                    or vim.fn.win_gettype(win) ~= ""
                    or vim.wo[win].winbar ~= ""
                    or vim.bo[buf].ft == "help"
                then
                    return false
                end

                return vim.bo[buf].buftype == ""
            end,
            attach_events = {
                "BufRead",
                "BufNewFile",
            },
        },
    },
    config = function(_, opts)
        require("dropbar").setup(opts)

        local dropbar_api = require("dropbar.api")
        vim.keymap.set("n", "<Leader>;", dropbar_api.pick, { desc = "Pick symbols in winbar" })
        vim.keymap.set("n", "[;", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
        vim.keymap.set("n", "];", dropbar_api.select_next_context, { desc = "Select next context" })
    end,
}
