-- vi: expandtab ts=2 sw=2

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'gpanders/editorconfig.nvim',
    'sheerun/vim-polyglot', -- Syntax
    'ellisonleao/gruvbox.nvim',
    'jiangmiao/auto-pairs', -- Typing
    'gentoo/gentoo-syntax',
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    -- IDE
    'preservim/nerdcommenter',
    { 'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'phaazon/hop.nvim', name = 'hop' },
    { 'lewis6991/gitsigns.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'kyazdani42/nvim-web-devicons',
    'lambdalisue/suda.vim', -- If forgot open with permisions
    -- Collection of common configurations for the Nvim LSP client
    'neovim/nvim-lspconfig',
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
    'saadparwaiz1/cmp_luasnip', -- Snippets source for nvim-cmp
    'L3MON4D3/LuaSnip', -- Snippets plugin
})
