local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'

  use 'mg979/vim-visual-multi'
  use 'folke/tokyonight.nvim'
  use "ellisonleao/gruvbox.nvim"
  use 'vim-airline/vim-airline'
  use 'mhartington/formatter.nvim'

  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end 
  }

  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require'hop'.setup {}
    end
  }
end)
