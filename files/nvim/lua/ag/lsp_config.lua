local lspconfig = require('lspconfig')
local completion = require('completion')
local illuminate = require('illuminate')

local mapper = function(mode, key, result)
    vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua " .. result .. "<CR>", {noremap = true, silent = true})
end


local custom_attach = function(client)

    completion.on_attach(client)
    illuminate.on_attach(client)
    -- Tell illuminate how to illuminate
    vim.api.nvim_command [[ hi def link LspReferenceText CursorLine ]]
    vim.api.nvim_command [[ hi def link LspReferenceRead CursorLine ]]
    vim.api.nvim_command [[ hi def link LspReferenceWrite CursorLine ]]

    -- set up mappings (only apply when LSP client attached)
    mapper("n", "K", "vim.lsp.buf.hover()")
    mapper("n", "<c-]", "vim.lsp.buf.definition")
    mapper("n", "gR", "vim.lsp.buf.references()")
    mapper("n", "gr", "vim.lsp.buf.rename()")
    mapper("n", "<space>h", "vim.lsp.buf.code_action()")
    mapper("n", "gin", "vim.lsp.buf.incoming_calls()")
    mapper("n", "<space>dn", "vim.lsp.diagnostic.goto_next()")
    mapper("n", "<space>dp", "vim.lsp.diagnostic.goto_prev()")
    mapper("n", "<space>da", "vim.lsp.diagnostic.set_loclist()")

    -- use omnifunc
    vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
end

-- Set up clients
-- python
-- TODO: Figure out how to show only what I want
-- this could mean either/or...
-- - turn off style warnings
-- - enable only syntax/unused warnings
lspconfig.pyls.setup({
    on_attach=custom_attach,
    settings = {
        pyls = {
            configurationSources={"flake8"},
            plugins={
                pylint={
                    enabled=false,
                    args={"--disable=R,C"},
                    executable="/home/linuxbrew/.linuxbrew/bin/pylint"
                },
                pyflakes={
                    enabled=true
                },
                pydocstyle={
                    enabled=false
                },
                pycodestyle={
                    enabled=false
                },
                rope_completion={
                    enabled=false
                },
                yapf={
                    enabled=true
                },
                mccabe={
                    enabled=false
                },
                preload={
                    enabled=false
                },
            }
        }
    }
})

-- typescript
lspconfig.tsserver.setup{on_attach=custom_attach}

-- vue
lspconfig.vuels.setup{on_attach=custom_attach}
