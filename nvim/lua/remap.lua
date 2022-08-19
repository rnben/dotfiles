-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
-- leader key 为空
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = {
    noremap = true,
    silent = true
}

local map = vim.api.nvim_set_keymap

map('n', '<leader>pv', '<cmd>Ex<CR>', opt)
map('n', '<leader><leader>w', '<cmd>HopWordAC<CR>', opt)
map('n', '<leader><leader>b', '<cmd>HopWordBC<CR>', opt)
map('n', '<leader><leader>j', '<cmd>HopLineAC<CR>', opt)
map('n', '<leader><leader>k', '<cmd>HopLineBC<CR>', opt)
map('n', '<leader><leader>f', '<cmd>HopChar2MW<CR>', opt)
map('n', '<leader>f', '<cmd>Format<CR>', opt)

if vim.g.vscode then
    vim.cmd([[
      nnoremap zM :call VSCodeNotify('editor.foldAll')<CR>
      nnoremap zR :call VSCodeNotify('editor.unfoldAll')<CR>
      nnoremap zc :call VSCodeNotify('editor.fold')<CR>
      nnoremap zC :call VSCodeNotify('editor.foldRecursively')<CR>
      nnoremap zo :call VSCodeNotify('editor.unfold')<CR>
      nnoremap zO :call VSCodeNotify('editor.unfoldRecursively')<CR>
      nnoremap za :call VSCodeNotify('editor.toggleFold')<CR>

      function! MoveCursor(direction) abort
        if(reg_recording() == '' && reg_executing() == '')
          return 'g'.a:direction
        else
          return a:direction
        endif
      endfunction

    nnoremap j :call VSCodeCall('cursorDown')<CR>
    nnoremap k :call VSCodeCall('cursorUp')<CR>
  ]])
end
