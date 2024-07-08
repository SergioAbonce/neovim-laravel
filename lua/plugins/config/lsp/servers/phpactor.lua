local lsp_attach = require "plugins.config.lsp.attach"
local lsp_flags = require "plugins.config.lsp.flags"
return function(ops)
    return vim.tbl_extend("force", {
        on_attach = function(client, bufnr)
            lsp_attach(client, bufnr)
        end,
        flags = lsp_flags,
        filetypes = { "php", "blade" },
        init_options = {
            ["language_server_worse_reflection.inlay_hints.enable"] = true,
            ["language_server_worse_reflection.inlay_hints.params"] = true,
            -- ["language_server_worse_reflection.inlay_hints.types"] = true,
            ["language_server_configuration.auto_config"] = false,
            ["code_transform.import_globals"] = true,
            ["language_server_phpstan.enabled"] = true,
            ["language_server_phpstan.level"] = 7,
            ["language_server_phpstan.bin"] = "phpstan",
        },
    }, ops)
end
