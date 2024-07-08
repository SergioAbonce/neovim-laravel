local lsp_attach = require "plugins.config.lsp.attach"
local lsp_flags = require "plugins.config.lsp.flags"

return function(ops)
    if ops.neodev == true then
        require("neodev").setup()
    end

    return vim.tbl_extend("force", {
        on_attach = function(client, bufnr)
            lsp_attach(client, bufnr)
        end,
        flags = lsp_flags,
        filetypes = { "lua" },
    }, ops)
end
