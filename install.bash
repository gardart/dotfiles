#!/bin/bash

# Author: Gardar Thorsteinsson
# Installs your dotfiles...

# Function to determine package manager
function determine_package_manager() {
  which yum > /dev/null && {
    echo "yum"
    export OSPACKMAN="yum"
    return;
  }
  which apt-get > /dev/null && {
    echo "apt-get"
    export OSPACKMAN="aptget"
    return;
  }
  which brew > /dev/null && {
    echo "homebrew"
    export OSPACKMAN="homebrew"
    return;
  }
}

# function setup_bash() {
#   # TODO: Bash customization
# }

function setup_zsh() {
  echo 'Installing oh-my-zsh...'
  #sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

  mkdir -p $ZSH_CUSTOM/plugins
  #git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
  #git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

  #mkdir -p $ZSH_CUSTOM/themes
  #curl curl -O https://gist.githubusercontent.com/schminitz/9931af23bbb59e772eec/raw/schminitz.zsh-theme -o $ZSH_CUSTOM/themes/schminitz.zsh-theme
}

function determine_shell() {
  echo 'Please pick your favorite shell:'
  echo '(1) Bash'
  echo '(2) Zsh'
  read -p 'Enter a number: ' SHELL_CHOICE
  if [[ $SHELL_CHOICE == '1' ]] ; then
    export LOGIN_SHELL="bash"
  elif [[ $SHELL_CHOICE == '2' ]] ; then
    export LOGIN_SHELL="zsh"
  else
    echo 'Could not determine choice.'
    exit 1
  fi
}

function setup_vim() {
  echo "Setting up vim...ignore any vim errors post install"
  vim +PlugInstall +qall
}

function setup_git() {
  echo 'Setting up git config...'
  read -p 'Enter Github username: ' GIT_USER
  git config --global user.name "$GIT_USER"
  read -p 'Enter email: ' GIT_EMAIL
  git config --global user.email $GIT_EMAIL
#  git config --global core.editor vim
#  git config --global color.ui true
#  git config --global color.diff auto
#  git config --global color.status auto
#  git config --global color.branch auto
}

# Adds a symbolic link to files in ~/.dotfiles
# to your home directory.
function symlink_files() {
  ignoredfiles=(LICENSE README.md install.bash update-zsh.sh wsl-hyper.js)

  for f in $(ls -d *); do
    if [[ ${ignoredfiles[@]} =~ $f ]]; then
      echo "Skipping $f ..."
    elif [[ $f =~ 'bashrc' ]]; then
      if [[ $LOGIN_SHELL == 'bash' ]] ; then
        link_file $f
      fi
    elif [[ $f =~ 'bash_logout' ]]; then
      if [[ $LOGIN_SHELL == 'bash' ]] ; then
        link_file $f
      fi
    elif [[ $f =~ 'zshrc' || $f =~ 'oh-my-zsh' ]]; then
      if [[ $LOGIN_SHELL == 'zsh' ]] ; then
        link_file $f
      fi
    elif [[ $f =~ 'oh-my-zsh' ]]; then
      if [[ $LOGIN_SHELL == 'zsh' ]] ; then
        link_file $f
      fi
    else
        link_file $f
    fi
  done
}

# symlink a file
# arguments: filename
function link_file(){
  echo "linking ~/.$1"
  if ! $(ln -s "$PWD/$1" "$HOME/.$1");  then
    echo "Backup and replace file '~/.$1'?"
    read -p "[Y/n]?: " Q_REPLACE_FILE
    if [[ $Q_REPLACE_FILE != 'n' ]]; then
      replace_file $1
    fi
  fi
}

# replace file
# arguments: filename
function replace_file() { 
  echo "backing up ~/.$1 to ~/.$1.backup.$timestamp"
  mv "$HOME/.$1" "$HOME/.$1.backup.$timestamp"  
  echo "replacing ~/.$1"
  ln -sf "$PWD/$1" "$HOME/.$1"
}

set -e
(
  #dotfilespath=$HOME/.minidot
  timestamp=$(date +"%Y%m%d%H%M")

  determine_package_manager
  # general package array
  declare -a packages=('vim' 'git' 'tree' 'htop' 'wget' 'curl' 'bash-completion')

  determine_shell
  if [[ $LOGIN_SHELL == 'bash' ]] ; then
    packages=(${packages[@]} 'bash')
  elif [[ $LOGIN_SHELL == 'zsh' ]] ; then
    packages=(${packages[@]} 'zsh')
  fi

  if [[ $OSPACKMAN == "homebrew" ]]; then
    echo "You are running homebrew."
    echo "Using Homebrew to install packages..."
    # brew update
    declare -a macpackages=('findutils' 'the_silver_searcher')
    brew install "${packages[@]}" "${macpackages[@]}"
#    brew cleanup
  elif [[ "$OSPACKMAN" == "yum" ]]; then
    echo "You are running yum."
    echo "Using yum to install packages...."
    # sudo yum update
    declare -a rhelpackages=('the_silver_searcher')
    sudo yum install "${packages[@]}" "${rhelpackages[@]}"
  elif [[ "$OSPACKMAN" == "aptget" ]]; then
    echo "You are running apt-get"
    echo "Using apt-get to install packages...."
    #declare -a debianpackages=('screenfetch')
    declare -a debianpackages=('lsb-release')
    sudo apt-get update
    sudo apt-get install "${packages[@]}" "${debianpackages[@]}"
  else
    echo "Could not determine OS. Exiting..."
    exit 1
  fi

  if [[ $LOGIN_SHELL == 'bash' ]] ; then
    # setup_bash
    echo 'No extra bash configs yet...'
  elif [[ $LOGIN_SHELL == 'zsh' ]] ; then
    setup_zsh
  fi

  symlink_files
#  setup_git
  setup_vim

  if [[ $LOGIN_SHELL == 'bash' ]] ; then
    echo "Operating System setup complete."
    echo "Reloading session"

    source ~/.bashrc
  elif [[ $LOGIN_SHELL == 'zsh' ]] ; then
    echo "Changing shells to ZSH"
    chsh -s /bin/zsh

    echo "Operating System setup complete."
    echo "Reloading session"
    exec zsh
  fi

)
