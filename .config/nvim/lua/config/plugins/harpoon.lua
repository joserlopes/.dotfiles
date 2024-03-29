return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        local harpoon = require('harpoon')
        harpoon:setup({})

        -- NOTE: In case you want to use telescope as the UI comment the next line
        -- and uncomment the next ones
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        -- basic telescope configuration
        -- local conf = require("telescope.config").values
        -- local function toggle_telescope(harpoon_files)
        --     local file_paths = {}
        --     for _, item in ipairs(harpoon_files.items) do
        --         table.insert(file_paths, item.value)
        --     end
        --
        --     require("telescope.pickers").new({}, {
        --         prompt_title = "Harpoon",
        --         finder = require("telescope.finders").new_table({
        --             results = file_paths,
        --         }),
        --         previewer = conf.file_previewer({}),
        --         sorter = conf.generic_sorter({}),
        --     }):find()
        -- end
        --
        -- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
        --     { desc = "Open harpoon window" })

        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)

        vim.keymap.set("n", "<C-s>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<C-w>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<C-t>", function() harpoon:list():select(3) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-g>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-i>", function() harpoon:list():next() end)
    end,
}
