-- ~/.config/nvim/lua/colors.lua

local M = {}

function M.setup()
    -- Define los grupos de resaltado que deseas modificar para la transparencia
    local groups = {
        "Normal",
        "NormalFloat",
        "SignColumn",
        "LineNr",
        "EndOfBuffer",
        "CursorLine",
        "CursorLineNr",
        "VertSplit",
        "StatusLine",
        "StatusLineNC",
        "Pmenu",
        "PmenuSel",
        "PmenuSbar",
        "PmenuThumb",
        -- Añade más grupos si es necesario
    }

    for _, group in ipairs(groups) do
        -- Establece el fondo a "NONE" para permitir la transparencia
        vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
    end
end

return M

