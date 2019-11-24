call plug#begin('~/.config/nvim/plugged')
Plug 'altercation/vim-colors-solarized' "vim solarized color scheme
Plug 'joshdick/onedark.vim' "vim one dark color scheme
" Plug 'flazz/vim-colorschemes' "vim's all color scheme
Plug 'sheerun/vim-polyglot' "Syntax and indentation language package
Plug 'airblade/vim-gitgutter' "git integration
Plug 'kien/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plug 'jistr/vim-nerdtree-tabs'
Plug 'benmills/vimux'
Plug 'tpope/vim-fugitive' " the ultimate git helper
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim', {'for': ['html', 'css', 'php']}
" Plug 'tpope/vim-commentary' " comment/uncomment with gcc or gc in visual mode
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

" Auto complete for brackets and quotes
" Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'

Plug 'easymotion/vim-easymotion'
" Plug 'Valloric/YouCompleteMe', {'do':'./install.py --clang-completer --cs-completer'}
Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'
Plug 'python-mode/python-mode', {'branch': 'develop', 'for': 'python'}
Plug 'tweekmonster/impsort.vim', {'for': 'python'}
" Track the engine.
" Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/LargeFile'
"Plug 'davidhalter/jedi-vim', {'for':'python'}
Plug 'StanAngeloff/php.vim', {'for':'php'}
Plug 'tmhedberg/matchit', {'for':['php', 'html', 'css']}
" Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
" Plug 'dsawardekar/wordpress.vim', {'for': 'php'}
Plug 'sudar/vim-wordpress-snippets', {'for':'php'}

" autoformat code
Plug 'Chiel92/vim-autoformat'
" It is for javascript
" Plug 'beautify-web/js-beautify', {'for':['php', 'html', 'css', 'js']}

" Markdown Plugin
Plug 'plasticboy/vim-markdown', {'for':'markdown'}
Plug 'godlygeek/tabular', {'for':'markdown'}

" Note Taking
" Plug 'vimwiki/vimwiki', { 'for': 'markdown' }
" Plug 'xolox/vim-notes', { 'for': 'markdown' }

" C++ Syntax Highlight
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
" C++ Auto Format
Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }
" for c#
" Plug 'OmniSharp/omnisharp-vim', {'for':'cs'}
" Plug 'tpope/vim-dispatch', {'for':'cs'}
" Plug 'w0rp/ale', {'for':'cs'}
" Plug 'Shougo/vimproc.vim', {'for':'cs'}

" Plug 'JavaRun'
" Enable this when coding Python
"Plug 'Python-mode-klen', {'for':'python'}

call plug#end()
