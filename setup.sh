CURR_DIR=$(pwd)

declare -a confs=(
    .vim
    .vimrc
    .zshrc
    .compton.conf
    .config/i3
    .config/termite
    .config/nvim
    )

# Clean up files
mkdir -p ~/.backup_conf
for c in ${confs[@]}; do
    echo $c
    cp -r ~/$c ~/.backup_conf/ 
    rm -rf ~/$c
done

# Create the symlinks
mkdir -p ~/.config
for c in ${confs[@]}; do
    ln -sf ${CURR_DIR}/$c ~/$c
done

# Install vim-plug for nvim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
