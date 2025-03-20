local utils = require("utils")

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter" }, {
    callback = function()
        if utils.is_buf_editor() then
            vim.wo.cursorline = true
        end
    end,
})

vim.api.nvim_create_autocmd({ "WinLeave" }, {
    callback = function()
        if utils.is_buf_editor() then
            vim.wo.cursorline = false
        end
    end,
})

-- vim.api.nvim_create_autocmd({ "UIEnter" }, {
--     callback = function()
--         if vim.bo.filetype ~= "" then
--             return
--         end
--         if vim.api.nvim_buf_get_lines(0, 0, -1, false)[1] == "" then
--             require("telescope").extensions.file_browser.file_browser()
--         end
--     end,
-- })
