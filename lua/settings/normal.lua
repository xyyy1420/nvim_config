require("helpers/global-helpers")



opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.ignorecase = true
opt.joinspaces = false
opt.smartcase = true
opt.showmatch = true

opt.splitbelow = true
opt.splitright = true

opt.wildmenu = true
opt.wildmode = "longest:full,full"

-- Default Plugins {{{
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end

-- display
o.list = true
o.number = true
o.laststatus = 2
o.cmdheight = 1
o.showcmd = true
o.ruler = true

-- Encode {{{
o.fileencoding = "utf-8"
o.encoding = "utf-8"
--o.termencoding="utf-8"
--}}}

opt.spell = true
opt.spelllang = { "en_us" }
opt.scrolloff = 8

-- Clipboard {{{
vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.fixeol = false -- Turn off appending new line in the end of a file
-- }}}


