return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities() -- `nvim-cmp` 用の設定

    -- HTML / CSS / JSON
    lspconfig.html.setup({ capabilities = capabilities })
    lspconfig.cssls.setup({ capabilities = capabilities })
    lspconfig.jsonls.setup({ capabilities = capabilities })

    -- Lua
    lspconfig.lua_ls.setup({ capabilities = capabilities })

    -- Shell Script
    lspconfig.bashls.setup({ capabilities = capabilities })

    -- Julia
    lspconfig.julials.setup({ capabilities = capabilities })

    -- Python
    lspconfig.pyright.setup({ capabilities = capabilities })

    -- TypeScript / JavaScript
    lspconfig.ts_ls.setup({ capabilities = capabilities })

    -- Go
    lspconfig.gopls.setup({ capabilities = capabilities })

    -- Rust
    lspconfig.rust_analyzer.setup({ capabilities = capabilities })

    -- C / C++
    lspconfig.clangd.setup({ capabilities = capabilities })

    -- Java
    lspconfig.jdtls.setup({ capabilities = capabilities })
  end,
}

