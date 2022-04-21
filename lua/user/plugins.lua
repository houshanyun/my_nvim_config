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
	use 'nvim-lua/popup.nvim'
    -- lsp
    use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use "hrsh7th/cmp-nvim-lua"	-- neovim api
    -- snippets
    use "rafamadriz/friendly-snippets"
    use 'L3MON4D3/LuaSnip'
    -- colorscheme
    use 'folke/tokyonight.nvim'
    -- which key
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            }
        end
    }
    -- no file
    use 'simrat39/symbols-outline.nvim'
    -- no file
    use 'kyazdani42/nvim-web-devicons'
    -- Neovim statusline
    use 'nvim-lualine/lualine.nvim'

    -- buffer line for Neovim
    use {'akinsho/bufferline.nvim', tag = "*"}
    -- nvim-tree
    use 'kyazdani42/nvim-tree.lua'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- use "kyazdani42/nvim-web-devicons"
    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    -- autotag
    use "windwp/nvim-ts-autotag"
    -- float terminal
    use "akinsho/toggleterm.nvim"
    use "norcalli/nvim-colorizer.lua"
	if packer_bootstrap then
    	    require('packer').sync()
  	end
end)

