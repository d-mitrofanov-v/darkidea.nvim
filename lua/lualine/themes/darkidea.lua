local M = {}

local darkidea = require("darkidea")
local c = darkidea.pallette

local default = {
	a = { fg = c.white, bg = c.black },
	b = { fg = c.white, bg = c.black },
	c = { fg = c.white, bg = c.black },
}

M.normal = default
M.insert = default
M.command = default
M.visual = default
M.replace = default
M.terminal = default
M.inactive = default

return M
