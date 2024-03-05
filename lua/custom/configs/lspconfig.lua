-- Language Servers configurations
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

-- Setup for luals (Lua)
lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_dir = util.path.dirname,
  Lua = {
    workspace = { checkThirdParty = false },
    telemetry = { enable = false },
  },
}

-- Setup for bashls (Bash)
lspconfig.bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "zsh", "bash" },
  root_dir = util.path.dirname,
}

-- Setup for gopls (Go)
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

-- Setup for pyls (Python)
lspconfig.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "pyls" },
  filetypes = { "python" },
  root_dir = function(fname)
    return util.path.dirname(fname)
  end,
}

-- Setup for yaml-language-server (YAML)
lspconfig.yamlls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yml" },
  root_dir = util.root_pattern(".git")
}

-- Setup for jsonls (JSON)
lspconfig.jsonls.setup {
  cmd = { "vscode-json-languageserver", "--stdio" },
  filetypes = { "json" },
  root_dir = util.root_pattern(".git"),
}

-- Setup for htmlls (HTML)
lspconfig.html.setup {
  cmd = { "html-languageserver", "--stdio" },
  filetypes = { "html" },
  root_dir = function(fname)
    return root_pattern(fname) or vim.loop.os_homedir()
  end,
  settings = {},
  init_options = {
    embeddedLanguages = { css = true, javascript = true },
    configurationSection = { 'html', 'css', 'javascript' },
  }
}

-- Setup for dockerfile-language-server (Dockerfile)
lspconfig.dockerls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "Dockerfile", "dockerfile" },
  root_dir = util.root_pattern("Dockerfile"),
}
