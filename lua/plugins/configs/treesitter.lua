local options = {
  ensure_installed = { "lua", "python", "bash", "go", "markdown", "rust", "cpp", "c_sharp", 
                      "javascript", "typescript", "sql", "promql", "regex", "html", "css", "json", "yaml" },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<C-space>',
      node_incremental = '<C-space>',
      scope_incremental = '<C-s>',
      node_decremental = '<C-backspace>',
    },
  },
}

return options
