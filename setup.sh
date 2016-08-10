# /bin/bash

configureHosts() {
    echo "modifying hosts..."

    cp /etc/hosts /etc/hosts.bak
    cp hosts /etc/hosts.ac
    cat hosts >> /etc/hosts

    echo "hosts modified\n"
}

configureGrub() {
    echo "set grub not to include other systems"

    cp /etc/default/grub /etc/default/grub.bak
    sed -i '$a GRUB_DISABLE_OS_PROBER=true' /etc/default/grub
    update-grub

    echo "grub configured.\n"
}

mountTmpToMemory() {
    echo "move Tmp files To main memory..."
    apt-get clean
    rm -rf /tmp/*

    # modify fstab
    cp /etc/fstab /etc/fstab.bak
    cat fstab.add >> /etc/fstab

    # modify rc.local
    cp /etc/rc.local /etc/rc.local.bak
    cp rc.local /etc/rc.local

    echo "done!\n"
}

removeSoftware() {
    echo "removing software useless..."
    echo "these software are going to be removed: "
    echo "firefox hexchat pidgin thunderbird"

    apt-get remove -y firefox
    apt-get remove -y hexchat
    apt-get remove -y pidgin
    apt-get remove -y thunderbird
    apt-get remove -y pluma     # remove the default editor of ubuntu mate

    apt-get autoremove

    echo "softwares removed."
}

installVim() {
    echo "installing vim & gvim..."
    apt-get install -y vim-gnome

    echo "configuring vim"
    cp -rf vimconfig/* /etc/vim/
    apt-get install -y qml-module-qtquick2
    echo "vim & gvim installed & configured.\n"
}

installGit() {
    echo "installing git..."

    apt-get install -y git
    apt-get install -y git-gui

    echo "git & git GUI installed.\n"
}

installZsh() {
    echo "installing zsh..."
    apt-get install -y zsh

    echo "configuring zsh..."
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    
    chsh -s /bin/zsh

    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="dieter"/g' ~/.zshrc
    sed -i 's/\/root:\/bin\/bash/\/root\/bin\/zsh/g' /etc/passwd
    sed -i 's/\/yourusername:\/bin\/bash/\/yourusername\/bin\/zsh/g' /etc/passwd

    cp ~/.zshrc /home/yourusername/.zshrc
    cp -rf ~/.oh-my-zsh /home/yourusername/.oh-my-zsh
    sed -i 's/root/\/home\/yourusername/g' /home/yourusername/.zshrc
    echo "zsh installed & configured.\n"
}

main() {
    configureHosts
    configureGrub
    #mountTmpToMemory

    # remove useless software
    removeSoftware

    # install the useful file for myshell
    installGit
    installVim
    installZsh

}

main

