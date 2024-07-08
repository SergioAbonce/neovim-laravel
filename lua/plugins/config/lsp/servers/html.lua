local lsp_attach = require "plugins.config.lsp.attach"
local lsp_flags = require "plugins.config.lsp.flags"

return function(ops)
    local config = {
        on_attach = lsp_attach,
        flags = lsp_flags,
        filetypes = { "html", "blade" },
    }
    if vim.fn.executable "html-languageserver" == 1 then
        config.cmd = { "html-languageserver", "--stdio" }
    end

    return vim.tbl_extend("force", config, ops)
end
