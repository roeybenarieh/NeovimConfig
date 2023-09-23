-- clling the setup function for the gitsings plugin

local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end


gitsigns.setup {
    -- Configuration options
    signs = {
        add = { hl = 'GitSignsAdd', text = '+' },
        change = { hl = 'GitSignsChange', text = '~' },
        delete = { hl = 'GitSignsDelete', text = '-' },
        topdelete = { hl = 'GitSignsDelete', text = '-' },
        changedelete = { hl = 'GitSignsChange', text = '~' },
    },
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    numhl = false, -- Disable line number highlighting
    linehl = false, -- Disable line highlighting
    word_diff = false, -- Show a diff of the entire line within the sign column
    watch_gitdir = {
        interval = 700, -- Time in milliseconds to refresh signs
    },
    current_line_blame_formatter_opts = {
        relative_time = true, -- show relative time of the commit
    },
    sign_priority = 6, -- Set sign priority (useful when other plugins also use the sign column)
    update_debounce = 200, -- Debounce time for updates in milliseconds
    status_formatter = nil, -- Use default statusline formatter
}