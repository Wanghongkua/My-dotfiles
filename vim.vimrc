"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Testing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"cd ~/Documents   "Change the working dir to 'Documents'

syntax enable
syntax on

" set autoread   "Detect when a file is changed
set autoread
au CursorHold * checktime

let mapleader=','           "Map leader from '\' to ','
let g:mapleader=','

" Change to upper case
inoremap <c-l> <esc>viwUea

" Create surrounding based on visual selection
vnoremap <space> <esc>a"<esc>`<i"<esc>`>

" Create surrounding
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" Move line upword or downword
"nnoremap - ddkP
"nnoremap _ ddp

" Select Word
nnoremap <space> viw

" Fast saving
nnoremap <leader>w :w!<cr>
"nnoremap <leader>q :wq!<cr>

set mouse=a
set so=7                            "Set 7 lines to the cursor - when moving vertically using j/k
set cmdheight=1                     "Height of the command bar 
set lazyredraw
set ttyfast
set cursorline                      "Highlight current line
set number                          "Show line number
set relativenumber                  "Show relative line number
set ruler                           "Show cursor position
set showcmd
set hlsearch                        "Highlight search results
set incsearch                       "Search act like search in modern browser

set backspace=indent,eol,start   " make backspace behave in a sane manner
set encoding=utf-8
" 消除ESC delays
set timeoutlen=1000 ttimeoutlen=0
" Auto source ~/.vimrc after saving it
"<leader>cd =  改变当前目录到文件所在目录
nnoremap <leader>cd :lcd %:p:h<cr>:pwd<cr>
"set textwidth=80 "set bound to width
set colorcolumn=+1  "Heilight 81st column
set tabstop=4 shiftwidth=4 expandtab smarttab   "Turn 'tab' into space
set history=1000 "change history to 1000
set clipboard=unnamed
" Ignore case when searching but only search for upper cases when typing upper
" cases
set ignorecase
set smartcase
" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
nnoremap <silent> <leader><space> :noh<cr>
" delete current line in insert mode
inoremap <c-d> <esc>ddO
" edit .vimrc the fast way
nnoremap <leader>ev :vsplit $VIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <C-f> :JavaCorrect<CR>
inoremap <C-e> <C-o>a
nnoremap H ^
nnoremap L $
set pastetoggle=<leader>z

" 主题设置
set background=dark
colorscheme solarized
"colorscheme molokai

" italic comment
" highlight Comment cterm=italic

" let g:solarized_termcolors=256
" 代码折叠
" 基于缩进或语法进行代码折叠
" "set foldmethod=indent
" set foldmethod=syntax
" " 启动 vim 时关闭折叠代码
" set nofoldenable

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Close the current buffer
noremap <leader>bd :Bclose<cr>:tabclose<cr>gT

noremap <leader>l :bnext<cr>
noremap <leader>h :bprevious<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking from comments
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
noremap <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>s? z=
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Cursor Position Setting -------------------- {{{
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" }}}

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Html setting ---------------------- {{{
augroup filetype_html
    autocmd!
    autocmd BufWritePre,BufRead *.html :normal gg=G
    autocmd BufNewFile,BufRead *.html setlocal nowrap
    autocmd FileType html nnoremap <buffer> <leader>f Vatzf
augroup END
" }}}

" Run file inside vim ---------------------- {{{
augroup run_file
    autocmd!
    autocmd FileType python nnoremap <silent> <F5> :!clear;python3 %<CR>
    autocmd FileType java nnoremap <silent> <F5> :w<CR>:!clear<CR>:Java %<CR>
    autocmd FileType c nnoremap <silent> <F5> :w<CR>:!clear<CR>:!gcc % -o %< && ./%< <CR>
    "autocmd FileType txt setlocal noeol binary fileformat=dos
augroup END
" }}}
if exists('+fixeol')
    set nofixeol
endif

" Set filetype based on suffixes ---------------------- {{{
augroup filetype_setting
    au BufNewFile,BufRead,BufReadPost *.pro set filetype=prolog
    au BufNewFile,BufRead,BufReadPost *.asm set filetype=asm
augroup END
" }}}

" Delete trailing white space -------------------- {{{
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
augroup delete_empty_space
    autocmd!
    autocmd BufWrite *.py :call DeleteTrailingWS()
augroup END
" }}}
"autocmd BufWrite *.coffee :call DeleteTrailingWS()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle 设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
" set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let vundle manage vundle
Plugin 'VundleVim/Vundle.vim'
" Plugin 'gmarik/vundle'

" All the Plugins -------------------- {{{
Plugin 'kien/ctrlp.vim' " fuzzy find files
Plugin 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'benmills/vimux'
Plugin 'tpope/vim-fugitive' " the ultimate git helper
Plugin 'surround.vim'
" Plugin 'tpope/vim-commentary' " comment/uncomment with gcc or gc in visual mode
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'Raimondi/delimitMate'
Plugin 'easymotion/vim-easymotion'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'christoomey/vim-tmux-navigator'
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Plugin 'JavaRun'
" Enable this when coding Python
" Plugin 'Python-mode-klen'
" }}}
call vundle#end()
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter 设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map ,cc <plug>NERDCommenterToggle
map ,c<space> <plug>NERDCommenterComment

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline 设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline Setting -------------------- {{{
set laststatus=2
" let g:airline_theme='molokai'
nnoremap <leader>a :AirlineRefresh<cr>
let g:airline_theme='distinguished'
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'
let g:airline_detect_modified=1

" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif

" " unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'

" " airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree 设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree Setting -------------------- {{{
nnoremap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 0
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic 设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntastic Setting -------------------- {{{
" 让Syntastic 纠错Python3.
let g:syntastic_python_python_exec = '/usr/local/bin/python3'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tags 设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tags Setting -------------------- {{{
" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nnoremap <silent> <leader>b :TagbarToggle<CR>

" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bracket Auto Complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bracket Auto Complete -------------------- {{{
let delimitMate_expand_cr = 1

augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy Motion Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Easy Motion Setting -------------------- {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap f <Plug>(easymotion-overwin-f)
nmap <leader>f <Plug>(easymotion-lineforward)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
" nmap t <Plug>(easymotion-t2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" nmap <Leader>l <Plug>(easymotion-lineforward)
" nmap <Leader>h <Plug>(easymotion-linebackward)
" Find multiple charactors
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" Differient highlight.
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)
" Ignore cases
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " US layout
let g:EasyMotion_use_smartsign_jp = 1 " JP layout
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe and Ultisnip cooperate.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Solution 1. -------------------- {{{
let g:UltiSnipsSnippetsDir        = $HOME.'/.vim/UltiSnips/'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"let g:ycm_python_binary_path = '/Library/Frameworks/Python.framework/Versions/3.5/bin/python3'
let g:ycm_python_binary_path = '/usr/local/bin/python3'
" let g:UltiSnipsListSnippets="<c-h>"
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_complete_in_comments = 1 
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_collect_identifiers_from_comments_and_strings = 1 
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Solution 2. -------------------- {{{
" function! g:UltiSnips_Complete()
"     call UltiSnips#ExpandSnippet()
"     if g:ulti_expand_res == 0
"         if pumvisible()
"             return "\<C-n>"
"         else
"             call UltiSnips#JumpForwards()
"             if g:ulti_jump_forwards_res == 0
"                 return "\<TAB>"
"             endif
"         endif
"     endif
"     return ""
" endfunction
" function! g:UltiSnips_Reverse()
"     call UltiSnips#JumpBackwards()
"     if g:ulti_jump_backwards_res == 0
"         return "\<C-P>"
"     endif
"     return ""
" endfunction
" if !exists("g:UltiSnipsJumpForwardTrigger")
"     let g:UltiSnipsJumpForwardTrigger = "<tab>"
" endif
" if !exists("g:UltiSnipsJumpBackwardTrigger")
"     let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" endif
" au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
" au InsertEnter * exec "inoremap <silent> " .     g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tmux Vim navigator
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:tmux_navigator_no_mappings = 1

" nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
" nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
" nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
" nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Eclim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Cooperate with YouCompleteMe -------------------- {{{
let g:ycm_always_populate_location_list = 1
let g:EclimCompletionMethod = 'omnifunc'
" Cooperate with Syntastic
augroup Eclim_Syntastic
    autocmd!
    autocmd FileType python let g:EclimFileTypeValidate = 0
    autocmd FileType c let g:EclimFileTypeValidate = 0
augroup END
" autocmd FileType python let g:EclimFileTypeValidate = 0
" Turn Off Preview window of YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions -------------------- {{{

" Search the content select in visual mode
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Looping arround error locations.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! <SID>LocationNext()                           
  try                                                   
    lnext                                               
  catch /^Vim\%((\a\+)\)\=:E553/                        
    lfirst                                              
  catch /^Vim\%((\a\+)\)\=:E42/                        
    echom "No Error."
  catch /^Vim\%((\a\+)\)\=:E776/                        
    echom "No Error."
  endtry                                                
endfunction                                             
nmap <silent> [e :<C-u>call <SID>LocationNext()<CR>
"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup refresh_airline
    autocmd! bufwritepost .vimrc source $VIMRC | AirlineRefresh
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
