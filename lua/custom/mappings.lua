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

M.gitsigns_custom_maps = {

  v = {
    ['<leader>ga'] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "Stage hunk"
    },
    ['<leader>gr'] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk"
    },
  },

  n = {


    -- Staging commands

    ['<leader>ga'] = {
      function()
        require('gitsigns').stage_hunk {vim.fn.line('.'), vim.fn.line('v')}
      end,
      "Stage hunk"
    },

    ['<leader>gA'] = {
      function()
        require('gitsigns').stage_buffer()
      end,
      "Stage buffer"
    },

    ['<leader>gu'] = {
      function()
        require('gitsigns').undo_stage_hunk()
      end,
      "Undo stage hunk"
    },


    -- Reset commands

    ['<leader>gr'] = {
      function()
        require('gitsigns').reset_hunk {vim.fn.line('.'), vim.fn.line('v')}
      end,
      "Reset hunk"
    },

    ['<leader>gR'] = {
      function()
        require('gitsigns').reset_buffer()
      end,
      "Reset buffer"
    },



    -- Toggles [T]

    ['<leader>gTd'] = {
      function()
        require('gitsigns').toggle_deleted()
      end,
      "Toggle Deleted"
    },

    -- Telescope gitsigns integration
    ['<leader>gs'] = {"<cmd> Telescope git_status   <CR>", "Git status"},
    ['<leader>gc'] = {"<cmd> Telescope git_commits  <CR>", "Git commits"},
    ['<leader>gb'] = {"<cmd> Telescope git_branches <CR>", "Git branches"},
    ['<leader>gf'] = {"<cmd> Telescope git_files    <CR>", "Git files"},
    ['<leader>gS'] = {"<cmd> Telescope git_stash    <CR>", "Git stash"},



    -- special things

    ['<leader>gp'] = {
      function()
        require('gitsigns').preview_hunk()
      end,
      "Preview hunk"
    },

    ['<leader>gB'] = {
      function()
        require('gitsigns').blame_line{full=true}
      end,
      "Blame line"
    },

    ['<leader>gd'] = {
      function()
      require('gitsigns').diffthis()
      end,
      "Diff this"
    },

    ['<leader>gD'] = {
      function()
        require('gitsigns').diffthis('~')
      end,
      "Diff this ~"
    },
  },
}

return M
