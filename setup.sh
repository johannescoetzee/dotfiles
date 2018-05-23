CURR_DIR=$(pwd)
rm -rf ~/.vim ~/.vim.bak
rm -rf ~/.config/i3 ~/.config/i3.bak
rm -rf ~/.config/polybar ~/.config/polybar.bak
rm -rf ~/.config/termite ~/.config/termite.bak
rm -rf ~/.vimrc ~/.vimrc.bak
rm -rf ~/.zshrc ~/.zshrc.bak
rm -rf ~/.compton.conf ~/.compton.conf.bak

mkdir -p ~/.vim/colors ~/.config/{i3,polybar,termite}

ln -sf ${CURR_DIR}/.vimrc ~/.vimrc
ln -sf ${CURR_DIR}/.zshrc ~/.zshrc
ln -sf ${CURR_DIR}/.compton.conf ~/.compton.conf
ln -sf ${CURR_DIR}/.vim/colors/molokai-dark.vim ~/.vim/colors/molokai-dark.vim
ln -sf ${CURR_DIR}/.config/i3/config ~/.config/i3/config
ln -sf ${CURR_DIR}/.config/polybar/config ~/.config/polybar/config
ln -sf ${CURR_DIR}/.config/polybar/launch.sh ~/.config/polybar/launch.sh
ln -sf ${CURR_DIR}/.config/termite/config ~/.config/termite/config

chmod 755 ${CURR_DIR}/.config/polybar/launch.sh

