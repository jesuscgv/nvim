-- ~/.config/nvim/init.lua

-- Establecer la tecla líder a la barra espaciadora
vim.g.mapleader = " "

-- Configuraciones básicas
vim.o.termguicolors = true
vim.o.winblend = 15  -- Ajusta este valor para cambiar la opacidad de las ventanas flotantes (0-100)
vim.o.pumblend = 15  -- Ajusta este valor para cambiar la opacidad de los menús emergentes (0-100)

require('mrrobot')

-- Función para asegurar que Packer esté instalado
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

-- Inicializar Packer y definir plugins
require('packer').startup(function(use)
    -- Packer puede gestionar a sí mismo
    use 'wbthomason/packer.nvim'

    -- Plugins adicionales
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'  -- Necesario para compilar el plugin
    }
    use 'mbbill/undotree'  -- Plugin de Undo Tree
    use 'neovim/nvim-lspconfig'

    -- Tema rose-pine
    use {
        'rose-pine/neovim',
        as = 'rose-pine'  -- Alias para facilitar el uso del tema
    }

    -- Plugin para manejar la transparencia
    use {
        'xiyaowong/nvim-transparent',
        config = function()
            require("transparent").setup({
                enable = true, -- Habilita la transparencia
                extra_groups = {
                    "Normal",
                    "NormalNC",
                    "FloatBorder",
                    "TelescopeBorder",
                    "TelescopePromptBorder",
                    "TelescopeResultsBorder",
                    "TelescopePreviewBorder",
                    "StatusLine",
                    "StatusLineNC",
                    "BufWinBar",
                    -- Añade más grupos si es necesario
                },
                exclude = { "TelescopePrompt" }, -- Excluir grupos específicos si es necesario
            })
        end
    }

    -- Otros plugins que uses
    -- use '...'

    -- Si Packer se instaló ahora mismo, sincronizar plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- Configuración del tema rose-pine
vim.cmd('colorscheme rose-pine')

-- Requerir y ejecutar la configuración de colores
require('colors').setup()

-- Asegurar que la transparencia se aplique después de cargar cualquier tema
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        require('transparent').load()
    end
})

-- Requerir la configuración principal desde mrrobot (si es necesario)
-- Asegúrate de que el módulo 'mrrobot' exista y esté correctamente configurado
-- require('mrrobot')

