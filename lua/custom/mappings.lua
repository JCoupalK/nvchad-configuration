local M = {}

-- To better learn hjkl
M.disable_arrows = {
  n = {
    ["<Up>"] = {"<Nop>", opts = {}},
    ["<Down>"] = {"<Nop>", opts = {}},
    ["<Left>"] = {"<Nop>", opts = {}},
    ["<Right>"] = {"<Nop>", opts = {}},
  },
  i = {
    ["<Up>"] = {"<Nop>", opts = {}},
    ["<Down>"] = {"<Nop>", opts = {}},
    ["<Left>"] = {"<Nop>", opts = {}},
    ["<Right>"] = {"<Nop>", opts = {}},
  },
  v = {
    ["<Up>"] = {"<Nop>", opts = {}},
    ["<Down>"] = {"<Nop>", opts = {}},
    ["<Left>"] = {"<Nop>", opts = {}},
    ["<Right>"] = {"<Nop>", opts = {}},
  },
}

-- Remap ESC key to kj and jk
M.remap_esc = {
  i = {
    ["jk"] = {"<Esc>", opts = {noremap = true, silent = true}},
    ["kj"] = {"<Esc>", opts = {noremap = true, silent = true}},
  },
}
-- Used to add debug breakpoint at line
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

-- Used to debug go test
M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

-- Used to make my life easier coding in Go
M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    },
    ["<leader>ife"] = {
      "<cmd> GoIfErr <CR>",
      "Add If Err statement"
    }
  }
}

return M
