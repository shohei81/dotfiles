-- lua/keymaps.lua
local wk = require("which-key")

wk.add({
    -- Telescope用のキーマッピング
    { "<leader>f", group = "Telescope" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },

    -- Gitsigns用のキーマッピング
    { "<leader>g", group = "Gitsigns" },
    { "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", desc = "Reset Hunk" },
    { "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", desc = "Stage Hunk" },
    { "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "Undo Stage Hunk" },

    -- ToggleTerm用のキーマッピング
    { "<leader>t", group = "Terminal" },
    { "<leader>tc", "<cmd>ToggleTerm<CR>", desc = "Close Terminal" },
    { "<leader>tk", "<cmd>ToggleTerm kill<CR>", desc = "Kill Terminal" },
    { "<leader>tl", "<cmd>ToggleTerm list<CR>", desc = "Terminal List" },
    { "<leader>tn", "<cmd>ToggleTerm<CR>", desc = "New Terminal" },
    { "<leader>to", "<cmd>ToggleTerm<CR>", desc = "Open Terminal" },
    { "<leader>tt", "<cmd>ToggleTerm<CR>", desc = "Toggle Terminal" },

    -- ▼ ここから追記例 ▼

    -- Neo-tree用のキーマッピング
    { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle Neo-tree" },

    -- ウィンドウ操作用のキーマッピング
    { "<leader>w", group = "Window" },
    { "<leader>wh", "<C-w>h", desc = "Move Left" },
    { "<leader>wj", "<C-w>j", desc = "Move Down" },
    { "<leader>wk", "<C-w>k", desc = "Move Up" },
    { "<leader>wl", "<C-w>l", desc = "Move Right" },

    { "<leader>ws", "<C-w>s", desc = "Split Horizontally" },
    { "<leader>wv", "<C-w>v", desc = "Split Vertically" },
    { "<leader>wc", "<C-w>c", desc = "Close Window" },

    { "<leader>w=", "<C-w>=", desc = "Balance Windows" },
    { "<leader>w<", "5<C-w><", desc = "Shrink Window Left" },
    { "<leader>w>", "5<C-w>>", desc = "Grow Window Right" },
    { "<leader>w-", "5<C-w>-", desc = "Shrink Window Up" },
    { "<leader>w+", "5<C-w>+", desc = "Grow Window Down" },
})
