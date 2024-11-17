install:
	ansible-galaxy collection install community.general
	ansible-playbook -i "localhost," -c local -K playbooks/all.yml

stow:
	stow nvim tmux

.PHONY: install stow 

