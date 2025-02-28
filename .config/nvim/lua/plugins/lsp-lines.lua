return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",

    event = "BufReadPre",
    cond = require("utils").is_not_vscode,

    opts = {},
    config = function()
        vim.diagnostic.config({
            virtual_text = false,
        })
    end,
}
