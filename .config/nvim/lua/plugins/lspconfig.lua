return {
    "neovim/nvim-lspconfig",
    version = "*",
    dependencies = { "saghen/blink.cmp" },

    cond = function()
        return not vim.g.vscode
    end,

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

        vim.keymap.set("n", "<C-CR>", function()
            vim.lsp.buf.code_action()
        end)
    end,
}
