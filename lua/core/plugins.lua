local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
  -- Theming
  {'catppuccin/nvim'},
  {'nvim-lualine/lualine.nvim'},
  -- File explorer
  {'ThePrimeagen/harpoon'},
--  {'stevearc/oil.nvim'},
--  {'ggandor/leap.nvim'},

  -- Fuzzy finder
  {'nvim-telescope/telescope.nvim', branch = '0.1.x'},

  -- Git
  {'lewis6991/gitsigns.nvim'},
--  {'tpope/vim-fugitive'},

  -- Code manipulation
  {'nvim-treesitter/nvim-treesitter'},
  {'nvim-treesitter/nvim-treesitter-context'},
  {'nvim-treesitter/nvim-treesitter-textobjects'},
  {'numToStr/Comment.nvim'},

  -- Utilities
  {'nvim-lua/plenary.nvim'},
--  {'akinsho/toggleterm.nvim'},

  -- LSP support
  {'neovim/nvim-lspconfig'},
  {'williamboman/mason.nvim'},           -- Optional
  {'williamboman/mason-lspconfig.nvim'}, -- Optional

  -- Autocomplete
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},
  {'hrsh7th/cmp-nvim-lsp'},
  --{'hrsh7th/cmp-buffer'},
  --{'hrsh7th/cmp-path'},
  {'saadparwaiz1/cmp_luasnip'},
  --{'hrsh7th/cmp-nvim-lua'},
  -- {'rafamadriz/friendly-snippets'}
})

