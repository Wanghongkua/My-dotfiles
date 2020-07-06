call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox' "vim Color Schemes for vim and airline
Plug 'altercation/vim-colors-solarized' "vim solarized color scheme
Plug 'joshdick/onedark.vim' "vim one dark color scheme
Plug 'tomasr/molokai' 
Plug 'sheerun/vim-polyglot' "Syntax and indentation language package
Plug 'airblade/vim-gitgutter' "git integration
Plug 'kien/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plug 'jistr/vim-nerdtree-tabs'
Plug 'benmills/vimux'
Plug 'tpope/vim-fugitive' " the ultimate git helper
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'php']}

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

" Change to relative number in normal mode and abselute number in insert
" mode
Plug 'myusuf3/numbers.vim'

Plug 'jiangmiao/auto-pairs'

Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'python-mode/python-mode', {'branch': 'develop', 'for': 'python'}
" Plug 'tweekmonster/impsort.vim', {'for': 'python'}
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/LargeFile'
Plug 'StanAngeloff/php.vim', {'for':'php'}
Plug 'tmhedberg/matchit', {'for':['php', 'html', 'css']}
" Plug 'sudar/vim-wordpress-snippets', {'for':'php'}

" For Python GoTo
" Plug 'davidhalter/jedi-vim', {'for': 'python'}

" For Django
Plug 'tweekmonster/django-plus.vim'

" autoformat code
Plug 'Chiel92/vim-autoformat'
" It is for javascript

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"
" Markdown Plugin
Plug 'plasticboy/vim-markdown', {'for':'markdown'}

" Automatic Alignment
Plug 'godlygeek/tabular', {'for':'markdown'}


" C++ Syntax Highlight
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
" C++ Auto Format
Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }

" LaTeX
Plug 'vim-latex/vim-latex', {'for': 'tex'}

call plug#end()
" Track the engine.
" Snippets are separated from the engine. Add this if you want them:
" Auto complete for brackets and quotes
" Plug 'Raimondi/delimitMate'
" Plug 'tpope/vim-commentary' " comment/uncomment with gcc or gc in visual mode
" Plug 'flazz/vim-colorschemes' "vim's all color scheme
" Plug 'Valloric/YouCompleteMe', {'do':'./install.py --clang-completer --cs-completer'}
"
" for c#
" Plug 'OmniSharp/omnisharp-vim', {'for':'cs'}
" Plug 'tpope/vim-dispatch', {'for':'cs'}
" Plug 'w0rp/ale', {'for':'cs'}
" Plug 'Shougo/vimproc.vim', {'for':'cs'}

" Plug 'JavaRun'
" Enable this when coding Python
"Plug 'Python-mode-klen', {'for':'python'}
" Note Taking
" Plug 'vimwiki/vimwiki', { 'for': 'markdown' }
" Plug 'xolox/vim-notes', { 'for': 'markdown' }
"Plug 'davidhalter/jedi-vim', {'for':'python'}
" Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
" Plug 'dsawardekar/wordpress.vim', {'for': 'php'}
" Plug 'beautify-web/js-beautify', {'for':['php', 'html', 'css', 'js']}
