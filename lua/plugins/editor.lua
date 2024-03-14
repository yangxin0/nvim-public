return {
    "telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make"
        },
        "nvim-telescope/telescope-file-browser.nvim"
    },
    keys = {
        {
            "<leader>f",
            function() require("telescope.builtin").find_files() end,
            desc = "Search Files"
        },
        {
            "<leader>b",
            function() require("telescope.builtin").buffers() end,
            desc = "Search Buffers"
        },
        {
            "\\\\",
            function() require("telescope.builtin").oldfiles() end,
            desc = "Recent Opened Files"
        }
    },
    config = function(_, opts)
        local telescope = require("telescope")
        opts.pickers = {
            find_files = {
                theme = "dropdown",
                previewer = false
            },
            buffers = {
                theme = "dropdown",
                previewer = false
            }
        }
        telescope.setup(opts)
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("file_browser")
    end
}
