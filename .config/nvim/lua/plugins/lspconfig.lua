return {
    "neovim/nvim-lspconfig",
    version = "*",
    dependencies = { "saghen/blink.cmp" },

    cond = function()
        return not vim.g.vscode
    end,

    event = { "BufReadPre", "BufNewFile" },

    keys = {
        {
            "<C-CR>",
            function()
                vim.lsp.buf.code_action()
            end,
        },
    },

    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        local lspconfig = require("lspconfig")

        lspconfig.clangd.setup({
            capabilities = capabilities,
            cmd = {
                "clangd",
                "--clang-tidy",
            },
        })
    end,
}
