local utils = require("utils")

vim.api.nvim_create_augroup("CursorLine", {})
vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
    group = "CursorLine",
    callback = function()
        if utils.is_buf_editor() then
            vim.wo.cursorline = true
        end
    end,
    desc = "Enable cursorline when entering a window",
})
vim.api.nvim_create_autocmd({ "WinLeave" }, {
    group = "CursorLine",
    callback = function()
        if utils.is_buf_editor() then
            vim.wo.cursorline = false
        end
    end,
    desc = "Disable cursorline when leaving a window",
})

vim.api.nvim_create_augroup("SpellCheck", {})
vim.api.nvim_create_autocmd({ "FileType" }, {
    group = "SpellCheck",
    pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spellcapcheck = ""
    end,
    desc = "Enable spellcheck for defined filetypes",
})

-- Auto save and load view
vim.api.nvim_create_augroup("AutoView", {})
vim.api.nvim_create_autocmd("BufWinLeave", {
    group = "AutoView",
    command = "silent! mkview",
})
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = "AutoView",
    command = "silent! loadview",
})
vim.opt.viewoptions = "cursor,folds"
