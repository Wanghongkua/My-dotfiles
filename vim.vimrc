"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Testing Aera
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("nvim")
    tnoremap <Esc> <C-\><C-n>
else
    " Set font for MacVim
    set guifont=MesloLGLDZForPowerline-Regular:h12
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/Documents/dotfile/plugin.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Testing for AutoPairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Section General {{{

set nocompatible        " not nocompatible with vi
set autoread            " Detect when a file is changed

set history=1000        " change history to 1000

syntax enable
syntax on

" Neovim Support
let g:python3_host_prog = '~/opt/anaconda3/envs/py3/bin/python3.7'
let g:python_host_prog = '~/opt/anaconda3/envs/py2/bin/python2.7'

" Be able to open Chinese TXT file
" set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

" }}}

" Section User Interface {{{

" colorscheme
set background=dark
" colorscheme solarized
" colorscheme molokai
" colorscheme onedark

colorscheme dracula
highlight Normal ctermbg=NONE guibg=NONE


" make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermbg=none ctermfg=8
highlight NonText ctermbg=none ctermfg=8

" add new line in comment lines with 'o' or 'O' without comments
set formatoptions-=o

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

set hidden

set nowritebackup
set nobackup                                     " Turn backup off, since
set nowb                                         " most stuff is in SVN,
set noswapfile                                   " git et.c anyway...

set updatetime=300                               " You will have bad experience for diagnostic
                                                 " messages when it's default 4000.

set shortmess+=c                                 " don't give |ins-completion-menu| messages.

set signcolumn=yes                               " always show signcolumns

" autocmd filetype python set textwidth=80
set textwidth=120                                " set bound to width


let g:solarized_italic=1


set number                                       " Show line number
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
set cmdheight=2                                  " Height of the command bar
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
let maplocalleader = "\\"

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
" nnoremap <leader>s `<v`>

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
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ra :AirlineRefresh<cr>

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
" vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
" vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Close the current buffer
" noremap <leader>bd :Bclose<cr>:tabclose<cr>gT

noremap <leader>l :bnext<cr>
noremap <leader>h :bprevious<cr>

" YouCompleteMe GoToDefinition
" noremap <leader>jd :YcmCompleter GoTo<CR>

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
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" }}}

" Vim-Tmux-Navigator
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Commerter Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerd Commerter Setting -------------------- {{{
map ,cc <plug>NERDCommenterToggle
map ,c<space> <plug>NERDCommenterComment
autocmd filetype python map ,cs <plug>NERDCommenterAlignLeft
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
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

" airline symbols
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
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
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

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
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
let g:easytags_cmd = '/usr/local/bin/ctags'
" Sensible defaults
" let g:easytags_opt = ['--fields=+l']
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_auto_highlight=1
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_python_enabled = 1
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
let g:easytags_auto_update = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nnoremap <silent> <leader>c :TagbarToggle<CR>

" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)
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
" nmap <leader>f <Plug>(easymotion-lineforward)
" nmap <leader>F <Plug>(easymotion-linebackward)
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
let g:EasyMotion_use_smartsign_us = 1 " US layout
let g:EasyMotion_use_smartsign_jp = 1 " JP layout
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:waikiki_roots = ['~/Dropbox/Note/VimNotes/']
let g:waikiki_index = "readme.md"
let g:waikiki_default_maps = 1
let g:waikiki_space_replacement = "\\ "
nnoremap <leader>ww :e ~/Dropbox/Note/VimNotes/readme.md<CR>


augroup mdgroup
  autocmd FileType markdown nmap <buffer> <CR> <Plug>(waikikiFollowLink)
  autocmd FileType markdown xmap <buffer> <CR> <Plug>(waikikiFollowLink)
  autocmd FileType markdown nmap <buffer> <backspace> <Plug>(waikikiGoUp)
  autocmd FileType markdown nmap <buffer> <tab> <Plug>(waikikiNextLink)
  autocmd FileType markdown nmap <buffer> <s-tab> <Plug>(waikikiPrevLink)
  autocmd FileType markdown nmap <buffer> <leader>o <Plug>MarkdownPreviewToggle
  " generating Table of Contents
  autocmd FileType markdown nmap <buffer> <leader>C :GenTocGFM<cr>
  autocmd FileType markdown nmap <buffer> <leader>p :Format<cr>
augroup end

let g:mkdp_auto_start = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Markdown Setting -------------------- {{{

" let g:vim_markdown_conceal = 0
let g:indentLine_conceallevel = 0
set conceallevel=0
let g:vim_markdown_folding_disabled = 1

" let g:instant_markdown_slow = 1
" let g:instant_markdown_autostart = 0
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
autocmd FileType python nnoremap <leader>s :!Isort %<CR>
autocmd FileType python nnoremap <leader>p :Format<CR>
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>wa  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>we  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>wc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>wo  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>ws  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>wj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>wk  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>wp  :<C-u>CocListResume<CR>

" Using coc-ultisnips, so these should be commented out
" Use <C-j> for trigger snippet expand.
" imap <C-j> <Plug>(coc-snippets-expand)


" Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python-mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python-mode -------------------- {{{

" let g:pymode_python = 'python3'
" let g:pymode_rope_lookup_project = 0
" let g:pymode_rope_goto_definition_cmd = 'e'
" let g:pymode_rope_goto_def_newwin = "new"
" let g:pymode_rope = 0
" autocmd FileType python nnoremap <leader>p :PymodeLintAuto<CR>

" Override go-to.definition key shortcut to Ctrl-]
" let g:pymode_rope_goto_definition_bind = "<C-]>"

" Override run current python file key shortcut to Ctrl-Shift-e
" let g:pymode_run_bind = "<C-S-d>"
" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jedi-Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jedi-Vim -------------------- {{{

" let g:jedi#completions_command = "<C-b>"
" let g:jedi#completions_enabled = 0
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
" function! VisualSelection(direction, extra_filter) range
    " let l:saved_reg = @"
    " execute "normal! vgvy"

    " let l:pattern = escape(@", '\\/.*$^~[]')
    " let l:pattern = substitute(l:pattern, "\n$", "", "")

    " if a:direction == 'gv'
        " call CmdLine("Ag \"" . l:pattern . "\" " )
    " elseif a:direction == 'replace'
        " call CmdLine("%s" . '/'. l:pattern . '/')
    " endif

    " let @/ = l:pattern
    " let @" = l:saved_reg
" endfunction

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
" function! <SID>LocationNext()
    " try
        " lnext
    " catch /^Vim\%((\a\+)\)\=:E553/
        " lfirst
    " catch /^Vim\%((\a\+)\)\=:E42/
        " echom "No Error."
    " catch /^Vim\%((\a\+)\)\=:E776/
        " echom "No Error."
    " endtry
" endfunction
" nmap <silent> [e :<C-u>call <SID>LocationNext()<CR>
"}}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
