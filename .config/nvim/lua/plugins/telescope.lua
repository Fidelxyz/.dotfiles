local builtin = require("telescope.builtin")

return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },

    cond = function()
        return not vim.g.vscode
    end,

    cmd = "Telescope",
    keys = {
        {
            "<C-Space>",
            builtin.find_files,
            desc = "Telescope find files",
        },
        {
            "<leader>ff",
            builtin.find_files,
            desc = "Telescope find files",
        },
        {
            "<leader>fg",
            builtin.live_grep,
            desc = "Telescope live grep",
        },
        {
            "<leader>fb",
            builtin.buffers,
            desc = "Telescope buffers",
        },
        {
            "<leader>fh",
            builtin.help_tags,
            desc = "Telescope help tags",
        },
        {
            "<leader>fr",
            builtin.lsp_references,
            desc = "Telescope LSP references",
        },
        {
            "<leader>fs",
            builtin.lsp_workspace_symbols,
            desc = "Telescope LSP symbols",
        },
        {
            "<leader>fk",
            builtin.keymaps,
            desc = "Telescope keymaps",
        },
    },
}
