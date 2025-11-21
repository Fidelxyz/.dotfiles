return {
    "saghen/blink.cmp",
    version = "*", -- stable version required to download the corresponding binary built
    -- optional: provides snippets for the snippet source
    dependencies = {
        "rafamadriz/friendly-snippets",
        "giuxtaposition/blink-cmp-copilot",
        "xieyonn/blink-cmp-dat-word",
    },

    event = { "InsertEnter", "CmdlineEnter" },

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- See the full "keymap" documentation for information on defining your own keymap.
        keymap = { preset = "super-tab" },

        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- Will be removed in a future release
            use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = "mono",
            kind_icons = {
                Copilot = "",
            },
        },

        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0,
            },
        },

        cmdline = {
            completion = {
                menu = {
                    auto_show = true,
                },
            },
            keymap = {
                preset = "super-tab",
            },
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer", "copilot" },
            per_filetype = {
                typst = { inherit_defaults = true, "datword" },
            },
            providers = {
                buffer = {
                    -- keep case of first char
                    transform_items = function(a, items)
                        local keyword = a.get_keyword()
                        local correct, case
                        if keyword:match("^%l") then
                            correct = "^%u%l+$"
                            case = string.lower
                        elseif keyword:match("^%u") then
                            correct = "^%l+$"
                            case = string.upper
                        else
                            return items
                        end

                        -- avoid duplicates from the corrections
                        local seen = {}
                        local out = {}
                        for _, item in ipairs(items) do
                            local raw = item.insertText
                            if raw ~= nil and raw:match(correct) then
                                local text = case(raw:sub(1, 1)) .. raw:sub(2)
                                item.insertText = text
                                item.label = text
                            end
                            if not seen[item.insertText] then
                                seen[item.insertText] = true
                                table.insert(out, item)
                            end
                        end
                        return out
                    end,
                },

                copilot = {
                    name = "copilot",
                    module = "blink-cmp-copilot",
                    score_offset = 100,
                    async = true,
                    transform_items = function(_, items)
                        local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                        local kind_idx = #CompletionItemKind + 1
                        CompletionItemKind[kind_idx] = "Copilot"
                        for _, item in ipairs(items) do
                            item.kind = kind_idx
                        end
                        return items
                    end,
                },

                datword = {
                    name = "Word",
                    module = "blink-cmp-dat-word",
                    score_offset = -100,
                    opts = {
                        paths = {
                            "/usr/share/dict/words",
                        },
                        spellsuggest = true,
                    },
                },
            },
        },
    },
}
