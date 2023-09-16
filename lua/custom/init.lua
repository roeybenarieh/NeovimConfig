-- this file is used to override neovim options and commands

-- relative line numbers
vim.wo.relativenumber = true

-- spelling documentation: 
-- https://neovim.io/doc/user/spell.html
-- https://jdhao.github.io/2019/04/29/nvim_spell_check/
-- https://johncodes.com/posts/2023/02-25-nvim-spell/
-- english spell checks 
vim.opt.spelllang = 'en_us'
vim.opt.spell = true