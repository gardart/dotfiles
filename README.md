# Installation

## Make backup of current config

```shell
mv ~/.config/nvim ~/.config/nvim.bak.$(date +%Y%m%d%H%M%S)
mv ~/.config/tmux ~/.config/tmux.bak.$(date +%Y%m%d%H%M%S)

```

## Install

```shell
git clone https://github.com/gardart/dotfiles.git ~/dotfiles
cd ~/dotfiles
make stow
# stow -t $HOME zsh --verbose=3
# stow -t $HOME tmux
# stow -t $HOME nvim
# stow -t $HOME fish
```

# Configurations

## vim

- `,d` brings up / closes down [NERDTree](https://github.com/scrooloose/nerdtree), a sidebar buffer for navigating and manipulating files
- `<Ctrl-P>` brings up [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim), a project file filter for easily opening specific files
- `,b` restricts ctrlp.vim to open buffers
- `ds`/`cs` delete/change surrounding characters (e.g. `"Hey!"` + `ds"` = `Hey!`, `"Hey!"` + `cs"'` = `'Hey!'`) with [vim-surround](https://github.com/tpope/vim-surround)
- `,"` surround word with "
- `,'` surround word with '
- `gcc` toggles current line comment
- `gc` toggles visual selection comment lines
- `,<space>` turn off highlighting until the next search
- `,l` Toggle between numbers and relative numbers
- `,1` Toggle number / nonumber
- `<Ctrl-hjkl>` move between windows, shorthand for `<C-w> hjkl`
- `<Shift-Tab>` move between buffers
- `,,` Open last buffer
