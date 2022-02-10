-- Set italics
vim.cmd([[
  let g:palenight_terminal_italics=1
  let g:gruvbox_italic=1
  let g:material_terminal_italics=1
  let g:dracula_italic=1
  let g:nord_italic=1
  let g:onehalf_italic=1
]])

-- Set colorscheme
vim.cmd("colorscheme onedark")

-- transparent background and get rid of unneccessary fills
vim.cmd([[
    hi Normal guibg=NONE ctermbg=NONE
    hi LineNr guibg=NONE ctermbg=NONE
    hi NonText guibg=NONE ctermbg=NONE
    hi SignColumn guibg=NONE ctermbg=NONE
    hi EndOfBuffer guibg=NONE ctermbg=NONE
    hi CursorLineNr guibg=NONE ctermbg=NONE
]])
