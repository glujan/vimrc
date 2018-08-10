.vimrc
=====

Feel [free to use it](LICENSE) and suggest improvements via Issues.
Keep in mind that I use it (mostly) for editing Python files.

Requirements
------------
- _Vim_ 7.3+ with Python support (check the latter with `vim --version | grep +python`)
- `exuberant-ctags` system package for `taglist.vim` plugin
- _Vim_ with `clipboard` support is recommended (_vim-gnome_ package in Debian)
- create virtualenvs for [Black](https://github.com/ambv/black) and (optionally) Neovim - see
  `" Black` and `" NeoVim` in [\_vimrc](_vimrc) for specific locations


Usage
-----
- Clone this repo
- Copy or symlink my `_vimrc` as your `~/.vimrc`
- Install _vim-plug_ on Linux:
    ```
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

    or read [here](https://github.com/junegunn/vim-plug#installation) for different platform
- `vim +PlugUpdate`

To see how to manage plugins please refer to the [vim-plug wiki](https://github.com/junegunn/vim-plug/wiki).
