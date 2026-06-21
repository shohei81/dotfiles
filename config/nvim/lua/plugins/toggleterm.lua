return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require('toggleterm').setup({
      -- 水平分割で開く
      direction = 'horizontal',

      -- size に関数を指定し、動的に行数を計算
      size = function(term)
        -- 画面全体の行数に対して 30% の高さを割り当てる
        local total_lines = vim.o.lines
        local terminal_height = math.floor(total_lines * 0.25)
        return terminal_height
      end,

      open_mapping = [[<c-\>]],  -- ターミナルを開くキー
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      close_on_exit = true,
      float_opts = {
        border = 'single',
        width = 200,
        height = 100,
        winblend = 3,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })
    function _G.set_terminal_keymaps()
      local opts = { noremap = true, silent = true }
      vim.api.nvim_buf_set_keymap(0, 't', '<Esc>', '<C-\\><C-n>', opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', '<C-\\><C-N><C-w>h', opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', '<C-\\><C-N><C-w>j', opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', '<C-\\><C-N><C-w>k', opts)
      vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', '<C-\\><C-N><C-w>l', opts)
    	
    end
    -- ターミナルバッファでキーを再マッピングするためのautocmd
    vim.cmd([[
      autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()
    ]])
  end,
}

