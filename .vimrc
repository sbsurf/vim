execute pathogen#infect()
syntax on
filetype plugin indent on

" Autosave
autocmd BufLeave,FocusLost * silent! wall

" Open a NERDTree automatically when vim starts up if no files were specified:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTree shortcut - Ctrl+n:
" map <C-n> :NERDTreeToggle<CR>

" Open NERDTree in the directory of the current file (or /home if no file is
" open)
nmap <silent> <C-i> :call NERDTreeToggleInCurDir()<cr>
function! NERDTreeToggleInCurDir()
 " If NERDTree is open in the current buffer
 if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
 else
    exe ":NERDTreeFind"
 endif
endfunction

" Close vim if only NERDTree is left open:
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set shiftwidth=4   " change the number of space characters inserted for indentation
set expandtab      " insert spaces whenever a tab key is pressed
set softtabstop=4  " makes the spaces feel like real tabs

autocmd FileType html setlocal shiftwidth=2 tabstop=2   " short tabs for html

:filetype indent on
:set filetype=html           " abbrev -  :set ft=html
:set smartindent             " abbrev -  :set si
" move the cursor to the top of the file and indent to the end: gg =G
" OR select the desired text to indent and hit = to indent it

" Turn on Mason hightlighting by default for .comp, .mas files:
au BufNewFile,BufRead *.mas set ft=mason
au BufNewFile,BufRead *.comp set ft=mason

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
 
  " Use ag in CtrlP for listing files. Lightning fast and respect .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

