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
            -- Show path only
            sources = function()
                local sources = require("dropbar.sources")
                return { sources.path }
            end,
        },
    },
}
