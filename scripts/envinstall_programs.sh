#!/bin/bash
source /usr/local/src/envinstall/envinstall_log.sh


__install_git__() {
    read -p "What is your git email?: " user_email && \
    sudo apt install git -y && ssh-keygen -t ed25519 -C $user_email && eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_ed25519 && warn "Key generated:" && cat ~/.ssh/id_ed25519.pub
}

__install_zsh__() {
    touch ~/.zshrc && sudo apt install zsh -y && chsh -s $(which zsh) && warn "Logout to make sure that zsh is the default shell!"
}

__install_python__() {
    sudo apt install python3 -y && sudo apt install python3-pip -y && sudo apt install python3-venv -y
}

__install_virtualenv__() {
    sudo apt install virtualenv -y
}

__install_ohmyzsh__() {
    sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
}

__install_ohmyzshplugins__() {
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

__install_kubectl__() {
    sudo apt install kubectl -y
}

__install_kubectx__() {
    sudo apt install kubectx -y
}

__install_gcloud__() {
    sudo apt install google-cloud-cli -y && gcloud init
}

__install_neovim__() {
		curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz && \
	sudo rm -rf /opt/nvim && \
	sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz 
}

__install_node__() {
    ## Need improvements
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm install v23.9.0 
}

__install_btop__() {
    ## Need improvements
    wget https://github.com/aristocratos/btop/releases/download/v1.3.2/btop-x86_64-linux-musl.tbz -P /tmp/ && \
    tar -x -j -f /tmp/btop-x86_64-linux-musl.tbz -C /tmp/ && \
    cd /tmp/btop && sudo make install && cd
}

__install_jq__() {
    sudo apt install jq -y
}

__install_yq__() {
    sudo apt install yq -y
}

#__install_dotfiles__() {
#    read -p "What is your github username?: " user_name && \
#    echo "alias config=\"/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME\"" >> ~/.zshrc && \
#    echo "alias config=\"/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME\"" >> ~/.bashrc && \
#    git clone git@github.com:$user_name/dotfiles.git $HOME/.cfg --bare && \
#    /usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME config --local status.showUntrackedFiles no && \
#    read -p "Replace all dotfiles? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] && \
#    /usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME checkout -f && zsh
#}
