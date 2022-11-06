-- set colorscheme to nightfly with protected call
-- in case it isn't installed
local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
vim.cmd [[hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f]]
vim.cmd [[hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f]]
vim.cmd [[hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f]]
vim.cmd [[hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f]]
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end
