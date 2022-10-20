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
    autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
  augroup end
]]

return require('packer').startup(function(use)

	  use 'wbthomason/packer.nvim'
    use "kyazdani42/nvim-web-devicons"
    -- use "MunifTanjim/nui.nvim"
    -- use "rcarriga/nvim-notify"
    use "tjdevries/colorbuddy.nvim"
    use "nvim-lua/plenary.nvim"
	  
    -- Packer
    -- use({
    --   "folke/noice.nvim",
    --   event = "VimEnter",
    --   config = function()
    --     require("noice").setup()
    --   end,
    --   -- requires = {
    --   --   -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --   --   "MunifTanjim/nui.nvim",
    --   --   "rcarriga/nvim-notify",
    --   -- }
    -- })

    -- nvim-tree
    use {
      'kyazdani42/nvim-tree.lua',
      -- requires = {
      --   'kyazdani42/nvim-web-devicons', -- optional, for file icons
      -- },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    -- lsp
    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    }
    
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use "hrsh7th/cmp-nvim-lua"	-- neovim api
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'jose-elias-alvarez/null-ls.nvim'

    -- lspsaga
    use({
      "glepnir/lspsaga.nvim",
      branch = "main",
    })
    
    -- snippets
    use "rafamadriz/friendly-snippets"
    use "L3MON4D3/LuaSnip"

    -- colorscheme
    use 'folke/tokyonight.nvim'
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
    use {'akinsho/bufferline.nvim', tag = "v2.*"}
    use 'romgrk/barbar.nvim'
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
    use {
      "folke/zen-mode.nvim",
      config = function()
        require("zen-mode").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }

	  if packer_bootstrap then
    	require('packer').sync()
  	end
end)


