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
      -- mason package manager configuration 
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "debugpy",
          "mypy",
          "ruff",
          "prettier",
          "pyright",
        },
      },
    },
  },
}
return plugins
