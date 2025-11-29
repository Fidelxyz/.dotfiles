return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",

    event = "BufReadPre",

    keys = {
        {
            "<Leader>xl",
            function()
                local enabled = require("lsp_lines").toggle()
                vim.diagnostic.config({
                    virtual_text = not enabled,
                })
            end,
            desc = "Diagnostics: Toggle lsp-lines",
        },
    },

    opts = {},
    config = function()
        -- Disable by default
        vim.diagnostic.config({ virtual_lines = false })

        vim.api.nvim_create_autocmd("InsertEnter", {
            callback = function()
                vim.diagnostic.config({
                    virtual_text = false,
                    virtual_lines = false,
                })
            end,
        })

        vim.api.nvim_create_autocmd("InsertLeave", {
            callback = function()
                vim.diagnostic.config({
                    virtual_text = true,
                })
            end,
        })
    end,
}
