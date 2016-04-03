
set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

" Set environment to 256 colours
set t_Co=256

let colors_name = "wombat"

if version >= 700
  hi CursorLine     guibg=#0A0000 ctermbg=16
  hi CursorColumn   guibg=#0A0000 ctermbg=16
  hi MatchParen     guifg=#8DE6BC guibg=#0A0000 gui=bold ctermfg=115 ctermbg=16 cterm=bold
  hi Pmenu          guifg=#FFFFFF guibg=#323232 ctermfg=255 ctermbg=236
  hi PmenuSel       guifg=#FFFFFF guibg=#864E2E ctermfg=255 ctermbg=94
endif

" Background and menu colors
hi Cursor           guifg=NONE guibg=#FFFFFF ctermbg=255 gui=none
hi Normal           guifg=#FFFFFF guibg=#0A0000 gui=none ctermfg=255 ctermbg=234 cterm=none
hi NonText          guifg=#FFFFFF guibg=#190F0F gui=none ctermfg=255 ctermbg=233 cterm=none
hi LineNr           guifg=#393030 guibg=#231919 gui=none ctermfg=239 ctermbg=233 cterm=none
hi StatusLine       guifg=#FFFFFF guibg=#220F09 gui=italic ctermfg=255 ctermbg=233 cterm=italic
hi StatusLineNC     guifg=#FFFFFF guibg=#322828 gui=none ctermfg=255 ctermbg=235 cterm=none
hi VertSplit        guifg=#FFFFFF guibg=#231919 gui=none ctermfg=255 ctermbg=234 cterm=none
hi Folded           guifg=#FFFFFF guibg=#0A0000 gui=none ctermfg=255 ctermbg=16 cterm=none
hi Title            guifg=#864E2E guibg=NONE    gui=bold ctermfg=45 ctermbg=NONE
hi Visual           guifg=#8134BF guibg=#323232 gui=none ctermfg=97 ctermbg=236 cterm=none
hi SpecialKey       guifg=#9C9B32 guibg=#190F0F gui=none ctermfg=137 ctermbg=233 cterm=none
"hi DiffChange       guibg=#534C00 gui=none ctermbg=58 cterm=none
"hi DiffAdd          guibg=#2C254C gui=none ctermbg=236 cterm=none
"hi DiffText         guibg=#6C3266 gui=none ctermbg=241 cterm=none
"hi DiffDelete       guibg=#470000 gui=none ctermbg=52 cterm=none

hi DiffChange       guibg=#4C4C09 gui=none ctermbg=234 cterm=none
hi DiffAdd          guibg=#252556 gui=none ctermbg=17 cterm=none
hi DiffText         guibg=#66326E gui=none ctermbg=22 cterm=none
hi DiffDelete       guibg=#3F000A gui=none ctermbg=0 ctermfg=196 cterm=none
" hi TabLineFill      guibg=#5E5E5E gui=none ctermbg=235 ctermfg=228 cterm=none
hi TabLineSel       guifg=#8134BF gui=bold ctermfg=97 cterm=bold

hi cursorline cterm=NONE ctermbg=232
hi CursorLineNR cterm=bold ctermfg=247

":hi
" Syntax highlighting
hi Constant guifg=#9C9B32 gui=none ctermfg=137 cterm=none
hi Number guifg=#9C9B32 gui=none ctermfg=137 cterm=none
hi Identifier guifg=#745C2B gui=none ctermfg=255 cterm=none
hi Special guifg=#CF8C8D gui=none ctermfg=174 cterm=none
hi PreProc guifg=#CF8C8D gui=none ctermfg=174 cterm=none
hi Keyword guifg=#8DE6BC gui=none ctermfg=249 cterm=none
hi pythonBuiltin guifg=#745C2B gui=none ctermfg=94 cterm=none
hi TabLineFill guifg=#39144C gui=none ctermfg=75 cterm=none


