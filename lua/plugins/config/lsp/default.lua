return {
  mason = {
    enable = true,
    auto_install = false,
  },
  servers = {
    emmet_ls = { enable = true, filetype = { "blade", "html" } },
    html = { enable = true, filetype = { "blade","html" } },
    jsonls = { enable = true },
    lua_ls = { enable = true, neodev = true },
    nil_ls = { enable = true, filetype = { "blade" } },
    phpactor = {enable = true, filetype = { "blade","php" }},
  },
  default_options = function (options)
    return vim.tbl_deep_extend("force", {
      on_attach = require"plugins.config.lsp.attach",
      flags = require "plugins.config.lsp.flags",
    }, options)
  end,
}
