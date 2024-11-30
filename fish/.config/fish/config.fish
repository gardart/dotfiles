if status is-interactive
    # Commands to run in interactive sessions can go here
end
set --prepend PATH "$HOME/.local/bin"

starship init fish | source

set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
#alias ls "ls -p -G"
#alias la "ls -A"
#alias ll "ls -l"
alias lla "ll -A"
#alias g git
alias tree "eza --tree"

# Changing "ls" to "eza"
alias ls='eza -al --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first' # all files and dirs
alias ll='eza -l --color=always --group-directories-first' # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | egrep "^\."'
alias l.='eza -al --color=always --group-directories-first ../' # ls on the PARENT directory
alias l..='eza -al --color=always --group-directories-first ../../' # ls on directory 2 levels up
alias l...='eza -al --color=always --group-directories-first ../../../' # ls on directory 3 levels up


set -gx EDITOR nvim

### HomeBrew
if test -d /home/linuxbrew/.linuxbrew
    # Homebrew is installed on Linux
    /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
else if test -d /opt/homebrew
    # Homebrew is installed on MacOS
    /opt/homebrew/bin/brew shellenv | source
end

function fish_user_key_bindings
    # Execute this onceer mode that emacs bindings should be used in
    fish_default_key_bindings -M insert
    #
    #         # Then execute the vi-bindings so they takerecedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert
end

### SET MANPAGER
### Uncomment only one of these!

### "nvim" as manpager
set -x MANPAGER "nvim +Man!"

### "less" as manpager
# set -x MANPAGER "less"

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end


set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

zoxide init --cmd cd fish | source
