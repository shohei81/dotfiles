return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local db = require("dashboard")
    db.setup({
      -- テーマを "hyper" にすることで、上部に日付や曜日、パッケージ数などが表示される
      theme = "hyper",

      config = {
        -- 画面上部に「FRIDAY」や日付、ロードしたパッケージ数などが表示される
        -- (week_header = true で曜日が表示される)
        week_header = {
          enable = true,
        },

        -- ショートカットメニュー（画面中央に表示）
        shortcut = {
          {
            desc = "Update",
            group = "@property",
            action = "Lazy update",
            key = "u",
          },
          {
            desc = "Files",
            group = "Label",
            action = "Telescope find_files",
            key = "f",
          },
          {
            desc = "Dotfiles",
            group = "Number",
            action = "Telescope find_files cwd=~/.config/nvim",
            key = "d",
          },
        },

        -- プロジェクト一覧の表示設定
        -- 「最近 Projects:」というラベルで最大8件まで表示
        project = {
          enable = true,
          limit = 8,
          icon = " ",
          label = "Recent Projects:",
          -- action = "Telescope find_files cwd=",
          -- ↑ プロジェクトを選択したときの動作を設定
        },

        -- 最近開いたファイル（Most Recent Used）の表示
        mru = {
          limit = 10,
          label = " Most Recent Files:",
        },

        -- 起動時に「Neovim loaded X packages」という表示をする
        packages = {
          enable = true,
        },

        -- フッター（画面下部）に表示する文言
        footer = {
          "Sharp tools make good work.",
        },
      },
    })
  end,
}

