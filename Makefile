install:
	ansible-galaxy collection install community.general
	ansible-playbook -i "localhost," -c local -K playbooks/all.yml

stow:
	stow -t $HOME zsh nvim tmux fish

.PHONY: install stow 

