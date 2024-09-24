-- Configuración de Leader Keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Activar número de línea y relativo
vim.wo.number = true
vim.o.relativenumber = true

-- Clipboard
vim.o.clipboard = "unnamedplus"

-- Búsqueda
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Colores y apariencia
vim.o.termguicolors = true
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default

-- Indentación y tabulaciones
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

-- Backup y Swapfile
vim.o.backup = false -- creates a backup file
vim.o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.o.swapfile = false -- creates a swapfile

-- Performance y comportamiento
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.pumheight = 10 -- pop up menu height
vim.o.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
vim.o.sidescrolloff = 8 -- minimal number of screen columns either side of cursor if wrap is `false`
vim.o.whichwrap = 'bs<>[]hl' -- which "horizontal" keys are allowed to travel to prev/next line

-- Completado
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience
vim.opt.shortmess:append 'c' -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append '-' -- hyphenated words recognized by searches
vim.opt.formatoptions:remove { 'c', 'r', 'o' } -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.

-- Visualización
vim.o.wrap = true
vim.o.linebreak = true
vim.o.cursorline = false -- highlight the current line

-- Divisiones de ventanas
vim.o.splitbelow = true -- force all horizontal splits to go below current window
vim.o.splitright = true -- force all vertical splits to go to the right of current window

-- Deshabilitar modos visuales innecesarios
vim.o.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.o.showtabline = 2 -- always show tabs

-- Backspace
vim.o.backspace = 'indent,eol,start' -- allow backspace on

-- File encoding
vim.o.fileencoding = 'utf-8' -- the encoding written to a file

-- Command line
vim.o.cmdheight = 1 -- more space in the neovim command line for displaying messages

-- NetRW
vim.g.netrw_preview = 0

-- Runtime path
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- separate vim plugins from neovim in case vim still in use

