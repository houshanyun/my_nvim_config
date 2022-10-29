local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

return require('packer').startup(function(use)

	  use 'wbthomason/packer.nvim'
    use "kyazdani42/nvim-web-devicons"
    use "tjdevries/colorbuddy.nvim"
    use "nvim-lua/plenary.nvim"
	  
    -- Packer

    -- nvim-tree
    use {
      'kyazdani42/nvim-tree.lua',
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    -- lsp
    use {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "jayp0521/mason-null-ls.nvim",
    }
    
    use "williamboman/mason-lspconfig.nvim"
    use "neovim/nvim-lspconfig"
    
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use "hrsh7th/cmp-nvim-lua"	-- neovim api

    -- snippets
    use 'saadparwaiz1/cmp_luasnip'
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- lspsaga
    use({
      "glepnir/lspsaga.nvim",
      branch = "main",
    })

    -- colorscheme
    use 'folke/tokyonight.nvim'
    use 'Tsuzat/NeoSolarized.nvim'
    use 'folke/lsp-colors.nvim'
    use {
      'svrana/neosolarized.nvim',
      -- requires = { 'tjdevries/colorbuddy.nvim' }
    }

    -- treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    }
    use {
      'nvim-telescope/telescope.nvim',
      -- requires = { 'nvim-lua/plenary.nvim' }
    }
    -- which key
    use {
        "folke/which-key.nvim",
        -- config = function()
        --     require("which-key").setup {
        --     -- your configuration comes here
        --     -- or leave it empty to use the default settings
        --     -- refer to the configuration section below
        --     }
        -- end
    }
    -- float terminal
    -- use "akinsho/toggleterm.nvim"

    -- Neovim statusline
    use 'nvim-lualine/lualine.nvim'

    -- buffer line for Neovim
    use {'akinsho/bufferline.nvim', tag = "v3.*"}
    -- use 'romgrk/barbar.nvim'
    use "norcalli/nvim-colorizer.lua"

    -- autotag
    use "windwp/nvim-ts-autotag"
    use {
      "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- git
    use {
      'lewis6991/gitsigns.nvim',
      config = function() require('gitsigns').setup() end
    }

    -- zen-mode
    -- use {
    --   "folke/zen-mode.nvim",
    --   config = function()
    --     require("zen-mode").setup {
    --       -- your configuration comes here
    --       -- or leave it empty to use the default settings
    --       -- refer to the configuration section below
    --     }
    --   end
    -- }

	  if packer_bootstrap then
    	require('packer').sync()
  	end
end)


