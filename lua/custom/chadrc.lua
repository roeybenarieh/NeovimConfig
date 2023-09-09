# this file is used to override the default config lua table provided by nvchad
---@type ChadrcConfig 
 local M = {}
 M.ui = {theme = 'catppuccin'}
 M.plugins = "custom.plugins"
 M.mappings = require "custom.mappings"
 return M
