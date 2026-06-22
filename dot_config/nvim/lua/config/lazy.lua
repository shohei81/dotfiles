-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { "neovim/nvim-lspconfig" }, -- LSP
    { "sontungexpt/witch" }, -- Color theme
    { "hrsh7th/nvim-cmp", dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- LSP の補完ソース
      "hrsh7th/cmp-buffer",     -- バッファ内の単語を補完
      "hrsh7th/cmp-path",       -- パスの補完
      "hrsh7th/cmp-cmdline",    -- コマンドラインの補完
      "L3MON4D3/LuaSnip",       -- スニペットエンジン
      "saadparwaiz1/cmp_luasnip", -- `luasnip` の補完ソース
    }, config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- Snippet を展開
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(), -- 手動で補完を開く
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter で確定
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- LSP の補完
          { name = "luasnip" },  -- スニペットの補完
          { name = "buffer" },   -- バッファ内の単語補完
          { name = "path" },     -- パス補完
        }),
      })
    end },
    { import = "plugins" }, -- `plugins/` フォルダ内の設定を読み込む
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

