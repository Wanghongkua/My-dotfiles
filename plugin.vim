call plug#begin('~/.config/nvim/plugged')
Plug 'kien/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plug 'jistr/vim-nerdtree-tabs'
Plug 'benmills/vimux'
Plug 'tpope/vim-fugitive' " the ultimate git helper
Plug 'surround.vim'
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
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'

" Plug 'JavaRun'
" Enable this when coding Python
" Plug 'Python-mode-klen'

call plug#end()