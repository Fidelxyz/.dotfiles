local utils = require("utils")

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
    callback = function()
        if utils.is_buf_editor() then vim.wo.cursorline = true end
    end,
})

vim.api.nvim_create_autocmd({ "WinLeave" }, {
    callback = function()
        if utils.is_buf_editor() then vim.wo.cursorline = false end
    end,
})
