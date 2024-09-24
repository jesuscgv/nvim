-- Asegurarse de que Packer está instalado
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()

-- Configurar Packer
require('packer').startup(function(use)
    -- Packer puede gestionar a sí mismo
    use 'wbthomason/packer.nvim'

    -- Tema Rose Pine
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            require('rose-pine').setup({
                -- Configuración opcional del tema
                -- variant = 'moon', -- 'auto', 'main', 'moon', o 'dawn'
                -- dark_variant = 'main',
                -- bold_vert_split = false,
                -- dim_nc_background = false,
                -- disable_background = false,
                -- disable_float_background = false,
                -- disable_italics = false,
            })
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- Telescope y fzf
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Undotree
    use 'mbbill/undotree'

    -- LSP y soporte
    use 'neovim/nvim-lspconfig' -- Configuración de LSP

    -- Otros plugins que desees añadir pueden ir aquí

    -- Si Packer acaba de instalarse, sincronizar
    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- Configuración básica de Telescope
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {"node_modules", ".git"}
    }
}

-- Cargar fzf para Telescope
pcall(require('telescope').load_extension, 'fzf')
