#!/data/data/com.termux/files/usr/bin/bash

# Setup storage permission
termux-setup-storage
# Install musthave packages
pkg update && pkg upgrade && pkg install wget curl fakeroot python python2 python3 figlet x11-repo tsu root-repo && echo "All must-have packages has been installed!" || echo "Oops! Something is wrong =("
# Install awesome zsh with best setup
git clone --depth=1 https://github.com/mayTermux/myTermux.git && cd myTermux && export COLUMNS LINES && ./install.sh
# Add some aliases to zsh
echo "alias upg='apt update & apt upgrade'" & "alias debug='adb-devices'" & "alias backup='tar -zcf /sdcard/termux-backup.tar.gz -C /data/data/com.termux/files ./home ./usr
'" & "alias restore='tar -zxf /sdcard/termux-backup.tar.gz -C /data/data/com.termux/files --recursive-unlink --preserve-permissions
'">> ~/.zshrc
