return {
    "stevearc/conform.nvim",

    event = { "BufWritePre" },
    cmd = { "ConformInfo", "Format" },

    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            c = { "clang-format" },
            cpp = { "clang-format" },
            rust = { "rustfmt" },
            glsl = { "clang-format" },
            python = { "ruff_format", "ruff_organize_imports", "ruff_fix" },
            javascript = { "prettier", "biome-organize-imports" },
            typescript = { "prettier", "biome-organize-imports" },
            vue = { "prettier", "biome-organize-imports" },
            json = { "jq" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },

    config = function(_, opts)
        local conform = require("conform")

        conform.setup(opts)

        vim.api.nvim_create_user_command("Format", function(args)
            local range = nil
            if args.count ~= -1 then
                local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                range = {
                    start = { args.line1, 0 },
                    ["end"] = { args.line2, end_line:len() },
                }
            end
            conform.format({ async = true, lsp_format = "fallback", range = range })
        end, { range = true })
    end,
}
