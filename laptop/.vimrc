set nocompatible              " be iMproved, required
"#filetype off                  " required
"#set rtp+=~/.vim/bundle/Vundle.vim
"#call vundle#begin()
"#Plugin 'gmarik/Vundle.vim'
"#Plugin 'Lokaltog/vim-powerline'
"#Plugin 'Yggdroot/indentLine'
"#Plugin 'scrooloose/nerdtree'
"#Plugin 'nvie/vim-flake8'
"#Plugin 'davidhalter/jedi-vim'
"#Plugin 'ervandew/supertab'
"#Plugin 'kien/ctrlp.vim'
"#call vundle#end()            " required
"#filetype plugin indent on    " required
execute pathogen#infect()

" key-mapping =================================================================

let mapleader = ","
let maplocalleader = "-"
" Bind nohl
noremap <C-h> :nohl<CR>
vnoremap <C-h> :nohl<CR>
inoremap <C-h> :nohl<CR>

" Quicksave command
noremap <C-Z> :update<CR><ESC>
vnoremap <C-Z> <C-C>:update<CR><ESC>
inoremap <C-Z> <C-O>:update<CR><ESC>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" Quick tab movings
noremap <Leader>0 :tabm 0<CR>
noremap <Leader>$ :tabm<CR>

" show invisible tabs and endline
"noremap <Leader>l :set list!<CR>
noremap <Leader>l :IndentLinesToggle<CR>

" char u00ac ¬
" char u25b8 ▸
set listchars=eol:¬,tab:▸\ 
"let g:indentLine_char = '▸'
",trail:~,extends:>,precedes:<

" keys to move around the windows
"map <c-j> <c-w>j map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-h> <c-w>h

" easier moving between tabs
"map <Leader>n <esc>:tabprevious<CR>
"map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
"vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

"" base-config =================================================================
"" disable backup and swap files
set nobackup
set nowritebackup
set noswapfile
set noundofile

" have been edited outsite vim
set autoread
" 
set showcmd

set laststatus=2
set bs=2     " make backspace behave like normal again

" automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" getting rid of bad habbits
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <esc> <nop>
inoremap jk <esc>
inoremap JK <esc>

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod



" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype on
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233
highlight Normal ctermbg=none
set cursorline
highlight Cursorline cterm=none ctermbg=234
" easier formatting of paragraphs
""vmap Q gq 
""nmap Q gqap

" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


"nnoremap <space> za

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

"set pastetoggle=<F5>
"" set clipboard=unnamed

" Mouse and backspace
" set mouse=a  " on OSX press ALT and click
" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.


"" NERDTree ====================================================================
"nmap <silent> <C-h> :NERDTreeToggle<CR>
"
" FLAKE8 ======================================================================
"let g:flake8_show_in_file = 1 " highlights text
"let g:flake8_show_in_gutter = 1 " highlights gutter 
"let g:flake8_quickfix_height=7
""let g:flake8_quickfix_location="topleft"
""autocmd BufWritePost *.py call Flake8()
""autocmd! BufRead,BufWritePost *.py call Flake8()
"
" Jedi ========================================================================
"autocmd FileType python setlocal completeopt-=preview
"let g:jedi#completions_enabled = 0
"let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 1
let g:jedi#completions_command = "jj"
let g:jedi#rename_command = "<leader>r"
let g:jedi#usages_command = "<leader>n"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_definitions_command = "<leader>D"
let g:jedi#documentation_command = "K"
"

"" Supertab ====================================================================
let g:SuperTabDefaultCompletionType = "<c-s>"
"
"" ctrlp =======================================================================
let g:ctrlp_max_height = 7
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
"
"" UltiSnip =======================================================================
"let g:UltiSnipsSnippetDirectories = ["~/dotfiles/laptop/.vim/UltiSnips"]
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsEditSplit = "horizontal"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
"let g:UltiSnipsJumpBackwardTrigger = "<c-n>"

"" Powerline 
let g:powerline_pycmd = "py3"
"" dump-configs ================================================================
"" Settings for python-mode
""map <Leader>g :call RopeGotoDefinition()<CR>
""let ropevim_enable_shortcuts = 1
""let g:pymode_rope_goto_def_newwin = "vnew"
"":::let g:pymode_rope_extended_complete = 1
""let g:pymode_rope_complete_on_dot = 0
"":::let g:pymode_syntax = 1
""let g:pymode_rope = 0
""let g:pymode_breakpoint = 0
"":::let g:pymode_syntax_builtin_objs = 0
"":::let g:pymode_syntax_builtin_funcs = 0
"":::set completeopt=menu "disable auto load doc window
""map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
"
""nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
""let g:ycm_autoclose_preview_window_after_completion=1
""let g:jedi#usages_command = "<leader>p"
""let g:jedi#popup_on_dot = 0
""let g:jedi#popup_select_first = 0
""map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
"" Better navigating through omnicomplete option list
"" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
""set completeopt=longest,menuone
""function! OmniPopup(action)
""    if pumvisible()
""        if a:action == 'j'
""            return "\<C-N>"
""        elseif a:action == 'k'
""            return "\<C-P>"
""        endif
""    endif
""    return a:action
""endfunction
"""
""inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
""inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
""function! InsertTabWrapper(direction)                                                                                                         
""    let col = col('.') - 1                                                                                                                    
""    if !col || getline('.')[col - 1] !~ '\k'                                                                                                  
""       return "\<tab>"                                                                                                                        
""    elseif "backward" == a:direction                                                                                                          
""       return "\<c-p>"                                                                                                                        
""    else                                                                                                                                      
""       return "\<c-n>"                                                                                                                        
""    endif                                                                                                                                     
""endfunction                                                                                                                                   
""inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>                                                                                         
""inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr> 
"
"" Python folding
"" mkdir -p ~/.vim/ftplugin
"" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
""set nofoldenable
