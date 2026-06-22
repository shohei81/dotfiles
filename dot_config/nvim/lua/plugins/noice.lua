return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",  -- 遅延読み込みする場合（必要に応じて変更）
    opts = {
      lsp = {
        override = {
          -- LSP の markdown 表示を noice.nvim 経由に置き換える
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = false,    -- 検索時の下部ポップアップは無効化（cmdline と popupmenu を利用）
        command_palette = true,   -- コマンドパレット風の表示にする
        long_message_to_split = true,  -- 長文のメッセージは分割表示
        inc_rename = false,       -- inc-rename.nvim との連携は無効
      },
      routes = {
        {
          filter = { event = "msg_show", find = "written" },
          opts = { skip = true },  -- "written" 関連のメッセージは表示しない
        },
      },
    },
  },
}

