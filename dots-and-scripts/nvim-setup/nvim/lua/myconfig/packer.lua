vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim'}

    -- install ripgrep to make livegrep work
    -- see deps: https://github.com/nvim-telescope/telescope.nvim
    use 
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    use {"catppuccin/nvim", as = "catppuccin"}

    use 
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use 
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use 
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- required for lsp
    use 
    {
        "williamboman/mason.nvim",
        run = ":MasonUpdate" 
    }

    use 
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = 
        {
            {'neovim/nvim-lspconfig'},         
            {                                 
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},   
        }
    }

    use{'lervag/vimtex'}
end)

