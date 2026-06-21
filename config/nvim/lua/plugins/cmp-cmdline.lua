return {
  "hrsh7th/cmp-cmdline",
  event = "CmdlineEnter",
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    local cmp = require("cmp")
    -- コマンドラインモードでの補完設定（例: コマンドライン ':' 用）
      cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "cmdline" },
      },
    })
  end,
}

