local M = {}

M.general = {
  n = {
    ["<leader>q"] = {"<cmd>:qall<cr>", "Quit Neovim"}
  }
}

-- custom mappings for the nvim dap plugin
M.dap = {
  -- making the mappings exists only when we explicitly load them
  plugin = true,

  -- making mappings for the normal mode (the 'n' stands for normal)
  n = {
    -- the <leader> is the space key, and than press 'd' followed by 'b' (d for debug and b for break point)
    -- this mapping is for creating a break point
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>", "Toggle BreakPoint"}
  }
}

-- custom mappings for the python dap plugin 
M.dap_python = {
  -- making the mappings exists only when we explicitly load them
  plugin = true,

  -- making mappings for the normal mode (the 'n' stands for normal)
  n = {
    -- the <leader> is the space key, and than press 'd' followed by 'p' and than 'r' (d for debug, p for python and r for run)
    -- this mapping is for running python debugger
    ["<leader>dpr"] = {"<CMD> require('dap-python').test_method() <CR>", "Run python in debugger"}
  }
}

M.mason = {
  n = {
    ["<leader>mm"] = {"<cmd>:Mason<cr>", "Mason control panel"}
  }
}

M.venv_selector = {
  n = {
    ["<leader>vc"] = { "<cmd>:VenvSelectCached<cr>", "retrieve the venv from cache (the one previously used for the same project directory)"},
    ["<leader>vs"] = { "<cmd>:VenvSelect<cr>", "Select VirtualEnv"},
  }
}

M.undotree = {
  n = {
    ["<leader>u"] = { "<cmd>lua require('undotree').toggle()<CR>", "Undo-Tree" }, -- Undo History
  }
}

return M
