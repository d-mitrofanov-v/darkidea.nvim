local M = {}

M.pallette = {
	black = "#000000",
	black1 = "#111111",
	grey = "#A9B7C6",
	grey1 = "#545c7e",
	white = "#FFFFFF",
	blue = "#00AAFF",
	blue1 = "#000066",
	blue2 = "#33CCFF",
	green = "#54B33E",
	green2 = "#153811",
	yellow = "#FFCF40",
	orange = "#FF8C36",
	brown = "#AA4926",
	red = "#FA3232",
	lavender = "#ED94FF",
	magenta = "#B200B2",
}

local get_groups = function()
	local c = M.pallette

	local groups = {
		Normal = { fg = c.white, bg = c.black },
		NormalNC = { fg = c.white, bg = c.black },
		NormalFloat = { fg = c.white, bg = c.black },
		String = { fg = c.green },
		Delimiter = { fg = c.white },
		Special = { fg = c.white },
		Identifier = { fg = c.white },
		Statement = { fg = c.orange },
		Function = { fg = c.white },
		Number = { fg = c.blue2 },
		Comment = { fg = c.yellow },
		IncSearch = { fg = c.black, bg = c.yellow },
		Search = { fg = c.black, bg = c.yellow },
		CursorLine = { bg = c.blue1 },
		CursorColumn = { bg = c.blue1 },
		ColorColumn = { bg = c.black1 },

		Added = { fg = c.green },
		Changed = { fg = c.blue },
		Removed = { fg = c.red },
		DiffAdd = { fg = c.green },
		DiffChange = { fg = c.blue },
		DiffDelete = { fg = c.red },
		makeCommands = { fg = c.white },

		LspInfoBorder = { fg = c.white },
		WinSeparator = { fg = c.grey1 },
		StatusLine = { bg = c.black },
    DiagnosticOk = { fg = c.green },
		DiagnosticHint = { fg = c.blue2 },
		DiagnosticInfo = { fg = c.blue },
		DiagnosticWarn = { fg = c.yellow },
		DiagnosticError = { fg = c.red },
		DiagnosticVirtualTextHint = { fg = c.blue2 },
		DiagnosticVirtualTextInfo = { fg = c.blue },
		DiagnosticVirtualTextWarn = { fg = c.yellow },
		DiagnosticVirtualTextError = { fg = c.red },

		Directory = { fg = c.white },

		NeoTreeGitAdded = { fg = c.green },
		NeoTreeGitModified = { fg = c.blue },
		NeoTreeGitDeleted = { fg = c.red },
		NeoTreeTitleBar = { bg = c.grey1 },
		NeoTreeFloatBorder = { fg = c.grey1 },
    NeoTreeDirectoryIcon = { fg = c.blue },
    MiniIconsAzure = { fg = c.blue },
    FlashBackdrop = { fg = c.grey1 },
    FlashLabel = { fg = c.white, bg = c.magenta },
	}
	return groups
end

M.setup = function()
	M.load()
end

M.load = function()
	if vim.version().minor < 9 then
		vim.notify_once("darkidea.nvim: you must use neovim 0.9 or higher")
		return
	end

	if vim.g.colors_name then
		vim.cmd.hi("clear")
	end
	vim.g.colors_name = "darkidea"
	vim.o.termguicolors = true

	local groups = get_groups()

	for group, settings in pairs(groups) do
		vim.api.nvim_set_hl(0, group, settings)
	end
end

return M
