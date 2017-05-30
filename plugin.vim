call plug#begin('~/.config/nvim/plugged')
Plug 'kien/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plug 'jistr/vim-nerdtree-tabs'
Plug 'benmills/vimux'
Plug 'tpope/vim-fugitive' " the ultimate git helper
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-commentary' " comment/uncomment with gcc or gc in visual mode
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'
Plug 'Valloric/YouCompleteMe', {'do':'./install.py --clang-completer'}
Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'
Plug 'python-mode/python-mode'
" Track the engine.
Plug 'SirVer/ultisnips', {'for':[ 'python', 'c', 'cpp', 'java', 'perl', 'bash', 'sql']}
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/LargeFile'
"Plug 'davidhalter/jedi-vim', {'for':'python'}
"Plug 'Konfekt/FastFold'
"Plug 'tmhedberg/SimpylFold'

" Plug 'JavaRun'
" Enable this when coding Python
"Plug 'Python-mode-klen', {'for':'python'}

call plug#end()
