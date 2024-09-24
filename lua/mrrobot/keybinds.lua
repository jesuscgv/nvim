-- Función para mapear teclas de manera más sencilla
local map = function(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Mapeos para Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- Mapeo para Undotree
map('n', '<leader>u', ':UndotreeToggle<CR>')

-- Implementar nuevos keybinds

local opts = { noremap = true, silent = true }

-- Desactivar la tecla <Space> en modos normal y visual
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', { silent = true })

-- Guardar archivo con Ctrl + S
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', opts)

-- Eliminar sin yankear con 'x'
vim.keymap.set('n', 'x', '"_x', opts)

-- Scroll con Ctrl + D/U y centrar
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Navegar búsquedas y centrar
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- División de ventanas
vim.keymap.set('n', '<leader>v', '<C-w>v', opts)  -- Dividir verticalmente
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)  -- Dividir horizontalmente
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- Igualar tamaño de ventanas
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- Cerrar ventana actual

-- Navegación entre ventanas con Ctrl + dirección (excepto <C-k> duplicado)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)
-- Nota: <C-k> ya está mapeado en LSP, así que no lo mapeamos aquí para evitar duplicaciones.

-- Alternar wrap con <leader>lw
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Mantener la selección visual al indent
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Mapeo para volver al directorio del archivo actual
vim.keymap.set('n', '<leader>pv', ':Ex<CR>', opts)

-- Asegurarse de que <leader>p no esté mapeado
-- (No añadimos ninguna mapeo para <leader>p, por lo que permanece sin mapear)

