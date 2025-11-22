return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",

    event = "BufReadPre",

    opts = {},
    config = function()
        local lsp_lines = require("lsp_lines")

        -- Disable by default
        vim.diagnostic.config({ virtual_lines = false })

        vim.keymap.set("n", "<Leader>xl", function()
            local enabled = lsp_lines.toggle()
            vim.diagnostic.config({
                virtual_text = not enabled,
            })
        end, { desc = "Toggle lsp-lines" })

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
