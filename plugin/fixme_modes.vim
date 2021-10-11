"
" VIM plugin for adding colored highlights for 'fixme' terms like TODO,
" CLEANUP, and NOTE.
" 
" Version 1.00
" Maintainer:	Craig Giles
" License:	This file is placed in the public domain.
" -----------------------------------------------------------------------

if exists("loaded_fixme_modes")
    finish
endif
let loaded_fixme_modes = 1

" Preserve external compatibility options, then enable full vim compatibility...
let s:save_cpo = &cpo
set cpo&vim

"
"     --- Fixme Highlights---
" -----------------------------------------------------------------------
:highlight FixMeTodo      guibg=NONE guifg=#cd2626 gui=underline,BOLD
:highlight FixMeNote      guibg=NONE guifg=#6495ed gui=underline,BOLD
:highlight FixMeImportant guibg=NONE guifg=#ffff00 gui=underline,BOLD
:highlight FixMeCleanup   guibg=NONE guifg=#ffff00 gui=underline,BOLD
:highlight FixMeSpeed     guibg=NONE guifg=#ffff00 gui=underline,BOLD

:let _ = matchadd("FixMeTodo", "TODO")
:let _ = matchadd("FixMeNote", "NOTE")
:let _ = matchadd("FixMeImportant", "IMPORTANT")
:let _ = matchadd("FixMeCleanup", "CLEANUP")
:let _ = matchadd("FixMeSpeed", "SPEED")
