local plugins = {
  {
    {
      -- plugin used for the protocol used between the ide and the debugger
      "mfussenegger/nvim-dap",
      config = function(_, opts)
         require("core.utils").load_mappings("dap")
      end
    },
    {
      "rcarriga/nvim-dap-ui",
      dependencies = "mfussenegger/nvim-dap",
      config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- setup and key maps for the dapui
        dapui.setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
      end
    },
    {
      -- python debugger that uses the dap protocol
      "mfussenegger/nvim-dap-python",
      ft = "python",
      dependencies = {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui"
      },
      config = function(_, opts)
        local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
        require("dap-python").setup(path)
        require("core.utils").load_mappings("dap_python")
      end,
    },
    {
      -- default lsp (protocol used for talking between nvim and the type checker) configuration
      "neovim/nvim-lspconfig",
      config = function ()
        -- use the default lsp configuration and my own custom made
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
      end
    },
    {
      -- package used to bridge between nvim that uses only lsp, to other extentions that doent work with it
      "jose-elias-alvarez/null-ls.nvim",
      ft = {"python"},
      opts = function()
        return require "custom.configs.null-ls"
      end,
    },
    {
      -- git integration for neovim. has features such as gitblame, show deleted/added/change lines 
      "lewis6991/gitsigns.nvim",
      config = function()
        require 'custom.configs.gitlensconfig'
      end,
    },
    {
     "linux-cultist/venv-selector.nvim",
      dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
      event = "VeryLazy",
      config = function()
        require("venv-selector").setup({
          name = {"venv", ".venv", "env", ".env", "envs"},
          auto_refresh = true,
          dap_enabled = true,
        })
      end,
      keys = {
        {"<leader>vc", "<cmd>:VenvSelectCached<cr>", desc = "retrieve the venv from cache (the one previously used for the same project directory)"},
        {"<leader>vs", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv :P"},
      }
    },
    {
      "jiaoshijie/undotree",
      dependencies  = "nvim-lua/plenary.nvim" ,
      config = function()
        require "custom.configs.undotree-config"
      end,
    },
    {
      "danymat/neogen",
      dependencies = "nvim-treesitter/nvim-treesitter",
      config = function()
        require "custom.configs.neogenconfig"
      end,
      -- follow only stable versions
      version = "*",
      keys = {
        {"<leader>ds", "<cmd>:Neogen<cr><cmd>:+1<cr>", desc = "Create Docstring"},
      }
    },
    {
      -- mason package manager configuration 
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "debugpy",
          "prettier",
          "pyright",
        },
      },
    },
  },
}
return plugins
