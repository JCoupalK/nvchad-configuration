local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
  sources = {
    -- Go
    null_ls.builtins.formatting.gofumpt,           -- Go formatting
    null_ls.builtins.formatting.goimports_reviser, -- Go formatting
    null_ls.builtins.formatting.golines,           -- Go formatting

    -- Bash
    null_ls.builtins.formatting.shfmt,       -- Bash formatting
    null_ls.builtins.diagnostics.shellcheck, -- Bash diagnostics

    -- Python
    null_ls.builtins.formatting.black, -- Python formatting

  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}
return opts
