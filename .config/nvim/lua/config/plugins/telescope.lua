-- Fuzzy Finder (files, lsp, etc)
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- Fuzzy Finder Algorithm which requires local dependencies to be built.
        -- Only load if `make` is available. Make sure you have the system
        -- requirements installed.
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
    },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope Find files" })
        vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope find git files" })
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Telescope grep search" })
        vim.keymap.set("n", "<leader>pg", builtin.git_status, { desc = "Telescope git status" })
    end,
}
