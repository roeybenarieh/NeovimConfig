-- this file is used to override neovim options and commands
local vim = vim

-- relative line numbers
vim.wo.relativenumber = true

-- make neovim use both the 'selection' clipboard ('unnamed') and the 'normal' clipboard the rest of the OS is using ('unnamedplus')
-- this configuration only matters in linux OSes, in windows both clipboards are already combained as part of the OS
-- https://stackoverflow.com/questions/30691466/what-is-difference-between-vims-clipboard-unnamed-and-unnamedplus-settings
vim.cmd('set clipboard^=unnamed,unnamedplus')

-- set the folding settings
-- press 'z' to open whichkey, all of the folding keymaps are there
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable= false -- disable folding at startup

-- spelling documentation: 
-- https://neovim.io/doc/user/spell.html
-- https://jdhao.github.io/2019/04/29/nvim_spell_check/
-- https://johncodes.com/posts/2023/02-25-nvim-spell/
-- english spell checks 
-- vim.opt.spelllang = 'en_us'
-- vim.opt.spell = true

-- Enable spell checking if buffer is modifiable
vim.cmd[[
  augroup spell_settings
    autocmd!
    autocmd WinEnter * if &modifiable | setlocal spell spelllang=en_us | else | setlocal nospell | endif
  augroup END
]]


-- Define customized highlight gropus for Gitsigns
-- added content
vim.cmd([[highlight GitSignsAdd guifg=#00A66D]])
vim.cmd([[highlight GitSignsAddNr guifg=#00A66D guibg=NONE]])
vim.cmd([[highlight GitSignsAddLn guifg=#00A66D guibg=NONE]])
-- chnaged content
vim.cmd([[highlight GitSignsChange guifg=#FFA500]])
vim.cmd([[highlight GitSignsChangeNr guifg=#FFA500 guibg=NONE]])
vim.cmd([[highlight GitSignsChangeLn guifg=#FFA500 guibg=NONE]])
-- deleted content
vim.cmd([[highlight GitSignsDelete guifg=#D73D49]])
vim.cmd([[highlight GitSignsDeleteNr guifg=#D73D49 guibg=NONE]])
vim.cmd([[highlight GitSignsDeleteLn guifg=#D73D49 guibg=NONE]])