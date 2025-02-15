local M = {}

function M.is_buf_editor()
    return vim.bo.buftype == ""
end

function M.is_blank_line()
    local line = vim.api.nvim_win_get_cursor(0)[1]
    return vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:match("%S") == nil
end

return M
