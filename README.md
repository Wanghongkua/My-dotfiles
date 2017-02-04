# My dotfiles
This is the back up of my dotfiles.

To totally install my vimrc, 5 steps are needed.

=> Change settings

    Go to the home directory in terminal app, replace (or add) the contents of
    the ".vimrc" file with the contents of my vim.vimrc file.

=> Install vundle

    If you have installed vundle, skip this step.
    Copy the command below in your terminal to install vundle.

    ```
    $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ```

    Then open Macvim type ":" followed by "PluginInstall" and press return.
=> Install YouCompleteMe

    If you don't need C family support, copy the 2 lines command below:

    ```
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py
    ```

    If you need C family support, copy the 2 lines command below:

    ```
    cd ~/.vim/bundle/YouCompleteMe
    ./install.py --clang-completer
    ```

=> Install Colorscheme                                                          
    My color scheme is solarized. To change the color scheme of vim, you need to
    download the official file in http://ethanschoonover.com/solarized .
    Unzip the file, find the scheme for vim which is named "solarized.vim",
    move or copy the file into the following folder

    ```
    /Applications/MacVim.app/Contents/Resources/vim/runtime/colors
    ```

=> Install font to support airline

    Go to your Download directory in terminal, and type the command bellow:

    ```
    git clone https://github.com/powerline/fonts.git
    ```

    Go to the folder you just downloaded, type the command below:

    ```
    ./install.sh
    ```

    Change the font for your Macvim app and terminal app to powerline font.
# Change default vim to Macvim for terminal user
Add the follow line to your .bashrc or .zshrc which is located in your home
derictory.

alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
