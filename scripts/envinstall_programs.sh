#!/bin/bash
source /usr/local/src/envinstall/envinstall_log.sh


__install_git__() {
    read -p "What is your git email?: " user_email && \
    sudo apt install git -y && ssh-keygen -t ed25519 -C $user_email && eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_ed25519 && warn "Key generated:" && cat ~/.ssh/id_ed25519.pub
}

__install_go__() {
    GOLANG_PKG_VERSION=$(curl 'https://go.dev/VERSION?m=text' | grep go) && \
    GOLANG_PKG_FILE="$GOLANG_PKG_VERSION.linux-amd64.tar.gz" && \
    wget https://go.dev/dl/$GOLANG_PKG_FILE -P /tmp/ && \
    sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf /tmp/$GOLANG_PKG_FILE && export PATH=$PATH:/usr/local/go/bin && \
    /usr/local/go/bin/go install github.com/go-delve/delve/cmd/dlv@latest

}

__install_zsh__() {
    touch ~/.zshrc && sudo apt install zsh -y && chsh -s $(which zsh) && warn "Logout to make sure that zsh is the default shell!"
}

__install_python__() {
    sudo apt install python3 -y && sudo apt install python3-pip -y
}

__install_virtualenv__() {
    sudo apt install virtualenv -y
}

__install_alacritty__() {
    sudo apt install alacritty -y && sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty
}

__install_ohmyzsh__() {
    sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
}

__install_ohmyzshplugins__() {
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && \
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

__install_vscode__() {
    sudo apt install code -y
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

__install_tmux__() {
    sudo apt install tmux -y
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

__install_insomnia__() {
    sudo apt install insomnia -y
}

__install_chrome__() {
    sudo apt install google-chrome-stable -y
}

__install_protobuf__() {
    sudo apt install protobuf-compiler -y  && \
    go install google.golang.org/protobuf/cmd/protoc-gen-go@latest && \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
}

__install_jq__() {
    sudo apt install jq -y
}

__install_yq__() {
    sudo apt install yq -y
}

__install_docker__() {
    sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y &&
    sudo usermod -a -G docker $USER && warn "Logout is needed for Docker to work properly"
}

__install_obsidian__() {
     ## Need improvements
    OBSIDIAN_PKG_FILE="obsidian_1.5.8_amd64.deb"
    wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.8/$OBSIDIAN_PKG_FILE -P /tmp/ && \
    sudo dpkg -i /tmp/$OBSIDIAN_PKG_FILE
}

__install_discord__() {
    DISCORD_PKG_FILE="download?platform=linux&format=deb"
    wget 'https://discord.com/api/download?platform=linux&format=deb' -P /tmp/ && \
    sudo dpkg -i /tmp/$DISCORD_PKG_FILE
}

__install_nitrogen__() {
    sudo apt install nitrogen -y
}

__install_neofetch__() {
    sudo apt install neofetch -y
}

__install_i3__() {
    sudo apt install i3 -y
}

__install_picom__() {
    sudo apt install libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev libxext-dev meson ninja-build uthash-dev -y && \
    cd /tmp && rm -rf ./picom && git clone -b stable/11 https://github.com/yshui/picom && \
    cd /tmp/picom && \
    meson setup --buildtype=release build && \
    ninja -C build && \
    ninja -C build install && \
    cd
}

__install_zig__() {
    sudo rm -rf /usr/local/zig && \
    sudo mkdir -p /usr/local/zig && \
    ZIG_VERSION=$(curl -s https://ziglang.org/download/index.json | jq -r '.master["x86_64-linux"].tarball') && \
    sudo wget $ZIG_VERSION -O /tmp/zig.tar.xz && \
    sudo tar -xf /tmp/zig.tar.xz -C /usr/local/zig --strip-components 1
}

__install_dotfiles__() {
    read -p "What is your github username?: " user_name && \
    echo "alias config=\"/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME\"" >> ~/.zshrc && \
    echo "alias config=\"/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME\"" >> ~/.bashrc && \
    git clone git@github.com:$user_name/dotfiles.git $HOME/.cfg --bare && \
    /usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME config --local status.showUntrackedFiles no && \
    read -p "Replace all dotfiles? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] && \
    /usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME checkout -f && zsh
}
