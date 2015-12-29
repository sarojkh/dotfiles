: '
TODO:
	-Echo all the steps
'
dotfile_root=~/"Google Drive/dotfiles"

# Create symlinks for dotfiles
ln -s "$dotfile_root/vim/.vimrc" ~/.vimrc
ln -s "$dotfile_root/vim/.vim/" ~/.vim

ln -s "$dotfile_root/bash/.bash_profile" ~/.bash_profile
ln -s "$dotfile_root/bash/.aliases" ~/.aliases
ln -s "$dotfile_root/bash/.bash_prompt" ~/.bash_prompt

ln -s "$dotfile_root/cron/.cron" ~/.cron

# Create folders for swap, backup and undo files for Vim
mkdir ~/.vim/backup
mkdir ~/.vim/swap
mkdir ~/.vim/undo

# Execute ~/.bash_profile
source ~/.bash_profile

