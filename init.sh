#!/bin/sh
set -x

cd ~
rm ~/.zshrc

xcode-select --install

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#git clone --recursive git@github.com:DarshanBagrecha-TI/dotfiles.git

omz reload

args brew install < .brew

sudo ln -sfn realpath .java/zulu-8.jdk /Library/Java/JavaVirtualMachines
sudo ln -sfn realpath .java/jdk-24.jdk /Library/Java/JavaVirtualMachines

cd ~/dotfiles && stow -S . --ignore=".java" && ~
