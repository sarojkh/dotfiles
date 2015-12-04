: '
TODO:
	-Echo all the steps
'
dotfile_root="~/Google Drive/dotfiles"

ln -s "$dotfile_root/vim/.vimrc" ~/.vimrc
ln -s "$dotfile_root/vim/.vim/" ~/.vim

ln -s "$dotfile_root/bash/.profile" ~/.profile
ln -s "$dotfile_root/bash/.aliases" ~/.aliases

ln -s "$dotfile_root/cron/.cron" ~/.cron

source ~/.profile

