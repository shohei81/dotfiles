return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- インストール/アップデート時に自動で :TSUpdate を実行
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      -- インストールする言語
      ensure_installed = {
	"c",
        "lua",
        "vim",
        "python",
        "javascript",
	"typescript",
	"html",
	"css",
	"json",
	"yaml",
	"toml",
	"bash",
	"cpp",
	"rust",
	"java",
	"php",
	"ruby",
	"go",
	"cmake",
	"dockerfile",
	"julia"
        -- 必要な言語を追加
      },
      -- 同期インストールするかどうか 
      sync_install = false,

      -- インストールに失敗したときに続行するかどうか
      ignore_install = { },

      highlight = {
        enable = true,        -- ハイライトを有効化
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,        -- ツリーシッターを用いたインデント
      },
      -- 以下はオプション: インクリメンタル選択などを使う場合
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",    -- 選択を開始
          node_incremental = "grn",  -- ノード単位で選択範囲を拡大
          node_decremental = "grm",  -- ノード単位で選択範囲を縮小
        },
      },
      -- さらにテキストオブジェクトなどを使いたい場合は "nvim-treesitter-textobjects" プラグインが必要
      -- textobjects = {
      --   ...
      -- },
    })
  end,
}

