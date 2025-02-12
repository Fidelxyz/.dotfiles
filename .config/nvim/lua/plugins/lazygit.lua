return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    cond = function()
        return not vim.g.vscode
    end,

    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
}
