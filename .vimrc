execute pathogen#infect()
syntax on
filetype plugin indent on

" Open a NERDTree automatically when vim starts up if no files were specified:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTree shortcut - Ctrl+n:
map <C-n> :NERDTreeToggle<CR>

" Close vim if only NERDTree is left open:
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
