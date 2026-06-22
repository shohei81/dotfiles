return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities() -- `nvim-cmp` 用の設定

    -- nvim 0.11+ の新 API。`require("lspconfig").X.setup{}` は非推奨なので
    -- vim.lsp.config / vim.lsp.enable に移行。各サーバの既定設定（cmd や
    -- filetypes 等）は nvim-lspconfig が `lsp/<name>.lua` として提供する。

    -- 全サーバ共通で nvim-cmp の capabilities を適用
    vim.lsp.config("*", { capabilities = capabilities })

    vim.lsp.enable({
      "html",
      "cssls",
      "jsonls",
      "lua_ls",
      "bashls",
      "julials",
      "pyright",
      "ts_ls",
      "gopls",
      "rust_analyzer",
      "clangd",
      "jdtls",
    })
  end,
}
