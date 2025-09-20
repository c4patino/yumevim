return {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>pv", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree" },
    },
    config = function()
        require("nvim-web-devicons").setup({})

        require("nvim-tree").setup({
            disable_netrw = true,
            hijack_netrw = true,
            hijack_cursor = true,
            hijack_unnamed_buffer_when_opening = true,
            sync_root_with_cwd = true,

            update_focused_file = {
                enable = true,
            },

            sort_by = "case_sensitive",

            filters = {
                custom = { "__pycache__" },
                exclude = {},
            },

            git = {
                enable = true,
                ignore = true,
            },

            view = {
                side = "right",
                width = 60,
                number = true,
                relativenumber = true,
                preserve_window_proportions = true,
            },

            renderer = {
                group_empty = true,

                root_folder_label = false,
                indent_width = 2,
                highlight_git = true,
                indent_markers = {
                    enable = true,
                },

                icons = {
                    glyphs = {
                        default = "󰈚",
                        symlink = "",
                        folder = {
                            default = "",
                            empty = "",
                            empty_open = "",
                            open = "",
                            symlink = "",
                            symlink_open = "",
                            arrow_open = "",
                            arrow_closed = "",
                        },
                        git = {
                            unstaged = "✗",
                            staged = "✓",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "★",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
            },
        })
    end,
}
