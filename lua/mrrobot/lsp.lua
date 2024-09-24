local nvim_lsp = require('lspconfig')

-- Configuración para TypeScript y JavaScript usando ts_ls (si es válido)
nvim_lsp.ts_ls.setup{
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", ".git"),
    single_file_support = true,
    on_attach = function(client, bufnr)
        -- Opcional: Puedes agregar configuraciones adicionales aquí
    end,
    flags = {
        debounce_text_changes = 150,
    }
}

-- Configuración para Python (pyright)
nvim_lsp.pyright.setup{
    on_attach = function(client, bufnr)
        -- Opcional: Configuraciones adicionales si es necesario
    end,
    flags = {
        debounce_text_changes = 150,
    }
}

-- Puedes añadir más configuraciones para otros lenguajes aquí

