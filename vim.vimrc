"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Testing Aera
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("nvim")
    tnoremap <Esc> <C-\><C-n>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source /Users/HankWang/Documents/dotfile/plugin.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Testing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Section General {{{

set nocompatible        " not nocompatible with vi
set autoread            " Detect when a file is changed

set history=1000        " change history to 1000

syntax enable
syntax on

" Neovim Support
let g:python3_host_prog = '/Users/HankWang/anaconda/envs/py36/bin/python3.6'
let g:python_host_prog = '/Users/HankWang/anaconda/envs/py27/bin/python2.7'

" Be able to open Chinese TXT file
" set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

" }}}

" Section User Interface {{{

" colorscheme
set background=dark
" colorscheme solarized
colorscheme molokai
" colorscheme onedark

" Set font for MacVim
set guifont=MesloLGLDZForPowerline-Regular:h12

" make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermbg=none ctermfg=8
highlight NonText ctermbg=none ctermfg=8

" make comments and HTML attributes italic
highlight Comment cterm=italic
highlight htmlArg cterm=italic

if &term =~ '256color'
    " disable background color erase
    set t_ut=
endif

" Code folding settings
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType c setlocal foldmethod=syntax
    autocmd FileType c,cpp,vim,xml,html,xhtml,perl,python normal zR
augroup END

set nobackup                                     " Turn backup off, since
set nowb                                         " most stuff is in SVN,
set noswapfile                                   " git et.c anyway...

set textwidth=120                                " set bound to width


let g:solarized_italic=1


set number                                       " Show line number
" set relativenumber                               " Show relative line number
set wrap                                         " turn on line wrapping
set wrapmargin=8                                 " wrap lines when coming within n characters from side
set linebreak
set showbreak=↪

set autoindent                                   " automatically set indent of new line
set smartindent

set list                                         " toggle invisible characters
set listchars=tab:→\ ,trail:⋅,extends:❯,precedes:❮

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " highlight conflicts

set backspace=indent,eol,start                   " make backspace behave in a sane manner

set tabstop=4 shiftwidth=4 expandtab smarttab    " Tab control & Turn 'tab' into space


set clipboard=unnamed

set ttyfast
set so=7                                         " Set 7 lines to the cursor - when moving vertically using j/k
set wildmenu                                     " Turn on the WiLd menu
set wildmode=list:longest                        " complete files like a shell
set wildmode=full                                " complete by tabing through
set showcmd                                      " Show incomplete commands
set scrolloff=3                                  " lines of text around cursor
set title
set magic                                        " Set magic on, for regex
set showmatch                                    " Show match braces

set mouse=a
set cmdheight=1                                  " Height of the command bar
set lazyredraw
set cursorline                                   " Highlight current line
set ruler                                        " Show cursor position
set hlsearch                                     " Highlight search results
set incsearch                                    " Search act like search in modern browser

set encoding=utf-8
set timeoutlen=1000 ttimeoutlen=0                " Delete ESC Delays

set noerrorbells                                 " No annoying sound on errors
set visualbell
set t_vb=
set tm=500

set colorcolumn=+1                               "Heilight 81st column

set ignorecase                                   " Ignore case when searching but only search for upper cases 
set smartcase                                    " when typing upper cases

set wildignore=*.o,*~,*.pyc                      " Ignore compiled files
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" }}}

" Section Mappings {{{

"Map leader from '\' to ','
let g:mapleader=','

" Change to upper or lower case
inoremap <c-l> <esc>viwUea
inoremap <c-h> <esc>viwuea

" remap ESC
inoremap jk <esc>

" Move line upword or downword
nnoremap - ddkP
nnoremap _ ddp

" Add one line before the text
nnoremap + o<esc>cc<esc>

" Fast saving
nnoremap <leader>, :w!<cr>

" Select last selected text in visual mode
nnoremap <leader>s `<v`>

" set paste toggle
nnoremap <leader>v :set paste!<cr>

"<leader>cd = change to current working directory
nnoremap <leader>cd :lcd %:p:h<cr>:pwd<cr>

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>


nnoremap <silent> <leader><space> :noh<cr>
" delete current line in insert mode
"inoremap <c-d> <esc>ddO
" edit .vimrc the fast way
nnoremap <leader>ev :vsplit $VIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>a :AirlineRefresh<cr>

augroup JavaCorrect
    autocmd!
    autocmd FileType java nnoremap <C-e> :JavaCorrect<CR>
augroup END

inoremap <C-f> <C-o>a
inoremap <C-e> <C-o>A
inoremap <C-b> <esc>i
" inoremap <C-b> <C-o>h
inoremap <C-a> <ESC>I
inoremap <C-o> <ESC>o

nnoremap H ^
nnoremap L $

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Close the current buffer
" noremap <leader>bd :Bclose<cr>:tabclose<cr>gT

noremap <leader>l :bnext<cr>
noremap <leader>h :bprevious<cr>

" YouCompleteMe GoToDefinition
noremap <leader>jd :YcmCompleter GoTo<CR>

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
" }}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Cursor Position Setting -------------------- {{{
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" }}}

" Vimscript file settings ---------------------- {{{
" }}}

" Html setting ---------------------- {{{
augroup filetype_html
    autocmd!
    " autocmd BufWritePre,BufRead *.html :normal gg=G
    autocmd BufNewFile,BufRead *.html setlocal nowrap
    " autocmd FileType html nnoremap <buffer> <leader>f Vatzf
augroup END
" }}}

" Run file inside vim ---------------------- {{{
augroup run_file
    autocmd!
    if has("nvim")
        " autocmd FileType python nnoremap <silent> <F5> :split<cr><c-w><c-j>:te python3 %<cr>
        autocmd FileType python nnoremap <silent> <F5> :PymodeRun<CR>
        autocmd FileType java nnoremap <silent> <F5> :w<CR>:Java %<CR>
        autocmd FileType c nnoremap <silent> <F5> :w<CR>:te gcc % -o %< && ./%< <CR>
        autocmd filetype cpp nnoremap <F5> :!clear<cr>:w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
    else
        autocmd FileType python nnoremap <silent> <F5> :!clear<CR>:! python3 %<cr>
        autocmd FileType java nnoremap <silent> <F5> :w<CR>:!clear<CR>:Java %<CR>
        autocmd FileType c nnoremap <silent> <F5> :w<CR>:!clear<cr>:!gcc % -o %< && ./%< <CR>
        autocmd filetype cpp nnoremap <F5> :!clear<cr>:w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
    endif
augroup END
" }}}

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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Clang-Format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Clang-Format -------------------- {{{
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" Toggle auto formatting:
" nmap <Leader>C :ClangFormatAutoToggle<CR>
" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor Shap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor Shap -------------------- {{{
"Tmux Cursor Shap
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Commerter Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Commerter Setting -------------------- {{{
map ,cc <plug>NERDCommenterToggle
map ,c<space> <plug>NERDCommenterComment
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 0
let g:NERDTrimTrailingWhitespace = 1
" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Airline Setting -------------------- {{{
set laststatus=2
" let g:airline_theme='molokai'
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
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C-Support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:C_UseTool_cmake = 'yes'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree Setting -------------------- {{{
nnoremap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 0
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoformat Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoformat setting ------------------------- {{{

autocmd FileType cpp,html,php nnoremap <leader>p :Autoformat<CR>

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Emmet Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Emmet setting ------------------------- {{{
let g:user_emmet_mode='a'
autocmd FileType html,css,php let g:user_emmet_leader_key='<C-Y>'
" autocmd FileType html,css imap <buffer> <c-k> <ESC>a<c-z>,
autocmd FileType html,css,php imap <C-K> <esc>a<plug>(emmet-expand-abbr)
autocmd FileType html,css,php imap <C-\> <plug>(emmet-move-next)

" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Syntastic Setting -------------------- {{{
" 让Syntastic 纠错Python3.

let g:syntastic_c_checkers=['make','splint', 'gcc']
let g:syntastic_c_remove_include_errors = 1
let g:syntastic_c_include_dirs = [ '../include', 'include', '../compile/ASST1']
"let g:syntastic_c_check_header = 1
let g:syntastic_c_no_include_search = 1

"let s:default_includes = [ '.', '..', 'include', 'includes',
"\ '../include', '../includes' ]
let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_python_checkers = ['python']
let g:syntastic_python_python_exec = '/usr/local/bin/python3.7'
" Syntastic HTML5 Support
let g:syntastic_html_tidy_exec = 'tidy5'


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
" WordPress Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WordPress Setting 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WordPress Setting ---------------------{{{


" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tags Setting -------------------- {{{
" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_opt = ['--fields=+l']
" let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_auto_highlight=0
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
let g:easytags_auto_update = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nnoremap <silent> <leader>C :TagbarToggle<CR>

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
" EasyAlign Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EasyAlign Setting -------------------- {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easy Motion Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Easy Motion Setting -------------------- {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap f <Plug>(easymotion-overwin-f)
nmap <leader>f <Plug>(easymotion-lineforward)
nmap <leader>F <Plug>(easymotion-linebackward)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <space> <Plug>(easymotion-overwin-f2)
" nmap t <Plug>(easymotion-t2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)

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
" Vim-Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Markdown Setting -------------------- {{{

let g:vim_markdown_conceal = 0
" set conceallevel=2
let g:vim_markdown_folding_disabled = 1

" let g:instant_markdown_slow = 1
" let g:instant_markdown_autostart = 0
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe and Ultisnip cooperate.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:UltiSnipsUsePythonVersion = 3

" Solution 1. -------------------- {{{
" let g:UltiSnipsSnippetsDir        = $HOME.'/.vim/UltiSnips/'
" let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
" let g:UltiSnipsSnippetsDir        = "~/.config/nvim/plugged/ultisnips"
let g:UltiSnipsSnippetDirectories=['~/.config/nvim/UltiSnips', "UltiSnips"]
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"let g:ycm_python_binary_path = '/usr/local/bin/python3.6'

" Has to be python2
let g:ycm_python_binary_path = '/Users/HankWang/anaconda/bin/python2'
let g:ycm_path_to_python_interpreter = '/Users/HankWang/anaconda/envs/py27/bin/python2.7'

" let g:UltiSnipsListSnippets="<c-h>"
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" Turn Off Preview window of YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
" Let YouCompleteMe run at markdown file
let g:ycm_filetype_blacklist = {}
let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_filetype_whitelist = {'pandoc': 1, 'markdown': 1, 'text': 1, 'md': 1, 'vimrc': 1}
let g:ycm_filetype_whitelist = {'*': 1}
" let g:ycm_filetypes_to_completely_ignore = 1
"}}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python-mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python-mode -------------------- {{{

let g:pymode_python = 'python3'
" let g:pymode_rope_lookup_project = 0
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_rope_goto_def_newwin = "new"
let g:pymode_rope = 0
autocmd FileType python nnoremap <leader>p :PymodeLintAuto<CR>

" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"

" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-d>"
" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jedi-Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jedi-Vim -------------------- {{{

let g:jedi#completions_command = "<C-b>"
let g:jedi#completions_enabled = 0
" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Eclim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cooperate with YouCompleteMe -------------------- {{{
if (&ft == 'java')
    let g:ycm_always_populate_location_list = 1
    let g:EclimCompletionMethod = 'omnifunc'
    " Cooperate with Syntastic
    augroup Eclim_Syntastic
        autocmd!
        autocmd FileType python let g:EclimFileTypeValidate = 0
        autocmd FileType c let g:EclimFileTypeValidate = 0
        autocmd FileType cpp let g:EclimFileTypeValidate = 0
    augroup END
    " autocmd FileType python let g:EclimFileTypeValidate = 0
endif
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""" RUN CURRENT FILE """""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Execute current file
"nnoremap <F5> :call ExecuteFile()<CR>

" Will attempt to execute the current file based on the `&filetype`
" You need to manually map the filetypes you use most commonly to the
" correct shell command.
"function! ExecuteFile()
"let filetype_to_command = {
"\   'javascript': 'node',
"\   'coffee': 'coffee',
"\   'python': 'python',
"\   'html': 'open',
"\   'sh': 'sh'
"\ }
"let cmd = get(filetype_to_command, &filetype, &filetype)
"call RunShellCommand(cmd." %s")
"endfunction

"" Enter any shell command and have the output appear in a new buffer
"" For example, to word count the current file:
""
""   :Shell wc %s
""
"" Thanks to: http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
"command! -complete=shellcmd -nargs=+ Shell call RunShellCommand(<q-args>)
"function! RunShellCommand(cmdline)
"echo a:cmdline
"let expanded_cmdline = a:cmdline
"for part in split(a:cmdline, ' ')
"if part[0] =~ '\v[%#<]'
"let expanded_part = fnameescape(expand(part))
"let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
"endif
"endfor
"botright new
"setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
"call setline(1, 'You entered:    ' . a:cmdline)
"call setline(2, 'Expanded Form:  ' .expanded_cmdline)
"call setline(3,substitute(getline(2),'.','=','g'))
"execute '$read !'. expanded_cmdline
"setlocal nomodifiable
"1
"endfunction
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
