#!/data/data/com.termux/files/usr/bin/bash

# Setup storage permission
if termux-setup-storage; then
  echo "Storage permission has been set up!"
else
  echo "Error: Failed to set up storage permission!"
  exit 1
fi

# Install must-have packages
if pkg update && pkg upgrade -y && pkg install -y wget curl fakeroot python python2 python3 figlet x11-repo tsu root-repo; then
  echo "All must-have packages have been installed!"
else
  echo "Error: Failed to install packages!"
  exit 1
fi

# Install awesome shell(zsh) with the best setup
if cd && wget https://raw.githubusercontent.com/mayTermux/myTermux/master/install.sh && chmod +x install.sh && ./install.sh; then
  echo "Zsh has been installed and configured!"
else
  echo "Error: Failed to install Zsh!"
  exit 1
fi

# Add some aliases to zsh
echo "alias upg='apt update && apt upgrade'" >> ~/.zshrc
echo "alias debug='adb-devices'" >> ~/.zshrc
echo "alias backup='tar -zcf /sdcard/termux-backup.tar.gz -C /data/data/com.termux/files ./home ./usr'" >> ~/.zshrc
echo "alias restore='tar -zxf /sdcard/termux-backup.tar.gz -C /data/data/com.termux/files --recursive-unlink --preserve-permissions'" >> ~/.zshrc
echo "Additional aliases have been added to your zsh configuration."
