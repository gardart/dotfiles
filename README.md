## Installation

```
$ git clone --recursive git@github.com:gardart/minidot.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./install.bash
```

## Configurations

### vim

* `,d` brings up / closes down [NERDTree](https://github.com/scrooloose/nerdtree), a sidebar buffer for navigating and manipulating files
* `Ctrl-P` brings up [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim), a project file filter for easily opening specific files
* `,b` restricts ctrlp.vim to open buffers
* `ds`/`cs` delete/change surrounding characters (e.g. `"Hey!"` + `ds"` = `Hey!`, `"Hey!"` + `cs"'` = `'Hey!'`) with [vim-surround](https://github.com/tpope/vim-surround)
* `,"` surround word with "
* `,'` surround word with '
* `gcc` toggles current line comment
* `gc` toggles visual selection comment lines
* `,[space]`  turn off highlighting until the next search
* `,l` Toggle between numbers and relative numbers
* `,1` Toggle number / nonumber
* `<C-hjkl>` move between windows, shorthand for `<C-w> hjkl`

