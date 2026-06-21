return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  -- or, branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    -- telescope の基本設定（必要に応じてカスタマイズ）
    require('telescope').setup{
      defaults = {
        -- ここで telescope の設定を追加できます
	layout_strategy = "horizontal",
	layout_config = {
		width = 0.9,
		height = 0.9,
		horizontal = {
			preview_width = 0.60,
		}
	}
      }
    }
  end
}




